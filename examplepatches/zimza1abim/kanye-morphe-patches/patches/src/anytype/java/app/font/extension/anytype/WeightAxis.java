package app.font.extension.anytype;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

/** Small, bounded fvar read; no font-byte allocation on cold start. */
final class WeightAxis {
    final float min, normal, max;
    WeightAxis(float min, float normal, float max) { this.min=min; this.normal=normal; this.max=max; }
    float clamp(int weight) { return Math.max(min, Math.min(max, weight)); }
    static WeightAxis read(File file) throws IOException {
        try (RandomAccessFile in=new RandomAccessFile(file,"r")) {
            if(in.length()<12) throw new IOException("Truncated font");
            in.seek(4);int count=in.readUnsignedShort();
            if(count<1 || count>256 || 12L+count*16L>in.length()) throw new IOException("Invalid font directory");
            for(int i=0;i<count;i++) {
                in.seek(12L+i*16L);int tag=in.readInt();in.readInt();long offset=Integer.toUnsignedLong(in.readInt()), size=Integer.toUnsignedLong(in.readInt());
                if(tag!=0x66766172)continue;
                if(size<16 || offset+size>in.length())throw new IOException("Invalid fvar table");
                in.seek(offset);if(in.readUnsignedShort()!=1)throw new IOException("Unsupported variable font version");
                in.readUnsignedShort();int start=in.readUnsignedShort();in.readUnsignedShort();int axes=in.readUnsignedShort(), axisSize=in.readUnsignedShort();
                if(axes>64 || axisSize<20 || start<16 || start+(long)axes*axisSize>size)throw new IOException("Invalid variable font axes");
                for(int a=0;a<axes;a++) {
                    in.seek(offset+start+(long)a*axisSize);int axis=in.readInt();
                    float min=in.readInt()/65536f, normal=in.readInt()/65536f, max=in.readInt()/65536f;
                    if(min>normal || normal>max)throw new IOException("Invalid variable font axis bounds");
                    if(axis==0x77676874)return new WeightAxis(min,normal,max);
                }
            }
            return null;
        }
    }
}
