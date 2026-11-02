.class public final Lcom/lge/ims/common/util/MSimUtils;
.super Ljava/lang/Object;
.source "MSimUtils.java"


# static fields
.field public static final DEFAULT_PHONE_ID:I = 0x0

.field public static final DEFAULT_SLOT_ID:I = 0x0

.field public static final DEFAULT_SUB_ID:I = 0x7fffffff

.field private static final DUMMY_SUB_ID_BASE:I = 0x7ffffffb

.field public static final EXTRA_KEY_SLOT_ID:Ljava/lang/String; = "SLOT_ID"

.field public static final INVALID_PHONE_ID:I = -0x1

.field public static final INVALID_SLOT_ID:I = -0x1

.field public static final INVALID_SUB_ID:I = -0x1

.field private static final MSIM_CONFIG:Ljava/lang/String;

.field private static final MULTI_IMS:Z

.field private static final MULTI_LTE:Z

.field public static final MULTI_SIM_DSDA:I = 0x2

.field public static final MULTI_SIM_DSDS:I = 0x1

.field public static final MULTI_SIM_NONE:I = 0x0

.field public static final MULTI_SIM_TSTS:I = 0x3

.field public static final PREFERRED_NETWORK_MODE:I

.field private static sMultiSim:I

.field private static sReverseSlotIdForSMS:Z

