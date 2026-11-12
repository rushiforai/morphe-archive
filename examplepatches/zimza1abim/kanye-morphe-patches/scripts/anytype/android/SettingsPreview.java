package app.font.anytype.test;

import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.reflect.*;
import app.font.extension.anytype.CustomFontManager;
import app.font.extension.anytype.FontUi;

/** Runs the actual patched Anytype Option and Compose resolver in an isolated APK. */
public class SettingsPreview extends androidx.activity.ComponentActivity {
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        try {
            LinearLayout column = new LinearLayout(this); column.setOrientation(1); column.setPadding(0,100,0,0);
            column.setBackgroundColor(0xfffafafa);
            TextView header = new TextView(this); header.setText("Application"); header.setTextSize(16); header.setPadding(48,24,48,24); column.addView(header);
            Class<?> cv = Class.forName("androidx.compose.ui.platform.ComposeView");
            Object compose = cv.getConstructor(android.content.Context.class, android.util.AttributeSet.class, int.class).newInstance(this,null,0);
            Class<?> function2 = Class.forName("kotlin.jvm.functions.Function2");
            Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0");
            Object unit = Class.forName("kotlin.Unit").getField("INSTANCE").get(null);
            Method option = java.util.Arrays.stream(Class.forName("com.anytypeio.anytype.core_ui.foundation.SystemKt").getDeclaredMethods())
                    .filter(m -> m.getName().equals("Option")).findFirst().get();
            int icon=getResources().getIdentifier("ic_settings_appearance","drawable",getPackageName());
            Object listener=FontUi.listener(function0,unit);
            Object content=Proxy.newProxyInstance(function2.getClassLoader(),new Class<?>[]{function2},(proxy,m,args)->{
                if (m.getName().equals("invoke")) { option.invoke(null, icon,0,args[0],"Font",listener); return unit; }
                if (m.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (m.getName().equals("equals")) return proxy==args[0];
                return "FontPreviewContent";
            });
            cv.getMethod("setContent",function2).invoke(compose,content);
            column.addView((View)compose,new LinearLayout.LayoutParams(-1,-2));
            TextView sample=new TextView(this);sample.setText("한글 테스트입니다.\nAnytype global font\n😀 🥰 💚 🩷 👍🏻\n👨‍👩‍👧‍👦 🇰🇷 🇺🇸");sample.setTextSize(24); sample.setPadding(48,40,48,0);column.addView(sample);
            setContentView(column);
            column.postDelayed(() -> {
                try {
                    int width = getResources().getDisplayMetrics().widthPixels;
                    column.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(1100, View.MeasureSpec.EXACTLY));
                    column.layout(0, 0, width, 1100);
                    android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(width, 1100, android.graphics.Bitmap.Config.ARGB_8888);
                    column.draw(new android.graphics.Canvas(bitmap));
                    try (java.io.FileOutputStream file = openFileOutput("preview.png", MODE_PRIVATE)) {
                        bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, file);
                    }
                    bitmap.recycle();
                } catch (Throwable error) { android.util.Log.e("ANYTYPE_FONT_TEST", "Preview capture", error); }
            }, 1500);
        } catch(Throwable error) { throw new RuntimeException(error); }
    }
}
