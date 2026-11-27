package app.morphe.extension.youtube.shared;

/** Stub of the official enum; only the signatures the add-on calls. */
public enum PlayerType {
    NONE,
    HIDDEN;

    public static PlayerType getCurrent() {
        throw new UnsupportedOperationException("stub");
    }

    public boolean isNoneOrHidden() {
        throw new UnsupportedOperationException("stub");
    }
}
