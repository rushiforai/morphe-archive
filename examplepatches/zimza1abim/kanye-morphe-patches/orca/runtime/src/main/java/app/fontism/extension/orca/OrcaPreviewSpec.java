package app.fontism.extension.orca;

/** Limits decoded bitmap memory independently of the number of installed fonts. */
final class OrcaPreviewSpec {
    final int width, height, size, color;
    final long generation;

    OrcaPreviewSpec(String width, String height, String size, String color, String generation) {
        this.width = bounded(width, 64, 1536);
        this.height = bounded(height, 32, 256);
        this.size = bounded(size, 8, 96);
        long argb = Long.parseLong(color);
        if (argb < Integer.MIN_VALUE || argb > 0xffffffffL) throw new IllegalArgumentException("Invalid preview color");
        this.color = (int) argb;
        this.generation = Long.parseLong(generation);
        if (this.generation <= 0) throw new IllegalArgumentException("Invalid font list generation");
    }

    private static int bounded(String value, int minimum, int maximum) {
        int result = Integer.parseInt(value);
        if (result < minimum || result > maximum) throw new IllegalArgumentException("Invalid preview dimensions");
        return result;
    }

    String cacheKey(String key) {
        return generation + ":" + width + ":" + height + ":" + size + ":" + color + ":" + key;
    }
}
