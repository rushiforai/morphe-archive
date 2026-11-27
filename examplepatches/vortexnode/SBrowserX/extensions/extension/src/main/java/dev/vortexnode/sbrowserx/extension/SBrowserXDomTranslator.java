package dev.vortexnode.sbrowserx.extension;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Fast, viewport-first, context-preserving DOM translator (Chrome-grade grammar).
 * - Preserves inline tags (<a>, <b>, <span>) using Chrome's native <a i=0>...</a> marker so Google NMT
 *   produces accurate Russian/Slavic declensions and preserves brand/device names.
 * - Sends visible-screen blocks FIRST (~250-350ms to first visible translation) and remaining blocks in 4 parallel threads.
 * - Supports both SBrowserMainActivity (native TransBar) and CustomTabActivity (Telegram links + Chrome-style banner).
 */
public final class SBrowserXDomTranslator {
    private static final String TAG = "SBrowserXDomTrans";
    private static final ExecutorService POOL = Executors.newFixedThreadPool(4);
    private static final AtomicInteger GENERATION = new AtomicInteger(0);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static final String EXTRACT_BLOCKS_JS =
            "(function(){"
            + "var skip={SCRIPT:1,STYLE:1,NOSCRIPT:1,TEXTAREA:1,CODE:1,PRE:1,SVG:1,IFRAME:1,CANVAS:1,MATH:1};"
            + "var inlineTags={A:1,B:1,STRONG:1,I:1,EM:1,SPAN:1,SMALL:1,MARK:1,U:1,S:1,SUB:1,SUP:1,ABBR:1,TIME:1,CITE:1,Q:1};"
            + "function hasBlockChild(el){"
            + "  for(var c=el.firstElementChild;c;c=c.nextElementSibling){"
            + "    if(!inlineTags[c.tagName]&&!skip[c.tagName])return true;"
            + "    if(hasBlockChild(c))return true;"
            + "  }"
            + "  return false;"
            + "}"
            + "function esc(s){return s.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');}"
            + "function serialize(el,saved){"
            + "  var out='';"
            + "  for(var n=el.firstChild;n;n=n.nextSibling){"
            + "    if(n.nodeType===3){out+=esc(n.nodeValue);}"
            + "    else if(n.nodeType===1&&!skip[n.tagName]){"
            + "      if(inlineTags[n.tagName]){"
            + "        var idx=saved.length;saved.push(n);"
            + "        out+='<a i='+idx+'>'+serialize(n,saved)+'</a>';"
            + "      }else{out+=' ';}"
            + "    }"
            + "  }"
            + "  return out;"
            + "}"
            + "if(!window.__sbxBlocks){"
            + "  var all=document.querySelectorAll('h1,h2,h3,h4,h5,h6,p,li,blockquote,figcaption,dt,dd,td,th,a,button,label,div,span');"
            + "  var vis=[],rest=[],seen=new Set();"
            + "  var vh=window.innerHeight||800;"
            + "  for(var i=0;i<all.length&&(vis.length+rest.length)<260;i++){"
            + "    var el=all[i];"
            + "    if(skip[el.tagName]||el.closest('script,style,code,pre,noscript,svg'))continue;"
            + "    if(hasBlockChild(el))continue;"
            + "    var ancestor=el.parentElement,dup=false;"
            + "    while(ancestor){if(seen.has(ancestor)){dup=true;break;}ancestor=ancestor.parentElement;}"
            + "    if(dup)continue;"
            + "    var txt=(el.innerText||el.textContent||'').trim();"
            + "    if(txt.length<2||txt.length>1500)continue;"
            + "    if(/^[\\d\\s.,:%$€£₽+\\-\\/()•|]+$/.test(txt))continue;"
            + "    if(/^(youtube|google|telegram|github|reddit|samsung|one ui|galaxy|android|ios|chrome|safari|windows|linux|wi-fi|wifi|usb-c|amoled|webrtc|nfc|bluetooth|discord|spotify|netflix|tiktok|instagram|whatsapp|paypal|play store|app store|sammobile|ebay|amazon|apple|nvidia|amd|intel|qualcomm|snapdragon)$/i.test(txt))continue;"
            + "    var saved=[];"
            + "    var markup=serialize(el,saved);"
            + "    if(!markup||!markup.trim())continue;"
            + "    seen.add(el);"
            + "    var rec={el:el,origHtml:el.innerHTML,saved:saved,markup:markup};"
            + "    var r=el.getBoundingClientRect();"
            + "    if(r.width>0&&r.height>0&&r.bottom>=-80&&r.top<=vh+250){vis.push(rec);}else{rest.push(rec);}"
            + "  }"
            + "  window.__sbxBlocks=vis.concat(rest);"
            + "}"
            + "var out=[];"
            + "for(var j=0;j<window.__sbxBlocks.length;j++){out.push(window.__sbxBlocks[j].markup);}"
            + "return JSON.stringify({lang:(document.documentElement.lang||''),host:(location.hostname||''),items:out});"
            + "})();";

