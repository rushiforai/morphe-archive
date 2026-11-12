import app.fontism.extension.joplin.FontSanitizer;
import java.nio.*;
import java.nio.file.*;
import java.util.*;

public class FontSanitizerTest {
    static void check(boolean ok) { if (!ok) throw new AssertionError(); }
    static byte[] font(int format) {
        ByteBuffer b = ByteBuffer.allocate(160).order(ByteOrder.BIG_ENDIAN);
        b.putInt(0x10000).putShort((short)2);
        b.position(12); b.putInt(0x636d6170).putInt(0).putInt(44).putInt(80);
        b.putInt(0x68656164).putInt(0).putInt(124).putInt(36);
        b.position(44); b.putShort((short)0).putShort((short)1).putShort((short)3).putShort((short)10).putInt(12);
        b.position(56); b.putShort((short)format).putShort((short)0).putInt(64).putInt(0).putInt(4);
        b.putInt(65).putInt(66).putInt(1);
        b.putInt(0xac00).putInt(0xac01).putInt(100);
        b.putInt(0xe001).putInt(0xe002).putInt(200);
        b.putInt(0x1f600).putInt(0x1f600).putInt(300);
        return b.array();
    }
    static Map<Integer,Integer> map(byte[] font) {
        ByteBuffer b=ByteBuffer.wrap(font).order(ByteOrder.BIG_ENDIAN);
        int cmap=-1, count=Short.toUnsignedInt(b.getShort(4));
        for(int i=0;i<count;i++) if(b.getInt(12+i*16)==0x636d6170)cmap=b.getInt(20+i*16);
        int sub=cmap+b.getInt(cmap+8), groups=b.getInt(sub+12);
        Map<Integer,Integer> result=new HashMap<>();
        for(int i=0;i<groups;i++) {
            int at=sub+16+i*12,start=b.getInt(at),end=b.getInt(at+4),g=b.getInt(at+8);
            for(int cp=start;cp<=end;cp++)result.put(cp,g+cp-start);
        }
        return result;
    }
    static void rejected(byte[] data) throws Exception {
        try { FontSanitizer.sanitize(data); throw new AssertionError("Accepted invalid font"); }
        catch(java.io.IOException expected) {}
    }
    public static void main(String[] args) throws Exception {
        for(int f:new int[]{12,13}) {
            byte[] safe=FontSanitizer.sanitize(font(f));
            Map<Integer,Integer> glyphs=map(safe);
            check(glyphs.size()==4 && glyphs.get(65)==1 && glyphs.get(0xac00)==100);
            check(glyphs.get(66)==(f==12?2:1));
            int sum=0;ByteBuffer b=ByteBuffer.wrap(safe);while(b.remaining()>=4)sum+=b.getInt();check(sum==0xb1b0afba);
            check(Arrays.equals(safe,FontSanitizer.sanitize(safe)));
        }
        byte[] valid=font(12);
        for(int n=0;n<valid.length;n++)rejected(Arrays.copyOf(valid,n));
        byte[] duplicate=valid.clone();ByteBuffer.wrap(duplicate).putInt(28,0x636d6170);rejected(duplicate);
        byte[] overlap=valid.clone();ByteBuffer.wrap(overlap).putInt(84,65);rejected(overlap);
        Random random=new Random(9);
        for(int i=0;i<2000;i++) {byte[] bytes=new byte[random.nextInt(512)];random.nextBytes(bytes);rejected(bytes);}
        int real=0;
        for(String path:args) {
            byte[] safe=FontSanitizer.sanitize(Files.readAllBytes(Path.of(path)));
            Map<Integer,Integer> glyphs=map(safe);
            check(glyphs.keySet().stream().allMatch(FontSanitizer::isText));
            check(glyphs.containsKey(65));
            check(java.awt.Font.createFont(java.awt.Font.TRUETYPE_FONT,new java.io.ByteArrayInputStream(safe)).canDisplay('A'));
            real++;
        }
        System.out.println("PASS: Unicode12/13, icon/emoji exclusion, checksums, idempotence, all truncations, malformed tables, 2000 random inputs, "+real+" real fonts (independent AWT load)");
    }
}
