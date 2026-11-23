package dev.jason.gboardpatches.extension.quickinsert;

public final class GboardQuickInsertPolicy {
    public static final String SUPER_INSERT_FLAG = "super_insert";
    public static final String SUPER_INSERT_VK_FLAG = "super_insert_vk";

    private GboardQuickInsertPolicy() {
    }

    public static boolean isTargetFlagName(String flagName) {
        return SUPER_INSERT_FLAG.equals(flagName)
                || SUPER_INSERT_VK_FLAG.equals(flagName);
    }

    public static Object maybeForce(String flagName, Object stockResult, boolean enabled) {
        if (!enabled || !isTargetFlagName(flagName) || !(stockResult instanceof Boolean)) {
            return stockResult;
        }
        return Boolean.TRUE;
    }
}