    private static final String DETECT_SAMPLE_JS =
            "(function(){"
            + "var lang=(document.documentElement.lang||'').trim();"
            + "var h=document.querySelector('h1,h2,p');"
            + "var txt=h?(h.innerText||''):((document.body&&document.body.innerText)||'').slice(0,220);"
            + "return JSON.stringify({lang:lang,sample:txt.trim().slice(0,220),url:location.href||''});"
            + "})();";

    private static final String REVERT_JS =
            "(function(){"
            + "if(window.__sbxBlocks){"
            + "  for(var i=0;i<window.__sbxBlocks.length;i++){"
            + "    try{window.__sbxBlocks[i].el.innerHTML=window.__sbxBlocks[i].origHtml;}catch(e){}"
            + "  }"
            + "}"
            + "window.__sbxBlocks=null;"
            + "})();";

    private static volatile String sLastAutoUrl = "";
    private static volatile long sLastAutoTime = 0L;

    private SBrowserXDomTranslator() {}

    public static void translateCurrentTab(String sourceLang, String targetLang) {
        translateTab(SBrowserXHooks.getMainActivity(), sourceLang, targetLang, true);
    }

    public static void translateTab(Activity targetActivity, String sourceLang, String targetLang, boolean showChromeBanner) {
        Context ctx = SBrowserXPrefs.getAppContext();
        if (ctx != null && !SBrowserXPrefs.isGoogleTranslateEnabled(ctx)) return;

        final String sl = (sourceLang == null || sourceLang.isEmpty() || "auto".equalsIgnoreCase(sourceLang) || "und".equalsIgnoreCase(sourceLang))
                ? "auto" : sourceLang.replace('_', '-');
        String resolvedTl = targetLang;
        if ((resolvedTl == null || resolvedTl.isEmpty()) && ctx != null) {
            resolvedTl = SBrowserXPrefs.getTranslateTargetLang(ctx);
        }
        final String tl = (resolvedTl == null || resolvedTl.isEmpty()) ? "ru" : resolvedTl.replace('_', '-');
        final String engine = ctx != null ? SBrowserXPrefs.getTranslateEngine(ctx) : "google";
        final int gen = GENERATION.incrementAndGet();

        MAIN.post(() -> {
            final Activity act = targetActivity != null ? targetActivity : SBrowserXHooks.getMainActivity();
            Object tab = getTabFromActivity(act);
            if (tab == null) return;
            evalJs(tab, EXTRACT_BLOCKS_JS, rawJson -> {
                if (gen != GENERATION.get()) return;
                if (rawJson == null || rawJson.isEmpty() || "null".equals(rawJson)) return;
                try {
                    JSONObject obj = new JSONObject(unwrapJsString(rawJson));
                    JSONArray itemsArr = obj.optJSONArray("items");
                    final String host = obj.optString("host", "");
                    final String docLang = SBrowserXGoogleTranslator.normalizeLang(obj.optString("lang", ""));
                    if (itemsArr == null || itemsArr.length() == 0) return;

                    final boolean[] bannerShown = new boolean[1];
                    int total = itemsArr.length();
                    List<int[]> ranges = new ArrayList<>();
                    int idx = 0;
                    while (idx < total) {
                        int start = idx;
                        int chars = 0;
                        int maxItems = (start == 0) ? 12 : 20;
                        while (idx < total && (idx - start) < maxItems && (idx == start || chars + itemsArr.optString(idx, "").length() < 2200)) {
                            chars += itemsArr.optString(idx, "").length();
                            idx++;
                        }
                        ranges.add(new int[] {start, idx});
                    }

                    for (int[] range : ranges) {
                        final int start = range[0];
                        final int end = range[1];
                        final String[] slice = new String[end - start];
                        for (int k = 0; k < slice.length; k++) {
                            slice[k] = itemsArr.optString(start + k, "");
                        }
                        POOL.execute(() -> {
                            if (gen != GENERATION.get()) return;
                            try {
                                SBrowserXGoogleTranslator.BatchResult br =
                                        SBrowserXGoogleTranslator.translateBatchHtml(engine, sl, tl, slice);
                                if (gen != GENERATION.get()) return;
                                applyBatchToDom(act, start, br.translations, gen);
                                if (showChromeBanner && !bannerShown[0]) {
                                    bannerShown[0] = true;
                                    String detected = (br.detectedLang != null && !br.detectedLang.isEmpty())
                                            ? br.detectedLang : (!docLang.isEmpty() ? docLang : sl);
                                    SBrowserXChromeTranslateBanner.show(act, detected, tl, host);
                                }
                            } catch (Throwable t) {
                                Log.w(TAG, "Batch [" + start + ".." + end + "] failed", t);
                            }
                        });
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "Extract/dispatch failed", t);
                }
            });
        });
    }

