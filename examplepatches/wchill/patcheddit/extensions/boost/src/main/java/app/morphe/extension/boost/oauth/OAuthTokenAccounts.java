/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.oauth;

import com.activeandroid.ActiveAndroid;
import com.rubenmayayo.reddit.aa.User;

import java.io.InterruptedIOException;
import java.util.List;

import app.morphe.extension.boost.api.AccountStore;
import app.morphe.extension.boost.api.BoostPreferences;
import app.morphe.extension.boost.api.RedditJraw;

public final class OAuthTokenAccounts {
    private OAuthTokenAccounts() {}

    public static String currentUsername() {
        RedditJraw account = RedditJraw.instance;
        return account == null || account.user == null ? null : account.user.name;
    }

    public static String clientId() throws OAuthTokenException {
        final String configured;
        try {
            configured = preferences().getApiPreference("pref_dev_reddit_client_id");
        } catch (ClassCastException exception) {
            throw new OAuthTokenException("The client ID in Boost's API settings has an invalid type.");
        }
        if (configured != null && !configured.isEmpty()) return configured;
        RedditJraw account = RedditJraw.instance;
        if (account != null && account.credentials != null) {
            return account.credentials.getClientId();
        }
        throw new OAuthTokenException(
                "Boost's API client is not initialized. Open the home feed or configure the "
                        + "client ID in Boost's API settings, then retry."
        );
    }

    public static String userAgent() throws OAuthTokenException {
        try {
            return preferences().getUserAgent();
        } catch (ClassCastException exception) {
            throw new OAuthTokenException("The user agent in Boost's API settings has an invalid type.");
        }
    }

    private static BoostPreferences preferences() throws OAuthTokenException {
        BoostPreferences preferences = BoostPreferences.getInstance();
        if (preferences == null) throw new OAuthTokenException("Boost's settings are not initialized.");
        return preferences;
    }

    public static OAuthTokenPayload export(String username, String expectedClientId)
            throws OAuthTokenException {
        if (!expectedClientId.equals(clientId())) {
            throw new OAuthTokenException("The API client changed. Start the export again.");
        }
        RedditJraw account = RedditJraw.instance;
        if (account != null && account.credentials != null
                && !expectedClientId.equals(account.credentials.getClientId())) {
            throw new OAuthTokenException(
                    "The API client changed since sign-in. Refresh the account in Boost before exporting."
            );
        }
        for (User user : AccountStore.users()) {
            if (user.name.equalsIgnoreCase(username)) {
                return new OAuthTokenPayload(user.accessToken, user.refreshToken, user.name, expectedClientId);
            }
        }
        throw new OAuthTokenException("That account is no longer saved in Boost.");
    }

    public static void save(OAuthTokenValidator.VerifiedAccount verified)
            throws OAuthTokenException, InterruptedIOException {
        if (!verified.tokens.clientId.equals(clientId())) {
            throw new OAuthTokenException("The API client changed during import. No account was changed.");
        }
        OAuthTokenValidator.checkInterrupted();
        int index;
        ActiveAndroid.beginTransaction();
        try {
            User target = null;
            for (User user : AccountStore.users()) {
                if (user.name.equalsIgnoreCase(verified.tokens.username)) {
                    target = user;
                    break;
                }
            }
            if (target == null) target = new User();
            target.name = verified.tokens.username;
            target.accessToken = verified.tokens.accessToken;
            target.refreshToken = verified.tokens.refreshToken;
            target.oAuthData = verified.oauthData;
            target.expirationDate = verified.expirationDate;
            target.synced = false;
            if (target.save() == null) {
                throw new OAuthTokenException("Boost could not save the imported account.");
            }
            index = accountIndex(target.name);
            OAuthTokenValidator.checkInterrupted();
            ActiveAndroid.setTransactionSuccessful();
        } finally {
            ActiveAndroid.endTransaction();
        }
        // DrawerActivity uses this index into the native Name ASC account list.
        if (!preferences().preferences.edit().putInt("last_profile", index).commit()) {
            throw new OAuthTokenException(
                    "The tokens were saved, but Boost could not save the selected profile. "
                            + "Select the imported account in Boost's account switcher."
            );
        }
    }

    private static int accountIndex(String username) throws OAuthTokenException {
        List<User> users = AccountStore.users();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).name.equalsIgnoreCase(username)) return i;
        }
        throw new OAuthTokenException("Boost could not find the imported account.");
    }

    public static void activate(String username) throws OAuthTokenException {
        int index = accountIndex(username);
        if (!preferences().preferences.edit().putInt("last_profile", index).commit()) {
            throw new OAuthTokenException(
                    "The tokens were saved, but Boost could not select the imported account."
            );
        }
        RedditJraw previous = RedditJraw.instance;
        boolean activated = false;
        try {
            // A task restart alone does not discard the process's authenticated client.
            // Match DrawerActivity's native reset/initialize/select sequence.
            RedditJraw.instance = null;
            RedditJraw.initialize();
            RedditJraw.instance.selectAccount(index);
            if (!username.equalsIgnoreCase(currentUsername())) {
                throw new OAuthTokenException("Boost could not activate the imported account.");
            }
            activated = true;
        } finally {
            if (!activated) RedditJraw.instance = previous;
        }
    }
}
