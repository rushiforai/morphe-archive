package app.morphe.extension.shared.requests;

import app.morphe.extension.shared.Utils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Requester {
    private Requester() {
    }

    public static HttpURLConnection getConnectionFromRoute(String apiUrl, Route route, String... params) throws IOException {
        return getConnectionFromCompiledRoute(apiUrl, route.compile(params));
    }

    public static HttpURLConnection getConnectionFromCompiledRoute(String apiUrl, Route.CompiledRoute route) throws IOException {
        String url = apiUrl + route.getCompiledRoute();
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(12000);
        connection.setReadTimeout(15000);
        connection.setRequestMethod(route.getMethod().name());
        if (route.getMethod() != Route.Method.GET) {
            connection.setFixedLengthStreamingMode(0);
        }
        String agentString = System.getProperty("http.agent")
                + "; Morphe/" + Utils.getAppVersionName()
                + " (" + Utils.getPatchesReleaseVersion() + ")";
        connection.setRequestProperty("User-Agent", agentString);

        return connection;
    }

    /**
     * Parse the {@link HttpURLConnection}, and closes the underlying InputStream.
     */
    private static String parseInputStreamAndClose(InputStream inputStream) throws IOException {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            StringBuilder jsonBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
                jsonBuilder.append('\n');
            }
            return jsonBuilder.toString();
        }
    }

    public static String parseString(HttpURLConnection connection) throws IOException {
        return parseInputStreamAndClose(connection.getInputStream());
    }

    public static String parseStringAndDisconnect(HttpURLConnection connection) throws IOException {
        String result = parseString(connection);
        connection.disconnect();
        return result;
    }

    public static String parseErrorString(HttpURLConnection connection) throws IOException {
        InputStream errorStream = connection.getErrorStream();
        if (errorStream == null) {
            return "";
        }
        return parseInputStreamAndClose(errorStream);
    }

    public static String parseErrorStringAndDisconnect(HttpURLConnection connection) throws IOException {
        String result = parseErrorString(connection);
        connection.disconnect();
        return result;
    }

    public static JSONObject parseJSONObject(HttpURLConnection connection) throws JSONException, IOException {
        return new JSONObject(parseString(connection));
    }

    public static JSONObject parseJSONObjectAndDisconnect(HttpURLConnection connection) throws JSONException, IOException {
        JSONObject object = parseJSONObject(connection);
        connection.disconnect();
        return object;
    }

    public static JSONArray parseJSONArray(HttpURLConnection connection) throws JSONException, IOException  {
        return new JSONArray(parseString(connection));
    }

    public static JSONArray parseJSONArrayAndDisconnect(HttpURLConnection connection) throws JSONException, IOException  {
        JSONArray array = parseJSONArray(connection);
        connection.disconnect();
        return array;
    }
}