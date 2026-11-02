.class public Lcom/lge/ims/server/ims/uc/UCStateUtils;
.super Ljava/lang/Object;
.source "UCStateUtils.java"


# static fields
.field public static final ACTION_CALL_STATE:Ljava/lang/String; = "com.lge.ims.action.CALL_STATE"

.field public static final ACTION_REG_STATE:Ljava/lang/String; = "com.lge.ims.action.REG_STATE"

.field public static final EXTRA_STATE:Ljava/lang/String; = "state"

.field public static final EXTRA_SUB_ID:Ljava/lang/String; = "subId"

.field public static final EXTRA_SVC_TYPE:Ljava/lang/String; = "svcType"

.field public static final INIT_ALL:I = 0x3

.field public static final INIT_CALL_STATE:I = 0x2

.field public static final INIT_REG_STATE:I = 0x1

.field public static final SERVICE_UC:Ljava/lang/String; = "UC"

.field public static final SERVICE_VOIP:Ljava/lang/String; = "VOIP"

.field public static final SERVICE_VT:Ljava/lang/String; = "VT"

.field public static final STATE_ACTIVE:I = 0x1

.field public static final STATE_INACTIVE:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method private static getActiveSubId()I
    .locals 2

    .line 372
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/lge/ims/common/agents/AgentFactory;->getAgent(I)Lcom/lge/ims/common/agents/agentif/IAgent;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/agentif/ISubscription;

    .line 373
    .local v0, "isub":Lcom/lge/ims/common/agents/agentif/ISubscription;
    if-nez v0, :cond_0

    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getImsDefaultSubId()I

    move-result v1

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lcom/lge/ims/common/agents/agentif/ISubscription;->getActiveSubId()I

    move-result v1

    :goto_0
    return v1
.end method

.method private static getPhoneId(I)I
    .locals 2
    .param p0, "slotId"    # I

    .line 377
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/lge/ims/common/agents/AgentFactory;->getAgent(I)Lcom/lge/ims/common/agents/agentif/IAgent;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/agentif/ISubscription;

    .line 378
    .local v0, "isub":Lcom/lge/ims/common/agents/agentif/ISubscription;
    if-nez v0, :cond_0

    move v1, p0

    goto :goto_0

    :cond_0
    invoke-interface {v0, p0}, Lcom/lge/ims/common/agents/agentif/ISubscription;->getPhoneId(I)I

    move-result v1

    :goto_0
    return v1
.end method

