package app.zeldrisho.zalo.extension;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import org.junit.jupiter.api.Test;

class RecallDigestTest {
  @Test void reusedDigestPreservesLengthPrefixedKeyFormat() throws Exception {
    Method method = RecallMarker.class.getDeclaredMethod("digest", String.class, String.class, String.class);
    method.setAccessible(true);
    for (String[] parts : new String[][] {{"owner", "a", "id"}, {"other", "b", "value"}, {"owner", "a", "id"}}) {
      MessageDigest expected = MessageDigest.getInstance("SHA-256");
      for (String part : parts) {
        byte[] bytes = part.getBytes(StandardCharsets.UTF_8);
        expected.update(ByteBuffer.allocate(4).putInt(bytes.length).array());
        expected.update(bytes);
      }
      StringBuilder hex = new StringBuilder();
      for (byte value : expected.digest()) hex.append(String.format("%02x", value & 0xff));
      assertEquals(hex.toString(), method.invoke(null, (Object[]) parts));
    }
  }
}
