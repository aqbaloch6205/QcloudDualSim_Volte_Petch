.class public Lcom/lge/ims/volte/provider/external/ImsState;
.super Ljava/lang/Object;
.source "ImsState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/ims/volte/provider/external/ImsState$PersistentValues;,
        Lcom/lge/ims/volte/provider/external/ImsState$VoWiFiActivationState;,
        Lcom/lge/ims/volte/provider/external/ImsState$RoamingState;,
        Lcom/lge/ims/volte/provider/external/ImsState$CallState;,
        Lcom/lge/ims/volte/provider/external/ImsState$VoLteState;,
        Lcom/lge/ims/volte/provider/external/ImsState$RegState;,
        Lcom/lge/ims/volte/provider/external/ImsState$Columns;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.lge.ims.provider.ims_state"

.field public static final DATABASE_NAME:Ljava/lang/String; = "ims_state.db"

.field public static final DATABASE_VERSION:I = 0x7

.field private static final TABLES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 164
    const-string v0, "reg_state"

    const-string v1, "volte_state"

    const-string v2, "call_state"

    const-string v3, "roaming_state"

    const-string v4, "vowifi_activation_state"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/ims/volte/provider/external/ImsState;->TABLES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getPersistentColumns(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "tableName"    # Ljava/lang/String;

    .line 173
    const-string v0, "volte_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 174
    invoke-static {}, Lcom/lge/ims/volte/provider/external/ImsState$VoLteState;->access$000()[Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 175
    :cond_0
    const-string v0, "roaming_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 176
    invoke-static {}, Lcom/lge/ims/volte/provider/external/ImsState$RoamingState;->access$100()[Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 179
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static final getTableContentCount()I
    .locals 1

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->dbRows()I

    move-result v0

    return v0
.end method

.method public static final getTableContents(Ljava/lang/String;)[[Ljava/lang/String;
    .locals 1
    .param p0, "tableName"    # Ljava/lang/String;

    .line 187
    const-string v0, "reg_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsState$RegState;->CONTENTS:[[Ljava/lang/String;

    return-object v0

    .line 189
    :cond_0
    const-string v0, "volte_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 190
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsState$VoLteState;->CONTENTS:[[Ljava/lang/String;

    return-object v0

    .line 191
    :cond_1
    const-string v0, "call_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 192
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsState$CallState;->CONTENTS:[[Ljava/lang/String;

    return-object v0

    .line 193
    :cond_2
    const-string v0, "roaming_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 194
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsState$RoamingState;->CONTENTS:[[Ljava/lang/String;

    return-object v0

    .line 195
    :cond_3
    const-string v0, "vowifi_activation_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 196
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsState$VoWiFiActivationState;->CONTENTS:[[Ljava/lang/String;

    return-object v0

    .line 199
    :cond_4
    const/4 v0, 0x0

    return-object v0
.end method

.method public static final getTables()[Ljava/lang/String;
    .locals 1

    .line 183
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsState;->TABLES:[Ljava/lang/String;

    return-object v0
.end method

.method public static final hasDefaultValues(Ljava/lang/String;)Z
    .locals 1
    .param p0, "tableName"    # Ljava/lang/String;

    .line 207
    const-string v0, "vowifi_activation_state"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    const/4 v0, 0x0

    return v0

    .line 211
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
