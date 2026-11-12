package app.font.anytype.test;

import android.app.*;
import android.os.*;
import android.content.*;
import android.database.*;
import android.net.Uri;
import android.graphics.*;
import android.widget.*;
import android.provider.OpenableColumns;
import app.font.extension.anytype.CustomFontManager;
import java.io.*;
import java.util.*;

public final class FontRuntimeTest extends Activity {
    public static final class App extends Application {
        @Override protected void attachBaseContext(Context context) {
            super.attachBaseContext(context);
            CustomFontManager.initialize(this);
            android.util.Log.i("ANYTYPE_FONT_TEST", "BEFORE_ACTIVITY=" + CustomFontManager.name());
        }
    }
    public static final class Provider extends ContentProvider {
        public boolean onCreate() { return true; }
        public Cursor query(Uri u, String[] p, String s, String[] a, String o) {
            MatrixCursor c = new MatrixCursor(new String[]{OpenableColumns.DISPLAY_NAME});
            c.addRow(new Object[]{u.getLastPathSegment()}); return c;
        }
        public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
            return ParcelFileDescriptor.open(new File(getContext().getFilesDir(), uri.getLastPathSegment()), ParcelFileDescriptor.MODE_READ_ONLY);
        }
        public String getType(Uri u) { return "font/ttf"; }
        public Uri insert(Uri u, ContentValues v) { throw new UnsupportedOperationException(); }
        public int update(Uri u, ContentValues v, String s, String[] a) { throw new UnsupportedOperationException(); }
        public int delete(Uri u, String s, String[] a) { throw new UnsupportedOperationException(); }
    }
    private static final String CHARS = "한글 테스트입니다.\nABCDEFGHIJKLMNOPQRSTUVWXYZ\nabcdefghijklmnopqrstuvwxyz\n0123456789\n!@#$%^&*()\n₩ $ € £ ¥\n→ ← ↑ ↓\n✓ ✕ ★ ●\n© ® ™\n± × ÷ ≠ ≤ ≥\nα β γ\n😀 🥰 💚 🩷 👍🏻\n👨‍👩‍👧‍👦\n🇰🇷 🇺🇸\na\u0301 العربية 中文 日本語";
    private void check(boolean ok, String label) { if (!ok) throw new AssertionError(label); }
    private Uri uri(String name) { return Uri.parse("content://app.font.anytype.test.files/" + name); }
    private void copy(String name) throws IOException {
        try (InputStream in = getAssets().open(name); FileOutputStream out = openFileOutput(name, MODE_PRIVATE)) {
            byte[] bytes = new byte[8192]; int n; while ((n = in.read(bytes)) != -1) out.write(bytes, 0, n);
        }
    }
    private int[] pixels(Typeface face, String text) {
        Bitmap bitmap = Bitmap.createBitmap(600, 130, Bitmap.Config.ARGB_8888);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG); paint.setColor(Color.BLACK); paint.setTextSize(72); paint.setTypeface(face);
        new Canvas(bitmap).drawText(text, 8, 95, paint);
        int[] p = new int[600*130]; bitmap.getPixels(p, 0, 600, 0, 0, 600, 130); bitmap.recycle(); return p;
    }
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        try {
            boolean restart = getIntent().getBooleanExtra("restart", false);
            if (restart) {
                check(CustomFontManager.resolve(400, 0) != null, "persistent first-render typeface");
                check(CustomFontManager.name().equals("Variable"), "persistent name");
            } else {
                CustomFontManager.reset();
                copy("Regular.otf"); copy("Variable.ttf");
                CustomFontManager.importFont(uri("Regular.otf"));
                check(CustomFontManager.resolve(400,0) != null, "OTF import");
                CustomFontManager.importFont(uri("Variable.ttf"));
                Typeface saved = CustomFontManager.resolve(400,0);
                for (String bad : new String[]{"empty.ttf", "broken.ttf", "wrong.txt", "missing.ttf"}) {
                    if (!bad.startsWith("missing")) try (FileOutputStream out=openFileOutput(bad,MODE_PRIVATE)) { if (!bad.startsWith("empty")) out.write(new byte[]{1,2,3}); }
                    try { CustomFontManager.importFont(uri(bad)); throw new AssertionError("accepted " + bad); } catch (IOException expected) {}
                    check(saved == CustomFontManager.resolve(400,0), "preserve previous font: " + bad);
                }
                new File(getFilesDir(),"Variable.ttf").delete();
            }
            Typeface regular = CustomFontManager.resolve(400,0);
            check(regular == CustomFontManager.resolve(400,0), "typeface cache identity");
            for (int w : new int[]{100,400,500,600,700,900}) check(CustomFontManager.resolve(w,0).getWeight()==w, "weight " + w);
            check(CustomFontManager.resolve(400,1).isItalic(), "italic");
            String fontFile = getSharedPreferences("prefs", MODE_PRIVATE).getString("morphe.anytype.font.file", "");
            Typeface directAxis = new Typeface.Builder(new File(getFilesDir(), "morphe-anytype-fonts/" + fontFile))
                    .setFontVariationSettings("'wght' 900").setWeight(900).build();
            check(Arrays.equals(pixels(directAxis,"Hamburgefonts"), pixels(CustomFontManager.resolve(900,0),"Hamburgefonts")), "actual wght axis raster");
            check(!Arrays.equals(pixels(regular,"Hamburgefonts"),pixels(CustomFontManager.resolve(900,0),"Hamburgefonts")), "weight changes raster");
            Paint p=new Paint(); p.setTypeface(regular);
            for (String glyph : new String[]{"한","A","9","₩","€","→","✓","★","©","±","≠","α","a\u0301","ع","中","日"})
                check(p.hasGlyph(glyph), "missing glyph " + glyph);
            for (String emoji : new String[]{"😀","🥰","💚","🩷","👍🏻","👨‍👩‍👧‍👦","🇰🇷","🇺🇸","🏳️","1️⃣"})
                check(Arrays.equals(pixels(Typeface.DEFAULT,emoji),pixels(regular,emoji)), "system emoji raster differs: " + emoji);
            TextView text=new TextView(this); text.setTypeface(Typeface.create(Typeface.DEFAULT,700,false));
            int beforeWeight=text.getTypeface().getWeight(); CustomFontManager.applyTree(text); check(text.getTypeface().getWeight()==beforeWeight,"TextView weight before="+beforeWeight+" after="+text.getTypeface().getWeight()+" chosen="+CustomFontManager.resolve(beforeWeight,0).getWeight());
            if (!restart) {
                CustomFontManager.reset(); CustomFontManager.applyTree(text);
                check(CustomFontManager.resolve(400,0)==null && CustomFontManager.name().equals("Default"),"reset");
                copy("Variable.ttf"); CustomFontManager.importFont(uri("Variable.ttf")); new File(getFilesDir(),"Variable.ttf").delete();
            }
            ScrollView scroll=new ScrollView(this); TextView sample=new TextView(this); sample.setText(CHARS); sample.setTextSize(21); sample.setPadding(25,90,25,25); sample.setTextColor(Color.BLACK); scroll.setBackgroundColor(Color.WHITE); scroll.addView(sample); setContentView(scroll); CustomFontManager.applyTree(scroll);
            result("PASS " + (restart ? "cold-start persistence and source deletion" : "OTF/variable/cache/weights/italic/fallback/emoji/invalid/reset"));
        } catch (Throwable error) { result("FAIL " + android.util.Log.getStackTraceString(error)); }
    }
    private void result(String text) {
        android.util.Log.i("ANYTYPE_FONT_TEST", text);
        try (FileOutputStream out=openFileOutput("result.txt",MODE_PRIVATE)) { out.write(text.getBytes("UTF-8")); } catch(IOException e) { throw new RuntimeException(e); }
    }
}
