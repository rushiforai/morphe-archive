/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.oauth;

import org.junit.Test;

import java.io.StringReader;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;

public class OAuthTokenPayloadTest {
    private static final String MINIMAL =
            "{\"access_token\":\"fixture-access\",\"refresh_token\":\"fixture-refresh\"}";

    @Test
    public void roundTripsExportMetadataAndOpaqueTokens() throws Exception {
        OAuthTokenPayload original = new OAuthTokenPayload(
                "fixture.access+/=", "fixture:refresh_-", "Fixture_User", "fixture-client"
        );
        OAuthTokenPayload decoded = OAuthTokenPayload.parse(original.toJson());
        assertEquals(original.accessToken, decoded.accessToken);
        assertEquals(original.refreshToken, decoded.refreshToken);
        assertEquals(original.username, decoded.username);
        assertEquals(original.clientId, decoded.clientId);
    }

    @Test
    public void acceptsTokenPairsWithoutMetadata() throws Exception {
        OAuthTokenPayload payload = OAuthTokenPayload.parse(MINIMAL);
        assertEquals("fixture-access", payload.accessToken);
        assertEquals("fixture-refresh", payload.refreshToken);
        assertNull(payload.username);
        assertNull(payload.clientId);
    }

    @Test
    public void rejectsAmbiguousOrMalformedJson() {
        String[] invalid = {
                "", "null", "[]", "{}", "{\"access_token\":\"only-access\"}",
                MINIMAL + "{}", MINIMAL + " true", MINIMAL.substring(0, MINIMAL.length() - 1),
                MINIMAL.replace("\"access_token\"", "access_token"),
                MINIMAL.replace("\"fixture-access\"", "null"),
                MINIMAL.replace("\"fixture-access\"", "42"),
                MINIMAL.replace("\"fixture-refresh\"", "[]"),
                MINIMAL.replace("\"fixture-refresh\"", "\"\""),
                MINIMAL.replace("\"fixture-refresh\"", "\"fixture\\nrefresh\""),
                MINIMAL.replace("\"fixture-access\"", "\" fixture-access \""),
                MINIMAL.replace("\"fixture-access\"", "\"fixture\u00e9\""),
                MINIMAL.replace("}", ",\"access_token\":\"other-access\"}"),
                MINIMAL.replace("}", ",\"version\":2}"),
                MINIMAL.replace("}", ",\"version\":1.0}"),
                MINIMAL.replace("}", ",\"version\":\"1\"}"),
                MINIMAL.replace("}", ",\"username\":null}"),
                MINIMAL.replace("}", ",\"client_id\":\"bad client\"}"),
                MINIMAL.replace("}", ",\"username\":\"bad/name\"}"),
                MINIMAL.replace("}", ",\"unexpected\":true}"),
                MINIMAL.replace("}", ",}"),
                "/* comment */" + MINIMAL,
        };
        for (String text : invalid) {
            OAuthTokenException error = assertThrows(OAuthTokenException.class,
                    () -> OAuthTokenPayload.parse(text));
            assertFalse(error.getMessage().contains("fixture-access"));
            assertFalse(error.getMessage().contains("fixture-refresh"));
        }
    }

    @Test
    public void rejectsOversizedTextAndTokens() {
        String oversized = MINIMAL + new String(new char[OAuthTokenPayload.MAX_CHARACTERS]).replace('\0', ' ');
        assertThrows(OAuthTokenException.class, () -> OAuthTokenPayload.parse(oversized));
        assertThrows(OAuthTokenException.class, () -> OAuthTokenPayload.read(new StringReader(oversized)));
        String token = new String(new char[16385]).replace('\0', 'x');
        assertThrows(OAuthTokenException.class,
                () -> new OAuthTokenPayload(token, "fixture-refresh", null, null));
    }

    @Test
    public void boundsReaderAndConsumesTheCompleteInput() throws Exception {
        assertEquals(MINIMAL, OAuthTokenPayload.read(new StringReader(MINIMAL)));
        OAuthTokenPayload payload = OAuthTokenPayload.parse(" \n" + MINIMAL + "\n ");
        assertEquals("fixture-access", payload.accessToken);
    }
}
