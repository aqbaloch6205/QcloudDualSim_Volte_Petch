# classes.dex

.class public Lcom/lge/ims/app/SIMOperatorDetector;
.super Ljava/lang/Object;
.source "SIMOperatorDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;,
        Lcom/lge/ims/app/SIMOperatorDetector$Sim;,
        Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LGIMS_SIMOperatorDetector"

.field private static final TARGET_COUNTRY:Ljava/lang/String;

.field private static final TARGET_OPERATOR:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

.field private final mMaxSlot:I

.field private final mServiceProfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 133
    sget-object v0, Lcom/lge/ims/common/util/ImsProperties;->IMS_TARGET_OPERATOR:Ljava/lang/String;

    sput-object v0, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    .line 134
    sget-object v0, Lcom/lge/ims/common/util/ImsProperties;->TARGET_COUNTRY:Ljava/lang/String;

    sput-object v0, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"  # Landroid/content/Context;

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-object p1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mContext:Landroid/content/Context;

    .line 144
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getMaxSimSlot()I

    move-result v0

    iput v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mMaxSlot:I

    .line 145
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mServiceProfiles:Ljava/util/List;

    .line 147
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    iget v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mMaxSlot:I

    if-ge v0, v1, :cond_24

    .line 148
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mServiceProfiles:Ljava/util/List;

    new-instance v2, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;

    invoke-direct {v2, p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;-><init>(Lcom/lge/ims/app/SIMOperatorDetector;I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 151
    .end local v0  # "i":I
    :cond_24
    new-instance v0, Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-direct {v0}, Lcom/lge/ims/common/util/SODConfig$Device;-><init>()V

    iput-object v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    .line 152
    return-void
.end method

.method private checkAndSetPreferredOperator(I)Z
    .registers 5
    .param p1, "slotId"  # I

    .line 1909
    const-string v0, "pref_operator"

    const-string v1, ""

    invoke-static {v0, v1, p1}, Lcom/lge/ims/common/util/ImsPrivateProperties$Persistent;->get(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 1911
    .local v0, "preferredOperator":Ljava/lang/String;
    const-string v2, "pref_country"

    invoke-static {v2, v1, p1}, Lcom/lge/ims/common/util/ImsPrivateProperties$Persistent;->get(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 1914
    .local v1, "preferredCountry":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1f

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1f

    .line 1915
    invoke-direct {p0, p1, v0, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setPreferenceOperatorPolicy(ILjava/lang/String;Ljava/lang/String;)V

    .line 1916
    const/4 v2, 0x1

    return v2

    .line 1919
    :cond_1f
    const/4 v2, 0x0

    return v2
.end method

.method private checkProhibiting(I)V
    .registers 7
    .param p1, "slotId"  # I

    .line 770
    invoke-direct {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getSmartModifiedTime()Landroid/database/Cursor;

    move-result-object v0

    .line 771
    .local v0, "cSmartModifiedTime":Landroid/database/Cursor;
    const/4 v1, 0x1

    const-string v2, "LGIMS_SIMOperatorDetector"

    if-nez v0, :cond_12

    .line 772
    const-string v3, "SmartConfig DB is not normal"

    invoke-static {v2, v3}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    .line 774
    return-void

    .line 777
    :cond_12
    const-string v3, "version"

    const-string v4, "1"

    invoke-direct {p0, v0, v3, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 779
    .local v3, "version":Ljava/lang/String;
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 780
    const-string v4, "2"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 781
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->checkProhibiting2(I)V

    .line 782
    return-void

    .line 786
    .end local v3  # "version":Ljava/lang/String;
    :cond_29
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncInSim(I)Ljava/lang/String;

    move-result-object v3

    .line 787
    .local v3, "mccmnc":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6f

    const-string v4, "45000"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6f

    const-string v4, "00101"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    goto :goto_6f

    .line 794
    :cond_44
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperator(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getCountry(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v2, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 795
    .local v2, "cOperator":Landroid/database/Cursor;
    if-nez v2, :cond_64

    .line 796
    invoke-static {}, Lcom/lge/ims/common/util/ImsUtils;->isEmergencyCallEnabledOnNonVoLteSim()Z

    move-result v4

    if-eqz v4, :cond_60

    .line 798
    invoke-direct {p0, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceBlockedByAcceptanceList(Ljava/lang/String;)Z

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    goto :goto_63

    .line 800
    :cond_60
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    .line 802
    :goto_63
    return-void

    .line 805
    :cond_64
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 808
    invoke-direct {p0, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceBlockedByAcceptanceList(Ljava/lang/String;)Z

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    .line 809
    return-void

    .line 788
    .end local v2  # "cOperator":Landroid/database/Cursor;
    :cond_6f
    :goto_6f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "This SIM("

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ") is ignored in CheckProhibiting"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    .line 790
    return-void
.end method

.method private checkProhibiting2(I)V
    .registers 14
    .param p1, "slotId"  # I

    .line 812
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncInSim(I)Ljava/lang/String;

    move-result-object v0

    .line 813
    .local v0, "mccmnc":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, "LGIMS_SIMOperatorDetector"

    if-nez v1, :cond_e3

    invoke-static {v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isCommonTestSim(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    goto/16 :goto_e3

    .line 819
    :cond_14
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorInSim(I)Ljava/lang/String;

    move-result-object v1

    .line 820
    .local v1, "simOperator":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getCountryInSim(I)Ljava/lang/String;

    move-result-object v3

    .line 821
    .local v3, "simCountry":Ljava/lang/String;
    invoke-direct {p0, v1, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    .line 822
    .local v4, "cSimOperator":Landroid/database/Cursor;
    if-nez v4, :cond_35

    .line 823
    invoke-static {}, Lcom/lge/ims/common/util/ImsUtils;->isEmergencyCallEnabledOnNonVoLteSim()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 825
    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceBlockedByAcceptanceList(Ljava/lang/String;)Z

    move-result v2

    invoke-direct {p0, p1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    goto :goto_34

    .line 827
    :cond_30
    const/4 v2, 0x1

    invoke-direct {p0, p1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    .line 829
    :goto_34
    return-void

    .line 832
    :cond_35
    const/4 v5, 0x1

    .line 834
    .local v5, "serviceAllowed":Z
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v8, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 835
    .local v6, "totc":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/lge/ims/app/SIMOperatorDetector;->getServiceEnableListByToTc(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 837
    .local v8, "cToTc":Landroid/database/Cursor;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "checkProhibiting2 :: TOTC - "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    if-eqz v8, :cond_da

    .line 840
    invoke-direct {p0, p1, v4, v8}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceEnabled(ILandroid/database/Cursor;Landroid/database/Cursor;)Z

    move-result v5

    .line 842
    const/4 v9, 0x0

    .line 844
    .local v9, "inboundRoamingAllowed":Z
    if-nez v5, :cond_a7

    const-string v10, "KR"

    invoke-virtual {v10, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a7

    .line 845
    invoke-direct {p0, p1, v4, v8}, Lcom/lge/ims/app/SIMOperatorDetector;->isInboundRoaming(ILandroid/database/Cursor;Landroid/database/Cursor;)Z

    move-result v9

    .line 846
    if-eqz v9, :cond_a7

    .line 847
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "SIM("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, ") is for InboundRoaming"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 850
    const/4 v5, 0x1

    .line 854
    :cond_a7
    invoke-direct {p0, p1, v9}, Lcom/lge/ims/app/SIMOperatorDetector;->setInboundRoaming(IZ)V

    .line 856
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 858
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SIM is "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v5, :cond_bd

    const-string v10, "Not Prohibited"

    goto :goto_bf

    :cond_bd
    const-string v10, "Prohibited"

    :goto_bf
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " based on TOTC("

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, ")"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 862
    .end local v9  # "inboundRoamingAllowed":Z
    :cond_da
    xor-int/lit8 v2, v5, 0x1

    invoke-direct {p0, p1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    .line 864
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 865
    return-void

    .line 814
    .end local v1  # "simOperator":Ljava/lang/String;
    .end local v3  # "simCountry":Ljava/lang/String;
    .end local v4  # "cSimOperator":Landroid/database/Cursor;
    .end local v5  # "serviceAllowed":Z
    .end local v6  # "totc":Ljava/lang/String;
    .end local v8  # "cToTc":Landroid/database/Cursor;
    :cond_e3
    :goto_e3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "This SIM("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ") is ignored in CheckProhibiting2"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 815
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setProhibited(IZ)V

    .line 816
    return-void
.end method

.method private disableSupportService(II)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "service"  # I

    .line 996
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 997
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lge/ims/common/util/SODConfig$Operator;->resetService(I)V

    .line 998
    return-void
.end method

.method private enableSupportService(II)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "service"  # I

    .line 1001
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 1002
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lge/ims/common/util/SODConfig$Operator;->setService(I)V

    .line 1003
    return-void
.end method

.method private equalGid(Landroid/database/Cursor;Ljava/lang/String;)I
    .registers 6
    .param p1, "cursor"  # Landroid/database/Cursor;
    .param p2, "gid"  # Ljava/lang/String;

    .line 1422
    if-nez p1, :cond_4

    .line 1423
    const/4 v0, 0x0

    return v0

    .line 1426
    :cond_4
    const-string v0, "gid"

    const-string v1, ""

    invoke-direct {p0, p1, v0, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1427
    .local v0, "cGid":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1428
    const/4 v1, -0x1

    return v1

    .line 1431
    :cond_14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EqualGID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LGIMS_SIMOperatorDetector"

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1432
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private equalSpn(Landroid/database/Cursor;Ljava/lang/String;)I
    .registers 6
    .param p1, "cursor"  # Landroid/database/Cursor;
    .param p2, "spn"  # Ljava/lang/String;

    .line 1437
    if-nez p1, :cond_4

    .line 1438
    const/4 v0, 0x0

    return v0

    .line 1441
    :cond_4
    const-string v0, "spn"

    const-string v1, ""

    invoke-direct {p0, p1, v0, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1442
    .local v0, "cSpn":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1443
    const/4 v1, -0x1

    return v1

    .line 1446
    :cond_14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EqualSPN = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LGIMS_SIMOperatorDetector"

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1447
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private getBestMatchedOperator(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .registers 14
    .param p1, "cursors"  # Landroid/database/Cursor;
    .param p2, "gid"  # Ljava/lang/String;
    .param p3, "spn"  # Ljava/lang/String;
    .param p4, "imsi"  # Ljava/lang/String;

    .line 1467
    const-string v0, "LGIMS_SIMOperatorDetector"

    const/4 v1, -0x1

    if-nez p1, :cond_b

    .line 1468
    const-string v2, "Cursor List is null !!!"

    invoke-static {v0, v2}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1469
    return v1

    .line 1472
    :cond_b
    const/4 v2, 0x0

    .line 1473
    .local v2, "bestMatchedPriority":I
    const/4 v3, -0x1

    .line 1474
    .local v3, "iBestMatchedCursor":I
    :goto_d
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_70

    .line 1475
    const/4 v4, 0x0

    .line 1476
    .local v4, "currentMatchedPriority":I
    invoke-direct {p0, p1, p2}, Lcom/lge/ims/app/SIMOperatorDetector;->equalGid(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 1477
    .local v5, "iEqualGid":I
    invoke-direct {p0, p1, p3}, Lcom/lge/ims/app/SIMOperatorDetector;->equalSpn(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 1478
    .local v6, "iEqualSpn":I
    invoke-direct {p0, p1, p4}, Lcom/lge/ims/app/SIMOperatorDetector;->matchedImsi(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 1480
    .local v7, "iMatchedImsi":I
    const/4 v8, 0x1

    if-ne v5, v8, :cond_2e

    if-ne v6, v8, :cond_2e

    if-ne v7, v8, :cond_2e

    .line 1481
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    .line 1482
    const/16 v2, 0x8

    .line 1483
    goto :goto_70

    .line 1485
    :cond_2e
    if-ne v5, v8, :cond_36

    if-ne v6, v1, :cond_36

    if-ne v7, v8, :cond_36

    .line 1486
    const/4 v4, 0x7

    goto :goto_65

    .line 1488
    :cond_36
    if-ne v5, v1, :cond_3e

    if-ne v6, v8, :cond_3e

    if-ne v7, v8, :cond_3e

    .line 1489
    const/4 v4, 0x6

    goto :goto_65

    .line 1491
    :cond_3e
    if-ne v5, v1, :cond_46

    if-ne v6, v1, :cond_46

    if-ne v7, v8, :cond_46

    .line 1492
    const/4 v4, 0x5

    goto :goto_65

    .line 1494
    :cond_46
    if-ne v5, v8, :cond_4e

    if-ne v6, v8, :cond_4e

    if-ne v7, v1, :cond_4e

    .line 1495
    const/4 v4, 0x4

    goto :goto_65

    .line 1497
    :cond_4e
    if-ne v5, v8, :cond_56

    if-ne v6, v1, :cond_56

    if-ne v7, v1, :cond_56

    .line 1498
    const/4 v4, 0x3

    goto :goto_65

    .line 1500
    :cond_56
    if-ne v5, v1, :cond_5e

    if-ne v6, v8, :cond_5e

    if-ne v7, v1, :cond_5e

    .line 1501
    const/4 v4, 0x2

    goto :goto_65

    .line 1503
    :cond_5e
    if-ne v5, v1, :cond_65

    if-ne v6, v1, :cond_65

    if-ne v7, v1, :cond_65

    .line 1504
    const/4 v4, 0x1

    .line 1507
    :cond_65
    :goto_65
    if-le v4, v2, :cond_6c

    .line 1508
    move v2, v4

    .line 1509
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    .line 1512
    :cond_6c
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1513
    .end local v4  # "currentMatchedPriority":I
    .end local v5  # "iEqualGid":I
    .end local v6  # "iEqualSpn":I
    .end local v7  # "iMatchedImsi":I
    goto :goto_d

    .line 1514
    :cond_70
    :goto_70
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "BestMatchedPriority = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ", BestMatchedCursorPosition = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1517
    return v3
.end method

.method private getCarrierFromNaoCarrierList(Ljava/lang/String;)Landroid/database/Cursor;
    .registers 4
    .param p1, "carrier"  # Ljava/lang/String;

    .line 2354
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "carrier=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2356
    .local v0, "selection":Ljava/lang/String;
    sget-object v1, Lcom/lge/ims/app/provider/SmartConfigProviderInterface$NaoCarrierList;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method private getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 11
    .param p1, "uri"  # Landroid/net/Uri;
    .param p2, "selection"  # Ljava/lang/String;

    .line 2360
    const/4 v0, 0x0

    .line 2362
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_1
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p1

    move-object v5, p2

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    move-object v0, v1

    .line 2367
    goto :goto_1f

    .line 2364
    :catchall_12
    move-exception v1

    .line 2365
    .local v1, "t":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LGIMS_SIMOperatorDetector"

    invoke-static {v3, v2}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2366
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2369
    .end local v1  # "t":Ljava/lang/Throwable;
    :goto_1f
    if-eqz v0, :cond_2b

    .line 2370
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 2371
    return-object v0

    .line 2373
    :cond_28
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 2376
    :cond_2b
    const/4 v1, 0x0

    return-object v1
.end method

.method private static getDefaultOperatorForNaOpen()Ljava/lang/String;
    .registers 1

    .line 2413
    invoke-static {}, Lcom/lge/ims/common/util/ImsProperties;->isLaop()Z

    move-result v0

    if-nez v0, :cond_9

    .line 2414
    const-string v0, "USC"

    return-object v0

    .line 2417
    :cond_9
    const-string v0, "OPEN"

    return-object v0
.end method

.method private getGidFromSim(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "slotId"  # I
    .param p2, "defaultValue"  # Ljava/lang/String;

    .line 2264
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 2265
    return-object p2

    .line 2268
    :cond_7
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2270
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    if-nez v0, :cond_e

    .line 2271
    return-object p2

    .line 2274
    :cond_e
    const-string v1, ""

    .line 2276
    .local v1, "gid":Ljava/lang/String;
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 2277
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/telephony/TelephonyManager;->getGroupIdLevel1(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_23

    .line 2279
    :cond_1f
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getGroupIdLevel1()Ljava/lang/String;

    move-result-object v1

    .line 2282
    :goto_23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2b

    move-object v2, p2

    goto :goto_31

    :cond_2b
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    :goto_31
    return-object v2
.end method

.method private getImsiFromSim(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "slotId"  # I
    .param p2, "defaultValue"  # Ljava/lang/String;

    .line 2306
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 2307
    return-object p2

    .line 2310
    :cond_7
    const/4 v0, 0x0

    .line 2312
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 2313
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v1

    .line 2314
    .local v1, "subId":I
    invoke-static {v1}, Lcom/lge/ims/common/util/MSimUtils;->isValidSubId(I)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 2315
    invoke-static {v1}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager(I)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2317
    .end local v1  # "subId":I
    :cond_1c
    goto :goto_21

    .line 2318
    :cond_1d
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2321
    :goto_21
    if-eqz v0, :cond_28

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    goto :goto_29

    :cond_28
    move-object v1, p2

    :goto_29
    return-object v1
.end method

.method private getMccMncFromMccMncList(Ljava/lang/String;)Landroid/database/Cursor;
    .registers 4
    .param p1, "mccmnc"  # Ljava/lang/String;

    .line 2335
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mccmnc=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2336
    .local v0, "selection":Ljava/lang/String;
    sget-object v1, Lcom/lge/ims/app/provider/SmartConfigProviderInterface$MccMncList;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method private getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 5
    .param p1, "op"  # Ljava/lang/String;
    .param p2, "co"  # Ljava/lang/String;

    .line 2330
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "operator=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' AND country=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2331
    .local v0, "selection":Ljava/lang/String;
    sget-object v1, Lcom/lge/ims/app/provider/SmartConfigProviderInterface$OperatorList;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method private getServiceAcceptanceList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 5
    .param p1, "op"  # Ljava/lang/String;
    .param p2, "co"  # Ljava/lang/String;

    .line 2340
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "operator=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "country"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2344
    .local v0, "selection":Ljava/lang/String;
    sget-object v1, Lcom/lge/ims/app/provider/SmartConfigProviderInterface$ServiceAcceptanceList;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method private getServiceEnableListByToTc(Ljava/lang/String;)Landroid/database/Cursor;
    .registers 4
    .param p1, "totc"  # Ljava/lang/String;

    .line 2348
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "totc=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2350
    .local v0, "selection":Ljava/lang/String;
    sget-object v1, Lcom/lge/ims/app/provider/SmartConfigProviderInterface$ServiceEnableListByToTc;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method private getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    .registers 4
    .param p1, "slotId"  # I

    .line 2040
    iget-object v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mServiceProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;

    .line 2041
    .local v0, "profile":Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;->getSim()Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v1

    return-object v1
.end method

.method private getSimProperties(I)Lcom/lge/ims/common/util/SODConfig$SimProperties;
    .registers 4
    .param p1, "slotId"  # I

    .line 2050
    iget-object v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mServiceProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;

    .line 2051
    .local v0, "profile":Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;->getSimProperties()Lcom/lge/ims/common/util/SODConfig$SimProperties;

    move-result-object v1

    return-object v1
.end method

.method private static getSimState(Ljava/lang/String;)I
    .registers 2
    .param p0, "iccState"  # Ljava/lang/String;

    .line 1091
    const-string v0, "LOADED"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1092
    const/4 v0, 0x4

    return v0

    .line 1094
    :cond_a
    const-string v0, "ABSENT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1095
    const/4 v0, 0x2

    return v0

    .line 1097
    :cond_14
    const-string v0, "LOCKED"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 1098
    const/16 v0, 0x8

    return v0

    .line 1100
    :cond_1f
    const-string v0, "SIM_REMOVED"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 1101
    const/16 v0, 0x10

    return v0

    .line 1104
    :cond_2a
    const/4 v0, 0x0

    return v0
.end method

.method private getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    .registers 4
    .param p1, "slotId"  # I

    .line 2045
    iget-object v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mServiceProfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;

    .line 2046
    .local v0, "profile":Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$ServiceProfile;->getSlot()Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v1

    return-object v1
.end method

.method private getSmartModifiedTime()Landroid/database/Cursor;
    .registers 3

    .line 2326
    sget-object v0, Lcom/lge/ims/app/provider/SmartConfigProviderInterface$SmartModifiedTime;->CONTENT_URI:Landroid/net/Uri;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private getSpnFromSim(ILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "slotId"  # I
    .param p2, "defaultValue"  # Ljava/lang/String;

    .line 2286
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 2287
    return-object p2

    .line 2290
    :cond_7
    const/4 v0, 0x0

    .line 2292
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 2293
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v1

    .line 2294
    .local v1, "subId":I
    invoke-static {v1}, Lcom/lge/ims/common/util/MSimUtils;->isValidSubId(I)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 2295
    invoke-static {v1}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager(I)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2297
    .end local v1  # "subId":I
    :cond_1c
    goto :goto_21

    .line 2298
    :cond_1d
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2301
    :goto_21
    if-eqz v0, :cond_28

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v1

    goto :goto_29

    :cond_28
    const/4 v1, 0x0

    .line 2302
    .local v1, "spn":Ljava/lang/String;
    :goto_29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_31

    move-object v2, p2

    goto :goto_37

    :cond_31
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    :goto_37
    return-object v2
.end method

.method private getSysSimOperator(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 1984
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimProperties(I)Lcom/lge/ims/common/util/SODConfig$SimProperties;

    move-result-object v0

    .line 1985
    .local v0, "simProp":Lcom/lge/ims/common/util/SODConfig$SimProperties;
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperator()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getSysSimOperatorSub(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 1989
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimProperties(I)Lcom/lge/ims/common/util/SODConfig$SimProperties;

    move-result-object v0

    .line 1990
    .local v0, "simProp":Lcom/lge/ims/common/util/SODConfig$SimProperties;
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperatorSub()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "cursor"  # Landroid/database/Cursor;
    .param p2, "column"  # Ljava/lang/String;
    .param p3, "defaultValue"  # Ljava/lang/String;

    .line 2380
    if-eqz p1, :cond_1c

    .line 2382
    :try_start_2
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 2383
    .local v0, "index":I
    if-gez v0, :cond_a

    move-object v1, p3

    goto :goto_e

    :cond_a
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1
    :try_end_e
    .catchall {:try_start_2 .. :try_end_e} :catchall_f

    .line 2385
    .local v1, "value":Ljava/lang/String;
    :goto_e
    return-object v1

    .line 2387
    .end local v0  # "index":I
    .end local v1  # "value":Ljava/lang/String;
    :catchall_f
    move-exception v0

    .line 2388
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LGIMS_SIMOperatorDetector"

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2389
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2393
    .end local v0  # "t":Ljava/lang/Throwable;
    :cond_1c
    return-object p3
.end method

.method private static isCarrierCodeRequiredOnSimLocked()Z
    .registers 2

    .line 2426
    sget-object v0, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    const-string v1, "CA"

    invoke-static {v0, v1}, Lcom/lge/ims/common/util/SODConfig;->equalsCountry(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isCommonTestSim(Ljava/lang/String;)Z
    .registers 2
    .param p0, "mccmnc"  # Ljava/lang/String;

    .line 2421
    const-string v0, "00101"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    const-string v0, "001001"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    .line 2422
    const-string v0, "001010"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    const-string v0, "45000"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    goto :goto_23

    :cond_21
    const/4 v0, 0x0

    goto :goto_24

    :cond_23
    :goto_23
    const/4 v0, 0x1

    .line 2421
    :goto_24
    return v0
.end method

.method private isEmergencyCallAvailableOnSimAbsentForTracfone(ILcom/lge/ims/common/util/ImsUtils$ServiceCaps;)Z
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "serviceCaps"  # Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;

    .line 2398
    sget-object v0, Lcom/lge/ims/common/util/ImsProperties;->TARGET_OPERATOR:Ljava/lang/String;

    const-string v1, "TRF"

    invoke-static {v1, v0}, Lcom/lge/ims/common/util/SODConfig;->equalsOperator(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_c

    .line 2399
    return v1

    .line 2402
    :cond_c
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMAbsent(I)Z

    move-result v0

    if-nez v0, :cond_13

    .line 2403
    return v1

    .line 2407
    :cond_13
    invoke-virtual {p2}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->isVoLteEnabled()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 2408
    invoke-virtual {p2}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->isVtEnabled()Z

    move-result v0

    if-nez v0, :cond_27

    .line 2409
    invoke-virtual {p2}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->isWfcEnabled()Z

    move-result v0

    if-nez v0, :cond_27

    const/4 v1, 0x1

    goto :goto_28

    :cond_27
    nop

    .line 2407
    :goto_28
    return v1
.end method

.method private isInboundRoaming(ILandroid/database/Cursor;Landroid/database/Cursor;)Z
    .registers 10
    .param p1, "slotId"  # I
    .param p2, "cSimOperator"  # Landroid/database/Cursor;
    .param p3, "cProhibit"  # Landroid/database/Cursor;

    .line 973
    const/4 v0, 0x0

    .line 975
    .local v0, "bInbound":Z
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperator(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getCountry(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 976
    .local v1, "cOperator":Landroid/database/Cursor;
    const-string v2, "/"

    if-nez v1, :cond_40

    .line 977
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Operator("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperator(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getCountry(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") is not existed in operator_list"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LGIMS_SIMOperatorDetector"

    invoke-static {v3, v2}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 979
    return v0

    .line 982
    :cond_40
    const-string v3, "operator_based_on"

    const-string v4, ""

    invoke-direct {p0, v1, v3, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 984
    .local v3, "basedOn":Ljava/lang/String;
    const-string v4, "target"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_73

    .line 985
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorInSim(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getCountryInSim(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 986
    .local v2, "opco":Ljava/lang/String;
    const-string v4, "inbounding_roaming"

    invoke-direct {p0, p3, v4, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 990
    .end local v2  # "opco":Ljava/lang/String;
    :cond_73
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 992
    return v0
.end method

.method private isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "cursor"  # Landroid/database/Cursor;
    .param p2, "field"  # Ljava/lang/String;
    .param p3, "str"  # Ljava/lang/String;

    .line 1021
    const/4 v0, 0x1

    if-nez p1, :cond_4

    .line 1022
    return v0

    .line 1025
    :cond_4
    const-string v1, ""

    invoke-direct {p0, p1, p2, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1026
    .local v1, "strList":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_17

    invoke-direct {p0, v1, p3, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_17

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    .line 1027
    .local v0, "bExisted":Z
    :goto_18
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Str("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v0, :cond_32

    const-string v3, "existed"

    goto :goto_34

    :cond_32
    const-string v3, " not existed"

    :goto_34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " List("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LGIMS_SIMOperatorDetector"

    invoke-static {v3, v2}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1030
    return v0
.end method

.method private isItExistedInList(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 7
    .param p1, "strList"  # Ljava/lang/String;
    .param p2, "str"  # Ljava/lang/String;
    .param p3, "checkWildcard"  # Z

    .line 1006
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1007
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_17

    .line 1008
    return v2

    .line 1011
    :cond_17
    if-eqz p3, :cond_22

    .line 1012
    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1013
    return v2

    .line 1017
    :cond_22
    const/4 v1, 0x0

    return v1
.end method

.method private isMccMncValid(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "mcc"  # Ljava/lang/String;
    .param p2, "mnc"  # Ljava/lang/String;

    .line 1132
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne v0, v1, :cond_4c

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x2

    if-eq v0, v3, :cond_16

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eq v0, v1, :cond_16

    goto :goto_4c

    .line 1136
    :cond_16
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v3, 0x39

    const/16 v4, 0x30

    if-ge v0, v1, :cond_32

    .line 1137
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-lt v1, v4, :cond_31

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-le v1, v3, :cond_2e

    goto :goto_31

    .line 1136
    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 1138
    :cond_31
    :goto_31
    return v2

    .line 1141
    .end local v0  # "i":I
    :cond_32
    const/4 v0, 0x0

    .restart local v0  # "i":I
    :goto_33
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_4a

    .line 1142
    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-lt v1, v4, :cond_49

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-le v1, v3, :cond_46

    goto :goto_49

    .line 1141
    :cond_46
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    .line 1143
    :cond_49
    :goto_49
    return v2

    .line 1147
    .end local v0  # "i":I
    :cond_4a
    const/4 v0, 0x1

    return v0

    .line 1133
    :cond_4c
    :goto_4c
    return v2
.end method

.method private isOperatorBasedOn(I)Z
    .registers 3
    .param p1, "flag"  # I

    .line 482
    iget-object v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v0, p1}, Lcom/lge/ims/common/util/SODConfig$Device;->isOperatorBasedOn(I)Z

    move-result v0

    return v0
.end method

.method public static isSIMAbsent(Ljava/lang/String;)Z
    .registers 3
    .param p0, "ss"  # Ljava/lang/String;

    .line 1165
    invoke-static {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimState(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public static isSIMLoaded(Ljava/lang/String;)Z
    .registers 3
    .param p0, "ss"  # Ljava/lang/String;

    .line 1178
    invoke-static {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimState(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public static isSIMLocked(Ljava/lang/String;)Z
    .registers 3
    .param p0, "ss"  # Ljava/lang/String;

    .line 1191
    invoke-static {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimState(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public static isSIMRemoved(Ljava/lang/String;)Z
    .registers 3
    .param p0, "ss"  # Ljava/lang/String;

    .line 1204
    invoke-static {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimState(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method private isServiceBlockedByAcceptanceList(Ljava/lang/String;)Z
    .registers 14
    .param p1, "mccmnc"  # Ljava/lang/String;

    .line 868
    sget-object v0, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->getServiceAcceptanceList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 869
    .local v2, "cAcceptance":Landroid/database/Cursor;
    const-string v3, "ImsPolicy :: SIM("

    const-string v4, ") is not blocked in model based on "

    const-string v5, "/"

    const-string v6, "LGIMS_SIMOperatorDetector"

    const/4 v7, 0x0

    if-nez v2, :cond_38

    .line 870
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 872
    return v7

    .line 875
    :cond_38
    const-string v8, "mcc"

    const-string v9, ""

    invoke-direct {p0, v2, v8, v9}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 877
    .local v8, "mccsFromCursor":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_7b

    .line 878
    const/4 v10, 0x3

    invoke-virtual {p1, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 879
    .local v10, "mcc":Ljava/lang/String;
    invoke-direct {p0, v8, v10, v7}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_7b

    .line 880
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ImsPolicy :: Mcc("

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 882
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 883
    return v7

    .line 887
    .end local v10  # "mcc":Ljava/lang/String;
    :cond_7b
    const-string v10, "mccmnc"

    invoke-direct {p0, v2, v10, v9}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 889
    .local v9, "mccmncsFromCursor":Ljava/lang/String;
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_b7

    .line 890
    invoke-direct {p0, v9, p1, v7}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_b7

    .line 891
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ImsPolicy :: MccMnc("

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 893
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 894
    return v7

    .line 898
    :cond_b7
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 900
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") is blocked in model based on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 903
    const/4 v0, 0x1

    return v0
.end method

.method private isServiceEnabled(ILandroid/database/Cursor;Landroid/database/Cursor;)Z
    .registers 16
    .param p1, "slotId"  # I
    .param p2, "cSimOperator"  # Landroid/database/Cursor;
    .param p3, "cProhibit"  # Landroid/database/Cursor;

    .line 907
    const/4 v0, 0x1

    .line 908
    .local v0, "bEnabled":Z
    const/4 v1, 0x0

    .line 910
    .local v1, "bExisted":Z
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncInSim(I)Ljava/lang/String;

    move-result-object v2

    .line 911
    .local v2, "mccmnc":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getCountryInSim(I)Ljava/lang/String;

    move-result-object v3

    .line 912
    .local v3, "country":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorInSim(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 913
    .local v4, "opco":Ljava/lang/String;
    const-string v5, "operator"

    invoke-direct {p0, p3, v5, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 915
    const/4 v5, 0x1

    if-eq v1, v5, :cond_34

    .line 916
    const-string v6, "country"

    invoke-direct {p0, p3, v6, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 919
    :cond_34
    if-eq v1, v5, :cond_3c

    .line 920
    const-string v6, "mccmnc"

    invoke-direct {p0, p3, v6, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 923
    :cond_3c
    const/4 v6, 0x3

    const/4 v7, 0x0

    if-eq v1, v5, :cond_4b

    .line 924
    nop

    .line 926
    invoke-virtual {v2, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 924
    const-string v9, "mcc"

    invoke-direct {p0, p3, v9, v8}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 928
    :cond_4b
    const-string v8, ""

    if-eq v1, v5, :cond_5f

    .line 929
    const-string v9, "region"

    invoke-direct {p0, p2, v9, v8}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 931
    .local v10, "region":Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_5f

    .line 932
    invoke-direct {p0, p3, v9, v10}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 936
    .end local v10  # "region":Ljava/lang/String;
    :cond_5f
    if-eq v1, v5, :cond_71

    .line 937
    const-string v9, "group_id"

    invoke-direct {p0, p2, v9, v8}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 939
    .local v8, "group_id":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_71

    .line 940
    invoke-direct {p0, p3, v9, v8}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 945
    .end local v8  # "group_id":Ljava/lang/String;
    :cond_71
    if-eqz v1, :cond_9b

    .line 946
    const-string v8, "operator_exempt"

    invoke-direct {p0, p3, v8, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    .line 949
    .local v8, "bExempt1":Z
    const-string v9, "mccmnc_exempt"

    invoke-direct {p0, p3, v9, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v10

    .line 953
    .local v10, "bExempt2":Z
    if-nez v10, :cond_95

    .line 954
    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v2, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    const-string v6, "%s*"

    invoke-static {v11, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 956
    .local v5, "mccWildcard":Ljava/lang/String;
    invoke-direct {p0, p3, v9, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->isItExistedInList(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v10

    .line 961
    .end local v5  # "mccWildcard":Ljava/lang/String;
    :cond_95
    if-nez v8, :cond_99

    if-eqz v10, :cond_9a

    .line 962
    :cond_99
    const/4 v0, 0x0

    .line 964
    .end local v8  # "bExempt1":Z
    .end local v10  # "bExempt2":Z
    :cond_9a
    goto :goto_9c

    .line 966
    :cond_9b
    const/4 v0, 0x0

    .line 969
    :goto_9c
    return v0
.end method

.method private isServiceSupported(II)Z
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "service"  # I

    .line 1034
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1035
    const/4 v0, 0x0

    return v0

    .line 1038
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 1039
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lge/ims/common/util/SODConfig$Operator;->isServiceOn(I)Z

    move-result v1

    return v1
.end method

.method private static isSmsOverImsSupported(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "op"  # Ljava/lang/String;
    .param p1, "co"  # Ljava/lang/String;

    .line 2430
    const-string v0, "KR"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 2431
    const-string v0, "SKT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 2432
    const/4 v0, 0x0

    return v0

    .line 2436
    :cond_12
    const/4 v0, 0x1

    return v0
.end method

.method private matchedImsi(Landroid/database/Cursor;Ljava/lang/String;)I
    .registers 6
    .param p1, "cursor"  # Landroid/database/Cursor;
    .param p2, "imsi"  # Ljava/lang/String;

    .line 1452
    if-nez p1, :cond_4

    .line 1453
    const/4 v0, 0x0

    return v0

    .line 1456
    :cond_4
    const-string v0, "imsi"

    const-string v1, ""

    invoke-direct {p0, p1, v0, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1457
    .local v0, "cImsi":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1458
    const/4 v1, -0x1

    return v1

    .line 1461
    :cond_14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MatchedIMSI = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LGIMS_SIMOperatorDetector"

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1462
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method private operatorDecision(I)V
    .registers 6
    .param p1, "slotId"  # I

    .line 1285
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "operatorDecision("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1287
    sget-object v0, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateOperatorBasedOn(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 1288
    .local v2, "bOperatorBasedOn":Z
    const/4 v3, 0x1

    if-eq v2, v3, :cond_36

    .line 1290
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->checkAndSetPreferredOperator(I)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 1291
    return-void

    .line 1294
    :cond_30
    const-string v3, "operator"

    invoke-direct {p0, p1, v0, v1, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1296
    return-void

    .line 1300
    :cond_36
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->checkAndSetPreferredOperator(I)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 1301
    return-void

    .line 1304
    :cond_3d
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isTargetBasedOn()Z

    move-result v0

    const-string v3, "US"

    if-eqz v0, :cond_72

    .line 1305
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isTargetOpenOnLaop()Z

    move-result v0

    if-eqz v0, :cond_64

    .line 1306
    invoke-static {}, Lcom/lge/ims/carrier/CarrierCodeLoader;->getDefaultSimOperator()Ljava/lang/String;

    move-result-object v0

    .line 1308
    .local v0, "defaultOp":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_58

    .line 1309
    const-string v0, "ATT"

    goto :goto_5c

    .line 1311
    :cond_58
    invoke-static {v0}, Lcom/lge/ims/common/util/ImsProperties;->getImsOperator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1314
    :goto_5c
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSysSimOperator(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1, v0, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setTargetOpenPolicyOnLaop(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    .end local v0  # "defaultOp":Ljava/lang/String;
    goto :goto_9d

    .line 1316
    :cond_64
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isSupportSIMMoved()Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 1317
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->setTargetPolicyWithSimMoved(I)V

    goto :goto_9d

    .line 1320
    :cond_6e
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->setTargetPolicy(I)V

    goto :goto_9d

    .line 1325
    :cond_72
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isNaOpen()Z

    move-result v0

    if-eqz v0, :cond_84

    .line 1326
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSysSimOperator(I)Ljava/lang/String;

    move-result-object v0

    .line 1327
    invoke-static {}, Lcom/lge/ims/app/SIMOperatorDetector;->getDefaultOperatorForNaOpen()Ljava/lang/String;

    move-result-object v1

    .line 1326
    invoke-direct {p0, p1, v0, v1, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMPolicyForNaOpen(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9d

    .line 1329
    :cond_84
    const-string v0, "CA"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_90

    .line 1330
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMPolicyForCA(I)V

    goto :goto_9d

    .line 1332
    :cond_90
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isKrOpen()Z

    move-result v0

    if-eqz v0, :cond_9a

    .line 1333
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMPolicyForKROpen(I)V

    goto :goto_9d

    .line 1336
    :cond_9a
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMPolicy(I)V

    .line 1339
    :goto_9d
    return-void
.end method

.method private parseMccMnc(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 7
    .param p1, "mcc"  # Ljava/lang/String;
    .param p2, "mnc"  # Ljava/lang/String;

    .line 1521
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "parseMccMnc("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1523
    const-string v0, "\\p{Z}"

    const-string v1, ""

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1524
    .local v0, "trimedMnc":Ljava/lang/String;
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1526
    .local v1, "aStr":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-direct {p0, p1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->isMccMncValid(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_3c

    .line 1527
    const/4 v2, 0x0

    return-object v2

    .line 1530
    :cond_3c
    return-object v1
.end method

.method private setDefaultSIMPolicyForNaOpen(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 27
    .param p1, "slotId"  # I
    .param p2, "carrier"  # Ljava/lang/String;
    .param p3, "def_op"  # Ljava/lang/String;
    .param p4, "def_co"  # Ljava/lang/String;

    .line 1594
    move-object/from16 v8, p0

    move/from16 v9, p1

    move-object/from16 v10, p2

    move-object/from16 v0, p3

    .line 1595
    .local v0, "sim_op":Ljava/lang/String;
    move-object/from16 v1, p4

    .line 1597
    .local v1, "sim_co":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Lcom/lge/ims/common/util/ImsProperties;->isUnknownOperator(Ljava/lang/String;)Z

    move-result v11

    .line 1599
    .local v11, "bUnknownCarrier":Z
    const/4 v12, 0x1

    if-eq v11, v12, :cond_13

    .line 1600
    move-object/from16 v0, p2

    .line 1605
    :cond_13
    const-string v2, "content://com.lge.ims.provider.lgims/lgims_db_info"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    .line 1606
    .local v13, "uri":Landroid/net/Uri;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1607
    .local v14, "selection":Ljava/lang/String;
    invoke-direct {v8, v13, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getCursor(Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 1608
    .local v15, "cursor":Landroid/database/Cursor;
    const/4 v2, 0x0

    .line 1610
    .local v2, "filename":Ljava/lang/String;
    const-string v3, ""

    if-eqz v15, :cond_46

    .line 1611
    const-string v4, "config_xml_file"

    invoke-direct {v8, v15, v4, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1612
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    move-object v7, v2

    goto :goto_47

    .line 1610
    :cond_46
    move-object v7, v2

    .line 1615
    .end local v2  # "filename":Ljava/lang/String;
    .local v7, "filename":Ljava/lang/String;
    :goto_47
    invoke-direct {v8, v10}, Lcom/lge/ims/app/SIMOperatorDetector;->getCarrierFromNaoCarrierList(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1617
    .local v6, "cCarrier":Landroid/database/Cursor;
    const-string v2, "LGIMS_SIMOperatorDetector"

    if-eqz v6, :cond_66

    .line 1618
    const-string v4, "operator"

    move-object/from16 v5, p3

    invoke-direct {v8, v6, v4, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1620
    const-string v4, "country"

    move-object/from16 v12, p4

    invoke-direct {v8, v6, v4, v12}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1622
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v4, v0

    move-object/from16 v16, v1

    goto :goto_8c

    .line 1625
    :cond_66
    move-object/from16 v5, p3

    move-object/from16 v12, p4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v0

    .end local v0  # "sim_op":Ljava/lang/String;
    .local v16, "sim_op":Ljava/lang/String;
    const-string v0, "carrier for "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " is not existed..."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v4, v16

    move-object/from16 v16, v1

    .line 1628
    .end local v1  # "sim_co":Ljava/lang/String;
    .local v4, "sim_op":Ljava/lang/String;
    .local v16, "sim_co":Ljava/lang/String;
    :goto_8c
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_d1

    .line 1629
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "filename = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1630
    const-string v0, "."

    invoke-static {v0}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1631
    .local v0, "tokens":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x5

    if-lt v1, v2, :cond_d1

    .line 1634
    const/4 v1, 0x1

    aget-object v2, v0, v1

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d1

    .line 1635
    const/4 v1, 0x3

    aget-object v1, v0, v1

    const-string v2, "SMSONLY"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d1

    .line 1636
    iget-object v1, v8, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    .line 1642
    .end local v0  # "tokens":[Ljava/lang/String;
    :cond_d1
    invoke-virtual {v8, v9, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v18, ""

    const-string v19, ""

    const-string v20, ""

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v4

    move-object/from16 v3, v16

    move-object/from16 v21, v4

    .end local v4  # "sim_op":Ljava/lang/String;
    .local v21, "sim_op":Ljava/lang/String;
    move-object/from16 v4, v17

    move-object/from16 v5, v18

    move-object/from16 v17, v6

    .end local v6  # "cCarrier":Landroid/database/Cursor;
    .local v17, "cCarrier":Landroid/database/Cursor;
    move-object/from16 v6, v19

    move-object/from16 v18, v7

    .end local v7  # "filename":Ljava/lang/String;
    .local v18, "filename":Ljava/lang/String;
    move-object/from16 v7, v20

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1644
    const/4 v0, 0x1

    return v0
.end method

.method private setEnablerType(ILjava/lang/String;)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "enabler"  # Ljava/lang/String;

    .line 1043
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 1044
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lge/ims/common/util/SODConfig$Operator;->setEnablerType(Ljava/lang/String;)V

    .line 1045
    return-void
.end method

.method private setInboundRoaming(IZ)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "inbounded"  # Z

    .line 597
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 598
    return-void

    .line 601
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 602
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lge/ims/common/util/SODConfig$Operator;->setInboundRoaming(Z)V

    .line 603
    return-void
.end method

.method private setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V
    .registers 11
    .param p1, "slotId"  # I
    .param p2, "op"  # Ljava/lang/String;
    .param p3, "co"  # Ljava/lang/String;
    .param p4, "unknown"  # Z

    .line 2095
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;ZZ)V

    .line 2096
    return-void
.end method

.method private setOperatorInfo(ILjava/lang/String;Ljava/lang/String;ZZ)V
    .registers 22
    .param p1, "slotId"  # I
    .param p2, "op"  # Ljava/lang/String;
    .param p3, "co"  # Ljava/lang/String;
    .param p4, "unknown"  # Z
    .param p5, "simMoved"  # Z

    .line 2099
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setOperatorInfo("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ")"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "LGIMS_SIMOperatorDetector"

    invoke-static {v7, v5}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2102
    invoke-direct/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v5

    .line 2103
    .local v5, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v5}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v8

    .line 2105
    .local v8, "opInfo":Lcom/lge/ims/common/util/SODConfig$Operator;
    invoke-virtual {v8}, Lcom/lge/ims/common/util/SODConfig$Operator;->getOperator()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eqz v9, :cond_99

    invoke-virtual {v8}, Lcom/lge/ims/common/util/SODConfig$Operator;->getCountry()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_99

    .line 2106
    const-string v9, "No Changed Operator !!!"

    invoke-static {v7, v9}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2107
    invoke-virtual/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isEquipInSim(I)Z

    move-result v7

    if-eqz v7, :cond_8b

    .line 2108
    invoke-direct/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v7

    .line 2110
    .local v7, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getSubId()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/lge/ims/common/util/SODConfig$Operator;->setSubId(I)V

    .line 2111
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getMccMnc()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/lge/ims/common/util/SODConfig$Operator;->setMccMnc(Ljava/lang/String;)V

    .line 2114
    .end local v7  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :cond_8b
    invoke-virtual {v8}, Lcom/lge/ims/common/util/SODConfig$Operator;->isSimMoved()Z

    move-result v7

    if-eq v7, v4, :cond_98

    .line 2115
    invoke-virtual {v8, v4}, Lcom/lge/ims/common/util/SODConfig$Operator;->setSimMoved(Z)V

    .line 2116
    iput-boolean v11, v5, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mChanged:Z

    .line 2117
    iput-boolean v10, v5, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mDelivered:Z

    .line 2120
    :cond_98
    return-void

    .line 2123
    :cond_99
    invoke-virtual {v8, v11}, Lcom/lge/ims/common/util/SODConfig$Operator;->setAvailable(Z)V

    .line 2124
    invoke-virtual {v8, v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->setOperator(Ljava/lang/String;)V

    .line 2125
    invoke-virtual {v8, v2}, Lcom/lge/ims/common/util/SODConfig$Operator;->setCountry(Ljava/lang/String;)V

    .line 2126
    invoke-virtual {v8, v3}, Lcom/lge/ims/common/util/SODConfig$Operator;->setUnknownOperator(Z)V

    .line 2127
    invoke-virtual {v8, v4}, Lcom/lge/ims/common/util/SODConfig$Operator;->setSimMoved(Z)V

    .line 2129
    iput-boolean v11, v5, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mChanged:Z

    .line 2130
    iput-boolean v10, v5, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mDelivered:Z

    .line 2132
    const-string v7, ""

    .line 2133
    .local v7, "enabler":Ljava/lang/String;
    const-string v9, ""

    .line 2134
    .local v9, "region":Ljava/lang/String;
    const-string v10, ""

    .line 2135
    .local v10, "groupId":Ljava/lang/String;
    const-string v12, ""

    .line 2136
    .local v12, "category":Ljava/lang/String;
    const-string v13, ""

    .line 2138
    .local v13, "configPerModel":Ljava/lang/String;
    invoke-direct {v0, v1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 2139
    .local v14, "cursor":Landroid/database/Cursor;
    if-eqz v14, :cond_df

    .line 2140
    const-string v15, "enabler_type"

    const-string v11, ""

    invoke-direct {v0, v14, v15, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2142
    const-string v15, "region"

    invoke-direct {v0, v14, v15, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2144
    const-string v15, "group_id"

    invoke-direct {v0, v14, v15, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2146
    const-string v15, "category"

    invoke-direct {v0, v14, v15, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 2148
    const-string v15, "config_per_model"

    invoke-direct {v0, v14, v15, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 2150
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 2153
    :cond_df
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_e7

    .line 2154
    const-string v7, "global"

    .line 2157
    :cond_e7
    invoke-virtual {v8, v7}, Lcom/lge/ims/common/util/SODConfig$Operator;->setEnablerType(Ljava/lang/String;)V

    .line 2158
    invoke-virtual {v8, v9}, Lcom/lge/ims/common/util/SODConfig$Operator;->setRegion(Ljava/lang/String;)V

    .line 2159
    invoke-virtual {v8, v10}, Lcom/lge/ims/common/util/SODConfig$Operator;->setGroupId(Ljava/lang/String;)V

    .line 2160
    invoke-virtual {v8, v12}, Lcom/lge/ims/common/util/SODConfig$Operator;->setCategory(Ljava/lang/String;)V

    .line 2161
    const-string v11, "true"

    invoke-virtual {v11, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    invoke-virtual {v8, v11}, Lcom/lge/ims/common/util/SODConfig$Operator;->setConfigPerModel(Z)V

    .line 2163
    invoke-virtual/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isEquipInSim(I)Z

    move-result v11

    if-eqz v11, :cond_118

    .line 2164
    invoke-direct/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v11

    invoke-virtual {v11}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v11

    .line 2166
    .local v11, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v11}, Lcom/lge/ims/common/util/SODConfig$Sim;->getSubId()I

    move-result v15

    invoke-virtual {v8, v15}, Lcom/lge/ims/common/util/SODConfig$Operator;->setSubId(I)V

    .line 2167
    invoke-virtual {v11}, Lcom/lge/ims/common/util/SODConfig$Sim;->getMccMnc()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v15}, Lcom/lge/ims/common/util/SODConfig$Operator;->setMccMnc(Ljava/lang/String;)V

    .line 2170
    .end local v11  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :cond_118
    invoke-virtual/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMLocked(I)Z

    move-result v11

    const/4 v15, 0x1

    if-eq v11, v15, :cond_122

    .line 2171
    invoke-direct/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->setTheLatestOperatorInfo(I)V

    .line 2173
    :cond_122
    return-void
.end method

.method private setPreferenceOperatorPolicy(ILjava/lang/String;Ljava/lang/String;)V
    .registers 29
    .param p1, "slotId"  # I
    .param p2, "operator"  # Ljava/lang/String;
    .param p3, "country"  # Ljava/lang/String;

    .line 1342
    move-object/from16 v8, p0

    move/from16 v9, p1

    move-object/from16 v10, p2

    move-object/from16 v11, p3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setPreferenceOperatorPolicy :: slotId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", op="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", co="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1345
    move-object/from16 v0, p2

    .line 1346
    .local v0, "preferenceOperator":Ljava/lang/String;
    move-object/from16 v2, p3

    .line 1347
    .local v2, "preferenceCountry":Ljava/lang/String;
    const-string v3, ""

    .line 1348
    .local v3, "strMccMnc":Ljava/lang/String;
    const-string v4, ""

    .line 1349
    .local v4, "strGid":Ljava/lang/String;
    const-string v5, ""

    .line 1350
    .local v5, "strSpn":Ljava/lang/String;
    const-string v6, ""

    .line 1351
    .local v6, "strImsi":Ljava/lang/String;
    const-string v7, ""

    .line 1353
    .local v7, "strEnabled":Ljava/lang/String;
    invoke-direct {v8, v11, v10}, Lcom/lge/ims/app/SIMOperatorDetector;->parseMccMnc(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 1354
    .local v12, "aMncInfo":[Ljava/lang/String;
    const-string v13, "country"

    const-string v15, "operator"

    const-string v14, ""

    if-eqz v12, :cond_16d

    .line 1355
    move-object/from16 v17, v0

    .end local v0  # "preferenceOperator":Ljava/lang/String;
    .local v17, "preferenceOperator":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v18, v2

    const/16 v16, 0x0

    .end local v2  # "preferenceCountry":Ljava/lang/String;
    .local v18, "preferenceCountry":Ljava/lang/String;
    aget-object v2, v12, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1357
    invoke-direct {v8, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncFromMccMncList(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1358
    .local v0, "cursor_list":Landroid/database/Cursor;
    if-eqz v0, :cond_103

    .line 1359
    const-string v2, ""

    .line 1360
    .local v2, "gid":Ljava/lang/String;
    const-string v19, ""

    .line 1361
    .local v19, "spn":Ljava/lang/String;
    const-string v20, ""

    .line 1362
    .local v20, "imsi":Ljava/lang/String;
    move-object/from16 v21, v2

    .end local v2  # "gid":Ljava/lang/String;
    .local v21, "gid":Ljava/lang/String;
    array-length v2, v12

    move-object/from16 v22, v4

    .end local v4  # "strGid":Ljava/lang/String;
    .local v22, "strGid":Ljava/lang/String;
    const/4 v4, 0x1

    if-le v2, v4, :cond_88

    .line 1363
    aget-object v2, v12, v4

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_85

    move-object v2, v14

    goto :goto_87

    :cond_85
    aget-object v2, v12, v4

    .end local v21  # "gid":Ljava/lang/String;
    .restart local v2  # "gid":Ljava/lang/String;
    :goto_87
    goto :goto_8a

    .line 1362
    .end local v2  # "gid":Ljava/lang/String;
    .restart local v21  # "gid":Ljava/lang/String;
    :cond_88
    move-object/from16 v2, v21

    .line 1365
    .end local v21  # "gid":Ljava/lang/String;
    .restart local v2  # "gid":Ljava/lang/String;
    :goto_8a
    array-length v4, v12

    move-object/from16 v21, v5

    .end local v5  # "strSpn":Ljava/lang/String;
    .local v21, "strSpn":Ljava/lang/String;
    const/4 v5, 0x2

    if-le v4, v5, :cond_9f

    .line 1366
    aget-object v4, v12, v5

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_9a

    move-object v4, v14

    goto :goto_9c

    :cond_9a
    aget-object v4, v12, v5

    :goto_9c
    move-object/from16 v19, v4

    goto :goto_a1

    .line 1365
    :cond_9f
    move-object/from16 v4, v19

    .line 1368
    .end local v19  # "spn":Ljava/lang/String;
    .local v4, "spn":Ljava/lang/String;
    :goto_a1
    array-length v5, v12

    move-object/from16 v19, v6

    .end local v6  # "strImsi":Ljava/lang/String;
    .local v19, "strImsi":Ljava/lang/String;
    const/4 v6, 0x3

    if-le v5, v6, :cond_b6

    .line 1369
    aget-object v5, v12, v6

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_b1

    move-object v5, v14

    goto :goto_b3

    :cond_b1
    aget-object v5, v12, v6

    :goto_b3
    move-object/from16 v20, v5

    goto :goto_b8

    .line 1368
    :cond_b6
    move-object/from16 v5, v20

    .line 1372
    .end local v20  # "imsi":Ljava/lang/String;
    .local v5, "imsi":Ljava/lang/String;
    :goto_b8
    invoke-direct {v8, v0, v2, v4, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->getBestMatchedOperator(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 1373
    .local v6, "iPosition":I
    move-object/from16 v20, v2

    .end local v2  # "gid":Ljava/lang/String;
    .local v20, "gid":Ljava/lang/String;
    const/4 v2, -0x1

    if-eq v6, v2, :cond_f4

    .line 1374
    invoke-interface {v0, v6}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v2

    if-eqz v2, :cond_f4

    .line 1375
    invoke-direct {v8, v0, v15, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1377
    .end local v17  # "preferenceOperator":Ljava/lang/String;
    .local v2, "preferenceOperator":Ljava/lang/String;
    invoke-direct {v8, v0, v13, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1379
    .end local v18  # "preferenceCountry":Ljava/lang/String;
    .local v17, "preferenceCountry":Ljava/lang/String;
    move-object/from16 v23, v2

    .end local v2  # "preferenceOperator":Ljava/lang/String;
    .local v23, "preferenceOperator":Ljava/lang/String;
    const-string v2, "gid"

    invoke-direct {v8, v0, v2, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1381
    .end local v22  # "strGid":Ljava/lang/String;
    .local v2, "strGid":Ljava/lang/String;
    move-object/from16 v18, v2

    .end local v2  # "strGid":Ljava/lang/String;
    .local v18, "strGid":Ljava/lang/String;
    const-string v2, "spn"

    invoke-direct {v8, v0, v2, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1383
    .end local v21  # "strSpn":Ljava/lang/String;
    .local v2, "strSpn":Ljava/lang/String;
    move-object/from16 v21, v2

    .end local v2  # "strSpn":Ljava/lang/String;
    .restart local v21  # "strSpn":Ljava/lang/String;
    const-string v2, "imsi"

    invoke-direct {v8, v0, v2, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1385
    .end local v19  # "strImsi":Ljava/lang/String;
    .local v2, "strImsi":Ljava/lang/String;
    move-object/from16 v19, v2

    .end local v2  # "strImsi":Ljava/lang/String;
    .restart local v19  # "strImsi":Ljava/lang/String;
    const-string v2, "enabled"

    invoke-direct {v8, v0, v2, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v2, v17

    move-object/from16 v17, v23

    goto :goto_f8

    .line 1389
    .end local v23  # "preferenceOperator":Ljava/lang/String;
    .local v17, "preferenceOperator":Ljava/lang/String;
    .local v18, "preferenceCountry":Ljava/lang/String;
    .restart local v22  # "strGid":Ljava/lang/String;
    :cond_f4
    move-object/from16 v2, v18

    move-object/from16 v18, v22

    .end local v22  # "strGid":Ljava/lang/String;
    .local v2, "preferenceCountry":Ljava/lang/String;
    .local v18, "strGid":Ljava/lang/String;
    :goto_f8
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    move-object v4, v2

    move-object/from16 v2, v17

    move-object/from16 v5, v18

    move-object/from16 v6, v21

    goto :goto_111

    .line 1358
    .end local v2  # "preferenceCountry":Ljava/lang/String;
    .end local v19  # "strImsi":Ljava/lang/String;
    .end local v20  # "gid":Ljava/lang/String;
    .end local v21  # "strSpn":Ljava/lang/String;
    .local v4, "strGid":Ljava/lang/String;
    .local v5, "strSpn":Ljava/lang/String;
    .local v6, "strImsi":Ljava/lang/String;
    .local v18, "preferenceCountry":Ljava/lang/String;
    :cond_103
    move-object/from16 v22, v4

    move-object/from16 v21, v5

    move-object/from16 v19, v6

    .end local v4  # "strGid":Ljava/lang/String;
    .end local v5  # "strSpn":Ljava/lang/String;
    .end local v6  # "strImsi":Ljava/lang/String;
    .restart local v19  # "strImsi":Ljava/lang/String;
    .restart local v21  # "strSpn":Ljava/lang/String;
    .restart local v22  # "strGid":Ljava/lang/String;
    move-object/from16 v2, v17

    move-object/from16 v4, v18

    move-object/from16 v6, v21

    move-object/from16 v5, v22

    .line 1392
    .end local v17  # "preferenceOperator":Ljava/lang/String;
    .end local v18  # "preferenceCountry":Ljava/lang/String;
    .end local v21  # "strSpn":Ljava/lang/String;
    .end local v22  # "strGid":Ljava/lang/String;
    .local v2, "preferenceOperator":Ljava/lang/String;
    .local v4, "preferenceCountry":Ljava/lang/String;
    .local v5, "strGid":Ljava/lang/String;
    .local v6, "strSpn":Ljava/lang/String;
    :goto_111
    move-object/from16 v20, v0

    .end local v0  # "cursor_list":Landroid/database/Cursor;
    .local v20, "cursor_list":Landroid/database/Cursor;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Preference Information = "

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v10, "/"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1394
    move-object/from16 v17, v2

    .end local v2  # "preferenceOperator":Ljava/lang/String;
    .restart local v17  # "preferenceOperator":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lcom/lge/ims/log/Log;->pii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1392
    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v22, v5

    move-object/from16 v21, v6

    move-object/from16 v18, v7

    move-object/from16 v10, v17

    move-object/from16 v17, v3

    move-object v7, v4

    goto :goto_181

    .line 1354
    .end local v17  # "preferenceOperator":Ljava/lang/String;
    .end local v19  # "strImsi":Ljava/lang/String;
    .end local v20  # "cursor_list":Landroid/database/Cursor;
    .local v0, "preferenceOperator":Ljava/lang/String;
    .local v2, "preferenceCountry":Ljava/lang/String;
    .local v4, "strGid":Ljava/lang/String;
    .local v5, "strSpn":Ljava/lang/String;
    .local v6, "strImsi":Ljava/lang/String;
    :cond_16d
    move-object/from16 v17, v0

    move-object/from16 v18, v2

    move-object/from16 v22, v4

    move-object/from16 v21, v5

    move-object/from16 v19, v6

    .end local v0  # "preferenceOperator":Ljava/lang/String;
    .end local v2  # "preferenceCountry":Ljava/lang/String;
    .end local v4  # "strGid":Ljava/lang/String;
    .end local v5  # "strSpn":Ljava/lang/String;
    .end local v6  # "strImsi":Ljava/lang/String;
    .restart local v17  # "preferenceOperator":Ljava/lang/String;
    .restart local v18  # "preferenceCountry":Ljava/lang/String;
    .restart local v19  # "strImsi":Ljava/lang/String;
    .restart local v21  # "strSpn":Ljava/lang/String;
    .restart local v22  # "strGid":Ljava/lang/String;
    move-object/from16 v10, v17

    move-object/from16 v17, v3

    move-object/from16 v24, v18

    move-object/from16 v18, v7

    move-object/from16 v7, v24

    .line 1398
    .end local v3  # "strMccMnc":Ljava/lang/String;
    .local v7, "preferenceCountry":Ljava/lang/String;
    .local v10, "preferenceOperator":Ljava/lang/String;
    .local v17, "strMccMnc":Ljava/lang/String;
    .local v18, "strEnabled":Ljava/lang/String;
    :goto_181
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v10

    move-object v3, v7

    move-object/from16 v4, v17

    move-object/from16 v5, v22

    move-object/from16 v6, v21

    move-object v11, v7

    .end local v7  # "preferenceCountry":Ljava/lang/String;
    .local v11, "preferenceCountry":Ljava/lang/String;
    move-object/from16 v7, v19

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1401
    const-string v0, ""

    .line 1402
    .local v0, "op":Ljava/lang/String;
    const-string v1, ""

    .line 1403
    .local v1, "co":Ljava/lang/String;
    invoke-direct {v8, v10, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 1404
    .local v2, "cPrefInfo":Landroid/database/Cursor;
    if-eqz v2, :cond_1a8

    .line 1405
    invoke-direct {v8, v2, v15, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1407
    invoke-direct {v8, v2, v13, v14}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1409
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 1412
    :cond_1a8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1b9

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1b9

    .line 1413
    const/4 v3, 0x0

    invoke-direct {v8, v9, v0, v1, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    goto :goto_1bc

    .line 1416
    :cond_1b9
    invoke-direct {v8, v9, v10, v11, v15}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1419
    :goto_1bc
    return-void
.end method

.method private setProhibited(IZ)V
    .registers 6
    .param p1, "slotId"  # I
    .param p2, "prohibited"  # Z

    .line 606
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 607
    return-void

    .line 610
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 612
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mProhibited:Z

    if-eq v1, p2, :cond_2e

    .line 613
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ImsPolicy :: Service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-eqz p2, :cond_1f

    const-string v2, "blocked"

    goto :goto_21

    :cond_1f
    const-string v2, "not blocked"

    :goto_21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "LGIMS_SIMOperatorDetector"

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    :cond_2e
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mProhibited:Z

    .line 617
    return-void
.end method

.method private setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "slotId"  # I
    .param p2, "op"  # Ljava/lang/String;
    .param p3, "co"  # Ljava/lang/String;
    .param p4, "mccmnc"  # Ljava/lang/String;
    .param p5, "gid"  # Ljava/lang/String;
    .param p6, "spn"  # Ljava/lang/String;
    .param p7, "imsi"  # Ljava/lang/String;

    .line 2177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setSIMInfo("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2179
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v0

    .line 2181
    .local v0, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->setSubId(I)V

    .line 2182
    invoke-virtual {v0, p2}, Lcom/lge/ims/common/util/SODConfig$Sim;->setOperator(Ljava/lang/String;)V

    .line 2183
    invoke-virtual {v0, p3}, Lcom/lge/ims/common/util/SODConfig$Sim;->setCountry(Ljava/lang/String;)V

    .line 2184
    invoke-virtual {v0, p4}, Lcom/lge/ims/common/util/SODConfig$Sim;->setMccMnc(Ljava/lang/String;)V

    .line 2185
    invoke-virtual {v0, p5}, Lcom/lge/ims/common/util/SODConfig$Sim;->setGid(Ljava/lang/String;)V

    .line 2186
    invoke-virtual {v0, p6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setSpn(Ljava/lang/String;)V

    .line 2187
    invoke-virtual {v0, p7}, Lcom/lge/ims/common/util/SODConfig$Sim;->setImsi(Ljava/lang/String;)V

    .line 2189
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setSIMInfo :: slotId/operator/country/mccmnc/gid/spn/imsi = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2191
    invoke-static {p7}, Lcom/lge/ims/log/Log;->pii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2189
    invoke-static {v1, v2}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2192
    return-void
.end method

.method private setSIMPolicy(I)V
    .registers 10
    .param p1, "slotId"  # I

    .line 1648
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setSIMPolicy("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "LGIMS_SIMOperatorDetector"

    invoke-static {v2, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1650
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v0

    .line 1652
    .local v0, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateSIMInfo(I)Z

    move-result v3

    const-string v4, "global"

    if-eqz v3, :cond_81

    .line 1653
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ") - SIM Checking"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1655
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v1

    .line 1656
    .local v1, "simOp":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v2

    .line 1658
    .local v2, "simCo":Ljava/lang/String;
    invoke-direct {p0, v1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 1659
    .local v3, "cursor":Landroid/database/Cursor;
    if-nez v3, :cond_5a

    .line 1660
    invoke-direct {p0, p1, v1, v2, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1661
    return-void

    .line 1664
    :cond_5a
    const-string v5, "operator"

    const-string v6, ""

    invoke-direct {p0, v3, v5, v6}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1666
    .local v5, "op":Ljava/lang/String;
    const-string v7, "country"

    invoke-direct {p0, v3, v7, v6}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1668
    .local v6, "co":Ljava/lang/String;
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 1669
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_7d

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_78

    goto :goto_7d

    .line 1674
    :cond_78
    const/4 v4, 0x0

    invoke-direct {p0, p1, v5, v6, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1675
    .end local v1  # "simOp":Ljava/lang/String;
    .end local v2  # "simCo":Ljava/lang/String;
    .end local v3  # "cursor":Landroid/database/Cursor;
    .end local v5  # "op":Ljava/lang/String;
    .end local v6  # "co":Ljava/lang/String;
    goto :goto_b4

    .line 1670
    .restart local v1  # "simOp":Ljava/lang/String;
    .restart local v2  # "simCo":Ljava/lang/String;
    .restart local v3  # "cursor":Landroid/database/Cursor;
    .restart local v5  # "op":Ljava/lang/String;
    .restart local v6  # "co":Ljava/lang/String;
    :cond_7d
    :goto_7d
    invoke-direct {p0, p1, v1, v2, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1671
    return-void

    .line 1677
    .end local v1  # "simOp":Ljava/lang/String;
    .end local v2  # "simCo":Ljava/lang/String;
    .end local v3  # "cursor":Landroid/database/Cursor;
    .end local v5  # "op":Ljava/lang/String;
    .end local v6  # "co":Ljava/lang/String;
    :cond_81
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ") - Abnormal Case"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1679
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v1

    .line 1680
    .restart local v1  # "simOp":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v2

    .line 1682
    .restart local v2  # "simCo":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_b1

    .line 1683
    sget-object v3, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    sget-object v5, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-direct {p0, p1, v3, v5, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b4

    .line 1686
    :cond_b1
    invoke-direct {p0, p1, v1, v2, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1689
    .end local v1  # "simOp":Ljava/lang/String;
    .end local v2  # "simCo":Ljava/lang/String;
    :goto_b4
    return-void
.end method

.method private setSIMPolicyForCA(I)V
    .registers 8
    .param p1, "slotId"  # I

    .line 1692
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setSIMPolicyForCA("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1694
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSysSimOperator(I)Ljava/lang/String;

    move-result-object v0

    .line 1695
    .local v0, "sysSimOperator":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSysSimOperatorSub(I)Ljava/lang/String;

    move-result-object v1

    .line 1696
    .local v1, "sysSimOperatorSub":Ljava/lang/String;
    const-string v2, ""

    .line 1697
    .local v2, "operator":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_30

    .line 1698
    move-object v2, v1

    goto :goto_3a

    .line 1700
    :cond_30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_38

    .line 1701
    move-object v2, v0

    goto :goto_3a

    .line 1704
    :cond_38
    sget-object v2, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    .line 1707
    :goto_3a
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateSIMInfo(I)Z

    .line 1708
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isEquipInSim(I)Z

    move-result v3

    if-eqz v3, :cond_53

    .line 1709
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v3

    .line 1711
    .local v3, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v3, v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->setOperator(Ljava/lang/String;)V

    .line 1712
    sget-object v4, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/lge/ims/common/util/SODConfig$Sim;->setCountry(Ljava/lang/String;)V

    .line 1715
    .end local v3  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :cond_53
    sget-object v3, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    .line 1716
    .local v4, "cursor":Landroid/database/Cursor;
    if-nez v4, :cond_61

    .line 1717
    const-string v5, "canada"

    invoke-direct {p0, p1, v2, v3, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_68

    .line 1721
    :cond_61
    const/4 v5, 0x0

    invoke-direct {p0, p1, v2, v3, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1722
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 1724
    :goto_68
    return-void
.end method

.method private setSIMPolicyForKROpen(I)V
    .registers 10
    .param p1, "slotId"  # I

    .line 1727
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setSIMPolicyForKROpen("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1729
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateSIMInfo(I)Z

    .line 1731
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSysSimOperator(I)Ljava/lang/String;

    move-result-object v0

    .line 1733
    .local v0, "sysSimOperator":Ljava/lang/String;
    invoke-static {v0}, Lcom/lge/ims/common/util/ImsProperties;->isUnknownOperator(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6e

    .line 1735
    invoke-static {}, Lcom/lge/ims/common/util/ImsProperties;->isLaop()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 1736
    const/4 v5, 0x0

    const/4 v6, 0x1

    const-string v3, "LGU"

    const-string v4, "KR"

    move-object v1, p0

    move v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;ZZ)V

    goto :goto_78

    .line 1738
    :cond_3d
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v7

    .line 1740
    .local v7, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_62

    .line 1741
    nop

    .line 1742
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1741
    move-object v1, p0

    move v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;ZZ)V

    goto :goto_6d

    .line 1744
    :cond_62
    const/4 v5, 0x0

    const/4 v6, 0x1

    const-string v3, "LGU"

    const-string v4, "KR"

    move-object v1, p0

    move v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;ZZ)V

    .line 1746
    .end local v7  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :goto_6d
    goto :goto_78

    .line 1748
    :cond_6e
    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v4, "KR"

    move-object v1, p0

    move v2, p1

    move-object v3, v0

    invoke-direct/range {v1 .. v6}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;ZZ)V

    .line 1750
    :goto_78
    return-void
.end method

.method private setSIMPolicyForNaOpen(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 27
    .param p1, "slotId"  # I
    .param p2, "carrier"  # Ljava/lang/String;
    .param p3, "def_op"  # Ljava/lang/String;
    .param p4, "def_co"  # Ljava/lang/String;

    .line 1534
    move-object/from16 v8, p0

    move/from16 v9, p1

    move-object/from16 v10, p2

    move-object/from16 v11, p3

    move-object/from16 v12, p4

    const/4 v13, 0x1

    .line 1535
    .local v13, "valid":Z
    invoke-virtual/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMAbsent(I)Z

    move-result v0

    const-string v14, "country"

    const-string v15, "operator"

    const-string v7, "LGIMS_SIMOperatorDetector"

    const-string v6, "/"

    if-eqz v0, :cond_24

    .line 1536
    invoke-direct/range {p0 .. p4}, Lcom/lge/ims/app/SIMOperatorDetector;->setDefaultSIMPolicyForNaOpen(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    move-object/from16 v21, v7

    move/from16 v20, v13

    move-object v13, v6

    goto/16 :goto_bb

    .line 1539
    :cond_24
    invoke-virtual/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isTestSimForNaOpen(I)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 1540
    invoke-direct/range {p0 .. p4}, Lcom/lge/ims/app/SIMOperatorDetector;->setDefaultSIMPolicyForNaOpen(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    move-object/from16 v21, v7

    move/from16 v20, v13

    move-object v13, v6

    goto/16 :goto_bb

    .line 1543
    :cond_35
    move-object/from16 v0, p3

    .line 1544
    .local v0, "simOperator":Ljava/lang/String;
    move-object/from16 v1, p4

    .line 1546
    .local v1, "simCountry":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Lcom/lge/ims/common/util/ImsProperties;->isUnknownOperator(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_64

    .line 1547
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sim is not suppored, set default operator("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_96

    .line 1551
    :cond_64
    invoke-direct {v8, v10}, Lcom/lge/ims/app/SIMOperatorDetector;->getCarrierFromNaoCarrierList(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 1552
    .local v2, "cCarrier":Landroid/database/Cursor;
    if-eqz v2, :cond_7a

    .line 1553
    invoke-direct {v8, v2, v15, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1555
    invoke-direct {v8, v2, v14, v12}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1557
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    move-object/from16 v16, v0

    move-object/from16 v17, v1

    goto :goto_9a

    .line 1560
    :cond_7a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "carrier for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not existed..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1563
    .end local v2  # "cCarrier":Landroid/database/Cursor;
    :goto_96
    move-object/from16 v16, v0

    move-object/from16 v17, v1

    .end local v0  # "simOperator":Ljava/lang/String;
    .end local v1  # "simCountry":Ljava/lang/String;
    .local v16, "simOperator":Ljava/lang/String;
    .local v17, "simCountry":Ljava/lang/String;
    :goto_9a
    nop

    .line 1564
    const-string v0, ""

    invoke-virtual {v8, v9, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1563
    const-string v5, ""

    const-string v18, ""

    const-string v19, ""

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    move/from16 v20, v13

    move-object v13, v6

    .end local v13  # "valid":Z
    .local v20, "valid":Z
    move-object/from16 v6, v18

    move-object/from16 v21, v7

    move-object/from16 v7, v19

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1568
    .end local v16  # "simOperator":Ljava/lang/String;
    .end local v17  # "simCountry":Ljava/lang/String;
    :goto_bb
    const/4 v0, 0x0

    .line 1569
    .local v0, "cOperator":Landroid/database/Cursor;
    if-eqz v20, :cond_d2

    .line 1570
    invoke-direct/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    .line 1571
    .local v1, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v8, v2, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1574
    .end local v1  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :cond_d2
    move-object/from16 v1, p3

    .line 1575
    .local v1, "op":Ljava/lang/String;
    move-object/from16 v2, p4

    .line 1576
    .local v2, "co":Ljava/lang/String;
    if-eqz v0, :cond_e8

    .line 1577
    invoke-direct {v8, v0, v15, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1579
    invoke-direct {v8, v0, v14, v12}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1581
    const/4 v3, 0x0

    invoke-direct {v8, v9, v1, v2, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1582
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_eb

    .line 1585
    :cond_e8
    invoke-direct {v8, v9, v11, v12, v15}, Lcom/lge/ims/app/SIMOperatorDetector;->setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1588
    :goto_eb
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "slotId/carrier/operator/country/def_op/def_co="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v4, v21

    invoke-static {v4, v3}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1590
    return-void
.end method

.method private setSimInfoFromCarrierCode(IZ)V
    .registers 12
    .param p1, "slotId"  # I
    .param p2, "simLocked"  # Z

    .line 2195
    invoke-static {p1, p2}, Lcom/lge/ims/carrier/CarrierCodeLoader;->getCarrierIdFromSim(IZ)Lcom/lge/ims/carrier/SimCarrierId;

    move-result-object v0

    .line 2196
    .local v0, "id":Lcom/lge/ims/carrier/SimCarrierId;
    invoke-static {}, Lcom/lge/ims/carrier/CarrierCodeLoader;->getInstance()Lcom/lge/ims/carrier/CarrierCodeLoader;

    move-result-object v1

    .line 2197
    .local v1, "ccl":Lcom/lge/ims/carrier/CarrierCodeLoader;
    invoke-virtual {v1, v0, p1}, Lcom/lge/ims/carrier/CarrierCodeLoader;->fetchCarrierCode(Lcom/lge/ims/carrier/SimCarrierId;I)Lcom/lge/ims/carrier/CarrierCode;

    move-result-object v2

    .line 2199
    .local v2, "cc":Lcom/lge/ims/carrier/CarrierCode;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setSimInfoFromCarrierCode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v2, :cond_1e

    invoke-virtual {v2}, Lcom/lge/ims/carrier/CarrierCode;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_20

    :cond_1e
    const-string v4, "(null)"

    :goto_20
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "LGIMS_SIMOperatorDetector"

    invoke-static {v4, v3}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2201
    if-nez v2, :cond_30

    .line 2202
    return-void

    .line 2205
    :cond_30
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v3

    .line 2207
    .local v3, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/lge/ims/carrier/CarrierCode;->getMcc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lge/ims/carrier/CarrierCode;->getMnc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/lge/ims/common/util/SODConfig$Sim;->setMccMnc(Ljava/lang/String;)V

    .line 2209
    invoke-virtual {v2}, Lcom/lge/ims/carrier/CarrierCode;->getMvnoMatchData()Ljava/lang/String;

    move-result-object v4

    .line 2211
    .local v4, "mvnoData":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    const-string v6, ""

    if-nez v5, :cond_ad

    .line 2212
    invoke-virtual {v2}, Lcom/lge/ims/carrier/CarrierCode;->getMvnoType()Ljava/lang/String;

    move-result-object v5

    const/4 v7, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_b8

    :cond_6c
    goto :goto_8a

    :sswitch_6d
    const-string v8, "imsi"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6c

    const/4 v7, 0x2

    goto :goto_8a

    :sswitch_77
    const-string v8, "spn"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6c

    const/4 v7, 0x1

    goto :goto_8a

    :sswitch_81
    const-string v8, "gid"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6c

    const/4 v7, 0x0

    :goto_8a
    packed-switch v7, :pswitch_data_c6

    goto :goto_ac

    .line 2224
    :pswitch_8e  #0x2
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setGid(Ljava/lang/String;)V

    .line 2225
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setSpn(Ljava/lang/String;)V

    .line 2226
    invoke-virtual {v3, v4}, Lcom/lge/ims/common/util/SODConfig$Sim;->setImsi(Ljava/lang/String;)V

    .line 2227
    goto :goto_ac

    .line 2219
    :pswitch_98  #0x1
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setGid(Ljava/lang/String;)V

    .line 2220
    invoke-virtual {v3, v4}, Lcom/lge/ims/common/util/SODConfig$Sim;->setSpn(Ljava/lang/String;)V

    .line 2221
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setImsi(Ljava/lang/String;)V

    .line 2222
    goto :goto_ac

    .line 2214
    :pswitch_a2  #0x0
    invoke-virtual {v3, v4}, Lcom/lge/ims/common/util/SODConfig$Sim;->setGid(Ljava/lang/String;)V

    .line 2215
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setSpn(Ljava/lang/String;)V

    .line 2216
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setImsi(Ljava/lang/String;)V

    .line 2217
    nop

    .line 2230
    :goto_ac
    goto :goto_b6

    .line 2233
    :cond_ad
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setGid(Ljava/lang/String;)V

    .line 2234
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setSpn(Ljava/lang/String;)V

    .line 2235
    invoke-virtual {v3, v6}, Lcom/lge/ims/common/util/SODConfig$Sim;->setImsi(Ljava/lang/String;)V

    .line 2237
    :goto_b6
    return-void

    nop

    :sswitch_data_b8
    .sparse-switch
        0x18fc2 -> :sswitch_81
        0x1bdb1 -> :sswitch_77
        0x31627a -> :sswitch_6d
    .end sparse-switch

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_a2  #00000000
        :pswitch_98  #00000001
        :pswitch_8e  #00000002
    .end packed-switch
.end method

.method private setSupportServices(II)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "service"  # I

    .line 1048
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 1049
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lge/ims/common/util/SODConfig$Operator;->setServices(I)V

    .line 1050
    return-void
.end method

.method private setTargetOpenPolicyOnLaop(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "carrier"  # Ljava/lang/String;
    .param p3, "def_op"  # Ljava/lang/String;
    .param p4, "def_co"  # Ljava/lang/String;

    .line 1790
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMPolicyForNaOpen(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1791
    return-void
.end method

.method private setTargetPolicy(I)V
    .registers 5
    .param p1, "slotId"  # I

    .line 1754
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setTargetPolicy("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1757
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateSIMInfo(I)Z

    .line 1759
    sget-object v0, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1760
    return-void
.end method

.method private setTargetPolicyWithSimMoved(I)V
    .registers 8
    .param p1, "slotId"  # I

    .line 1769
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setTargetPolicyWithSimMoved("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1771
    const-string v0, ""

    .line 1772
    .local v0, "op":Ljava/lang/String;
    const-string v1, ""

    .line 1773
    .local v1, "co":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateSIMInfo(I)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_4f

    .line 1775
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v2

    .line 1776
    .local v2, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    sget-object v4, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_49

    .line 1777
    invoke-virtual {v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p1, v4, v5, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    goto :goto_4e

    .line 1780
    :cond_49
    sget-object v5, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    invoke-direct {p0, p1, v5, v4, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1782
    .end local v2  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :goto_4e
    goto :goto_56

    .line 1784
    :cond_4f
    sget-object v2, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    sget-object v4, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-direct {p0, p1, v2, v4, v3}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1786
    :goto_56
    return-void
.end method

.method private setTheLatestOperatorInfo(I)V
    .registers 10
    .param p1, "slotId"  # I

    .line 2055
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v0

    .line 2058
    .local v0, "opInfo":Lcom/lge/ims/common/util/SODConfig$Operator;
    nop

    .line 2059
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Operator;->getOperator()Ljava/lang/String;

    move-result-object v1

    .line 2058
    const-string v2, "operator"

    invoke-static {p1, v2, v1}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2060
    nop

    .line 2061
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Operator;->getCountry()Ljava/lang/String;

    move-result-object v1

    .line 2060
    const-string v2, "country"

    invoke-static {p1, v2, v1}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2063
    const/4 v1, 0x0

    .line 2064
    .local v1, "sim_operator":Ljava/lang/String;
    const/4 v2, 0x0

    .line 2065
    .local v2, "sim_country":Ljava/lang/String;
    const/4 v3, 0x0

    .line 2066
    .local v3, "sim_mccmnc":Ljava/lang/String;
    const/4 v4, 0x0

    .line 2067
    .local v4, "sim_gid":Ljava/lang/String;
    const/4 v5, 0x0

    .line 2068
    .local v5, "sim_spn":Ljava/lang/String;
    const/4 v6, 0x0

    .line 2070
    .local v6, "sim_imsi":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isEquipInSim(I)Z

    move-result v7

    if-eqz v7, :cond_48

    .line 2071
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v7

    .line 2072
    .local v7, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v1

    .line 2073
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v2

    .line 2074
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getMccMnc()Ljava/lang/String;

    move-result-object v3

    .line 2075
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getGid()Ljava/lang/String;

    move-result-object v4

    .line 2076
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getSpn()Ljava/lang/String;

    move-result-object v5

    .line 2077
    invoke-virtual {v7}, Lcom/lge/ims/common/util/SODConfig$Sim;->getImsi()Ljava/lang/String;

    move-result-object v6

    .line 2080
    .end local v7  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :cond_48
    const-string v7, "sim_operator"

    invoke-static {p1, v7, v1}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2082
    const-string v7, "sim_country"

    invoke-static {p1, v7, v2}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2084
    const-string v7, "mccmnc"

    invoke-static {p1, v7, v3}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2086
    const-string v7, "gid"

    invoke-static {p1, v7, v4}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2088
    const-string v7, "spn"

    invoke-static {p1, v7, v5}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2090
    const-string v7, "imsi"

    invoke-static {p1, v7, v6}, Lcom/lge/ims/common/util/SODConfig;->setValueForCachedOperatorInfo(ILjava/lang/String;Ljava/lang/String;)V

    .line 2092
    return-void
.end method

.method private setUnknownPolicy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 27
    .param p1, "slotId"  # I
    .param p2, "op"  # Ljava/lang/String;
    .param p3, "co"  # Ljava/lang/String;
    .param p4, "enabler"  # Ljava/lang/String;

    .line 1794
    move-object/from16 v8, p0

    move/from16 v9, p1

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setUnknownPolicy("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, "/"

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v13, p2

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1795
    invoke-virtual/range {p0 .. p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMBasedOn()Z

    move-result v1

    const-string v14, "sim"

    const-string v15, "target"

    if-eqz v1, :cond_3b

    move-object v1, v14

    goto :goto_3c

    :cond_3b
    move-object v1, v15

    :goto_3c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, ")"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1794
    const-string v6, "LGIMS_SIMOperatorDetector"

    invoke-static {v6, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1797
    move-object/from16 v5, p2

    .line 1800
    .local v5, "unknownOp":Ljava/lang/String;
    sget-object v3, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    const-string v0, "KR"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_140

    .line 1801
    const-string v0, ""

    invoke-virtual {v8, v9, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1802
    .local v4, "mccmnc":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f0

    .line 1803
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v2, v0

    .line 1804
    .local v2, "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "45002"

    const-string v1, "KT"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1805
    const-string v0, "45004"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1806
    const-string v0, "45008"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1807
    const-string v0, "45006"

    const-string v1, "LGU"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1808
    const-string v0, "45005"

    const-string v1, "SKT"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1809
    const-string v0, "45011"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1811
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v16, v0

    check-cast v16, Ljava/lang/String;

    .line 1812
    .local v16, "simOperator":Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d3

    .line 1813
    const/4 v0, 0x3

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const/4 v1, 0x0

    invoke-virtual {v4, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    const-string v18, ""

    const-string v19, ""

    const-string v20, ""

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v21, v2

    .end local v2  # "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .local v21, "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    move-object v2, v3

    move-object/from16 v3, v17

    move-object/from16 v17, v4

    .end local v4  # "mccmnc":Ljava/lang/String;
    .local v17, "mccmnc":Ljava/lang/String;
    move-object v13, v5

    .end local v5  # "unknownOp":Ljava/lang/String;
    .local v13, "unknownOp":Ljava/lang/String;
    move-object/from16 v5, v18

    move-object/from16 v18, v14

    move-object v14, v6

    move-object/from16 v6, v19

    move-object/from16 v19, v15

    move-object v15, v7

    move-object/from16 v7, v20

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f9

    .line 1816
    .end local v13  # "unknownOp":Ljava/lang/String;
    .end local v17  # "mccmnc":Ljava/lang/String;
    .end local v21  # "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2  # "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v4  # "mccmnc":Ljava/lang/String;
    .restart local v5  # "unknownOp":Ljava/lang/String;
    :cond_d3
    move-object/from16 v21, v2

    move-object/from16 v17, v4

    move-object v13, v5

    move-object/from16 v18, v14

    move-object/from16 v19, v15

    move-object v14, v6

    move-object v15, v7

    .end local v2  # "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4  # "mccmnc":Ljava/lang/String;
    .end local v5  # "unknownOp":Ljava/lang/String;
    .restart local v13  # "unknownOp":Ljava/lang/String;
    .restart local v17  # "mccmnc":Ljava/lang/String;
    .restart local v21  # "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, v16

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1817
    move-object/from16 v5, v16

    .end local v13  # "unknownOp":Ljava/lang/String;
    .restart local v5  # "unknownOp":Ljava/lang/String;
    goto :goto_fa

    .line 1802
    .end local v16  # "simOperator":Ljava/lang/String;
    .end local v17  # "mccmnc":Ljava/lang/String;
    .end local v21  # "mccmncList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v4  # "mccmnc":Ljava/lang/String;
    :cond_f0
    move-object/from16 v17, v4

    move-object v13, v5

    move-object/from16 v18, v14

    move-object/from16 v19, v15

    move-object v14, v6

    move-object v15, v7

    .line 1821
    .end local v4  # "mccmnc":Ljava/lang/String;
    .end local v5  # "unknownOp":Ljava/lang/String;
    .restart local v13  # "unknownOp":Ljava/lang/String;
    .restart local v17  # "mccmnc":Ljava/lang/String;
    :goto_f9
    move-object v5, v13

    .end local v13  # "unknownOp":Ljava/lang/String;
    .restart local v5  # "unknownOp":Ljava/lang/String;
    :goto_fa
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Only For KR!!!, setUnknownPolicy("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1822
    invoke-virtual/range {p0 .. p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMBasedOn()Z

    move-result v1

    if-eqz v1, :cond_126

    move-object/from16 v1, v18

    goto :goto_128

    :cond_126
    move-object/from16 v1, v19

    :goto_128
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1821
    invoke-static {v14, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1823
    .end local v17  # "mccmnc":Ljava/lang/String;
    goto :goto_1a6

    :cond_140
    move-object v13, v5

    move-object v14, v6

    .end local v5  # "unknownOp":Ljava/lang/String;
    .restart local v13  # "unknownOp":Ljava/lang/String;
    const-string v0, "AU"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a5

    .line 1825
    const-string v1, "VDA"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_184

    .line 1826
    const-string v1, "OPT"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_184

    .line 1827
    const-string v1, "TEL"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_184

    .line 1828
    const-string v1, "OPEN"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_184

    .line 1829
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ImsPolicy :: Unknown op-changed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v1}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1830
    const-string v1, "OPEN"

    move-object v5, v1

    .end local v13  # "unknownOp":Ljava/lang/String;
    .local v1, "unknownOp":Ljava/lang/String;
    goto :goto_185

    .line 1833
    .end local v1  # "unknownOp":Ljava/lang/String;
    .restart local v13  # "unknownOp":Ljava/lang/String;
    :cond_184
    move-object v5, v13

    .end local v13  # "unknownOp":Ljava/lang/String;
    .restart local v5  # "unknownOp":Ljava/lang/String;
    :goto_185
    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a6

    .line 1834
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ImsPolicy :: Unknown co-changed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v0}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1835
    const-string v0, "AU"

    move-object v10, v0

    .end local p3  # "co":Ljava/lang/String;
    .local v0, "co":Ljava/lang/String;
    goto :goto_1a6

    .line 1823
    .end local v0  # "co":Ljava/lang/String;
    .end local v5  # "unknownOp":Ljava/lang/String;
    .restart local v13  # "unknownOp":Ljava/lang/String;
    .restart local p3  # "co":Ljava/lang/String;
    :cond_1a5
    move-object v5, v13

    .line 1839
    .end local v13  # "unknownOp":Ljava/lang/String;
    .end local p3  # "co":Ljava/lang/String;
    .restart local v5  # "unknownOp":Ljava/lang/String;
    .local v10, "co":Ljava/lang/String;
    :cond_1a6
    :goto_1a6
    const/4 v0, 0x1

    invoke-direct {v8, v9, v5, v10, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->setOperatorInfo(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 1840
    invoke-direct {v8, v9, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->setEnablerType(ILjava/lang/String;)V

    .line 1841
    return-void
.end method

.method private updateOperatorBasedOn(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 13
    .param p1, "op"  # Ljava/lang/String;
    .param p2, "co"  # Ljava/lang/String;

    .line 1844
    iget-object v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Device;->clearOperatorBasedOn()V

    .line 1846
    invoke-direct {p0, p1, p2}, Lcom/lge/ims/app/SIMOperatorDetector;->getOperatorFromOperatorList(Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1847
    .local v0, "cOperator":Landroid/database/Cursor;
    const/4 v1, 0x0

    const/high16 v2, 0x10000

    const-string v3, "LGIMS_SIMOperatorDetector"

    if-nez v0, :cond_3c

    .line 1848
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateOperatorBasedOn :: operator for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not existed..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1850
    iget-object v3, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v3, v2}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    .line 1851
    return v1

    .line 1854
    :cond_3c
    const-string v4, "operator_based_on"

    const-string v5, ""

    invoke-direct {p0, v0, v4, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1856
    .local v4, "strOperatorBasedOn":Ljava/lang/String;
    const-string v6, "support_sim_moved"

    invoke-direct {p0, v0, v6, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1858
    .local v5, "strSupportSimMoved":Ljava/lang/String;
    iget-object v6, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    const-string v7, "true"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {v6, v8}, Lcom/lge/ims/common/util/SODConfig$Device;->setSimMovedSupported(Z)V

    .line 1859
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1861
    const-string v6, "target"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    const-string v8, "US"

    const/4 v9, 0x1

    if-eqz v6, :cond_94

    .line 1862
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    .line 1864
    invoke-virtual {v7, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_75

    .line 1865
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v1, v9}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    goto/16 :goto_ee

    .line 1868
    :cond_75
    invoke-static {}, Lcom/lge/ims/common/util/ImsProperties;->isLaop()Z

    move-result v1

    if-eqz v1, :cond_ee

    .line 1869
    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ee

    .line 1870
    sget-object v1, Lcom/lge/ims/common/util/ImsProperties;->TARGET_OPERATOR:Ljava/lang/String;

    const-string v2, "TRF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ee

    .line 1871
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    goto :goto_ee

    .line 1877
    :cond_94
    const-string v6, "sim"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_11f

    .line 1878
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    const/high16 v2, 0x20000

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    .line 1880
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Device;->isSimMovedSupported()Z

    move-result v1

    if-eqz v1, :cond_b0

    .line 1881
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v1, v9}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    .line 1884
    :cond_b0
    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const-string v6, "OPEN"

    if-eqz v2, :cond_d7

    .line 1885
    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    const-string v2, "NAO"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    const/4 v7, 0x4

    if-eqz v2, :cond_cb

    .line 1886
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v1, v7}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    goto :goto_ee

    .line 1887
    :cond_cb
    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ee

    .line 1889
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v1, v7}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    goto :goto_ee

    .line 1891
    :cond_d7
    const-string v2, "KR"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ee

    sget-object v1, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    .line 1892
    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ee

    .line 1893
    iget-object v1, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    .line 1902
    :cond_ee
    :goto_ee
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "operatorBasedOn=0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v2}, Lcom/lge/ims/common/util/SODConfig$Device;->getOperatorBasedOn()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", simMovedSupported="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    .line 1903
    invoke-virtual {v2}, Lcom/lge/ims/common/util/SODConfig$Device;->isSimMovedSupported()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1902
    invoke-static {v3, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1905
    return v9

    .line 1897
    :cond_11f
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected OperatorBasedOn("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1898
    iget-object v3, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v3, v2}, Lcom/lge/ims/common/util/SODConfig$Device;->setOperatorBasedOn(I)V

    .line 1899
    return v1
.end method

.method private updateSIMInfo(I)Z
    .registers 24
    .param p1, "slotId"  # I

    .line 1923
    move-object/from16 v8, p0

    move/from16 v9, p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateSIMInfo("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1924
    const/4 v10, 0x0

    .line 1927
    .local v10, "result":Z
    invoke-virtual/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMLocked(I)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 1928
    invoke-virtual/range {p0 .. p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getTheLatestOperatorInfo(I)Z

    move-result v0

    .line 1930
    .local v0, "updated":Z
    invoke-static {}, Lcom/lge/ims/app/SIMOperatorDetector;->isCarrierCodeRequiredOnSimLocked()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 1931
    const/4 v1, 0x1

    invoke-direct {v8, v9, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setSimInfoFromCarrierCode(IZ)V

    .line 1934
    :cond_37
    return v0

    .line 1938
    .end local v0  # "updated":Z
    :cond_38
    const-string v0, ""

    invoke-virtual {v8, v9, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1939
    .local v11, "mccmnc":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_58

    .line 1940
    const-string v2, ""

    const-string v3, ""

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1941
    return v10

    .line 1945
    :cond_58
    const-string v1, ""

    .line 1946
    .local v1, "op":Ljava/lang/String;
    const-string v2, ""

    .line 1947
    .local v2, "co":Ljava/lang/String;
    invoke-direct {v8, v11}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncFromMccMncList(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 1948
    .local v12, "cursors":Landroid/database/Cursor;
    const/4 v3, 0x0

    const/4 v4, 0x3

    if-nez v12, :cond_7d

    .line 1949
    invoke-virtual {v11, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 1950
    .end local v2  # "co":Ljava/lang/String;
    .local v13, "co":Ljava/lang/String;
    invoke-virtual {v11, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 1951
    .end local v1  # "op":Ljava/lang/String;
    .local v14, "op":Ljava/lang/String;
    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v14

    move-object v3, v13

    move-object v4, v11

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1952
    return v10

    .line 1956
    .end local v13  # "co":Ljava/lang/String;
    .end local v14  # "op":Ljava/lang/String;
    .restart local v1  # "op":Ljava/lang/String;
    .restart local v2  # "co":Ljava/lang/String;
    :cond_7d
    const-string v5, ""

    .line 1957
    .local v5, "gid":Ljava/lang/String;
    const-string v6, ""

    .line 1958
    .local v6, "spn":Ljava/lang/String;
    const-string v7, ""

    .line 1960
    .local v7, "imsi":Ljava/lang/String;
    invoke-direct {v8, v9, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getGidFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1961
    .local v13, "simGid":Ljava/lang/String;
    invoke-direct {v8, v9, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getSpnFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1962
    .local v14, "simSpn":Ljava/lang/String;
    invoke-direct {v8, v9, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getImsiFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1963
    .local v15, "simImsi":Ljava/lang/String;
    invoke-direct {v8, v12, v13, v14, v15}, Lcom/lge/ims/app/SIMOperatorDetector;->getBestMatchedOperator(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 1964
    .local v3, "iPosition":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_c7

    invoke-interface {v12, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v4

    if-eqz v4, :cond_c7

    .line 1965
    const-string v4, "operator"

    invoke-direct {v8, v12, v4, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1966
    const-string v4, "country"

    invoke-direct {v8, v12, v4, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1967
    const-string v4, "gid"

    invoke-direct {v8, v12, v4, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1968
    const-string v4, "spn"

    invoke-direct {v8, v12, v4, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1969
    const-string v4, "imsi"

    invoke-direct {v8, v12, v4, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getValueInCursor(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1970
    const/4 v10, 0x1

    move-object/from16 v16, v2

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v19, v7

    move/from16 v20, v10

    move-object v10, v1

    goto :goto_dc

    .line 1973
    :cond_c7
    const/4 v0, 0x0

    const/4 v4, 0x3

    invoke-virtual {v11, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1974
    invoke-virtual {v11, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v16, v2

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v19, v7

    move/from16 v20, v10

    move-object v10, v1

    .line 1976
    .end local v1  # "op":Ljava/lang/String;
    .end local v2  # "co":Ljava/lang/String;
    .end local v5  # "gid":Ljava/lang/String;
    .end local v6  # "spn":Ljava/lang/String;
    .end local v7  # "imsi":Ljava/lang/String;
    .local v10, "op":Ljava/lang/String;
    .local v16, "co":Ljava/lang/String;
    .local v17, "gid":Ljava/lang/String;
    .local v18, "spn":Ljava/lang/String;
    .local v19, "imsi":Ljava/lang/String;
    .local v20, "result":Z
    :goto_dc
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 1978
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v10

    move/from16 v21, v3

    .end local v3  # "iPosition":I
    .local v21, "iPosition":I
    move-object/from16 v3, v16

    move-object v4, v11

    move-object/from16 v5, v17

    move-object/from16 v6, v18

    move-object/from16 v7, v19

    invoke-direct/range {v0 .. v7}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1980
    return v20
.end method

.method private updateSysSimOperator(I)V
    .registers 12
    .param p1, "slotId"  # I

    .line 1994
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimProperties(I)Lcom/lge/ims/common/util/SODConfig$SimProperties;

    move-result-object v0

    .line 1996
    .local v0, "simProp":Lcom/lge/ims/common/util/SODConfig$SimProperties;
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperator()Ljava/lang/String;

    move-result-object v1

    .line 1997
    .local v1, "oldOperator":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperatorSub()Ljava/lang/String;

    move-result-object v2

    .line 1999
    .local v2, "oldOperatorSub":Ljava/lang/String;
    invoke-static {p1}, Lcom/lge/ims/common/util/ImsProperties;->getSysSimOperator(I)Ljava/lang/String;

    move-result-object v3

    .line 2000
    .local v3, "sysSimOp":Ljava/lang/String;
    invoke-static {p1}, Lcom/lge/ims/common/util/ImsProperties;->getSysSimOperatorSub(I)Ljava/lang/String;

    move-result-object v4

    .line 2002
    .local v4, "sysSimOpSub":Ljava/lang/String;
    invoke-static {}, Lcom/lge/ims/common/util/ImsProperties;->isLaopSimOperatorUsed()Z

    move-result v5

    if-eqz v5, :cond_79

    .line 2003
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMLocked(I)Z

    move-result v5

    if-eqz v5, :cond_79

    invoke-static {}, Lcom/lge/ims/app/SIMOperatorDetector;->isCarrierCodeRequiredOnSimLocked()Z

    move-result v5

    if-eqz v5, :cond_79

    .line 2004
    const/4 v5, 0x1

    invoke-static {p1, v5}, Lcom/lge/ims/carrier/CarrierCodeLoader;->getCarrierIdFromSim(IZ)Lcom/lge/ims/carrier/SimCarrierId;

    move-result-object v5

    .line 2005
    .local v5, "id":Lcom/lge/ims/carrier/SimCarrierId;
    invoke-static {}, Lcom/lge/ims/carrier/CarrierCodeLoader;->getInstance()Lcom/lge/ims/carrier/CarrierCodeLoader;

    move-result-object v6

    .line 2006
    .local v6, "ccl":Lcom/lge/ims/carrier/CarrierCodeLoader;
    invoke-virtual {v6, v5, p1}, Lcom/lge/ims/carrier/CarrierCodeLoader;->fetchCarrierCode(Lcom/lge/ims/carrier/SimCarrierId;I)Lcom/lge/ims/carrier/CarrierCode;

    move-result-object v7

    .line 2008
    .local v7, "cc":Lcom/lge/ims/carrier/CarrierCode;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateSysSimOperator(op/sub): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 2009
    if-eqz v7, :cond_59

    invoke-virtual {v7}, Lcom/lge/ims/carrier/CarrierCode;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_5b

    :cond_59
    const-string v9, "(null)"

    :goto_5b
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 2008
    const-string v9, "LGIMS_SIMOperatorDetector"

    invoke-static {v9, v8}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2011
    if-eqz v7, :cond_79

    .line 2012
    invoke-virtual {v7}, Lcom/lge/ims/carrier/CarrierCode;->getOperatorFast()Ljava/lang/String;

    move-result-object v3

    .line 2013
    invoke-virtual {v7}, Lcom/lge/ims/carrier/CarrierCode;->getOperatorSub()Ljava/lang/String;

    move-result-object v4

    .line 2015
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_79

    .line 2016
    move-object v4, v3

    .line 2022
    .end local v5  # "id":Lcom/lge/ims/carrier/SimCarrierId;
    .end local v6  # "ccl":Lcom/lge/ims/carrier/CarrierCodeLoader;
    .end local v7  # "cc":Lcom/lge/ims/carrier/CarrierCode;
    :cond_79
    invoke-virtual {v0, v3}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->setOperator(Ljava/lang/String;)V

    .line 2023
    invoke-virtual {v0, v4}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->setOperatorSub(Ljava/lang/String;)V

    .line 2025
    invoke-static {}, Lcom/lge/ims/common/util/ImsProperties;->isLaopSimOperatorUsed()Z

    move-result v5

    if-eqz v5, :cond_a9

    .line 2027
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperator()Ljava/lang/String;

    move-result-object v5

    .line 2026
    invoke-static {v1, v5}, Lcom/lge/ims/common/util/SODConfig;->equalsOperator(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_99

    .line 2029
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperatorSub()Ljava/lang/String;

    move-result-object v5

    .line 2028
    invoke-static {v2, v5}, Lcom/lge/ims/common/util/SODConfig;->equalsOperator(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a9

    .line 2030
    :cond_99
    nop

    .line 2031
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperator()Ljava/lang/String;

    move-result-object v5

    .line 2032
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$SimProperties;->getOperatorSub()Ljava/lang/String;

    move-result-object v6

    .line 2033
    invoke-static {p1}, Lcom/lge/ims/common/util/ImsProperties;->getSysSimCountry(I)Ljava/lang/String;

    move-result-object v7

    .line 2030
    invoke-static {v5, v6, v7, p1}, Lcom/lge/ims/carrier/CarrierCodeLoader;->setSimOperatorCountry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 2036
    :cond_a9
    return-void
.end method


# virtual methods
.method public declared-synchronized decideOperator(I)V
    .registers 5
    .param p1, "slotId"  # I

    monitor-enter p0

    .line 155
    :try_start_1
    const-string v0, "LGIMS_SIMOperatorDetector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "decideOperator("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_55

    if-nez v0, :cond_27

    .line 158
    monitor-exit p0

    return-void

    .line 161
    :cond_27
    :try_start_27
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateSysSimOperator(I)V

    .line 163
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->operatorDecision(I)V

    .line 165
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMaxSlot()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_4a

    .line 166
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isMultiImsEnabled()Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 167
    invoke-virtual {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setActive(IZ)V

    goto :goto_4d

    .line 170
    .end local p0  # "this":Lcom/lge/ims/app/SIMOperatorDetector;
    :cond_3e
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getDefaultDataSlotId()I

    move-result v0

    .line 171
    .local v0, "ddsSlotId":I
    if-ne p1, v0, :cond_45

    goto :goto_46

    :cond_45
    const/4 v1, 0x0

    :goto_46
    invoke-virtual {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setActive(IZ)V

    .line 172
    .end local v0  # "ddsSlotId":I
    goto :goto_4d

    .line 175
    :cond_4a
    invoke-virtual {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setActive(IZ)V

    .line 178
    :goto_4d
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->checkProhibiting(I)V

    .line 180
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->updateServices(I)Z
    :try_end_53
    .catchall {:try_start_27 .. :try_end_53} :catchall_55

    .line 181
    monitor-exit p0

    return-void

    .line 154
    .end local p1  # "slotId":I
    :catchall_55
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public deliverOperatorInfo(I)V
    .registers 11
    .param p1, "slotId"  # I

    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "deliverOperatorInfo("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_25

    .line 187
    return-void

    .line 190
    :cond_25
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 191
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v1

    .line 193
    .local v1, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-static {}, Lcom/lge/ims/CommonStarter;->getInstance()Lcom/lge/ims/CommonStarter;

    move-result-object v8

    .line 194
    .local v8, "cs":Lcom/lge/ims/CommonStarter;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v4

    invoke-virtual {v1}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v5

    iget-object v6, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    .line 195
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimProperties(I)Lcom/lge/ims/common/util/SODConfig$SimProperties;

    move-result-object v7

    .line 194
    move-object v2, v8

    move v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/lge/ims/CommonStarter;->deliverOperatorInfo(ILcom/lge/ims/common/util/SODConfig$Operator;Lcom/lge/ims/common/util/SODConfig$Sim;Lcom/lge/ims/common/util/SODConfig$Device;Lcom/lge/ims/common/util/SODConfig$SimProperties;)V

    .line 196
    return-void
.end method

.method public deliverSimInfo(I)V
    .registers 5
    .param p1, "slotId"  # I

    .line 213
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 214
    return-void

    .line 217
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 219
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-static {}, Lcom/lge/ims/CommonStarter;->getInstance()Lcom/lge/ims/CommonStarter;

    move-result-object v1

    .line 220
    .local v1, "cs":Lcom/lge/ims/CommonStarter;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/lge/ims/CommonStarter;->deliverSimInfo(ILcom/lge/ims/common/util/SODConfig$Sim;)V

    .line 221
    return-void
.end method

.method public deliverUpdateServiceInfo(I)V
    .registers 8
    .param p1, "slotId"  # I

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "deliverUpdateServiceInfo("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_25

    .line 202
    return-void

    .line 205
    :cond_25
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 206
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v1

    .line 208
    .local v1, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-static {}, Lcom/lge/ims/CommonStarter;->getInstance()Lcom/lge/ims/CommonStarter;

    move-result-object v2

    .line 209
    .local v2, "cs":Lcom/lge/ims/CommonStarter;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v3

    invoke-virtual {v1}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v4

    iget-object v5, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    invoke-virtual {v2, p1, v3, v4, v5}, Lcom/lge/ims/CommonStarter;->deliverUpdateServiceInfo(ILcom/lge/ims/common/util/SODConfig$Operator;Lcom/lge/ims/common/util/SODConfig$Sim;Lcom/lge/ims/common/util/SODConfig$Device;)V

    .line 210
    return-void
.end method

.method public getCountry(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 306
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_9

    .line 307
    const-string v0, ""

    return-object v0

    .line 310
    :cond_9
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 311
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->getCountry()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getCountryInSim(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 1064
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_9

    .line 1065
    const-string v0, ""

    return-object v0

    .line 1068
    :cond_9
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1069
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDefaultDataSlotId()I
    .registers 6

    .line 232
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubscriptionId()I

    move-result v0

    .line 233
    .local v0, "subId":I
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMaxSlot()I

    move-result v1

    const-string v2, "LGIMS_SIMOperatorDetector"

    const/4 v3, 0x1

    if-le v1, v3, :cond_37

    .line 234
    const/4 v1, -0x1

    if-eq v0, v1, :cond_37

    .line 235
    invoke-static {v0}, Landroid/telephony/SubscriptionManager;->getSlotIndex(I)I

    move-result v3

    .line 236
    .local v3, "slotId":I
    if-eq v3, v1, :cond_37

    .line 237
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DefaultDataSlotId - slotId="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ", subId="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    return v3

    .line 243
    .end local v3  # "slotId":I
    :cond_37
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DefaultDataSlotId - defaultSlot, subId="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    const/4 v1, 0x0

    return v1
.end method

.method public getDefaultSlot()I
    .registers 2

    .line 224
    const/4 v0, 0x0

    return v0
.end method

.method public getEnablerType(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 324
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_9

    .line 325
    const-string v0, ""

    return-object v0

    .line 328
    :cond_9
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 329
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->getEnablerType()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getMaxSlot()I
    .registers 2

    .line 228
    iget v0, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mMaxSlot:I

    return v0
.end method

.method public getMccMnc(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 315
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_9

    .line 316
    const-string v0, ""

    return-object v0

    .line 319
    :cond_9
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 320
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->getMccMnc()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getMccMncFromSim(ILjava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "slotId"  # I
    .param p2, "defaultValue"  # Ljava/lang/String;

    .line 2241
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 2242
    return-object p2

    .line 2245
    :cond_7
    const/4 v0, 0x0

    .line 2247
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 2248
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v1

    .line 2249
    .local v1, "subId":I
    invoke-static {v1}, Lcom/lge/ims/common/util/MSimUtils;->isValidSubId(I)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 2250
    invoke-static {v1}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager(I)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2252
    .end local v1  # "subId":I
    :cond_1c
    goto :goto_21

    .line 2253
    :cond_1d
    invoke-static {}, Lcom/lge/ims/common/util/AppContext;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 2256
    :goto_21
    if-eqz v0, :cond_28

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v1

    goto :goto_29

    :cond_28
    move-object v1, p2

    .line 2258
    .local v1, "mccmnc":Ljava/lang/String;
    :goto_29
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MccMnc/SlotId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LGIMS_SIMOperatorDetector"

    invoke-static {v3, v2}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2260
    return-object v1
.end method

.method public getMccMncInSim(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 1073
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_9

    .line 1074
    const-string v0, ""

    return-object v0

    .line 1077
    :cond_9
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1078
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Sim;->getMccMnc()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getOperator(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 297
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_9

    .line 298
    const-string v0, ""

    return-object v0

    .line 301
    :cond_9
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 302
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->getOperator()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getOperatorInSim(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 1055
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_9

    .line 1056
    const-string v0, ""

    return-object v0

    .line 1059
    :cond_9
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1060
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getOtherSlotIds(I)Ljava/util/List;
    .registers 7
    .param p1, "slotId"  # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 249
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getOtherSlotIds("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMaxSlot()I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ge v0, v3, :cond_2c

    .line 252
    const-string v0, "This device is only for Single SIM"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    return-object v2

    .line 256
    :cond_2c
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 257
    .local v0, "slotIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_32
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMaxSlot()I

    move-result v4

    if-ge v3, v4, :cond_44

    .line 258
    if-eq p1, v3, :cond_41

    .line 259
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    :cond_41
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    .line 263
    .end local v3  # "i":I
    :cond_44
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Another SlotId List - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 265
    return-object v2

    .line 268
    :cond_61
    return-object v0
.end method

.method public getSimState(I)I
    .registers 4
    .param p1, "slotId"  # I

    .line 1082
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1083
    const/4 v0, 0x0

    return v0

    .line 1086
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1087
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Sim;->getState()I

    move-result v1

    return v1
.end method

.method public getSubId(I)I
    .registers 4
    .param p1, "slotId"  # I

    .line 288
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 289
    const/4 v0, -0x1

    return v0

    .line 292
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 293
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->getSubId()I

    move-result v1

    return v1
.end method

.method public getSupportServices(I)I
    .registers 4
    .param p1, "slotId"  # I

    .line 333
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 334
    const/4 v0, 0x0

    return v0

    .line 337
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 338
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->getServices()I

    move-result v1

    return v1
.end method

.method public getSupportedRCSVersion(I)Ljava/lang/String;
    .registers 4
    .param p1, "slotId"  # I

    .line 342
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getSupportedRCSVersion("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isRCSSupported(I)Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    iget-object v0, v0, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->mRCSVersion:Ljava/lang/String;

    goto :goto_2c

    :cond_2b
    const/4 v0, 0x0

    :goto_2c
    return-object v0
.end method

.method public getTheLatestOperatorInfo(I)Z
    .registers 16
    .param p1, "slotId"  # I

    .line 1108
    const-string v0, "sim_operator"

    invoke-static {p1, v0}, Lcom/lge/ims/common/util/SODConfig;->getValueForCachedOperatorInfo(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1110
    .local v0, "sim_op":Ljava/lang/String;
    const-string v1, "sim_country"

    invoke-static {p1, v1}, Lcom/lge/ims/common/util/SODConfig;->getValueForCachedOperatorInfo(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1112
    .local v9, "sim_co":Ljava/lang/String;
    const-string v1, "mccmnc"

    invoke-static {p1, v1}, Lcom/lge/ims/common/util/SODConfig;->getValueForCachedOperatorInfo(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1114
    .local v10, "sim_mccmnc":Ljava/lang/String;
    const-string v1, "gid"

    invoke-static {p1, v1}, Lcom/lge/ims/common/util/SODConfig;->getValueForCachedOperatorInfo(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1116
    .local v11, "sim_gid":Ljava/lang/String;
    const-string v1, "spn"

    invoke-static {p1, v1}, Lcom/lge/ims/common/util/SODConfig;->getValueForCachedOperatorInfo(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1118
    .local v12, "sim_spn":Ljava/lang/String;
    const-string v1, "imsi"

    invoke-static {p1, v1}, Lcom/lge/ims/common/util/SODConfig;->getValueForCachedOperatorInfo(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1121
    .local v13, "sim_imsi":Ljava/lang/String;
    move-object v1, p0

    move v2, p1

    move-object v3, v0

    move-object v4, v9

    move-object v5, v10

    move-object v6, v11

    move-object v7, v12

    move-object v8, v13

    invoke-direct/range {v1 .. v8}, Lcom/lge/ims/app/SIMOperatorDetector;->setSIMInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1123
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 1124
    const-string v1, "LGIMS_SIMOperatorDetector"

    const-string v2, "No cached operator-info"

    invoke-static {v1, v2}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1125
    const/4 v1, 0x0

    return v1

    .line 1128
    :cond_3e
    const/4 v1, 0x1

    return v1
.end method

.method public isActive(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 348
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 349
    const/4 v0, 0x0

    return v0

    .line 352
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 353
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->isActive()Z

    move-result v1

    return v1
.end method

.method public isAvailable(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 357
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 358
    const/4 v0, 0x0

    return v0

    .line 361
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 362
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->isAvailable()Z

    move-result v1

    return v1
.end method

.method public isChanged(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 366
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 367
    const/4 v0, 0x0

    return v0

    .line 370
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 371
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mChanged:Z

    return v1
.end method

.method public isCommonStart(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 393
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 394
    const/4 v0, 0x0

    return v0

    .line 397
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 398
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mCommonStart:Z

    return v1
.end method

.method public isDelivered(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 375
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 376
    const/4 v0, 0x0

    return v0

    .line 379
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 380
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mDelivered:Z

    return v1
.end method

.method public isEnablerTypeForNonOperator(I)Z
    .registers 3
    .param p1, "slotId"  # I

    .line 519
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getEnablerType(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/ims/common/util/SODConfig;->isEnablerTypeForNonOperator(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isEquipInSim(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 1213
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1214
    const/4 v0, 0x0

    return v0

    .line 1217
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1218
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->mEquiped:Z

    return v1
.end method

.method public isFinalSimState(I)Z
    .registers 3
    .param p1, "slotId"  # I

    .line 1208
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMAbsent(I)Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMRemoved(I)Z

    move-result v0

    if-nez v0, :cond_1b

    .line 1209
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMLoaded(I)Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMLocked(I)Z

    move-result v0

    if-eqz v0, :cond_19

    goto :goto_1b

    :cond_19
    const/4 v0, 0x0

    goto :goto_1c

    :cond_1b
    :goto_1b
    const/4 v0, 0x1

    .line 1208
    :goto_1c
    return v0
.end method

.method public isInboudRoaming(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 411
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 412
    const/4 v0, 0x0

    return v0

    .line 415
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 416
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->isInboundRoaming()Z

    move-result v1

    return v1
.end method

.method public isInitialStart(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 384
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 385
    const/4 v0, 0x0

    return v0

    .line 388
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 389
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mInitialStart:Z

    return v1
.end method

.method public isKrOpen()Z
    .registers 2

    .line 506
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isOperatorBasedOn(I)Z

    move-result v0

    return v0
.end method

.method public isMultiImsEnabled()Z
    .registers 2

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->multiIms()Z

    move-result v0

    return v0
.end method

.method public isNaOpen()Z
    .registers 2

    .line 494
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMBasedOn()Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isOperatorBasedOn(I)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    return v0
.end method

.method public isProhibited(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 420
    const/4 v0, 0x0

    return v0
.end method

.method public isRCSAvailable(I)Z
    .registers 14
    .param p1, "slotId"  # I

    .line 447
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isRCSAvailable("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LGIMS_SIMOperatorDetector"

    invoke-static {v1, v0}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_26

    .line 450
    const/4 v0, 0x0

    return v0

    .line 453
    :cond_26
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 454
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/common/util/SODConfig$Operator;->getOperator()Ljava/lang/String;

    move-result-object v1

    .line 457
    .local v1, "strOperator":Ljava/lang/String;
    const-string v2, "TMO"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lge/ims/common/util/SODConfig$Operator;->getCountry()Ljava/lang/String;

    move-result-object v2

    const-string v3, "US"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5a

    .line 458
    :cond_4a
    const-string v2, "MPCS"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5a

    const-string v2, "DISH"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 459
    :cond_5a
    const-string v1, "TMUS"

    .line 462
    :cond_5c
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v9

    .line 463
    .local v9, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v9}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v10

    .line 464
    .local v10, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    new-instance v11, Lcom/lge/ims/app/RCSAvailableChecker;

    iget-object v3, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mContext:Landroid/content/Context;

    .line 465
    invoke-virtual {v10}, Lcom/lge/ims/common/util/SODConfig$Sim;->getMccMnc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10}, Lcom/lge/ims/common/util/SODConfig$Sim;->getGid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10}, Lcom/lge/ims/common/util/SODConfig$Sim;->getSpn()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10}, Lcom/lge/ims/common/util/SODConfig$Sim;->getImsi()Ljava/lang/String;

    move-result-object v7

    move-object v2, v11

    move-object v8, v1

    invoke-direct/range {v2 .. v8}, Lcom/lge/ims/app/RCSAvailableChecker;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    .local v2, "objRCSAvailableChecker":Lcom/lge/ims/app/RCSAvailableChecker;
    invoke-virtual {v2}, Lcom/lge/ims/app/RCSAvailableChecker;->isAvailable()Z

    move-result v3

    .line 468
    .local v3, "bRCSAvailable":Z
    const/4 v4, 0x1

    if-ne v3, v4, :cond_8f

    .line 469
    const/high16 v4, 0x10000

    invoke-direct {p0, p1, v4}, Lcom/lge/ims/app/SIMOperatorDetector;->enableSupportService(II)V

    .line 470
    invoke-virtual {v2}, Lcom/lge/ims/app/RCSAvailableChecker;->getRCSVersion()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v9, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->mRCSVersion:Ljava/lang/String;

    .line 473
    :cond_8f
    return v3
.end method

.method public isRCSStart(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 402
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 403
    const/4 v0, 0x0

    return v0

    .line 406
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 407
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mRcsStart:Z

    return v1
.end method

.method public isRCSSupported(I)Z
    .registers 3
    .param p1, "slotId"  # I

    .line 477
    const/high16 v0, 0x10000

    invoke-direct {p0, p1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceSupported(II)Z

    move-result v0

    return v0
.end method

.method public isSIMAbsent(I)Z
    .registers 5
    .param p1, "slotId"  # I

    .line 1156
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1157
    const/4 v0, 0x0

    return v0

    .line 1160
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1161
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->isStateOn(I)Z

    move-result v1

    return v1
.end method

.method public isSIMBasedOn()Z
    .registers 2

    .line 486
    const/high16 v0, 0x20000

    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isOperatorBasedOn(I)Z

    move-result v0

    return v0
.end method

.method public isSIMLoaded(I)Z
    .registers 5
    .param p1, "slotId"  # I

    .line 1169
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1170
    const/4 v0, 0x0

    return v0

    .line 1173
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1174
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->isStateOn(I)Z

    move-result v1

    return v1
.end method

.method public isSIMLocked(I)Z
    .registers 5
    .param p1, "slotId"  # I

    .line 1182
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1183
    const/4 v0, 0x0

    return v0

    .line 1186
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1187
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->isStateOn(I)Z

    move-result v1

    return v1
.end method

.method public isSIMRemoved(I)Z
    .registers 5
    .param p1, "slotId"  # I

    .line 1195
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 1196
    const/4 v0, 0x0

    return v0

    .line 1199
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1200
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Lcom/lge/ims/common/util/SODConfig$Sim;->isStateOn(I)Z

    move-result v1

    return v1
.end method

.method public isSlotIdValid(I)Z
    .registers 6
    .param p1, "slotId"  # I

    .line 276
    const/4 v0, 0x1

    if-ltz p1, :cond_b

    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMaxSlot()I

    move-result v1

    if-lt p1, v1, :cond_a

    goto :goto_b

    .line 283
    :cond_a
    return v0

    .line 277
    :cond_b
    :goto_b
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 278
    .local v1, "stes":[Ljava/lang/StackTraceElement;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isSlotIdValid :: slotId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", caller="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, v1, v0

    .line 279
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v0, v1, v0

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 278
    const-string v2, "LGIMS_SIMOperatorDetector"

    invoke-static {v2, v0}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const/4 v0, 0x0

    return v0
.end method

.method public isSmsOnly()Z
    .registers 2

    .line 498
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isOperatorBasedOn(I)Z

    move-result v0

    return v0
.end method

.method public isSmsOnlyForNaOpen()Z
    .registers 2

    .line 502
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isNaOpen()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isSmsOnly()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public isSupportSIMMoved()Z
    .registers 2

    .line 510
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isOperatorBasedOn(I)Z

    move-result v0

    return v0
.end method

.method public isTargetBasedOn()Z
    .registers 2

    .line 490
    const/high16 v0, 0x10000

    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isOperatorBasedOn(I)Z

    move-result v0

    return v0
.end method

.method public isTargetOpenOnLaop()Z
    .registers 2

    .line 514
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isTargetBasedOn()Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isOperatorBasedOn(I)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    return v0
.end method

.method public isTestSimForNaOpen(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 1151
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMccMncFromSim(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1152
    .local v0, "mccmnc":Ljava/lang/String;
    invoke-static {v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isCommonTestSim(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_17

    const-string v1, "00202"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    goto :goto_17

    :cond_15
    const/4 v1, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 v1, 0x1

    :goto_18
    return v1
.end method

.method public isUpdated(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 429
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 430
    const/4 v0, 0x0

    return v0

    .line 433
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 434
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mUpdated:Z

    return v1
.end method

.method public isVTSupported(I)Z
    .registers 3
    .param p1, "slotId"  # I

    .line 548
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceSupported(II)Z

    move-result v0

    return v0
.end method

.method public isVoLTEAvailable(I)Z
    .registers 7
    .param p1, "slotId"  # I

    .line 523
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    .line 524
    return v1

    .line 527
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 528
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v2

    .line 530
    .local v2, "opInfo":Lcom/lge/ims/common/util/SODConfig$Operator;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/lge/ims/common/util/SODConfig$Operator;->isServiceOn(I)Z

    move-result v4

    if-nez v4, :cond_25

    const/4 v4, 0x4

    .line 531
    invoke-virtual {v2, v4}, Lcom/lge/ims/common/util/SODConfig$Operator;->isServiceOn(I)Z

    move-result v4

    if-nez v4, :cond_25

    const/4 v4, 0x2

    .line 532
    invoke-virtual {v2, v4}, Lcom/lge/ims/common/util/SODConfig$Operator;->isServiceOn(I)Z

    move-result v4

    if-eqz v4, :cond_26

    :cond_25
    move v1, v3

    .line 530
    :cond_26
    return v1
.end method

.method public isVoLTEStart(I)Z
    .registers 4
    .param p1, "slotId"  # I

    .line 438
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_8

    .line 439
    const/4 v0, 0x0

    return v0

    .line 442
    :cond_8
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 443
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mVoLteStart:Z

    return v1
.end method

.method public isVoLTESupported(I)Z
    .registers 3
    .param p1, "slotId"  # I

    .line 536
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceSupported(II)Z

    move-result v0

    return v0
.end method

.method public isVoLteEmergencySupported(I)Z
    .registers 3
    .param p1, "slotId"  # I

    .line 540
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceSupported(II)Z

    move-result v0

    return v0
.end method

.method public isVoWiFiSupported(I)Z
    .registers 3
    .param p1, "slotId"  # I

    .line 544
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lcom/lge/ims/app/SIMOperatorDetector;->isServiceSupported(II)Z

    move-result v0

    return v0
.end method

.method public setActive(IZ)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "active"  # Z

    .line 552
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 553
    return-void

    .line 556
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 557
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/lge/ims/common/util/SODConfig$Operator;->setActive(Z)V

    .line 558
    return-void
.end method

.method public setChanged(IZ)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "changed"  # Z

    .line 579
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 580
    return-void

    .line 583
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 584
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mChanged:Z

    .line 585
    return-void
.end method

.method public setCommonStart(IZ)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "started"  # Z

    .line 570
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 571
    return-void

    .line 574
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 575
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mCommonStart:Z

    .line 576
    return-void
.end method

.method public setDelivered(IZ)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "delivered"  # Z

    .line 588
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 589
    return-void

    .line 592
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 593
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mDelivered:Z

    .line 594
    return-void
.end method

.method public setEquipInSim(IZ)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "equip"  # Z

    .line 1222
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 1223
    return-void

    .line 1226
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    .line 1227
    .local v0, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->mEquiped:Z

    .line 1228
    return-void
.end method

.method public setInitialStart(IZ)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "started"  # Z

    .line 561
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 562
    return-void

    .line 565
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 566
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mInitialStart:Z

    .line 567
    return-void
.end method

.method public setRCSStart(IZ)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "started"  # Z

    .line 620
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 621
    return-void

    .line 624
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 625
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mRcsStart:Z

    .line 626
    return-void
.end method

.method public setSimState(II)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "state"  # I

    .line 1244
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 1245
    return-void

    .line 1248
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v0

    .line 1250
    .local v0, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/common/util/SODConfig$Sim;->clearState()V

    .line 1251
    invoke-virtual {v0, p2}, Lcom/lge/ims/common/util/SODConfig$Sim;->setState(I)V

    .line 1252
    return-void
.end method

.method public setSimState(ILjava/lang/String;)V
    .registers 5
    .param p1, "slotId"  # I
    .param p2, "iccState"  # Ljava/lang/String;

    .line 1231
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 1232
    return-void

    .line 1235
    :cond_7
    invoke-static {p2}, Lcom/lge/ims/app/SIMOperatorDetector;->getSimState(Ljava/lang/String;)I

    move-result v0

    .line 1237
    .local v0, "simState":I
    if-eqz v0, :cond_18

    .line 1238
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v1

    .line 1239
    .local v1, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v1, v0}, Lcom/lge/ims/common/util/SODConfig$Sim;->setState(I)V

    .line 1241
    .end local v1  # "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    :cond_18
    return-void
.end method

.method public setUpdated(IZ)V
    .registers 6
    .param p1, "slotId"  # I
    .param p2, "updated"  # Z

    .line 629
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 630
    return-void

    .line 633
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 635
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iget-boolean v1, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mUpdated:Z

    if-eq v1, p2, :cond_18

    .line 636
    if-eqz p2, :cond_18

    .line 637
    const-string v1, "LGIMS_SIMOperatorDetector"

    const-string v2, "ImsPolicy :: Service updated"

    invoke-static {v1, v2}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    :cond_18
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mUpdated:Z

    .line 642
    return-void
.end method

.method public setVoLTEStart(IZ)V
    .registers 4
    .param p1, "slotId"  # I
    .param p2, "started"  # Z

    .line 645
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 646
    return-void

    .line 649
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 650
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    iput-boolean p2, v0, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->mVoLteStart:Z

    .line 651
    return-void
.end method

.method public showAllInfo(I)V
    .registers 11
    .param p1, "slotId"  # I

    .line 1256
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 1257
    return-void

    .line 1260
    :cond_7
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSlot(I)Lcom/lge/ims/app/SIMOperatorDetector$Slot;

    move-result-object v0

    .line 1261
    .local v0, "slot":Lcom/lge/ims/app/SIMOperatorDetector$Slot;
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v1

    .line 1263
    .local v1, "sim":Lcom/lge/ims/app/SIMOperatorDetector$Sim;
    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->getOperatorInfo()Lcom/lge/ims/common/util/SODConfig$Operator;

    move-result-object v2

    .line 1264
    .local v2, "opInfo":Lcom/lge/ims/common/util/SODConfig$Operator;
    invoke-virtual {v1}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v3

    .line 1266
    .local v3, "simInfo":Lcom/lge/ims/common/util/SODConfig$Sim;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ImsPolicy: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/lge/ims/app/SIMOperatorDetector$Slot;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lcom/lge/ims/common/util/SODConfig$Operator;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "LGIMS_SIMOperatorDetector"

    invoke-static {v5, v4}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1267
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ImsPolicy: [ SIM: equiped="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v6, v1, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->mEquiped:Z

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", rcsVersion="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v1, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->mRCSVersion:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " ], "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1268
    invoke-virtual {v3}, Lcom/lge/ims/common/util/SODConfig$Sim;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1267
    invoke-static {v5, v4}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1269
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ImsPolicy: [ DEV: operatorBasedOn=0x"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    .line 1270
    invoke-virtual {v6}, Lcom/lge/ims/common/util/SODConfig$Device;->getOperatorBasedOn()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", simMovedSupported="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mDevice:Lcom/lge/ims/common/util/SODConfig$Device;

    .line 1271
    invoke-virtual {v6}, Lcom/lge/ims/common/util/SODConfig$Device;->isSimMovedSupported()Z

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " ]"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1269
    invoke-static {v5, v4}, Lcom/lge/ims/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1273
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ImsPolicy: [ PROP: operator="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v7, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_OPERATOR:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", country="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v7, Lcom/lge/ims/app/SIMOperatorDetector;->TARGET_COUNTRY:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", sysSimOp="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1274
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSysSimOperator(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", sysSimOpSub="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1275
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSysSimOperatorSub(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", model="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v7, Lcom/lge/ims/common/util/ImsProperties;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", build="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v7, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", ntcode="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v7, 0x2af9

    .line 1277
    const-string v8, ""

    invoke-static {v7, v8}, Lcom/lge/ims/common/util/ImsProperties$Vendor;->getSysProp(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", laop="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1279
    invoke-static {}, Lcom/lge/ims/common/util/ImsProperties;->isLaop()Z

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", maxSlot="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1280
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->getMaxSlot()I

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, ", multi-IMS="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isMultiImsEnabled()Z

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1273
    invoke-static {v5, v4}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1281
    return-void
.end method

.method public updateServices(I)Z
    .registers 13
    .param p1, "slotId"  # I

    .line 654
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSlotIdValid(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    .line 655
    return v1

    .line 658
    :cond_8
    const/4 v0, 0x0

    .line 659
    .local v0, "bVoLTE":Z
    const/4 v2, 0x0

    .line 660
    .local v2, "bVT":Z
    const/4 v3, 0x0

    .line 661
    .local v3, "bVoWiFi":Z
    const/4 v4, 0x0

    .line 663
    .local v4, "bVoLteEmergency":Z
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isProhibited(I)Z

    move-result v5

    const/4 v6, 0x1

    const-string v7, "LGIMS_SIMOperatorDetector"

    if-eqz v5, :cond_1e

    .line 664
    const/4 v0, 0x0

    .line 665
    const/4 v2, 0x0

    .line 666
    const/4 v3, 0x0

    .line 668
    const/4 v5, 0x0

    invoke-static {p1, v5}, Lcom/lge/ims/common/util/ImsUtils;->setServiceCapsToLocalStorage(ILcom/lge/ims/common/util/ImsUtils$ServiceCaps;)V

    goto/16 :goto_ea

    .line 671
    :cond_1e
    iget-object v5, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mContext:Landroid/content/Context;

    invoke-static {v5, p1}, Lcom/lge/ims/common/util/ImsUtils;->getServiceCapsByPlatform(Landroid/content/Context;I)Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;

    move-result-object v5

    .line 673
    .local v5, "serviceCaps":Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;
    invoke-virtual {v5}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    sget-boolean v8, Lcom/lge/ims/common/util/ImsConstants;->USE_CARRIER_CONFIG:Z

    if-eqz v8, :cond_64

    .line 676
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isEquipInSim(I)Z

    move-result v8

    if-nez v8, :cond_64

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMRemoved(I)Z

    move-result v8

    if-eqz v8, :cond_64

    .line 678
    invoke-static {p1}, Lcom/lge/ims/common/util/ImsUtils;->getServiceCapsFromLocalStorage(I)Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;

    move-result-object v8

    .line 680
    .local v8, "oldSC":Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;
    if-eqz v8, :cond_43

    move-object v9, v8

    goto :goto_44

    :cond_43
    move-object v9, v5

    :goto_44
    move-object v5, v9

    .line 682
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "LocalStorage: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-eqz v8, :cond_57

    invoke-virtual {v8}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_59

    :cond_57
    const-string v10, "(null)"

    :goto_59
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 685
    .end local v8  # "oldSC":Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;
    :cond_64
    invoke-virtual {v5}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->isVoLteEnabled()Z

    move-result v0

    .line 686
    invoke-virtual {v5}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->isVtEnabled()Z

    move-result v2

    .line 687
    invoke-virtual {v5}, Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;->isWfcEnabled()Z

    move-result v3

    .line 690
    if-eqz v0, :cond_78

    invoke-direct {p0, p1, v5}, Lcom/lge/ims/app/SIMOperatorDetector;->isEmergencyCallAvailableOnSimAbsentForTracfone(ILcom/lge/ims/common/util/ImsUtils$ServiceCaps;)Z

    move-result v8

    if-eqz v8, :cond_a9

    .line 691
    :cond_78
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMAbsent(I)Z

    move-result v8

    if-nez v8, :cond_87

    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isSIMLocked(I)Z

    move-result v8

    if-eqz v8, :cond_85

    goto :goto_87

    :cond_85
    move v8, v1

    goto :goto_88

    :cond_87
    :goto_87
    move v8, v6

    .line 693
    .local v8, "isSimAbsentOrLocked":Z
    :goto_88
    if-eqz v8, :cond_98

    .line 694
    invoke-static {}, Lcom/lge/ims/common/util/ImsUtils;->isEmergencyCallEnabledOnServiceRestricted()Z

    move-result v9

    if-eqz v9, :cond_98

    .line 695
    const-string v9, "SimAbsentOrLocked: VoLTE is enabled for IMS e-call"

    invoke-static {v7, v9}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    const/4 v0, 0x1

    .line 697
    const/4 v4, 0x1

    goto :goto_a9

    .line 698
    :cond_98
    sget-boolean v9, Lcom/lge/ims/common/util/ImsConstants;->USE_CARRIER_CONFIG:Z

    if-eqz v9, :cond_a9

    .line 699
    invoke-static {}, Lcom/lge/ims/common/util/ImsUtils;->isDeviceEncryptionModeEnabledAsFDE()Z

    move-result v9

    if-eqz v9, :cond_a9

    .line 700
    const-string v9, "EncryptionMode: VoLTE is enabled for IMS e-call"

    invoke-static {v7, v9}, Lcom/lge/ims/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 701
    const/4 v0, 0x1

    .line 702
    const/4 v4, 0x1

    .line 707
    .end local v8  # "isSimAbsentOrLocked":Z
    :cond_a9
    :goto_a9
    if-nez v0, :cond_e7

    if-nez v2, :cond_e7

    if-nez v3, :cond_e7

    .line 708
    invoke-static {}, Lcom/lge/ims/common/util/ImsUtils;->isEmergencyCallEnabledOnNonVoLteSim()Z

    move-result v8

    if-eqz v8, :cond_e7

    .line 709
    const-string v8, "NonVoLteSim: VoLTE is enabled for IMS e-call"

    invoke-static {v7, v8}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 710
    const/4 v0, 0x1

    .line 711
    const/4 v4, 0x1

    .line 713
    iget-object v8, p0, Lcom/lge/ims/app/SIMOperatorDetector;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/lge/ims/common/util/ImsUtils;->isSmsOnlyEnabledByPlatform(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_e7

    .line 714
    invoke-virtual {p0}, Lcom/lge/ims/app/SIMOperatorDetector;->isKrOpen()Z

    move-result v8

    if-eqz v8, :cond_e7

    .line 715
    invoke-direct {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->getSim(I)Lcom/lge/ims/app/SIMOperatorDetector$Sim;

    move-result-object v8

    invoke-virtual {v8}, Lcom/lge/ims/app/SIMOperatorDetector$Sim;->getSimInfo()Lcom/lge/ims/common/util/SODConfig$Sim;

    move-result-object v8

    .line 717
    .local v8, "sim":Lcom/lge/ims/common/util/SODConfig$Sim;
    invoke-virtual {v8}, Lcom/lge/ims/common/util/SODConfig$Sim;->getOperator()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8}, Lcom/lge/ims/common/util/SODConfig$Sim;->getCountry()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/lge/ims/app/SIMOperatorDetector;->isSmsOverImsSupported(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_e7

    .line 718
    const-string v9, "SmsOnly: SMSoIMS not supports"

    invoke-static {v7, v9}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 719
    const/4 v0, 0x0

    .line 720
    const/4 v4, 0x0

    .line 727
    .end local v8  # "sim":Lcom/lge/ims/common/util/SODConfig$Sim;
    :cond_e7
    invoke-static {p1, v5}, Lcom/lge/ims/common/util/ImsUtils;->setServiceCapsToLocalStorage(ILcom/lge/ims/common/util/ImsUtils$ServiceCaps;)V

    .line 730
    .end local v5  # "serviceCaps":Lcom/lge/ims/common/util/ImsUtils$ServiceCaps;
    :goto_ea
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isVoLTESupported(I)Z

    move-result v5

    if-ne v0, v5, :cond_108

    .line 731
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isVTSupported(I)Z

    move-result v5

    if-ne v2, v5, :cond_108

    .line 732
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isVoWiFiSupported(I)Z

    move-result v5

    if-ne v3, v5, :cond_108

    .line 733
    invoke-virtual {p0, p1}, Lcom/lge/ims/app/SIMOperatorDetector;->isVoLteEmergencySupported(I)Z

    move-result v5

    if-ne v4, v5, :cond_108

    .line 734
    const-string v5, "ImsPolicy :: updateServices - Service not changed"

    invoke-static {v7, v5}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    return v1

    .line 738
    :cond_108
    invoke-virtual {p0, p1, v6}, Lcom/lge/ims/app/SIMOperatorDetector;->setUpdated(IZ)V

    .line 739
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->setSupportServices(II)V

    .line 741
    if-eqz v0, :cond_114

    .line 742
    invoke-direct {p0, p1, v6}, Lcom/lge/ims/app/SIMOperatorDetector;->enableSupportService(II)V

    goto :goto_117

    .line 745
    :cond_114
    invoke-direct {p0, p1, v6}, Lcom/lge/ims/app/SIMOperatorDetector;->disableSupportService(II)V

    .line 747
    :goto_117
    const/4 v1, 0x4

    if-eqz v2, :cond_11e

    .line 748
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->enableSupportService(II)V

    goto :goto_121

    .line 751
    :cond_11e
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->disableSupportService(II)V

    .line 753
    :goto_121
    const/4 v1, 0x2

    if-eqz v3, :cond_128

    .line 754
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->enableSupportService(II)V

    goto :goto_12b

    .line 757
    :cond_128
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->disableSupportService(II)V

    .line 760
    :goto_12b
    const/16 v1, 0x8

    if-eqz v4, :cond_133

    .line 761
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->enableSupportService(II)V

    goto :goto_136

    .line 763
    :cond_133
    invoke-direct {p0, p1, v1}, Lcom/lge/ims/app/SIMOperatorDetector;->disableSupportService(II)V

    .line 766
    :goto_136
    return v6
.end method
