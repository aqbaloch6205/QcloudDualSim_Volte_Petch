.class public Lcom/lge/ims/volte/provider/external/ImsStateProvider;
.super Landroid/content/ContentProvider;
.source "ImsStateProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;
    }
.end annotation


# static fields
.field protected static final PM_CALL_STATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static final PM_REG_STATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static final PM_ROAMING_STATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static final PM_VOLTE_STATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected static final PM_VOWIFI_ACTIVATION_STATE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "ImsStateProvider"

.field protected static final URI_CALL_STATE:I = 0x5

.field protected static final URI_CALL_STATE_SINGLE:I = 0x6

.field protected static final URI_MATCHER:Landroid/content/UriMatcher;

.field protected static final URI_REG_STATE:I = 0x1

.field protected static final URI_REG_STATE_SINGLE:I = 0x2

.field protected static final URI_ROAMING_STATE:I = 0x7

.field protected static final URI_ROAMING_STATE_SINGLE:I = 0x8

.field protected static final URI_VOLTE_STATE:I = 0x3

.field protected static final URI_VOLTE_STATE_SINGLE:I = 0x4

.field protected static final URI_VOWIFI_ACTIVATION_STATE:I = 0x9

.field protected static final URI_VOWIFI_ACTIVATION_STATE_SINGLE:I = 0xa


