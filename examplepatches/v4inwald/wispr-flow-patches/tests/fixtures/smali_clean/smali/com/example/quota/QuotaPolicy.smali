# Synthetic smali fixture — the kind of code the unlimited-words patch targets.
# Minimal on purpose: enough structure for the patcher to anchor on, no app code.
.class public final Lcom/example/quota/QuotaPolicy;
.super Ljava/lang/Object;

.field public static final SOFT_LIMIT:I = 0x3e8

.method public final computeState(ZIJ)Lcom/example/quota/QuotaState;
    .locals 0

    if-nez p1, :cond_0

    sget-object p0, Lcom/example/quota/QuotaState$None;->INSTANCE:Lcom/example/quota/QuotaState$None;

    return-object p0

    :cond_0
    sget-object p0, Lcom/example/quota/QuotaState$Limited;->INSTANCE:Lcom/example/quota/QuotaState$Limited;

    return-object p0
.end method
