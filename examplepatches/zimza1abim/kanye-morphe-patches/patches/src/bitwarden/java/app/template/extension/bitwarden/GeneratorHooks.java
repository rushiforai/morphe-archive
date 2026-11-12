package app.template.extension.bitwarden;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.widget.EditText;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Bitwarden generator hooks. Obfuscated Kotlin lambda types are resolved by reflection
 * so the patch only depends on Bitwarden's kept class and field names.
 */
public final class GeneratorHooks {
    public static final String DEFAULT_SPECIAL = "!@#$%^&*";

    private static final String PREFS = "morphe_bitwarden_generator";
    private static final String KEY_SPECIAL = "custom_special_chars";
    private static final String HELP_DATA =
            "com.bitwarden.ui.platform.components.button.model.BitwardenHelpButtonData";
    private static final String STATE_PREFIX = "GeneratorState(generatedText=";
    private static final String SELECTED_PASSPHRASE = ", selectedType=Passphrase(";
    private static final String LOWER = "abcdefghijkmnopqrstuvwxyz";
    private static final String UPPER = "ABCDEFGHJKLMNPQRSTUVWXYZ";
    private static final String NUMBER = "23456789";
    private static final String LOWER_AMBIGUOUS = "l";
    private static final String UPPER_AMBIGUOUS = "IO";
    private static final String NUMBER_AMBIGUOUS = "01";

    private static final SecureRandom random = new SecureRandom();
    private static volatile WeakReference<Activity> activity = new WeakReference<>(null);
    private static volatile Context appContext;
    private static volatile String customSpecial;
    private static volatile String passphraseText;

    private GeneratorHooks() {
    }

    /** MainActivity.onCreate. */
    public static void attach(Activity current) {
        activity = new WeakReference<>(current);
        appContext = current.getApplicationContext();
    }

    // ---------------------------------------------------------------- passphrase length

    /**
     * GeneratorScreen reads GeneratorState.generatedText. The state class is obfuscated, but its
     * data class toString() keeps "GeneratorState(generatedText=..., selectedType=Passphrase(...".
     */
    public static void onGeneratorState(Object state, String generated) {
        String prefix = STATE_PREFIX + generated + SELECTED_PASSPHRASE;
        passphraseText = state != null && generated != null && String.valueOf(state).startsWith(prefix)
                ? generated : null;
    }

    /** Label of the generated value field: the total length for passphrases, else none. */
    public static String passphraseLengthLabel(String generated) {
        if (generated == null || !generated.equals(passphraseText)) return null;
        int length = generated.codePointCount(0, generated.length());
        return length + " characters";
    }

    // ---------------------------------------------------------------- custom special characters

    /** Special characters toggle label. */
    public static String specialLabel() {
        String custom = customSpecial();
        return custom.isEmpty() ? DEFAULT_SPECIAL : custom;
    }