# instance fields
.field private mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 867
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->URI_MATCHER:Landroid/content/UriMatcher;

    .line 868
    const-string v1, "com.lge.ims.provider.ims_state"

    const-string v2, "reg_state"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 870
    const-string v2, "reg_state/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 872
    const-string v2, "volte_state"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 874
    const-string v2, "volte_state/#"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 876
    const-string v2, "call_state"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 878
    const-string v3, "call_state/#"

    const/4 v4, 0x6

    invoke-virtual {v0, v1, v3, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 880
    const-string v3, "roaming_state"

    const/4 v4, 0x7

    invoke-virtual {v0, v1, v3, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 882
    const-string v3, "roaming_state/#"

    const/16 v4, 0x8

    invoke-virtual {v0, v1, v3, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 884
    const-string v3, "vowifi_activation_state"

    const/16 v4, 0x9

    invoke-virtual {v0, v1, v3, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 886
    const-string v3, "vowifi_activation_state/#"

    const/16 v4, 0xa

    invoke-virtual {v0, v1, v3, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 889
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_REG_STATE:Ljava/util/HashMap;

    .line 890
    const-string v1, "_id"

    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 891
    const-string v3, "sub_id"

    invoke-virtual {v0, v3, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 892
    const-string v4, "state"

    invoke-virtual {v0, v4, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 893
    const-string v5, "service_status"

    invoke-virtual {v0, v5, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 894
    const-string v6, "network_type"

    invoke-virtual {v0, v6, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 896
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_VOLTE_STATE:Ljava/util/HashMap;

    .line 897
    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 898
    invoke-virtual {v0, v3, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 899
    invoke-virtual {v0, v5, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 900
    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 901
    const-string v2, "volte_provisioned"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 902
    const-string v2, "vt_provisioned"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 903
    const-string v2, "wfc_provisioned"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    const-string v2, "device_volte_available"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    const-string v2, "device_vt_available"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 908
    const-string v2, "device_wfc_available"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 911
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_CALL_STATE:Ljava/util/HashMap;

    .line 912
    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 913
    invoke-virtual {v0, v3, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    invoke-virtual {v0, v4, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    const-string v2, "connected_call_on_wifi"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 918
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_ROAMING_STATE:Ljava/util/HashMap;

    .line 919
    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    invoke-virtual {v0, v3, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 921
    const-string v2, "volte_roaming"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 922
    const-string v2, "vt_roaming"

    invoke-virtual {v0, v2, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 924
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_VOWIFI_ACTIVATION_STATE:Ljava/util/HashMap;

    .line 925
    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 926
    invoke-virtual {v0, v3, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 927
    const-string v1, "slot_id"

    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 928
    const-string v1, "operator"

    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    invoke-virtual {v0, v4, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    const-string v1, "reserved"

    invoke-virtual {v0, v1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 931
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method private insertCallState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "initialValues"    # Landroid/content/ContentValues;

    .line 781
    if-eqz p2, :cond_0

    .line 782
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .local v0, "values":Landroid/content/ContentValues;
    goto :goto_0

    .line 784
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 787
    .restart local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    const-string v1, "sub_id"

    const-string v2, "-1"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 788
    const-string v1, "state"

    const-string v2, "0"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    const-string v1, "connected_call_on_wifi"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 791
    iget-object v1, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v1}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 792
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "call_state"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 794
    .local v4, "rowId":J
    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_1

    .line 795
    sget-object v2, Lcom/lge/ims/volte/provider/external/ImsState$CallState;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 796
    .local v2, "insertedUri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 797
    return-object v2

    .line 800
    .end local v2    # "insertedUri":Landroid/net/Uri;
    :cond_1
    new-instance v2, Landroid/database/sqlite/SQLiteException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to insert row into "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private insertRegState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "initialValues"    # Landroid/content/ContentValues;

    .line 724
    if-eqz p2, :cond_0

    .line 725
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .local v0, "values":Landroid/content/ContentValues;
    goto :goto_0

    .line 727
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 730
    .restart local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    const-string v1, "sub_id"

    const-string v2, "-1"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    const-string v1, "state"

    const-string v2, "0"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    const-string v1, "service_status"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    const-string v1, "network_type"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    iget-object v1, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v1}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 736
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "reg_state"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 738
    .local v4, "rowId":J
    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_1

    .line 739
    sget-object v2, Lcom/lge/ims/volte/provider/external/ImsState$RegState;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 740
    .local v2, "insertedUri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 741
    return-object v2

    .line 744
    .end local v2    # "insertedUri":Landroid/net/Uri;
    :cond_1
    new-instance v2, Landroid/database/sqlite/SQLiteException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to insert row into "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private insertRoamingState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "initialValues"    # Landroid/content/ContentValues;

    .line 806
    if-eqz p2, :cond_0

    .line 807
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .local v0, "values":Landroid/content/ContentValues;
    goto :goto_0

    .line 809
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 812
    .restart local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    const-string v1, "sub_id"

    const-string v2, "-1"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 813
    const-string v1, "volte_roaming"

    const-string v2, "0"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 814
    const-string v1, "vt_roaming"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 816
    iget-object v1, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v1}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 817
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "roaming_state"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 819
    .local v4, "rowId":J
    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_1

    .line 820
    sget-object v2, Lcom/lge/ims/volte/provider/external/ImsState$RoamingState;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 821
    .local v2, "insertedUri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 822
    return-object v2

    .line 825
    .end local v2    # "insertedUri":Landroid/net/Uri;
    :cond_1
    new-instance v2, Landroid/database/sqlite/SQLiteException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to insert row into "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private insertVoLteState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "initialValues"    # Landroid/content/ContentValues;

    .line 750
    if-eqz p2, :cond_0

    .line 751
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .local v0, "values":Landroid/content/ContentValues;
    goto :goto_0

    .line 753
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 756
    .restart local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    const-string v1, "sub_id"

    const-string v2, "-1"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    const-string v1, "service_status"

    const-string v2, "0"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 758
    const-string v1, "call_state"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 759
    const-string v1, "volte_provisioned"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 760
    const-string v1, "vt_provisioned"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 761
    const-string v1, "wfc_provisioned"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 762
    const-string v1, "device_volte_available"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 763
    const-string v1, "device_vt_available"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 764
    const-string v1, "device_wfc_available"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    iget-object v1, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v1}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 767
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "volte_state"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 769
    .local v4, "rowId":J
    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_1

    .line 770
    sget-object v2, Lcom/lge/ims/volte/provider/external/ImsState$VoLteState;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 771
    .local v2, "insertedUri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 772
    return-object v2

    .line 775
    .end local v2    # "insertedUri":Landroid/net/Uri;
    :cond_1
    new-instance v2, Landroid/database/sqlite/SQLiteException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to insert row into "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private insertVoWiFiActivationState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "initialValues"    # Landroid/content/ContentValues;

    .line 831
    if-eqz p2, :cond_0

    .line 832
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .local v0, "values":Landroid/content/ContentValues;
    goto :goto_0

    .line 834
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 837
    .restart local v0    # "values":Landroid/content/ContentValues;
    :goto_0
    const-string v1, "sub_id"

    const-string v2, "-1"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 838
    const-string v1, "slot_id"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    const-string v1, "operator"

    const-string v2, "unknown"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 840
    const-string v1, "state"

    const-string v2, "0"

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    const-string v1, "reserved"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 843
    iget-object v1, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v1}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 844
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "vowifi_activation_state"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 846
    .local v4, "rowId":J
    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-lez v2, :cond_2

    .line 847
    invoke-static {}, Lcom/lge/ims/log/Log;->isDebuggable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 848
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "VoWiFiActivationState: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v6, "ImsStateProvider"

    invoke-static {v6, v2}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 851
    :cond_1
    sget-object v2, Lcom/lge/ims/volte/provider/external/ImsState$VoWiFiActivationState;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 853
    .local v2, "insertedUri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 854
    return-object v2

    .line 857
    .end local v2    # "insertedUri":Landroid/net/Uri;
    :cond_2
    new-instance v2, Landroid/database/sqlite/SQLiteException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to insert row into "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static putValueIfNotPresent(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 861
    invoke-virtual {p0, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 862
    invoke-virtual {p0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 864
    :cond_0
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 12
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "where"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;

    .line 338
    if-nez p1, :cond_0

    .line 339
    const-string v0, "ImsStateProvider"

    const-string v1, "delete() with null uri"

    invoke-static {v0, v1}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    const/4 v0, -0x1

    return v0

    .line 343
    :cond_0
    iget-object v0, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 346
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    sget-object v1, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    const-string v2, "vowifi_activation_state"

    const-string v3, "roaming_state"

    const-string v4, "call_state"

    const-string v5, "volte_state"

    const-string v6, "reg_state"

    const/16 v7, 0x29

    const-string v8, " AND ("

    const-string v9, "\'\'"

    const-string v10, "_id="

    const/4 v11, 0x1

    packed-switch v1, :pswitch_data_0

    .line 403
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown URI "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 395
    :pswitch_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 396
    .local v1, "rowId":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 398
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_1
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 396
    invoke-virtual {v0, v2, v3, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 400
    .local v2, "count":I
    goto/16 :goto_0

    .line 392
    .end local v1    # "rowId":Ljava/lang/String;
    .end local v2    # "count":I
    :pswitch_1
    invoke-virtual {v0, v2, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 393
    .restart local v2    # "count":I
    goto/16 :goto_0

    .line 384
    .end local v2    # "count":I
    :pswitch_2
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 385
    .restart local v1    # "rowId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 387
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_2
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 385
    invoke-virtual {v0, v3, v2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 389
    .restart local v2    # "count":I
    goto/16 :goto_0

    .line 381
    .end local v1    # "rowId":Ljava/lang/String;
    .end local v2    # "count":I
    :pswitch_3
    invoke-virtual {v0, v3, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 382
    .restart local v2    # "count":I
    goto/16 :goto_0

    .line 373
    .end local v2    # "count":I
    :pswitch_4
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 374
    .restart local v1    # "rowId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 376
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_3
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 374
    invoke-virtual {v0, v4, v2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 378
    .restart local v2    # "count":I
    goto/16 :goto_0

    .line 370
    .end local v1    # "rowId":Ljava/lang/String;
    .end local v2    # "count":I
    :pswitch_5
    invoke-virtual {v0, v4, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 371
    .restart local v2    # "count":I
    goto/16 :goto_0

    .line 362
    .end local v2    # "count":I
    :pswitch_6
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 363
    .restart local v1    # "rowId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 365
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_4
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 363
    invoke-virtual {v0, v5, v2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 367
    .restart local v2    # "count":I
    goto :goto_0

    .line 359
    .end local v1    # "rowId":Ljava/lang/String;
    .end local v2    # "count":I
    :pswitch_7
    invoke-virtual {v0, v5, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 360
    .restart local v2    # "count":I
    goto :goto_0

    .line 351
    .end local v2    # "count":I
    :pswitch_8
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 352
    .restart local v1    # "rowId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 354
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_5
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 352
    invoke-virtual {v0, v6, v2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 356
    .restart local v2    # "count":I
    goto :goto_0

    .line 348
    .end local v1    # "rowId":Ljava/lang/String;
    .end local v2    # "count":I
    :pswitch_9
    invoke-virtual {v0, v6, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 349
    .restart local v2    # "count":I
    nop

    .line 406
    :goto_0
    invoke-virtual {p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 408
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 11
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "writer"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .line 644
    iget-object v0, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 646
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-nez v0, :cond_0

    .line 647
    const-string v1, "No database"

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 648
    return-void

    .line 651
    :cond_0
    invoke-static {}, Lcom/lge/ims/volte/provider/external/ImsState;->getTables()[Ljava/lang/String;

    move-result-object v1

    .line 653
    .local v1, "tables":[Ljava/lang/String;
    if-nez v1, :cond_1

    .line 654
    const-string v2, "No tables"

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 655
    return-void

    .line 658
    :cond_1
    const-string v2, "ImsState {"

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 660
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 662
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_b

    .line 663
    const-string v4, "\n"

    if-eqz v3, :cond_2

    .line 664
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 667
    :cond_2
    const/4 v5, 0x0

    .line 670
    .local v5, "c":Landroid/database/Cursor;
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SELECT * FROM "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v1, v3

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    move-object v5, v6

    .line 672
    aget-object v6, v1, v3

    const/16 v7, 0x5f

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 674
    .local v6, "index":I
    const-string v7, "\t"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 676
    if-lez v6, :cond_3

    .line 677
    aget-object v7, v1, v3

    const/4 v8, 0x0

    invoke-virtual {v7, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 679
    :cond_3
    aget-object v7, v1, v3

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 682
    :goto_1
    const-string v7, " {\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 684
    if-eqz v5, :cond_8

    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 686
    :cond_4
    const-string v7, "\t  "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 687
    invoke-interface {v5}, Landroid/database/Cursor;->getColumnCount()I

    move-result v7

    .line 689
    .local v7, "colCount":I
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_2
    if-ge v8, v7, :cond_7

    .line 690
    if-eqz v8, :cond_6

    .line 691
    rem-int/lit8 v9, v8, 0x6

    if-nez v9, :cond_5

    .line 692
    const-string v9, ",\n\t\t"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 694
    :cond_5
    const-string v9, ", "

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 698
    :cond_6
    :goto_3
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 699
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 701
    .end local v8    # "j":I
    :cond_7
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 702
    nop

    .end local v7    # "colCount":I
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-nez v7, :cond_4

    .line 705
    :cond_8
    const-string v4, "\t}"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 710
    nop

    .end local v6    # "index":I
    if-eqz v5, :cond_9

    .line 711
    goto :goto_4

    .line 710
    :catchall_0
    move-exception v4

    goto :goto_5

    .line 706
    :catch_0
    move-exception v4

    .line 707
    .local v4, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_1
    const-string v6, "ImsStateProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "rawQuery :: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 708
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 710
    .end local v4    # "e":Landroid/database/sqlite/SQLiteException;
    if-eqz v5, :cond_9

    .line 711
    :goto_4
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 662
    .end local v5    # "c":Landroid/database/Cursor;
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 710
    .restart local v5    # "c":Landroid/database/Cursor;
    :goto_5
    if-eqz v5, :cond_a

    .line 711
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 713
    :cond_a
    throw v4

    .line 716
    .end local v3    # "i":I
    .end local v5    # "c":Landroid/database/Cursor;
    :cond_b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 718
    const-string v3, "}"

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 719
    return-void
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;

    .line 413
    if-nez p1, :cond_0

    .line 414
    const-string v0, "ImsStateProvider"

    const-string v1, "getType() with null uri"

    invoke-static {v0, v1}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    const/4 v0, 0x0

    return-object v0

    .line 418
    :cond_0
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 440
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 438
    :pswitch_0
    const-string v0, "vnd.android.cursor.item/com.lge.ims.provider.ims_state.vowifi_activation_state/#"

    return-object v0

    .line 436
    :pswitch_1
    const-string v0, "vnd.android.cursor.dir/com.lge.ims.provider.ims_state.vowifi_activation_state"

    return-object v0

    .line 434
    :pswitch_2
    const-string v0, "vnd.android.cursor.item/com.lge.ims.provider.ims_state.roaming_state/#"

    return-object v0

    .line 432
    :pswitch_3
    const-string v0, "vnd.android.cursor.dir/com.lge.ims.provider.ims_state.roaming_state"

    return-object v0

    .line 430
    :pswitch_4
    const-string v0, "vnd.android.cursor.item/com.lge.ims.provider.ims_state.call_state/#"

    return-object v0

    .line 428
    :pswitch_5
    const-string v0, "vnd.android.cursor.dir/com.lge.ims.provider.ims_state.call_state"

    return-object v0

    .line 426
    :pswitch_6
    const-string v0, "vnd.android.cursor.item/com.lge.ims.provider.ims_state.volte_state/#"

    return-object v0

    .line 424
    :pswitch_7
    const-string v0, "vnd.android.cursor.dir/com.lge.ims.provider.ims_state.volte_state"

    return-object v0

    .line 422
    :pswitch_8
    const-string v0, "vnd.android.cursor.item/com.lge.ims.provider.ims_state.reg_state/#"

    return-object v0

    .line 420
    :pswitch_9
    const-string v0, "vnd.android.cursor.dir/com.lge.ims.provider.ims_state.reg_state"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "initialValues"    # Landroid/content/ContentValues;

    .line 446
    if-nez p1, :cond_0

    .line 447
    const-string v0, "ImsStateProvider"

    const-string v1, "insert() with null uri"

    invoke-static {v0, v1}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    const/4 v0, 0x0

    return-object v0

    .line 451
    :cond_0
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 463
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URI "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 461
    :pswitch_1
    invoke-direct {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->insertVoWiFiActivationState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 459
    :pswitch_2
    invoke-direct {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->insertRoamingState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 457
    :pswitch_3
    invoke-direct {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->insertCallState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 455
    :pswitch_4
    invoke-direct {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->insertVoLteState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 453
    :pswitch_5
    invoke-direct {p0, p1, p2}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->insertRegState(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate()Z
    .locals 5

    .line 469
    invoke-static {}, Lcom/lge/ims/log/Log;->isDebuggable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 470
    const-string v0, "ImsStateProvider"

    const-string v1, "ImsStateProvider is created ..."

    invoke-static {v0, v1}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    :cond_0
    new-instance v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {}, Lcom/lge/ims/common/util/QcloudVolte;->dbVersion()I

    move-result v3

    const-string v4, "ims_state.db"

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    iput-object v0, p0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    .line 476
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 16
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .line 482
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "query :: "

    const-string v4, "ImsStateProvider"

    if-nez v2, :cond_0

    .line 483
    const-string v0, "query() with null uri"

    invoke-static {v4, v0}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    const/4 v0, 0x0

    return-object v0

    .line 487
    :cond_0
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    move-object v13, v0

    .line 489
    .local v13, "qb":Landroid/database/sqlite/SQLiteQueryBuilder;
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v0, v2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const-string v5, "vowifi_activation_state"

    const-string v6, "roaming_state"

    const-string v7, "call_state"

    const-string v8, "volte_state"

    const-string v9, "reg_state"

    const/4 v10, 0x1

    const-string v11, "_id="

    packed-switch v0, :pswitch_data_0

    .line 536
    move-object/from16 v3, p3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 531
    :pswitch_0
    invoke-virtual {v13, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 532
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_VOWIFI_ACTIVATION_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 533
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 534
    goto/16 :goto_0

    .line 527
    :pswitch_1
    invoke-virtual {v13, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 528
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_VOWIFI_ACTIVATION_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 529
    goto/16 :goto_0

    .line 522
    :pswitch_2
    invoke-virtual {v13, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 523
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_ROAMING_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 524
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 525
    goto/16 :goto_0

    .line 518
    :pswitch_3
    invoke-virtual {v13, v6}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 519
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_ROAMING_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 520
    goto/16 :goto_0

    .line 513
    :pswitch_4
    invoke-virtual {v13, v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 514
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_CALL_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 515
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 516
    goto :goto_0

    .line 509
    :pswitch_5
    invoke-virtual {v13, v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 510
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_CALL_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 511
    goto :goto_0

    .line 504
    :pswitch_6
    invoke-virtual {v13, v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 505
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_VOLTE_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 506
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 507
    goto :goto_0

    .line 500
    :pswitch_7
    invoke-virtual {v13, v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 501
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_VOLTE_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 502
    goto :goto_0

    .line 495
    :pswitch_8
    invoke-virtual {v13, v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 496
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_REG_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 497
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 498
    goto :goto_0

    .line 491
    :pswitch_9
    invoke-virtual {v13, v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 492
    sget-object v0, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->PM_REG_STATE:Ljava/util/HashMap;

    invoke-virtual {v13, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 493
    nop

    .line 539
    :goto_0
    iget-object v0, v1, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v14

    .line 540
    .local v14, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v15, 0x0

    .line 543
    .local v15, "c":Landroid/database/Cursor;
    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v5, v13

    move-object v6, v14

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v12, p5

    :try_start_0
    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v15, v0

    .line 552
    goto :goto_1

    .line 544
    :catch_0
    move-exception v0

    move-object v5, v0

    move-object v0, v5

    .line 545
    .local v0, "e":Landroid/database/sqlite/SQLiteException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    .line 548
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v5

    const-string v6, "no such table"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 549
    iget-object v5, v1, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    .line 550
    invoke-virtual {v5}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    .line 549
    invoke-virtual {v5, v6}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->checkIntegrityAndCreateTablesIfNotPresent(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 554
    .end local v0    # "e":Landroid/database/sqlite/SQLiteException;
    :cond_1
    :goto_1
    if-eqz v15, :cond_2

    .line 555
    invoke-virtual/range {p0 .. p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-interface {v15, v0, v2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 558
    :cond_2
    invoke-static {}, Lcom/lge/ims/log/Log;->isDebuggable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 559
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "::"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v3, p3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/lge/ims/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 558
    :cond_3
    move-object/from16 v3, p3

    .line 562
    :goto_2
    return-object v15

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 16
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "where"    # Ljava/lang/String;
    .param p4, "whereArgs"    # [Ljava/lang/String;

    .line 567
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    if-nez v0, :cond_0

    .line 568
    const-string v4, "ImsStateProvider"

    const-string v5, "update() with null uri"

    invoke-static {v4, v5}, Lcom/lge/ims/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    const/4 v4, 0x0

    return v4

    .line 572
    :cond_0
    move-object/from16 v4, p0

    iget-object v5, v4, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->mDBHelper:Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;

    invoke-virtual {v5}, Lcom/lge/ims/volte/provider/external/ImsStateProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 573
    .local v5, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v6, 0x0

    .line 575
    .local v6, "count":I
    sget-object v7, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v7, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v7

    const-string v8, "vowifi_activation_state"

    const-string v9, "roaming_state"

    const-string v10, "call_state"

    const-string v11, "volte_state"

    const-string v12, "reg_state"

    const-string v14, " AND ("

    const-string v15, "\'\'"

    const-string v13, "_id="

    const/4 v4, 0x1

    packed-switch v7, :pswitch_data_0

    .line 632
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown URI "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 624
    :pswitch_0
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 625
    .local v4, "rowId":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 627
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0x29

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    :cond_1
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 625
    invoke-virtual {v5, v8, v1, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 629
    goto/16 :goto_0

    .line 621
    .end local v4    # "rowId":Ljava/lang/String;
    :pswitch_1
    invoke-virtual {v5, v8, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 622
    goto/16 :goto_0

    .line 613
    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 614
    .restart local v4    # "rowId":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 616
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v10, 0x29

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    :cond_2
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 614
    invoke-virtual {v5, v9, v1, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 618
    goto/16 :goto_0

    .line 610
    .end local v4    # "rowId":Ljava/lang/String;
    :pswitch_3
    invoke-virtual {v5, v9, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 611
    goto/16 :goto_0

    .line 602
    :pswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 603
    .restart local v4    # "rowId":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 605
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x29

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    :cond_3
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 603
    invoke-virtual {v5, v10, v1, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 607
    goto/16 :goto_0

    .line 599
    .end local v4    # "rowId":Ljava/lang/String;
    :pswitch_5
    invoke-virtual {v5, v10, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 600
    goto/16 :goto_0

    .line 591
    :pswitch_6
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 592
    .restart local v4    # "rowId":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 594
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x29

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    :cond_4
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 592
    invoke-virtual {v5, v11, v1, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 596
    goto :goto_0

    .line 588
    .end local v4    # "rowId":Ljava/lang/String;
    :pswitch_7
    invoke-virtual {v5, v11, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 589
    goto :goto_0

    .line 580
    :pswitch_8
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 581
    .restart local v4    # "rowId":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 583
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x29

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    :cond_5
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 581
    invoke-virtual {v5, v12, v1, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 585
    goto :goto_0

    .line 577
    .end local v4    # "rowId":Ljava/lang/String;
    :pswitch_9
    invoke-virtual {v5, v12, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 578
    nop

    .line 635
    :goto_0
    if-lez v6, :cond_6

    .line 636
    invoke-virtual/range {p0 .. p0}, Lcom/lge/ims/volte/provider/external/ImsStateProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v7, 0x0

    invoke-virtual {v4, v0, v7}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 639
    :cond_6
    return v6

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
