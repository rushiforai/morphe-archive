# Synthetic fixture — an installer read behind a licence gate, the shape PairIP has.
.class public Lcom/example/sdk/Gate;
.super Ljava/lang/Object;

.method private localCheck()Z
    .locals 2

    invoke-static {}, Lcom/example/sdk/Gate;->packageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "com.example.app"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstallSourceInfo(Ljava/lang/String;)Landroid/content/pm/InstallSourceInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    return v1
.end method

.method public static packageManager()Landroid/content/pm/PackageManager;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