    public static void maybeAutoTranslateOnLoad() {
        maybeAutoTranslateActivity(SBrowserXHooks.getMainActivity(), true);
    }

    public static void maybeAutoTranslateActivity(Activity targetActivity, boolean showChromeBanner) {
        maybeAutoTranslateActivityInternal(targetActivity, showChromeBanner, 450L, true);
    }

    private static void maybeAutoTranslateActivityInternal(
            Activity targetActivity, boolean showChromeBanner, long delayMs, boolean allowRetry
    ) {
        Context ctx = SBrowserXPrefs.getAppContext();
        if (ctx == null || !SBrowserXPrefs.isGoogleTranslateEnabled(ctx) || !SBrowserXPrefs.isTranslateAutoEnabled(ctx)) {
            return;
        }
        MAIN.postDelayed(() -> {
            final Activity act = targetActivity != null ? targetActivity : SBrowserXHooks.getMainActivity();
            Object tab = getTabFromActivity(act);
            if (tab == null) return;
            evalJs(tab, DETECT_SAMPLE_JS, rawJson -> {
                if (rawJson == null || rawJson.isEmpty() || "null".equals(rawJson)) return;
                POOL.execute(() -> {
                    try {
                        JSONObject obj = new JSONObject(unwrapJsString(rawJson));
                        String url = obj.optString("url", "");
                        if (url.isEmpty() || !url.startsWith("http")) return;
                        try {
                            String host = Uri.parse(url).getHost();
                            if (host != null && SBrowserXPrefs.getTranslateNeverSites(ctx).contains(host.toLowerCase(Locale.US))) {
                                return;
                            }
                        } catch (Throwable ignored) {}

                        long now = System.currentTimeMillis();
                        if (url.equals(sLastAutoUrl) && (now - sLastAutoTime) < 4000L) return;

                        String targetLang = SBrowserXGoogleTranslator.normalizeLang(SBrowserXPrefs.getTranslateTargetLang(ctx));
                        String pageLang = SBrowserXGoogleTranslator.normalizeLang(obj.optString("lang", ""));
                        String sample = obj.optString("sample", "");

                        // SPA / lazy-loaded pages may have empty body at 450ms -> retry once at 1500ms
                        if (sample.length() < 15) {
                            if (allowRetry) {
                                maybeAutoTranslateActivityInternal(act, showChromeBanner, 1500L, false);
                            }
                            return;
                        }

                        // Detect mismatch when a foreign page falsely declares <html lang="ru"> (or vice versa)
                        boolean looksMostlyLatin = isMostlyLatin(sample);
                        boolean targetIsCyrillic = "ru".equalsIgnoreCase(targetLang)
                                || "uk".equalsIgnoreCase(targetLang)
                                || "be".equalsIgnoreCase(targetLang);
                        if (pageLang.isEmpty() || (targetIsCyrillic && pageLang.equalsIgnoreCase(targetLang) && looksMostlyLatin)) {
                            pageLang = SBrowserXGoogleTranslator.detectLanguageFast(sample);
                        }
                        if (pageLang.isEmpty() || pageLang.equalsIgnoreCase(targetLang)) return;

                        Set<String> never = SBrowserXPrefs.getTranslateNeverLangs(ctx);
                        Set<String> always = SBrowserXPrefs.getTranslateAlwaysLangs(ctx);
                        if (never.contains(pageLang) && !always.contains(pageLang)) return;

                        sLastAutoUrl = url;
                        sLastAutoTime = now;
                        translateTab(act, pageLang, targetLang, showChromeBanner);
                    } catch (Throwable ignored) {}
                });
            });
        }, delayMs);
    }