.field private static sSingleImsEnabledOnDsdv:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 33
    sget v0, Lcom/android/internal/telephony/Phone;->PREFERRED_NT_MODE:I

    sput v0, Lcom/lge/ims/common/util/MSimUtils;->PREFERRED_NETWORK_MODE:I

    .line 48
    invoke-static {}, Landroid/sysprop/TelephonyProperties;->multi_sim_config()Ljava/util/Optional;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/lge/ims/common/util/MSimUtils;->MSIM_CONFIG:Ljava/lang/String;

    .line 49
    nop

    .line 50
    const/16 v0, 0x2afa

    const-string v1, "0"

    invoke-static {v0, v1}, Lcom/lge/ims/common/util/ImsProperties$Vendor;->getSysProp(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 49
    const-string v2, "1"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/lge/ims/common/util/MSimUtils;->MULTI_IMS:Z

    .line 51
    nop

    .line 52
    const/16 v0, 0x2afb

    invoke-static {v0, v1}, Lcom/lge/ims/common/util/ImsProperties$Vendor;->getSysProp(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/lge/ims/common/util/MSimUtils;->MULTI_LTE:Z

    .line 53
    const/4 v0, 0x0

    sput-boolean v0, Lcom/lge/ims/common/util/MSimUtils;->sSingleImsEnabledOnDsdv:Z

    .line 54
    sput-boolean v0, Lcom/lge/ims/common/util/MSimUtils;->sReverseSlotIdForSMS:Z

    .line 55
    const/4 v0, -0x1

    sput v0, Lcom/lge/ims/common/util/MSimUtils;->sMultiSim:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultDataSubId()I
    .locals 1

    .line 58
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubscriptionId()I

    move-result v0

    return v0
.end method

.method public static getDefaultSubId()I
    .locals 1

    .line 62
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultSubscriptionId()I

    move-result v0

    return v0
.end method

.method public static getImsDefaultSubId()I
    .locals 1

    .line 66
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getDefaultDataSubId()I

    move-result v0

    return v0

    .line 69
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v0

    return v0
.end method

.method public static getImsi(I)Ljava/lang/String;
    .locals 2
    .param p0, "subId"    # I

    .line 74
    invoke-static {p0}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager(I)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 75
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public static getMaxSimSlot()I
    .locals 2

    .line 79
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getMultiSimEnabled()I

    move-result v0

    .line 81
    .local v0, "simConfig":I
    packed-switch v0, :pswitch_data_0

    .line 89
    const/4 v1, 0x1

    return v1

    .line 87
    :pswitch_0
    const/4 v1, 0x3

    return v1

    .line 85
    :pswitch_1
    const/4 v1, 0x2

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getMultiSimEnabled()I
    .locals 2

    .line 94
    sget v0, Lcom/lge/ims/common/util/MSimUtils;->sMultiSim:I

    if-gez v0, :cond_3

    .line 95
    sget-object v0, Lcom/lge/ims/common/util/MSimUtils;->MSIM_CONFIG:Ljava/lang/String;

    const-string v1, "dsds"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    const/4 v0, 0x1

    sput v0, Lcom/lge/ims/common/util/MSimUtils;->sMultiSim:I

    goto :goto_0

    .line 97
    :cond_0
    const-string v1, "dsda"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 98
    const/4 v0, 0x2

    sput v0, Lcom/lge/ims/common/util/MSimUtils;->sMultiSim:I

    goto :goto_0

    .line 99
    :cond_1
    const-string v1, "tsts"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 100
    const/4 v0, 0x3

    sput v0, Lcom/lge/ims/common/util/MSimUtils;->sMultiSim:I

    goto :goto_0

    .line 102
    :cond_2
    const/4 v0, 0x0

    sput v0, Lcom/lge/ims/common/util/MSimUtils;->sMultiSim:I

    .line 106
    :cond_3
    :goto_0
    sget v0, Lcom/lge/ims/common/util/MSimUtils;->sMultiSim:I

    return v0
.end method

.method public static getNetworkMode(Landroid/content/ContentResolver;I)I
    .locals 5
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "phoneId"    # I

    .line 110
    sget v0, Lcom/lge/ims/common/util/MSimUtils;->PREFERRED_NETWORK_MODE:I

    .line 111
    .local v0, "networkMode":I
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v1

    .line 113
    .local v1, "subId":I
    invoke-static {v1}, Lcom/lge/ims/common/util/MSimUtils;->isValidSubId(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 114
    return v0

    .line 123
    :cond_0
    invoke-static {v1}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager(I)Landroid/telephony/TelephonyManager;

    move-result-object v2

    .line 124
    .local v2, "tm":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_1

    .line 125
    const/4 v3, 0x0

    .line 126
    invoke-virtual {v2, v3}, Landroid/telephony/TelephonyManager;->getAllowedNetworkTypesForReason(I)J

    move-result-wide v3

    long-to-int v3, v3

    .line 125
    invoke-static {v3}, Landroid/telephony/RadioAccessFamily;->getNetworkTypeFromRaf(I)I

    move-result v0

    .line 130
    :cond_1
    return v0
.end method

.method public static getPhoneCount()I
    .locals 2

    .line 134
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 135
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getActiveModemCount()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1
.end method

.method public static getPhoneId(I)I
    .locals 1
    .param p0, "subId"    # I

    .line 139
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/lge/ims/common/util/MSimUtils;->getPhoneId(II)I

    move-result v0

    return v0
.end method

.method public static getPhoneId(II)I
    .locals 2
    .param p0, "subId"    # I
    .param p1, "defaultPhoneId"    # I

    .line 143
    invoke-static {p0}, Landroid/telephony/SubscriptionManager;->getPhoneId(I)I

    move-result v0

    .line 145
    .local v0, "phoneId":I
    if-ltz v0, :cond_0

    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getPhoneCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 147
    :cond_0
    move v0, p1

    .line 150
    :cond_1
    return v0
.end method

.method public static getPhoneIdForDummySubId(I)I
    .locals 2
    .param p0, "subId"    # I

    .line 154
    invoke-static {p0}, Lcom/lge/ims/common/util/MSimUtils;->isDummySubId(I)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 155
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 156
    const/4 v0, 0x0

    return v0

    .line 158
    :cond_0
    invoke-static {p0, v1}, Lcom/lge/ims/common/util/MSimUtils;->getPhoneId(II)I

    move-result v0

    return v0

    .line 160
    :cond_1
    invoke-static {p0}, Lcom/lge/ims/common/util/MSimUtils;->isValidSubId(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 161
    invoke-static {p0, v1}, Lcom/lge/ims/common/util/MSimUtils;->getPhoneId(II)I

    move-result v0

    return v0

    .line 164
    :cond_2
    return v1
.end method

.method public static getSimState(I)Ljava/lang/String;
    .locals 1
    .param p0, "slotId"    # I

    .line 168
    invoke-static {p0}, Lcom/lge/ims/common/util/LGExtApi$Uicc;->getSimState(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSlotId(I)I
    .locals 1
    .param p0, "subId"    # I

    .line 172
    invoke-static {p0}, Landroid/telephony/SubscriptionManager;->getSlotIndex(I)I

    move-result v0

    return v0
.end method

.method public static getSlotIdForSingleImsOnDsdv()I
    .locals 1

    .line 235
    const/4 v0, 0x0

    return v0
.end method

.method public static getSubId(I)I
    .locals 2
    .param p0, "phoneId"    # I

    .line 176
    invoke-static {p0}, Landroid/telephony/SubscriptionManager;->getSubId(I)[I

    move-result-object v0

    .line 178
    .local v0, "subIds":[I
    if-eqz v0, :cond_0

    array-length v1, v0

    if-lez v1, :cond_0

    .line 179
    const/4 v1, 0x0

    aget v1, v0, v1

    return v1

    .line 182
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static hasIccCard(I)Z
    .locals 2
    .param p0, "slotId"    # I

    .line 186
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 187
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/telephony/TelephonyManager;->hasIccCard(I)Z

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static isDummySubId(I)Z
    .locals 1
    .param p0, "subId"    # I

    .line 193
    const v0, 0x7ffffffb

    if-lt p0, v0, :cond_0

    const v0, 0x7fffffff

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isMultiImsEnabled()Z
    .locals 1

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->multiIms()Z

    move-result v0

    return v0
.end method

.method public static isMultiImsEnabledOnDssv()Z
    .locals 2

    .line 253
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lge/ims/common/util/ImsProperties;->TARGET_COUNTRY:Ljava/lang/String;

    const-string v1, "AU"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isMultiLteEnabled()Z
    .locals 1

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->multiLte()Z

    move-result v0

    return v0
.end method

.method public static isMultiSimEnabled()Z
    .locals 2

    .line 207
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabledInternal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    const/4 v0, 0x1

    return v0

    .line 211
    :cond_0
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 212
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->isMultiSimEnabled()Z

    move-result v1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabledInternal()Z

    move-result v1

    :goto_0
    return v1
.end method

.method private static isMultiSimEnabledInternal()Z
    .locals 1

    .line 258
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getMultiSimEnabled()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isReverseSlotIdForSMSRequired()Z
    .locals 1

    .line 216
    sget-boolean v0, Lcom/lge/ims/common/util/MSimUtils;->sReverseSlotIdForSMS:Z

    return v0
.end method

.method public static isSimLoaded(I)Z
    .locals 2
    .param p0, "slotId"    # I

    .line 220
    invoke-static {p0}, Lcom/lge/ims/common/util/MSimUtils;->getSimState(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "LOADED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isSingleImsEnabledOnDsdv()Z
    .locals 1

    .line 239
    sget-boolean v0, Lcom/lge/ims/common/util/MSimUtils;->sSingleImsEnabledOnDsdv:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiLteEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSlotIdForSingleImsOnDsdv(I)Z
    .locals 1
    .param p0, "slotId"    # I

    .line 243
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getSlotIdForSingleImsOnDsdv()I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isValidSubId(I)Z
    .locals 1
    .param p0, "subId"    # I

    .line 224
    if-ltz p0, :cond_0

    const v0, 0x7ffffffe

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static setReverseSlotIdForSMSRequired(Z)V
    .locals 0
    .param p0, "required"    # Z

    .line 229
    sput-boolean p0, Lcom/lge/ims/common/util/MSimUtils;->sReverseSlotIdForSMS:Z

    .line 230
    return-void
.end method

.method public static setSingleImsEnabledOnDsdv(Landroid/content/Context;)V
    .locals 1
    .param p0, "c"    # Landroid/content/Context;

    .line 247
    const-string v0, "com.lge.ims.dsdv_sv"

    invoke-static {p0, v0}, Lcom/android/ims/ImsFeatureProvider;->hasFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/lge/ims/common/util/MSimUtils;->sSingleImsEnabledOnDsdv:Z

    .line 248
    return-void
.end method
