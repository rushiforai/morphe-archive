/*
 * cancel_ads.js - Block sponsored ad pop-ups in cz.bakalari.mobile (Flutter app)
 * 
 * Usage:
 *   frida -U -f cz.bakalari.mobile -l cancel_ads.js --no-pause
 */

const BLOCKED_DOMAINS = [
    'campaign.bakalari.cz',
    'campaign-dev.bakalari.cz',
    'netglade.cz'
];

function isBlocked(url) {
    try {
        return BLOCKED_DOMAINS.some(d => url && url.includes(d));
    } catch(e) {
        return false;
    }
}

function log(msg) {
    console.log('[Morphe-AdBlock] ' + msg);
}

log('=== Morphe AdBlock starting ===');
log('Blocking: ' + BLOCKED_DOMAINS.join(', '));

Java.perform(function () {
    let hooksApplied = 0;

    // Helper to extract URL from various request types
    function getUrl(obj) {
        try {
            if (obj && obj.url) return obj.url();
            if (obj && obj.getUrl) return obj.getUrl().toString();
            if (obj && obj.request) {
                var req = obj.request();
                if (req && req.url) return req.url().toString();
                if (req && req.getUrl) return req.getUrl().toString();
            }
            return '';
        } catch(e) { return ''; }
    }

    // Hook OkHttpClient.newCall
    try {
        var OkHttpClient = Java.use('okhttp3.OkHttpClient');
        OkHttpClient.newCall.overload('okhttp3.Request').implementation = function(request) {
            var url = request.url().toString();
            if (isBlocked(url)) {
                log('BLOCKED (OkHttpClient): ' + url);
                throw new Error('Ad blocked');
            }
            log('ALLOWED: ' + url);
            return this.newCall(request);
        };
        log('Hooked OkHttpClient.newCall');
    } catch(e) {
        log('Failed OkHttpClient.newCall: ' + e.message);
    }

    // Hook okhttp3.Call.execute
    try {
        var OkHttpCall = Java.use('okhttp3.Call');
        OkHttpCall.execute.overload().implementation = function() {
            var url = this.request().url().toString();
            if (isBlocked(url)) {
                log('BLOCKED (OkHttpCall.execute): ' + url);
                throw new Error('Ad blocked');
            }
            log('ALLOWED (OkHttpCall.execute): ' + url);
            return this.execute();
        };
        log('Hooked okhttp3.Call.execute');
    } catch(e) {
        log('Failed OkHttpCall.execute: ' + e.message);
    }

    // Hook FirebasePerfOkHttpClient.execute
    try {
        var FirebasePerfOkHttpClient = Java.use('com.google.firebase.perf.network.FirebasePerfOkHttpClient');
        FirebasePerfOkHttpClient.execute.overload('okhttp3.Call').implementation = function(call) {
            var url = call.request().url().toString();
            if (isBlocked(url)) {
                log('BLOCKED (FirebasePerfOkHttpClient): ' + url);
                throw new Error('Ad blocked: ' + url);
            }
            log('ALLOWED (FirebasePerfOkHttpClient): ' + url);
            return this.execute(call);
        };
        log('Hooked FirebasePerfOkHttpClient.execute');
    } catch(e) {
        log('Failed FirebasePerfOkHttpClient.execute: ' + e.message);
    }

    // Hook c8/f.j - Firebase Performance URL tracking
    try {
        var c8_f = Java.use('c8.f');
        c8_f.j.overload('java.lang.String').implementation = function(url) {
            if (isBlocked(url)) {
                log('BLOCKED (c8/f.j): ' + url);
                throw new Error('Ad blocked');
            }
            log('ALLOWED (c8/f.j): ' + url);
            return this.j(url);
        };
        log('Hooked c8/f.j');
    } catch(e) {
        log('Failed c8/f.j: ' + e.message);
    }

    // Hook HttpURLConnection.connect
    try {
        var HttpURLConnection = Java.use('java.net.HttpURLConnection');
        HttpURLConnection.connect.implementation = function() {
            var url = this.getURL().toString();
            if (isBlocked(url)) {
                log('BLOCKED (HttpURLConnection): ' + url);
                throw new Error('Ad blocked: ' + url);
            }
            log('ALLOWED (HttpURLConnection): ' + url);
            return this.connect();
        };
        log('Hooked HttpURLConnection.connect');
    } catch(e) {
        log('Failed HttpURLConnection.connect: ' + e.message);
    }

    log('Morphe AdBlock ready - waiting for network requests...');
});