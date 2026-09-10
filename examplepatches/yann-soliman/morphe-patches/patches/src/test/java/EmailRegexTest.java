import java.nio.file.*;
import java.util.Random;
import java.util.regex.Pattern;

/** Test compiled patch constants, or regexes independently extracted from both DEX files. */
public class EmailRegexTest {
    private static int checks;
    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) throw new AssertionError(message);
    }
    public static void main(String[] args) throws Exception {
        String oldRegex, newRegex;
        if (args.length == 2) {
            oldRegex = Files.readString(Path.of(args[0])).stripTrailing();
            newRegex = Files.readString(Path.of(args[1])).stripTrailing();
        } else {
            Class<?> patch = Class.forName("io.github.yannsoliman.patches.keepcool.KeepcoolEmailPatchKt");
            oldRegex = (String) patch.getField("ORIGINAL_REGEX").get(null);
            newRegex = (String) patch.getMethod("getPLUS_REGEX").invoke(null);
        }
        Pattern old = Pattern.compile(oldRegex), fixed = Pattern.compile(newRegex);
        String email = "prenom+keepcool@gmail.com";
        check(!old.matcher(email).matches(), "Baseline must reproduce bug");
        check(fixed.matcher(email).matches(), "Plus address rejected");
        check(oldRegex.substring(oldRegex.indexOf('@')).equals(newRegex.substring(newRegex.indexOf('@'))), "Domain validation changed");
        for (String valid : new String[]{email,"prenom@gmail.com","prenom.nom+keepcool@gmail.com","a+b@gmail.com","a-b_c+d@gmail.com"})
            check(fixed.matcher(valid).matches(), "Valid address rejected: " + valid);
        for (String invalid : new String[]{"","not-an-email","@gmail.com","a b@gmail.com","a..b@gmail.com","a+b@@gmail.com","a+b@gm+ail.com","a+b@gmail",".a+b@gmail.com","a+b.@gmail.com"})
            check(!fixed.matcher(invalid).matches(), "Invalid address accepted: " + invalid);
        // Fixed seed: no-plus addresses must have exactly the original behavior.
        Random random = new Random(821);
        String alphabet = "abcAZ019_- .!@";
        for (int i = 0; i < 10000; i++) {
            StringBuilder local = new StringBuilder();
            for (int j = random.nextInt(20); j > 0; j--) local.append(alphabet.charAt(random.nextInt(alphabet.length())));
            String sample = local + (i % 2 == 0 ? "@gmail.com" : "@example.technology");
            check(old.matcher(sample).matches() == fixed.matcher(sample).matches(), "No-plus regression: " + sample);
        }
        System.out.println("PASS: " + checks + " checks (positive, negative, domain unchanged, 10000 no-plus regressions)");
    }
}
