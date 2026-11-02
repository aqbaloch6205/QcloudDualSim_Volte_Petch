.class public Lcom/lge/ims/common/util/LGExtApi$Uicc;
.super Ljava/lang/Object;
.source "LGExtApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/ims/common/util/LGExtApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Uicc"
.end annotation


# static fields
.field private static final EF_SMSP:I = 0x6f42

.field private static final KEY_ECCLIST:Ljava/lang/String; = "sim.ecclist"

.field private static final KEY_EF_UST:Ljava/lang/String; = "ef_ust"

.field public static final SIM_REMOVED:Ljava/lang/String; = "SIM_REMOVED"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bytesToHexString([B)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # [B

    .line 316
    invoke-static {p0}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized cacheEccList(I)Z
    .locals 2
    .param p0, "slotId"    # I

    const-class v0, Lcom/lge/ims/common/util/LGExtApi$Uicc;

    monitor-enter v0

    .line 264
    :try_start_0
    invoke-static {}, Lcom/lge/ims/common/util/LGExtApi$Uicc;->initEccList()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 266
    const/4 v1, 0x1

    monitor-exit v0

    return v1

    .line 263
    .end local p0    # "slotId":I
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getEccList(I)Ljava/lang/String;
    .locals 3
    .param p0, "slotId"    # I

    const-class v0, Lcom/lge/ims/common/util/LGExtApi$Uicc;

    monitor-enter v0

    .line 270
    :try_start_0
    invoke-static {}, Lcom/lge/ims/common/util/LGExtApi$Uicc;->initEccList()V

    .line 272
    const-string v1, "sim.ecclist"

    const-string v2, ""

    invoke-static {v1, p0, v2}, Lcom/lge/uicc/LGUiccManager;->getProperty(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 269
    .end local p0    # "slotId":I
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static getEfSmsP()Ljava/lang/String;
    .locals 1

    .line 276
    const/16 v0, 0x6f42

    invoke-static {v0}, Lcom/lge/uicc/LGUiccManager;->readIccRecordToString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getEfUst(I)[B
    .locals 2
    .param p0, "slotId"    # I

    .line 280
    const-string v0, "ef_ust"

    const-string v1, "0"

    invoke-static {v0, p0, v1}, Lcom/lge/uicc/LGUiccManager;->getProperty(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, "efUst":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 283
    const/4 v1, 0x0

    return-object v1

    .line 286
    :cond_0
    invoke-static {v0}, Lcom/lge/ims/common/util/LGExtApi$Uicc;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1
.end method

.method public static getSimState(I)Ljava/lang/String;
    .locals 3
    .param p0, "slotId"    # I

    .line 290
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/telephony/TelephonyManager;->getSimState(I)I

    move-result v0

    .line 292
    .local v0, "simState":I
    packed-switch v0, :pswitch_data_0

    .line 311
    const-string v1, "UNKNOWN"

    return-object v1

    .line 298
    :pswitch_0
    const-string v1, "LOADED"

    return-object v1

    .line 309
    :pswitch_1
    const-string v1, "CARD_RESTRICTED"

    return-object v1

    .line 307
    :pswitch_2
    const-string v1, "CARD_IO_ERROR"

    return-object v1

    .line 296
    :pswitch_3
    const-string v1, "NOT_READY"

    return-object v1

    .line 300
    :pswitch_4
    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->simLoadedState()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 305
    :pswitch_5
    const-string v1, "LOCKED"

    return-object v1

    .line 294
    :pswitch_6
    const-string v1, "ABSENT"

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .line 320
    invoke-static {p0}, Lcom/android/internal/telephony/uicc/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method private static initEccList()V
    .locals 0

    .line 325
    return-void
.end method
