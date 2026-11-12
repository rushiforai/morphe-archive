import app.font.extension.anytype.FontValidator;
import java.nio.*;
import java.nio.file.*;
import java.util.*;

public class FontValidatorTest {
    static void check(boolean ok) { if (!ok) throw new AssertionError(); }
    static byte[] font(int format) {
        ByteBuffer b = ByteBuffer.allocate(204).order(ByteOrder.BIG_ENDIAN);
        b.putInt(0x10000).putShort((short)3);
        b.position(12); b.putInt(0x636d6170).putInt(0).putInt(60).putInt(80);
        b.putInt(0x68656164).putInt(0).putInt(140).putInt(56);
        b.putInt(0x6d617870).putInt(0).putInt(196).putInt(8);
        b.position(196); b.putInt(0x50000).putShort((short)400);
        b.position(60); b.putShort((short)0).putShort((short)1).putShort((short)3).putShort((short)10).putInt(12);
        b.position(72); b.putShort((short)format).putShort((short)0).putInt(64).putInt(0).putInt(4);
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
        try { FontValidator.validate(data); throw new AssertionError("Accepted invalid font"); }
        catch(java.io.IOException expected) {}
    }
    public static void main(String[] args) throws Exception {
        for(int f:new int[]{12,13}) {
            byte[] safe=FontValidator.validate(font(f));
            Map<Integer,Integer> glyphs=map(safe);
            check(glyphs.size()==6 && glyphs.get(65)==1 && glyphs.get(0xac00)==100);
            check(glyphs.get(66)==(f==12?2:1));
            int sum=0;ByteBuffer b=ByteBuffer.wrap(safe);while(b.remaining()>=4)sum+=b.getInt();check(sum==0xb1b0afba);
            check(Arrays.equals(safe,FontValidator.validate(safe)));
        }
        check(FontValidator.isText(0x2211)); // mathematical sum
        check(FontValidator.isText(0x200d)); // shaping joiner
        check(FontValidator.isText(0x0301)); // combining acute
        check(!FontValidator.isText(0x1f600));
        byte[] valid=font(12);
        for(int n=0;n<valid.length;n++)rejected(Arrays.copyOf(valid,n));
        byte[] duplicate=valid.clone();ByteBuffer.wrap(duplicate).putInt(28,0x636d6170);rejected(duplicate);
        byte[] overlap=valid.clone();ByteBuffer.wrap(overlap).putInt(100,65);rejected(overlap);
        Random random=new Random(9);
        for(int i=0;i<2000;i++) {byte[] bytes=new byte[random.nextInt(512)];random.nextBytes(bytes);rejected(bytes);}
        int real=0;
        for(String path:args) {
            byte[] safe=FontValidator.validate(Files.readAllBytes(Path.of(path)));
            Map<Integer,Integer> glyphs=map(safe);
            check(glyphs.keySet().stream().allMatch(FontValidator::isText));
            check(glyphs.containsKey(65));
            check(java.awt.Font.createFont(java.awt.Font.TRUETYPE_FONT,new java.io.ByteArrayInputStream(safe)).canDisplay('A'));
            real++;
        }
        System.out.println("PASS: Unicode12/13, emoji exclusion and private-use preservation, checksums, idempotence, all truncations, malformed tables, 2000 random inputs, "+real+" real fonts (independent AWT load)");
    }
}