    private static boolean isMostlyLatin(String s) {
        if (s == null || s.isEmpty()) return false;
        int latin = 0;
        int letters = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.isLetter(c)) {
                letters++;
                if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) latin++;
            }
        }
        return letters >= 12 && (latin * 100 / letters) >= 65;
    }

    public static void revertCurrentTab() {
        revertTab(SBrowserXHooks.getMainActivity());
    }

    public static void revertTab(Activity targetActivity) {
        GENERATION.incrementAndGet();
        MAIN.post(() -> {
            Object tab = getTabFromActivity(targetActivity != null ? targetActivity : SBrowserXHooks.getMainActivity());
            if (tab != null) {
                evalJs(tab, REVERT_JS, null);
            }
        });
    }

    private static void applyBatchToDom(Activity act, int startIndex, String[] translatedSlice, int gen) {
        JSONArray arr = new JSONArray();
        for (String s : translatedSlice) {
            arr.put(s != null ? s : "");
        }
        String js = "(function(start,arr){"
                + "if(!window.__sbxBlocks)return;"
                + "function rebuild(parent,html,saved){"
                + "  var tmp=document.createElement('div');tmp.innerHTML=html;"
                + "  var frag=document.createDocumentFragment();"
                + "  function walk(src,dst){"
                + "    for(var n=src.firstChild;n;n=n.nextSibling){"
                + "      if(n.nodeType===3){dst.appendChild(document.createTextNode(n.nodeValue));}"
                + "      else if(n.nodeType===1){"
                + "        var ai=(n.tagName==='A'&&n.getAttribute('i')!==null)?n.getAttribute('i'):null;"
                + "        if(ai!==null){"
                + "          var orig=saved[parseInt(ai,10)];"
                + "          if(orig){"
                + "            var clone=orig.cloneNode(false);"
                + "            walk(n,clone);dst.appendChild(clone);"
                + "          }else{walk(n,dst);}"
                + "        }else{walk(n,dst);}"
                + "      }"
                + "    }"
                + "  }"
                + "  walk(tmp,frag);"
                + "  parent.innerHTML='';parent.appendChild(frag);"
                + "}"
                + "for(var i=0;i<arr.length;i++){"
                + "  var b=window.__sbxBlocks[start+i];"
                + "  if(b&&arr[i]){try{rebuild(b.el,arr[i],b.saved);}catch(e){}}"
                + "}"
                + "})(" + startIndex + "," + arr.toString() + ");";

        MAIN.post(() -> {
            if (gen != GENERATION.get()) return;
            Object tab = getTabFromActivity(act);
            if (tab != null) {
                evalJs(tab, js, null);
            }
        });
    }

    private static String unwrapJsString(String raw) {
        String s = raw.trim();
        if (s.startsWith("\"") && s.endsWith("\"") && s.length() >= 2) {
            try {
                JSONArray wrapper = new JSONArray("[" + s + "]");
                return wrapper.getString(0);
            } catch (Throwable ignored) {}
        }
        return s;
    }

    private static Object getTabFromActivity(Activity act) {
        try {
            if (act == null || act.isFinishing() || act.isDestroyed()) return null;
            return act.getClass().getMethod("getCurrentTab").invoke(act);
        } catch (Throwable t) {
            Log.e(TAG, "getTabFromActivity failed", t);
            return null;
        }
    }

    private interface JsResultCallback {
        void onResult(String result);
    }

    private static void evalJs(Object tab, String script, JsResultCallback cb) {
        try {
            Class<?> cbCls = Class.forName("com.sec.terrace.TerraceJavaScriptCallback");
            Object proxy = null;
            if (cb != null) {
                proxy = Proxy.newProxyInstance(
                        cbCls.getClassLoader(),
                        new Class<?>[] {cbCls},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object p, Method m, Object[] args) {
                                if ("handleJavaScriptResult".equals(m.getName()) && args != null && args.length > 0) {
                                    cb.onResult(args[0] instanceof String ? (String) args[0] : null);
                                }
                                return null;
                            }
                        });
            }
            Method eval = tab.getClass().getMethod("evaluateJavaScript", String.class, cbCls);
            eval.invoke(tab, script, proxy);
        } catch (Throwable t) {
            Log.e(TAG, "evaluateJavaScript failed", t);
        }
    }
}
