# Synthetic fixture — telemetry reading the same API from an obfuscated class name.
.class public Lcom/example/telemetry/Report;
.super Ljava/lang/Object;

.method public properties(Landroid/content/pm/InstallSourceInfo;)Ljava/util/Map;
    .locals 2

    invoke-virtual {p1}, Landroid/content/pm/InstallSourceInfo;->getPackageSource()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Map;->of(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
