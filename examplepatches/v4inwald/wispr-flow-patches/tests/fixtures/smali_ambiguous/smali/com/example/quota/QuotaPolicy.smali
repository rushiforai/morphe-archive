# Same class, but the anchor pattern occurs twice — applying it would patch the wrong
# branch. The patcher must refuse rather than pick one.
.class public final Lcom/example/quota/QuotaPolicy;
.super Ljava/lang/Object;

.method public final computeState(ZIJ)Lcom/example/quota/QuotaState;
    .locals 0

    if-nez p1, :cond_0

    if-nez p1, :cond_0

    sget-object p0, Lcom/example/quota/QuotaState$None;->INSTANCE:Lcom/example/quota/QuotaState$None;

    return-object p0

    :cond_0
    sget-object p0, Lcom/example/quota/QuotaState$Limited;->INSTANCE:Lcom/example/quota/QuotaState$Limited;

    return-object p0
.end method
