package app.zeldrisho.zalo.extension;

/** Selection policy for the native account-specific backup interval. */
public final class BackupIntervalPolicy {
  private BackupIntervalPolicy() {}

  /**
   * Returns the selected interval in milliseconds for 1, 3, 6, or 12 hours.
   * All other values preserve the native interval, also expressed in milliseconds.
   */
  public static long select(long nativeInterval, int hours) {
    switch (hours) {
      case 1:
      case 3:
      case 6:
      case 12:
        return hours * 3_600_000L;
      default:
        return nativeInterval;
    }
  }
}