.method public static getRegisteredServiceType(Landroid/content/Context;I)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phoneId"    # I

    .line 179
    if-nez p0, :cond_0

    .line 180
    const/4 v0, 0x0

    return v0

    .line 183
    :cond_0
    nop

    .line 184
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 183
    invoke-static {v0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->getServiceStatusForPhoneId(Landroid/content/ContentResolver;I)I

    move-result v0

    return v0
.end method

.method private static getSubId(I)I
    .locals 2
    .param p0, "slotId"    # I

    .line 382
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/lge/ims/common/agents/AgentFactory;->getAgent(I)Lcom/lge/ims/common/agents/agentif/IAgent;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/agentif/ISubscription;

    .line 383
    .local v0, "isub":Lcom/lge/ims/common/agents/agentif/ISubscription;
    if-nez v0, :cond_0

    const/4 v1, -0x1

    goto :goto_0

    :cond_0
    invoke-interface {v0, p0}, Lcom/lge/ims/common/agents/agentif/ISubscription;->getSubId(I)I

    move-result v1

    :goto_0
    return v1
.end method

.method public static initializeImsState(Landroid/content/Context;II)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phoneId"    # I
    .param p2, "initFlags"    # I

    .line 141
    if-nez p0, :cond_0

    .line 142
    return-void

    .line 145
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 147
    .local v0, "cr":Landroid/content/ContentResolver;
    if-ltz p1, :cond_1

    .line 148
    invoke-static {v0, p1, p2}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->initializeImsStateInternal(Landroid/content/ContentResolver;II)V

    goto :goto_1

    .line 150
    :cond_1
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 151
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getPhoneCount()I

    move-result v1

    .line 152
    .local v1, "phoneCount":I
    const/4 v2, 0x0

    .local v2, "pid":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 153
    invoke-static {v0, v2, p2}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->initializeImsStateInternal(Landroid/content/ContentResolver;II)V

    .line 152
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 155
    .end local v1    # "phoneCount":I
    .end local v2    # "pid":I
    :cond_2
    goto :goto_1

    .line 156
    :cond_3
    const/4 v1, 0x0

    invoke-static {v0, v1, p2}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->initializeImsStateInternal(Landroid/content/ContentResolver;II)V

    .line 161
    :goto_1
    return-void
.end method

.method public static initializeImsStateForSubscriptionChanged(Landroid/content/Context;I)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phoneId"    # I

    .line 165
    if-nez p0, :cond_0

    .line 166
    return-void

    .line 169
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 170
    .local v0, "cr":Landroid/content/ContentResolver;
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v1

    .line 172
    .local v1, "subId":I
    invoke-static {v0, p1, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 173
    invoke-static {v0, p1, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 174
    invoke-static {v0, p1, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$CallState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 175
    invoke-static {v0, p1, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RoamingState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 176
    return-void
.end method

.method private static initializeImsStateInternal(Landroid/content/ContentResolver;II)V
    .locals 1
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "phoneId"    # I
    .param p2, "initFlags"    # I

    .line 387
    and-int/lit8 v0, p2, 0x2

    if-eqz v0, :cond_0

    .line 388
    invoke-static {p0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController;->initCallState(Landroid/content/ContentResolver;I)V

    .line 391
    :cond_0
    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_1

    .line 392
    invoke-static {p0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController;->initRegState(Landroid/content/ContentResolver;I)V

    .line 394
    :cond_1
    return-void
.end method

.method public static initializeState(Landroid/content/Context;I)V
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I

    .line 75
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 77
    .local v0, "cr":Landroid/content/ContentResolver;
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiImsEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiImsEnabledOnDssv()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    invoke-static {}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->getActiveSubId()I

    move-result v1

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {p1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->getSubId(I)I

    move-result v1

    .line 79
    .local v1, "subId":I
    :goto_1
    invoke-static {p1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->getPhoneId(I)I

    move-result v2

    .line 81
    .local v2, "phoneId":I
    invoke-static {v0, v2, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->init(Landroid/content/ContentResolver;II)V

    .line 82
    invoke-static {v0, v2, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->init(Landroid/content/ContentResolver;II)V

    .line 83
    invoke-static {v0, v2, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$CallState;->init(Landroid/content/ContentResolver;II)V

    .line 84
    invoke-static {v0, v2, v1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RoamingState;->init(Landroid/content/ContentResolver;II)V

    .line 86
    const/4 v3, 0x0

    const-string v4, "UC"

    invoke-static {p0, p1, v3, v4}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->notifyRegState(Landroid/content/Context;IILjava/lang/String;)V

    .line 87
    const-string v4, "VT"

    invoke-static {p0, p1, v3, v4}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->notifyCallState(Landroid/content/Context;IILjava/lang/String;)V

    .line 88
    const-string v4, "VOIP"

    invoke-static {p0, p1, v3, v4}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->notifyCallState(Landroid/content/Context;IILjava/lang/String;)V

    .line 90
    invoke-static {p0, p1}, Lcom/lge/ims/volte/util/ImsGlobal;->isVoLteEnabled(Landroid/content/Context;I)Z

    move-result v4

    .line 91
    .local v4, "isVoLteEnabled":Z
    invoke-static {p0, p1}, Lcom/lge/ims/volte/util/ImsGlobal;->isWfcEnabled(Landroid/content/Context;I)Z

    move-result v5

    .line 92
    .local v5, "isWfcEnabled":Z
    invoke-static {p0, p1}, Lcom/lge/ims/volte/util/ImsGlobal;->isVtEnabled(Landroid/content/Context;I)Z

    move-result v6

    .line 93
    .local v6, "isVtEnabled":Z
    nop

    .line 94
    invoke-static {p0, p1}, Lcom/lge/ims/volte/util/ImsGlobal;->isVoLteProvisioningRequired(Landroid/content/Context;I)Z

    move-result v7

    .line 95
    .local v7, "isVoLteProvisioningRequired":Z
    invoke-static {p0, p1}, Lcom/lge/ims/volte/util/ImsGlobal;->isVtProvisioningRequired(Landroid/content/Context;I)Z

    move-result v8

    .line 96
    .local v8, "isVtProvisioningRequired":Z
    invoke-static {p0, p1}, Lcom/lge/ims/volte/util/ImsGlobal;->isWfcProvisioningRequired(Landroid/content/Context;I)Z

    move-result v9

    .line 97
    .local v9, "isWfcProvisioningRequired":Z
    const/4 v10, 0x1

    if-nez v7, :cond_3

    if-eqz v8, :cond_2

    goto :goto_2

    :cond_2
    move v11, v3

    goto :goto_3

    :cond_3
    :goto_2
    move v11, v10

    .line 99
    .local v11, "isImsStateSyncRequired":Z
    :goto_3
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "initializeState :: slotId="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", voLteEnabled="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", wfcEnabled="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", vtEnabled="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", voLteProvisioningRequired="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", vtProvisioningRequired="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 107
    if-eqz v7, :cond_4

    goto :goto_4

    .line 109
    :cond_4
    if-eqz v4, :cond_5

    .line 110
    invoke-static {p0, p1, v10}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateVoLteProvisioned(Landroid/content/Context;II)V

    goto :goto_4

    .line 112
    :cond_5
    invoke-static {p0, p1, v3}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateVoLteProvisioned(Landroid/content/Context;II)V

    .line 115
    :goto_4
    if-eqz v8, :cond_6

    goto :goto_5

    .line 117
    :cond_6
    if-eqz v6, :cond_7

    .line 118
    invoke-static {p0, p1, v10}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateVtProvisioned(Landroid/content/Context;II)V

    goto :goto_5

    .line 120
    :cond_7
    const-string v12, "KR"

    invoke-static {p1, v12}, Lcom/lge/ims/volte/util/ImsGlobal;->isCountry(ILjava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_8

    .line 121
    invoke-static {p0, p1, v3}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateVtProvisioned(Landroid/content/Context;II)V

    goto :goto_5

    .line 123
    :cond_8
    invoke-static {p0, p1, v10}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateVtProvisioned(Landroid/content/Context;II)V

    .line 127
    :goto_5
    if-eqz v9, :cond_9

    goto :goto_6

    .line 129
    :cond_9
    if-eqz v5, :cond_a

    .line 130
    invoke-static {p0, p1, v10}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateWfcProvisioned(Landroid/content/Context;II)V

    goto :goto_6

    .line 132
    :cond_a
    invoke-static {p0, p1, v3}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateWfcProvisioned(Landroid/content/Context;II)V

    .line 135
    :goto_6
    if-eqz v11, :cond_b

    .line 136
    const-string v3, "initializeState :: ImsStateSyncRequired"

    invoke-static {v3}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 138
    :cond_b
    return-void
.end method

.method public static initializeStateOnceOnBootup(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 51
    const-string v0, "initializeStateOnceOnBootup"

    invoke-static {v0}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 53
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 55
    .local v0, "cr":Landroid/content/ContentResolver;
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 56
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getPhoneCount()I

    move-result v1

    .line 57
    .local v1, "phoneCount":I
    const/4 v2, 0x0

    .local v2, "phoneId":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 58
    invoke-static {v2}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v3

    .line 59
    .local v3, "subId":I
    invoke-static {v0, v2, v3}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->init(Landroid/content/ContentResolver;II)V

    .line 60
    invoke-static {v0, v2, v3}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->init(Landroid/content/ContentResolver;II)V

    .line 61
    invoke-static {v0, v2, v3}, Lcom/lge/ims/volte/provider/external/ImsStateController$CallState;->init(Landroid/content/ContentResolver;II)V

    .line 62
    invoke-static {v0, v2, v3}, Lcom/lge/ims/volte/provider/external/ImsStateController$RoamingState;->init(Landroid/content/ContentResolver;II)V

    .line 57
    .end local v3    # "subId":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 64
    .end local v1    # "phoneCount":I
    .end local v2    # "phoneId":I
    :cond_0
    goto :goto_1

    .line 65
    :cond_1
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v2

    .line 66
    .local v2, "subId":I
    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->init(Landroid/content/ContentResolver;II)V

    .line 67
    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->init(Landroid/content/ContentResolver;II)V

    .line 68
    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateController$CallState;->init(Landroid/content/ContentResolver;II)V

    .line 69
    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateController$RoamingState;->init(Landroid/content/ContentResolver;II)V

    .line 71
    .end local v2    # "subId":I
    :goto_1
    return-void
.end method

.method public static isVoLteProvisioned(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phoneId"    # I

    .line 188
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 189
    return v0

    .line 192
    :cond_0
    nop

    .line 193
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 192
    invoke-static {v1, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->getVoLteProvisionedForPhoneId(Landroid/content/ContentResolver;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    move v0, v2

    :cond_1
    return v0
.end method

.method public static isVtProvisioned(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phoneId"    # I

    .line 197
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 198
    return v0

    .line 201
    :cond_0
    nop

    .line 202
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 201
    invoke-static {v1, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->getVtProvisionedForPhoneId(Landroid/content/ContentResolver;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    move v0, v2

    :cond_1
    return v0
.end method

.method public static isWfcProvisioned(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phoneId"    # I

    .line 206
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 207
    return v0

    .line 210
    :cond_0
    nop

    .line 211
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 210
    invoke-static {v1, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->getWfcProvisionedForPhoneId(Landroid/content/ContentResolver;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    move v0, v2

    :cond_1
    return v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 442
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[GII-UC] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/ims/common/log/ImsLog;->d(Ljava/lang/String;)V

    .line 443
    return-void
.end method

.method private static logi(Ljava/lang/String;)V
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 446
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[GII-UC] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/ims/common/log/ImsLog;->i(Ljava/lang/String;)V

    .line 447
    return-void
.end method

.method public static notifyCallState(Landroid/content/Context;IILjava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "state"    # I
    .param p3, "svcType"    # Ljava/lang/String;

    .line 215
    if-nez p0, :cond_0

    .line 216
    return-void

    .line 219
    :cond_0
    invoke-static {p1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->getSubId(I)I

    move-result v0

    .line 221
    .local v0, "subId":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "notifyCallState :: slotId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", subId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", svcType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->log(Ljava/lang/String;)V

    .line 224
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.lge.ims.action.CALL_STATE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 226
    .local v1, "intent":Landroid/content/Intent;
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 227
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 228
    const/high16 v2, 0x1000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 229
    const-string v2, "subId"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 230
    const-string v2, "state"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 231
    const-string v2, "svcType"

    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 233
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 234
    return-void
.end method

.method public static notifyRegState(Landroid/content/Context;IILjava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "state"    # I
    .param p3, "svcType"    # Ljava/lang/String;

    .line 237
    if-nez p0, :cond_0

    .line 238
    return-void

    .line 241
    :cond_0
    invoke-static {p1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->getSubId(I)I

    move-result v0

    .line 243
    .local v0, "subId":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "notifyRegState :: slotId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", subId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", svcType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->log(Ljava/lang/String;)V

    .line 246
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.lge.ims.action.REG_STATE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 248
    .local v1, "intent":Landroid/content/Intent;
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 249
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 250
    const/high16 v2, 0x1000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 251
    const-string v2, "subId"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 252
    const-string v2, "state"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 253
    const-string v2, "svcType"

    invoke-virtual {v1, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 255
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 256
    return-void
.end method

.method public static registerContentObserver(Landroid/content/Context;Landroid/database/ContentObserver;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "observer"    # Landroid/database/ContentObserver;

    .line 259
    if-nez p0, :cond_0

    .line 260
    return-void

    .line 263
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->registerObserver(Landroid/content/ContentResolver;Landroid/database/ContentObserver;)V

    .line 264
    return-void
.end method

.method public static unregisterContentObserver(Landroid/content/Context;Landroid/database/ContentObserver;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "observer"    # Landroid/database/ContentObserver;

    .line 267
    if-nez p0, :cond_0

    .line 268
    return-void

    .line 271
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->unregisterObserver(Landroid/content/ContentResolver;Landroid/database/ContentObserver;)V

    .line 272
    return-void
.end method

.method public static updateCallState(Landroid/content/Context;II)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "state"    # I

    .line 293
    if-nez p0, :cond_0

    .line 294
    return-void

    .line 297
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 299
    .local v0, "cr":Landroid/content/ContentResolver;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateCallState :: state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 301
    invoke-static {v0, p2, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->putCallStateForPhoneId(Landroid/content/ContentResolver;II)I

    .line 302
    invoke-static {v0, p2, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$CallState;->putStateForPhoneId(Landroid/content/ContentResolver;II)I

    .line 303
    return-void
.end method

.method public static updateRegNetworkType(Landroid/content/Context;IIZ)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "networkType"    # I
    .param p3, "updateOnRegistered"    # Z

    .line 307
    if-nez p0, :cond_0

    .line 308
    return-void

    .line 311
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 313
    .local v0, "cr":Landroid/content/ContentResolver;
    if-eqz p3, :cond_1

    .line 314
    invoke-static {v0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->getStateForPhoneId(Landroid/content/ContentResolver;I)I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 315
    return-void

    .line 318
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateRegNetworkType :: networkType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", slotId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 320
    invoke-static {v0, p2, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->putNetworkTypeForPhoneId(Landroid/content/ContentResolver;II)I

    .line 321
    return-void
.end method

.method public static updateRegState(Landroid/content/Context;II)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "state"    # I

    .line 324
    if-nez p0, :cond_0

    .line 325
    return-void

    .line 328
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateRegState :: state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", slotId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 330
    nop

    .line 331
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 330
    invoke-static {v0, p2, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->putServiceStatusForPhoneId(Landroid/content/ContentResolver;II)I

    .line 332
    invoke-static {p1, p2}, Lcom/lge/ims/common/util/QcloudVolte;->logReg(II)V

    return-void
.end method

.method public static updateSubId(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 275
    if-nez p0, :cond_0

    .line 276
    return-void

    .line 279
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 281
    .local v0, "cr":Landroid/content/ContentResolver;
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 282
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->getPhoneCount()I

    move-result v1

    .line 284
    .local v1, "phoneCount":I
    const/4 v2, 0x0

    .local v2, "phoneId":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 285
    const/4 v3, -0x1

    invoke-static {v0, v2, v3}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateSubIdIfChanged(Landroid/content/ContentResolver;II)V

    .line 284
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 287
    .end local v1    # "phoneCount":I
    .end local v2    # "phoneId":I
    :cond_1
    goto :goto_1

    .line 288
    :cond_2
    const/4 v1, 0x0

    invoke-static {}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->getActiveSubId()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->updateSubIdIfChanged(Landroid/content/ContentResolver;II)V

    .line 290
    :goto_1
    return-void
.end method

.method private static updateSubIdIfChanged(Landroid/content/ContentResolver;II)V
    .locals 6
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "phoneId"    # I
    .param p2, "subId"    # I

    .line 397
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 398
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result p2

    .line 401
    :cond_0
    invoke-static {p2}, Lcom/lge/ims/common/util/MSimUtils;->isValidSubId(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 402
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 403
    return-void

    .line 410
    :cond_1
    invoke-static {p1}, Lcom/lge/ims/common/util/MSimUtils;->hasIccCard(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 411
    invoke-static {p2}, Lcom/lge/ims/common/util/MSimUtils;->isDummySubId(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 412
    return-void

    .line 415
    :cond_2
    invoke-static {p0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->getSubId(Landroid/content/ContentResolver;I)I

    move-result v0

    .line 416
    .local v0, "subIdForRegState":I
    invoke-static {p0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->getSubId(Landroid/content/ContentResolver;I)I

    move-result v1

    .line 417
    .local v1, "subIdForVoLteState":I
    invoke-static {p0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$CallState;->getSubId(Landroid/content/ContentResolver;I)I

    move-result v2

    .line 418
    .local v2, "subIdForCallState":I
    invoke-static {p0, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$RoamingState;->getSubId(Landroid/content/ContentResolver;I)I

    move-result v3

    .line 420
    .local v3, "subIdForRoamingState":I
    if-eq p2, v0, :cond_3

    .line 421
    invoke-static {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateController$RegState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 424
    :cond_3
    if-eq p2, v1, :cond_4

    .line 425
    invoke-static {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 428
    :cond_4
    if-eq p2, v2, :cond_5

    .line 429
    invoke-static {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateController$CallState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 432
    :cond_5
    if-eq p2, v3, :cond_6

    .line 433
    invoke-static {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateController$RoamingState;->putSubId(Landroid/content/ContentResolver;II)I

    .line 436
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateSubIdIfChanged :: subId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", subIdForReg="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", subIdForVoLte="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", subIdForCall="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", subIdForRoaming="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 439
    return-void
.end method

.method public static updateVoLteProvisioned(Landroid/content/Context;II)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "provisioned"    # I

    .line 335
    if-nez p0, :cond_0

    .line 336
    return-void

    .line 339
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateVoLteProvisioned :: provisioned="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", slotId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 341
    nop

    .line 342
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 341
    invoke-static {v0, p2, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->putVoLteProvisionedForPhoneId(Landroid/content/ContentResolver;II)I

    .line 344
    const-string v0, "VZW"

    invoke-static {p1, v0}, Lcom/lge/ims/volte/util/ImsGlobal;->isOperator(ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 345
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/lge/ims/common/util/SettingsUtils;->putAllowVoLteProvisioning(Landroid/content/ContentResolver;I)V

    .line 347
    :cond_1
    return-void
.end method

.method public static updateVtProvisioned(Landroid/content/Context;II)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "provisioned"    # I

    .line 350
    if-nez p0, :cond_0

    .line 351
    return-void

    .line 354
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateVtProvisioned :: provisioned="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", slotId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 356
    nop

    .line 357
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 356
    invoke-static {v0, p2, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->putVtProvisionedForPhoneId(Landroid/content/ContentResolver;II)I

    .line 358
    return-void
.end method

.method public static updateWfcProvisioned(Landroid/content/Context;II)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "slotId"    # I
    .param p2, "provisioned"    # I

    .line 361
    if-nez p0, :cond_0

    .line 362
    return-void

    .line 365
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateWfcProvisioned :: provisioned="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", slotId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/ims/server/ims/uc/UCStateUtils;->logi(Ljava/lang/String;)V

    .line 367
    nop

    .line 368
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 367
    invoke-static {v0, p2, p1}, Lcom/lge/ims/volte/provider/external/ImsStateController$VoLteState;->putWfcProvisionedForPhoneId(Landroid/content/ContentResolver;II)I

    .line 369
    return-void
.end method