    /**
     * GeneratorClients.password(): generates with the custom special set, honoring every
     * minimum count like the SDK does. Returns null to let the SDK generate instead: no custom
     * set, special characters off, or a request carrying HTML passwordrules options.
     */
    public static String generatePassword(Object request) {
        String custom = customSpecial();
        if (custom.isEmpty() || request == null) return null;
        try {
            Class<?> type = request.getClass();
            if (!field(type, "special").getBoolean(request) || field(type, "customRequiredChars").get(request) != null
                    || field(type, "customAllowedChars").get(request) != null
                    || field(type, "maxConsecutive").get(request) != null) {
                return null;
            }
            boolean avoidAmbiguous = field(type, "avoidAmbiguous").getBoolean(request);
            String[] sets = {
                    charset(request, "lowercase", avoidAmbiguous ? LOWER : LOWER + LOWER_AMBIGUOUS),
                    charset(request, "uppercase", avoidAmbiguous ? UPPER : UPPER + UPPER_AMBIGUOUS),
                    charset(request, "numbers", avoidAmbiguous ? NUMBER : NUMBER + NUMBER_AMBIGUOUS),
                    custom,
            };
            String[] minimumFields = {"minLowercase", "minUppercase", "minNumber", "minSpecial"};
            int length = field(type, "length").getByte(request) & 0xff;

            List<Character> password = new ArrayList<>(length);
            StringBuilder all = new StringBuilder();
            for (int i = 0; i < sets.length; i++) {
                if (sets[i].isEmpty()) continue;
                all.append(sets[i]);
                int minimum = Math.max(unsignedByte(field(type, minimumFields[i]).get(request), 1), 1);
                for (int n = 0; n < minimum; n++) password.add(pick(sets[i]));
            }
            if (all.length() == 0 || password.size() > length) return null;
            while (password.size() < length) password.add(pick(all));
            Collections.shuffle(password, random);

            StringBuilder out = new StringBuilder(length);
            for (char c : password) out.append(c);
            return out.toString();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String charset(Object request, String enabledField, String chars) throws Exception {
        return field(request.getClass(), enabledField).getBoolean(request) ? chars : "";
    }

    private static char pick(CharSequence chars) {
        return chars.charAt(random.nextInt(chars.length()));
    }

    /** Value of a boxed kotlin.UByte (obfuscated), or the fallback when absent. */
    private static int unsignedByte(Object boxed, int fallback) throws IllegalAccessException {
        if (boxed == null) return fallback;
        for (Field value : boxed.getClass().getDeclaredFields()) {
            if (value.getType() == byte.class && !Modifier.isStatic(value.getModifiers())) {
                value.setAccessible(true);
                return value.getByte(boxed) & 0xff;
            }
        }
        return fallback;
    }

    /** Help button beside the special characters toggle that opens the editor. */
    public static Object specialHelpButton(final boolean checked, final Object onCheckedChange) {
        try {
            Constructor<?> constructor = null;
            for (Constructor<?> candidate : Class.forName(HELP_DATA).getConstructors()) {
                Class<?>[] params = candidate.getParameterTypes();
                if (params.length == 3 && params[0].isInterface() && params[1] == String.class
                        && params[2] == boolean.class) {
                    constructor = candidate;
                }
            }
            if (constructor == null) return null;
            final Class<?> function0 = constructor.getParameterTypes()[0];
            Object onClick = Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) {
                            switch (method.getName()) {
                                case "equals":
                                    return proxy == args[0];
                                case "hashCode":
                                    return System.identityHashCode(proxy);
                                case "toString":
                                    return "CustomSpecialCharsClick";
                                default:
                                    showEditor(checked, onCheckedChange);
                                    return null;
                            }
                        }
                    });
            return constructor.newInstance(onClick, "Custom special characters", false);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void showEditor(final boolean checked, final Object onCheckedChange) {
        final Activity current = activity.get();
        if (current == null || current.isFinishing()) return;
        final EditText input = new EditText(current);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS
                | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
        input.setHint(DEFAULT_SPECIAL);
        input.setText(customSpecial());
        input.setSelection(input.getText().length());
        FrameLayout container = new FrameLayout(current);
        int padding = Math.round(20 * current.getResources().getDisplayMetrics().density);
        container.setPadding(padding, padding / 2, padding, 0);
        container.addView(input);

        boolean night = (current.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        new AlertDialog.Builder(current, night
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                .setTitle("Custom special characters")
                .setMessage("Leave empty for the default (" + DEFAULT_SPECIAL + ").")
                .setView(container)
                .setPositiveButton("Save", (dialog, which) ->
                        save(current, sanitize(input.getText().toString()), checked, onCheckedChange))
                .setNeutralButton("Default", (dialog, which) ->
                        save(current, "", checked, onCheckedChange))
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void save(Context context, String value, boolean checked, Object onCheckedChange) {
        if (value.equals(customSpecial())) return;
        customSpecial = value;
        prefs(context).edit().putString(KEY_SPECIAL, value).apply();
        // The toggle composable skips recomposition while its arguments are unchanged, so flip
        // it to refresh the label and regenerate with the new set.
        if (checked) {
            setChecked(onCheckedChange, false);
            new Handler(Looper.getMainLooper()).postDelayed(() -> setChecked(onCheckedChange, true), 150);
        } else if (!value.isEmpty()) {
            setChecked(onCheckedChange, true);
        }
    }

    private static void setChecked(Object onCheckedChange, boolean value) {
        try {
            Method invoke = onCheckedChange.getClass().getMethod("invoke", Object.class);
            invoke.setAccessible(true);
            invoke.invoke(onCheckedChange, value);
        } catch (Throwable ignored) {
            // The new set still applies on the next generation.
        }
    }

    /** Printable ASCII symbols only, deduplicated in input order. */
    static String sanitize(String raw) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < raw.length(); i++) {
            char c = raw.charAt(i);
            boolean symbol = c > ' ' && c < 0x7f && !Character.isLetterOrDigit(c);
            if (symbol && out.indexOf(String.valueOf(c)) < 0) out.append(c);
        }
        return out.toString();
    }

    private static String customSpecial() {
        String value = customSpecial;
        if (value != null) return value;
        Context context = appContext;
        if (context == null) return "";
        value = prefs(context).getString(KEY_SPECIAL, "");
        customSpecial = value;
        return value;
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Field field(Class<?> type, String name) throws NoSuchFieldException {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }
}
