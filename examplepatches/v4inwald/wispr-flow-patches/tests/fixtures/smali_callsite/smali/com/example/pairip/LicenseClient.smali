# Synthetic smali fixture — the shape of the Play licensing installer check.
# The real class is com/pairip/licensecheck/LicenseClient; only the relevant
# instructions are reproduced, including a second site in the same method.
.class public Lcom/example/pairip/LicenseClient;
.super Ljava/lang/Object;

.field private context:Landroid/content/Context;


.method private performLocalInstallerCheck()Z
    .locals 3

    iget-object v0, p0, Lcom/example/pairip/LicenseClient;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "com.example.app"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstallSourceInfo(Ljava/lang/String;)Landroid/content/pm/InstallSourceInfo;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    return v1
.end method


.method private pairingCheck()Z
    .locals 3

    iget-object v0, p0, Lcom/example/pairip/LicenseClient;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "com.example.app"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    return v1
.end method
