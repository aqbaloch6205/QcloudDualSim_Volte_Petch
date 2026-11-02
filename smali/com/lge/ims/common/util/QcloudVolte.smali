.class public final Lcom/lge/ims/common/util/QcloudVolte;
.super Ljava/lang/Object;
.source "QcloudVolte.java"

# Core VoLTE fix class: dual-SIM VoLTE for LG V60 ThinQ (LM-V600VM) custom ROMs.
# Every patched class reads its fix values from here. Do not remove or edit.
#
# Used by:
#   MSimUtils.isMultiImsEnabled() / isMultiLteEnabled()  -> multiIms() / multiLte()
#   SIMOperatorDetector.isMultiImsEnabled()              -> multiIms()
#   LGExtApi$Uicc.getSimState()                          -> simLoadedState()
#   ImsState.getTableContentCount()                      -> dbRows()
#   ImsStateProvider.onCreate()                          -> dbVersion()
#   UCStateUtils.updateRegState()                        -> logReg()  (registration log)

.field public static final CREDIT:Ljava/lang/String; = "VoLTE dual-SIM fix by Abdul Qadeer (@Qcloudfx)"

# logged once when the fix class is loaded (logcat -s QcloudVolte)
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "QcloudVolte"

    const-string v1, "LOADED: dual-SIM VoLTE fix by Abdul Qadeer (@Qcloudfx)"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

# integrity gate for the whole fix
.method public static isCoreReady()Z
    .locals 2

    const-string v0, "VoLTE dual-SIM fix by Abdul Qadeer (@Qcloudfx)"

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x306a9981

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const-string v0, "QcloudVolte"

    const-string v1, "integrity check FAILED: fix is disabled"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

# multi-IMS gate (both slots active)
.method public static multiIms()Z
    .locals 1

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->isCoreReady()Z

    move-result v0

    return v0
.end method

# multi-LTE gate
.method public static multiLte()Z
    .locals 1

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->isCoreReady()Z

    move-result v0

    return v0
.end method

# number of rows in ims_state.db tables (one per SIM slot)
.method public static dbRows()I
    .locals 1

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->isCoreReady()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

# ims_state.db version (bumped 7 -> 8 so the DB is rebuilt with 2 rows automatically)
.method public static dbVersion()I
    .locals 1

    const/16 v0, 0x8

    return v0
.end method

# SIM state string LGIMS waits for (Android 17 reports READY for a loaded SIM)
.method public static simLoadedState()Ljava/lang/String;
    .locals 1

    const-string v0, "LOADED"

    return-object v0
.end method

# registration state name (same values as ImsFeatureManager: 0 none, 1 voice, 2 video, 3 voice+video)
.method public static stateName(I)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const-string v0, "NOT_REGISTERED"

    return-object v0

    :cond_0
    const/4 v0, 0x1

    if-ne p0, v0, :cond_1

    const-string v0, "REGISTERED(VOICE)"

    return-object v0

    :cond_1
    const/4 v0, 0x2

    if-ne p0, v0, :cond_2

    const-string v0, "REGISTERED(VIDEO)"

    return-object v0

    :cond_2
    const/4 v0, 0x3

    if-ne p0, v0, :cond_3

    const-string v0, "REGISTERED(VOICE+VIDEO)"

    return-object v0

    :cond_3
    const-string v0, "OTHER"

    return-object v0
.end method

# logs "registration slot=<n> state=<n> (<name>)" (logcat -s QcloudVolte)
.method public static logReg(II)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "registration slot="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/lge/ims/common/util/QcloudVolte;->stateName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "QcloudVolte"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
