.class public Lcom/lge/ims/common/agents/dcm/DCApn;
.super Ljava/lang/Object;
.source "DCApn.java"

# interfaces
.implements Lcom/lge/ims/common/agents/dcmif/IDCApn;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;
    }
.end annotation


# static fields
.field private static final ACTION_BLOCK_PDN_RELEASED:Ljava/lang/String; = "com.lge.android.intent.action.ACTION_BLOCK_PDN_RELEASED"

.field private static final ACTION_CONNECTIVITY:Ljava/lang/String; = "android.net.conn.CONNECTIVITY_CHANGE"

.field private static final ACTION_IMS_APN_CHANGED:Ljava/lang/String; = "com.lge.android.intent.action.IMS_APN_CHANGED"

.field private static final ACTION_IMS_SVC_ONOFF:Ljava/lang/String; = "com.lge.ims.action.IMS_SVC_ONOFF"

.field private static final ACTION_MODEM_RESET_COMPLETE:Ljava/lang/String; = "com.lge.intent.action.MODEM_RESET_COMPLETE"

.field private static final ACTION_PCSCF_MODIFY_EPS_BEARER:Ljava/lang/String; = "com.lge.internal.telephony.pcscf-modify-eps-bearer"

.field private static final ACTION_USER_TRIGGERED_REGI_REQUEST:Ljava/lang/String; = "com.lge.intent.action.IMS_USER_RETRY"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDCApnReceiver:Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;

.field mDCNetWatcher:Lcom/lge/ims/common/agents/dcmif/IDCNetWatcher;

.field mDCSettings:Lcom/lge/ims/common/agents/dcmif/IDCSettings;

.field private mSlotId:I

.field private mapApn:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Ljava/lang/Integer;",
            "Lcom/lge/ims/common/agents/dcmif/IApn;",
            ">;"
        }
    .end annotation
.end field

.field private mapLocalIP:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "slotId"  # I

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    .line 111
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapLocalIP:Ljava/util/Hashtable;

    .line 113
    const/4 v0, 0x0

    iput v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    .line 117
    const-string v0, ""

    invoke-static {p1, v0}, Lcom/lge/ims/common/log/ImsLog;->d(ILjava/lang/String;)V

    .line 118
    iput p1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    .line 119
    return-void
.end method

.method static synthetic access$000(Lcom/lge/ims/common/agents/dcm/DCApn;)I
    .registers 2
    .param p0, "x0"  # Lcom/lge/ims/common/agents/dcm/DCApn;

    .line 79
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    return v0
.end method

.method private apnFactory()V
    .registers 10

    .line 692
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    if-nez v0, :cond_5

    .line 693
    return-void

    .line 696
    :cond_5
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "id"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "%s=\'%d\'"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 697
    .local v0, "selection":Ljava/lang/String;
    const/4 v1, 0x0

    .line 700
    .local v1, "c":Landroid/database/Cursor;
    :try_start_1f
    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/lge/ims/common/configuration/ProviderInterface$AoSConnection;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v3, v0}, Lcom/lge/ims/common/util/DBUtils$CP;->getFirstCursor(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    move-object v1, v2

    .line 703
    if-nez v1, :cond_39

    .line 704
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v3, "cursor is null"

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_35} :catch_7d
    .catchall {:try_start_1f .. :try_end_35} :catchall_7b

    .line 731
    invoke-static {v1}, Lcom/lge/ims/common/util/DBUtils;->closeCursor(Landroid/database/Cursor;)V

    .line 705
    return-void

    .line 708
    :cond_39
    :try_start_39
    const-string v5, "aos_connection_0_profile_name"

    const-string v6, "aos_connection_0_access_policy"

    const-string v7, "aos_connection_0_ip_version"

    const-string v8, "aos_connection_0_features"

    move-object v3, p0

    move-object v4, v1

    invoke-direct/range {v3 .. v8}, Lcom/lge/ims/common/agents/dcm/DCApn;->createApnFromDB(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    const-string v5, "aos_connection_1_profile_name"

    const-string v6, "aos_connection_1_access_policy"

    const-string v7, "aos_connection_1_ip_version"

    const-string v8, "aos_connection_1_features"

    move-object v3, p0

    move-object v4, v1

    invoke-direct/range {v3 .. v8}, Lcom/lge/ims/common/agents/dcm/DCApn;->createApnFromDB(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 716
    const-string v5, "aos_connection_2_profile_name"

    const-string v6, "aos_connection_2_access_policy"

    const-string v7, "aos_connection_2_ip_version"

    const-string v8, "aos_connection_2_features"

    move-object v3, p0

    move-object v4, v1

    invoke-direct/range {v3 .. v8}, Lcom/lge/ims/common/agents/dcm/DCApn;->createApnFromDB(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    const-string v5, "aos_connection_4_profile_name"

    const-string v6, "aos_connection_4_access_policy"

    const-string v7, "aos_connection_4_ip_version"

    const-string v8, "aos_connection_4_features"

    move-object v3, p0

    move-object v4, v1

    invoke-direct/range {v3 .. v8}, Lcom/lge/ims/common/agents/dcm/DCApn;->createApnFromDB(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 724
    const-string v5, "aos_connection_5_profile_name"

    const-string v6, "aos_connection_5_access_policy"

    const-string v7, "aos_connection_5_ip_version"

    const-string v8, "aos_connection_5_features"

    move-object v3, p0

    move-object v4, v1

    invoke-direct/range {v3 .. v8}, Lcom/lge/ims/common/agents/dcm/DCApn;->createApnFromDB(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_7a} :catch_7d
    .catchall {:try_start_39 .. :try_end_7a} :catchall_7b

    goto :goto_87

    .line 731
    :catchall_7b
    move-exception v2

    goto :goto_8c

    .line 728
    :catch_7d
    move-exception v2

    .line 729
    .local v2, "e":Ljava/lang/Exception;
    :try_start_7e
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->e(ILjava/lang/String;)V
    :try_end_87
    .catchall {:try_start_7e .. :try_end_87} :catchall_7b

    .line 731
    .end local v2  # "e":Ljava/lang/Exception;
    :goto_87
    invoke-static {v1}, Lcom/lge/ims/common/util/DBUtils;->closeCursor(Landroid/database/Cursor;)V

    .line 732
    nop

    .line 733
    return-void

    .line 731
    :goto_8c
    invoke-static {v1}, Lcom/lge/ims/common/util/DBUtils;->closeCursor(Landroid/database/Cursor;)V

    .line 732
    throw v2
.end method

.method private checkAddressValid([Ljava/lang/String;I[Z)I
    .registers 12
    .param p1, "addresses"  # [Ljava/lang/String;
    .param p2, "ipVersion"  # I
    .param p3, "validities"  # [Z

    .line 879
    const-string v0, ") >> "

    const/4 v1, 0x0

    .line 881
    .local v1, "validCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    array-length v3, p1

    if-ge v2, v3, :cond_f3

    .line 882
    aget-object v3, p1, v2

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 883
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Address at index("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") is empty"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 884
    goto/16 :goto_ef

    .line 887
    :cond_2f
    const/4 v3, 0x0

    .line 890
    .local v3, "inetAddress":Ljava/net/InetAddress;
    :try_start_30
    aget-object v4, p1, v2

    invoke-static {v4}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v4
    :try_end_36
    .catch Ljava/net/UnknownHostException; {:try_start_30 .. :try_end_36} :catch_38

    move-object v3, v4

    .line 893
    goto :goto_65

    .line 891
    :catch_38
    move-exception v4

    .line 892
    .local v4, "e":Ljava/net/UnknownHostException;
    iget v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception :: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", Address("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, p1, v2

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/lge/ims/common/log/ImsLog;->e(ILjava/lang/String;)V

    .line 895
    .end local v4  # "e":Ljava/net/UnknownHostException;
    :goto_65
    if-nez v3, :cond_69

    .line 896
    goto/16 :goto_ef

    .line 899
    :cond_69
    invoke-virtual {v3}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v4

    if-nez v4, :cond_d2

    .line 900
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v4

    if-nez v4, :cond_d2

    .line 901
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v4

    if-eqz v4, :cond_7c

    goto :goto_d2

    .line 906
    :cond_7c
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Address("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p1, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 908
    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    const/4 v5, 0x1

    if-eq p2, v4, :cond_c9

    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4V6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    .line 909
    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-ne p2, v4, :cond_b0

    goto :goto_c9

    .line 914
    :cond_b0
    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-eq p2, v4, :cond_c0

    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6V4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    .line 915
    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-ne p2, v4, :cond_ef

    .line 916
    :cond_c0
    instance-of v4, v3, Ljava/net/Inet6Address;

    if-eqz v4, :cond_ef

    .line 917
    aput-boolean v5, p3, v2

    .line 918
    add-int/lit8 v1, v1, 0x1

    goto :goto_ef

    .line 910
    :cond_c9
    :goto_c9
    instance-of v4, v3, Ljava/net/Inet4Address;

    if-eqz v4, :cond_ef

    .line 911
    aput-boolean v5, p3, v2

    .line 912
    add-int/lit8 v1, v1, 0x1

    goto :goto_ef

    .line 902
    :cond_d2
    :goto_d2
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid InetAddress - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 903
    nop

    .line 881
    .end local v3  # "inetAddress":Ljava/net/InetAddress;
    :cond_ef
    :goto_ef
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_4

    .line 923
    .end local v2  # "i":I
    :cond_f3
    return v1
.end method

.method private cleanUpApns()V
    .registers 6

    .line 736
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 737
    .local v0, "apnList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 739
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 742
    :try_start_10
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;
    :try_end_16
    .catch Ljava/util/ConcurrentModificationException; {:try_start_10 .. :try_end_16} :catch_29

    .line 746
    .local v2, "key":Ljava/lang/Integer;
    nop

    .line 748
    iget-object v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    invoke-virtual {v3, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lge/ims/common/agents/dcmif/IApn;

    .line 749
    .local v3, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-eqz v3, :cond_28

    .line 751
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lcom/lge/ims/common/agents/dcmif/IApn;->disconnect(I)V

    .line 752
    invoke-interface {v3}, Lcom/lge/ims/common/agents/dcmif/IApn;->cleanup()V

    .line 754
    .end local v2  # "key":Ljava/lang/Integer;
    .end local v3  # "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    :cond_28
    goto :goto_a

    .line 743
    :catch_29
    move-exception v2

    .line 744
    .local v2, "e":Ljava/util/ConcurrentModificationException;
    iget-object v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->clear()V

    .line 745
    return-void

    .line 756
    .end local v2  # "e":Ljava/util/ConcurrentModificationException;
    :cond_30
    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->clear()V

    .line 757
    return-void
.end method

.method private createAndSetApn(Ljava/lang/String;III)V
    .registers 12
    .param p1, "apnName"  # Ljava/lang/String;
    .param p2, "nAccessPolicy"  # I
    .param p3, "nIpVersion"  # I
    .param p4, "nConnectionFeatures"  # I

    .line 824
    const-string v0, "Known-APN"

    .line 825
    .local v0, "logTag":Ljava/lang/String;
    const/4 v1, 0x0

    .line 827
    .local v1, "nApnType":I
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->IMS:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 828
    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    sget-object v3, Lcom/lge/ims/common/agents/dcmif/EApnType;->IMS:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v3}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Lcom/lge/ims/common/agents/dcm/ApnIms;

    iget-object v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    iget v6, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-direct {v4, v5, p2, p3, v6}, Lcom/lge/ims/common/agents/dcm/ApnIms;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 830
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->IMS:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v1

    goto/16 :goto_b2

    .line 832
    :cond_2f
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->INTERNET:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 833
    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    sget-object v3, Lcom/lge/ims/common/agents/dcmif/EApnType;->INTERNET:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v3}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Lcom/lge/ims/common/agents/dcm/ApnInternet;

    iget-object v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    iget v6, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-direct {v4, v5, p2, p3, v6}, Lcom/lge/ims/common/agents/dcm/ApnInternet;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->INTERNET:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v1

    goto :goto_b2

    .line 837
    :cond_5a
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->XCAP:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_85

    .line 838
    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    sget-object v3, Lcom/lge/ims/common/agents/dcmif/EApnType;->XCAP:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v3}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Lcom/lge/ims/common/agents/dcm/ApnXcap;

    iget-object v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    iget v6, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-direct {v4, v5, p2, p3, v6}, Lcom/lge/ims/common/agents/dcm/ApnXcap;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 840
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->XCAP:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v1

    goto :goto_b2

    .line 842
    :cond_85
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->EMERGENCY:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b0

    .line 843
    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    sget-object v3, Lcom/lge/ims/common/agents/dcmif/EApnType;->EMERGENCY:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v3}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Lcom/lge/ims/common/agents/dcm/ApnEmergency;

    iget-object v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    iget v6, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-direct {v4, v5, p2, p3, v6}, Lcom/lge/ims/common/agents/dcm/ApnEmergency;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 845
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EApnType;->EMERGENCY:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v1

    goto :goto_b2

    .line 848
    :cond_b0
    const-string v0, "Unknown-APN"

    .line 851
    :goto_b2
    if-eqz v1, :cond_bd

    .line 853
    invoke-virtual {p0, v1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v2

    .line 854
    .local v2, "currApn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-eqz v2, :cond_bd

    .line 855
    invoke-interface {v2, p4}, Lcom/lge/ims/common/agents/dcmif/IApn;->setConnectionFeatures(I)V

    .line 859
    .end local v2  # "currApn":Lcom/lge/ims/common/agents/dcmif/IApn;
    :cond_bd
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " :: apn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", accessPolicy="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 860
    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", ipVersion="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " nConnectionFeatures="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 859
    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 862
    return-void
.end method

.method private createApnFromDB(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 24
    .param p1, "cursor"  # Landroid/database/Cursor;
    .param p2, "profileName"  # Ljava/lang/String;
    .param p3, "accessPolicy"  # Ljava/lang/String;
    .param p4, "ipVersion"  # Ljava/lang/String;
    .param p5, "connection_features"  # Ljava/lang/String;

    .line 762
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    if-nez v2, :cond_14

    .line 763
    iget v5, v0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v6, "Profile name is null"

    invoke-static {v5, v6}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 764
    return-void

    .line 767
    :cond_14
    invoke-interface/range {p1 .. p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    .line 768
    .local v5, "columnForProfile":I
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 769
    .local v6, "columnForAccessPolicy":I
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 770
    .local v7, "columnForIPV":I
    move-object/from16 v8, p5

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    .line 772
    .local v9, "columnForConnectionFeature":I
    const/4 v10, 0x0

    .line 773
    .local v10, "mProfileName":Ljava/lang/String;
    const/4 v11, 0x0

    .line 774
    .local v11, "mAccessPolicy":I
    const/4 v12, 0x0

    .line 775
    .local v12, "mIpVersion":I
    const/4 v13, 0x0

    .line 777
    .local v13, "mConnectionFeature":I
    if-ltz v5, :cond_30

    .line 778
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 781
    :cond_30
    const/4 v15, 0x2

    if-ltz v6, :cond_47

    .line 783
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 789
    .local v14, "strAccessPolicy":Ljava/lang/String;
    move/from16 v16, v5

    move/from16 v17, v6

    const/16 v15, 0x10

    .end local v5  # "columnForProfile":I
    .end local v6  # "columnForAccessPolicy":I
    .local v16, "columnForProfile":I
    .local v17, "columnForAccessPolicy":I
    invoke-static {v14, v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v5

    long-to-int v11, v5

    goto :goto_4b

    .line 781
    .end local v14  # "strAccessPolicy":Ljava/lang/String;
    .end local v16  # "columnForProfile":I
    .end local v17  # "columnForAccessPolicy":I
    .restart local v5  # "columnForProfile":I
    .restart local v6  # "columnForAccessPolicy":I
    :cond_47
    move/from16 v16, v5

    move/from16 v17, v6

    .line 792
    .end local v5  # "columnForProfile":I
    .end local v6  # "columnForAccessPolicy":I
    .restart local v16  # "columnForProfile":I
    .restart local v17  # "columnForAccessPolicy":I
    :goto_4b
    if-ltz v7, :cond_77

    .line 793
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 794
    sget-object v5, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v5}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v5

    if-eq v12, v5, :cond_77

    sget-object v5, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    .line 795
    invoke-virtual {v5}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v5

    if-eq v12, v5, :cond_77

    sget-object v5, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4V6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    .line 796
    invoke-virtual {v5}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v5

    if-eq v12, v5, :cond_77

    sget-object v5, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6V4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    .line 797
    invoke-virtual {v5}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v5

    if-eq v12, v5, :cond_77

    .line 798
    sget-object v5, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4V6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v5}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v12

    .line 802
    :cond_77
    if-ltz v9, :cond_89

    .line 804
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 810
    .local v5, "strConnectionFeatures":Ljava/lang/String;
    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v14

    long-to-int v13, v14

    .line 813
    .end local v5  # "strConnectionFeatures":Ljava/lang/String;
    :cond_89
    iget v5, v0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Apn :: profile="

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v14, ", access_policy="

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 814
    invoke-static {v11}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v14, ", ip_version="

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v14, " from "

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v14, ":"

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v14, "connection_feature="

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 817
    invoke-static {v13}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 813
    invoke-static {v5, v6}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 819
    invoke-direct {v0, v10, v11, v12, v13}, Lcom/lge/ims/common/agents/dcm/DCApn;->createAndSetApn(Ljava/lang/String;III)V

    .line 820
    return-void
.end method

.method private getIPAddress(Ljava/util/Collection;I)Ljava/lang/String;
    .registers 10
    .param p2, "ipVersion"  # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroid/net/LinkAddress;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 927
    .local p1, "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    const/4 v0, 0x0

    if-nez p1, :cond_4

    .line 928
    return-object v0

    .line 931
    :cond_4
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 933
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/net/LinkAddress;>;"
    if-nez v1, :cond_b

    .line 934
    return-object v0

    .line 937
    :cond_b
    const/4 v0, 0x0

    .line 939
    .local v0, "ipAddress":Ljava/lang/String;
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_cc

    .line 940
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/LinkAddress;

    .line 942
    .local v2, "linkAddress":Landroid/net/LinkAddress;
    if-nez v2, :cond_22

    .line 943
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v4, "linkAddress is null"

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 944
    goto :goto_c

    .line 947
    :cond_22
    invoke-virtual {v2}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    .line 949
    .local v3, "netAddress":Ljava/net/InetAddress;
    if-nez v3, :cond_45

    .line 950
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Resolving InetAddress failed - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Landroid/net/LinkAddress;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 951
    goto :goto_c

    .line 954
    :cond_45
    invoke-virtual {v3}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v4

    if-nez v4, :cond_ae

    .line 955
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v4

    if-nez v4, :cond_ae

    .line 956
    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v4

    if-eqz v4, :cond_58

    goto :goto_ae

    .line 961
    :cond_58
    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-eq p2, v4, :cond_93

    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6V4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    .line 962
    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-ne p2, v4, :cond_69

    goto :goto_93

    .line 971
    :cond_69
    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-eq p2, v4, :cond_79

    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4V6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    .line 972
    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-ne p2, v4, :cond_ac

    .line 973
    :cond_79
    instance-of v4, v3, Ljava/net/Inet4Address;

    if-eqz v4, :cond_82

    .line 974
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    .line 975
    return-object v0

    .line 976
    :cond_82
    instance-of v4, v3, Ljava/net/Inet6Address;

    if-eqz v4, :cond_ac

    .line 977
    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4V6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-ne p2, v4, :cond_ac

    .line 978
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    goto :goto_ac

    .line 963
    :cond_93
    :goto_93
    instance-of v4, v3, Ljava/net/Inet6Address;

    if-eqz v4, :cond_9c

    .line 964
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    .line 965
    return-object v0

    .line 966
    :cond_9c
    instance-of v4, v3, Ljava/net/Inet4Address;

    if-eqz v4, :cond_ac

    .line 967
    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6V4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-ne p2, v4, :cond_ac

    .line 968
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    .line 982
    .end local v2  # "linkAddress":Landroid/net/LinkAddress;
    .end local v3  # "netAddress":Ljava/net/InetAddress;
    :cond_ac
    :goto_ac
    goto/16 :goto_c

    .line 957
    .restart local v2  # "linkAddress":Landroid/net/LinkAddress;
    .restart local v3  # "netAddress":Ljava/net/InetAddress;
    :cond_ae
    :goto_ae
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid InetAddress - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Landroid/net/LinkAddress;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 958
    goto/16 :goto_c

    .line 984
    .end local v2  # "linkAddress":Landroid/net/LinkAddress;
    .end local v3  # "netAddress":Ljava/net/InetAddress;
    :cond_cc
    return-object v0
.end method

.method private getIpVersion(I)I
    .registers 6
    .param p1, "apnType"  # I

    .line 1021
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    .line 1023
    .local v0, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v0, :cond_20

    .line 1024
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Apn is null; apnType="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 1025
    const/4 v1, 0x0

    return v1

    .line 1028
    :cond_20
    invoke-interface {v0}, Lcom/lge/ims/common/agents/dcmif/IApn;->getIpVersion()I

    move-result v1

    return v1
.end method

.method private getLinkProperties(ILandroid/net/ConnectivityManager;)Landroid/net/LinkProperties;
    .registers 5
    .param p1, "apnType"  # I
    .param p2, "cm"  # Landroid/net/ConnectivityManager;

    .line 865
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCSettings:Lcom/lge/ims/common/agents/dcmif/IDCSettings;

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    invoke-interface {v0}, Lcom/lge/ims/common/agents/dcmif/IDCSettings;->isMultipleApnSupported()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 866
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getNetworkByCapability(I)Landroid/net/Network;

    move-result-object v0

    .line 868
    .local v0, "network":Landroid/net/Network;
    if-nez v0, :cond_12

    .line 869
    return-object v1

    .line 871
    :cond_12
    invoke-virtual {p2, v0}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object v1

    return-object v1

    .line 875
    .end local v0  # "network":Landroid/net/Network;
    :cond_17
    invoke-virtual {p2, v1}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object v0

    return-object v0
.end method

.method private getPcscfAddress(I)[Ljava/lang/String;
    .registers 5

    invoke-static {p1}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getPhoneApnTypeFromType(I)Ljava/lang/String;

    move-result-object v0

    # PATCH: skip LGExtApi (LG framework) branch, always use ConnectivityManager LinkProperties
    const/4 v1, 0x0

    if-nez v1, :cond_25

    iget-object v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-direct {p0, p1, v1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getLinkProperties(ILandroid/net/ConnectivityManager;)Landroid/net/LinkProperties;

    move-result-object v1

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Landroid/net/LinkProperties;->getPcscfServers()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/ims/compat/LGTelephonyCompat;->getPcscfAddress(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_23
    const/4 v2, 0x0

    return-object v2

    :cond_25
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-static {v1, v0}, Lcom/lge/ims/common/util/LGExtApi$Data;->getPcscfAddress(ILjava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getValidAddresses([Ljava/lang/String;I)[Ljava/lang/String;
    .registers 10
    .param p1, "addresses"  # [Ljava/lang/String;
    .param p2, "ipVersion"  # I

    .line 988
    const/4 v0, 0x0

    if-eqz p1, :cond_52

    array-length v1, p1

    if-nez v1, :cond_7

    goto :goto_52

    .line 993
    :cond_7
    array-length v1, p1

    new-array v1, v1, [Z

    .line 995
    .local v1, "validities":[Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    array-length v3, p1

    if-ge v2, v3, :cond_14

    .line 996
    const/4 v3, 0x0

    aput-boolean v3, v1, v2

    .line 995
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 999
    .end local v2  # "i":I
    :cond_14
    invoke-direct {p0, p1, p2, v1}, Lcom/lge/ims/common/agents/dcm/DCApn;->checkAddressValid([Ljava/lang/String;I[Z)I

    move-result v2

    .line 1001
    .local v2, "validCount":I
    if-nez v2, :cond_22

    .line 1002
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v4, "No valid addresses"

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 1003
    return-object v0

    .line 1006
    :cond_22
    new-array v0, v2, [Ljava/lang/String;

    .line 1008
    .local v0, "validAddresses":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_26
    array-length v5, p1

    if-ge v3, v5, :cond_39

    if-ge v4, v2, :cond_39

    .line 1009
    aget-boolean v5, v1, v3

    const/4 v6, 0x1

    if-ne v5, v6, :cond_36

    .line 1010
    aget-object v5, p1, v3

    aput-object v5, v0, v4

    .line 1011
    add-int/lit8 v4, v4, 0x1

    .line 1008
    :cond_36
    add-int/lit8 v3, v3, 0x1

    goto :goto_26

    .line 1015
    .end local v3  # "i":I
    .end local v4  # "j":I
    :cond_39
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Count of valid addresses :: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 1017
    return-object v0

    .line 989
    .end local v0  # "validAddresses":[Ljava/lang/String;
    .end local v1  # "validities":[Z
    .end local v2  # "validCount":I
    :cond_52
    :goto_52
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v2, "Addresses is null"

    invoke-static {v1, v2}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 990
    return-object v0
.end method


# virtual methods
.method public changeApnEmployState(Lcom/lge/ims/common/agents/dcmif/EApnType;Z)V
    .registers 6
    .param p1, "apnType"  # Lcom/lge/ims/common/agents/dcmif/EApnType;
    .param p2, "enable"  # Z

    .line 662
    if-nez p1, :cond_a

    .line 663
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v1, "ApnType is null"

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 664
    return-void

    .line 667
    :cond_a
    invoke-virtual {p1}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    .line 668
    .local v0, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v0, :cond_1c

    .line 669
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v2, "apn is null"

    invoke-static {v1, v2}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 670
    return-void

    .line 673
    :cond_1c
    const/4 v1, 0x1

    if-ne p2, v1, :cond_23

    .line 674
    invoke-interface {v0}, Lcom/lge/ims/common/agents/dcmif/IApn;->employApn()V

    goto :goto_26

    .line 676
    :cond_23
    invoke-interface {v0}, Lcom/lge/ims/common/agents/dcmif/IApn;->dismissApn()V

    .line 678
    :goto_26
    return-void
.end method

.method public cleanup()V
    .registers 4

    .line 149
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->d(ILjava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCApnReceiver:Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    if-eqz v2, :cond_15

    .line 152
    invoke-virtual {v2, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 153
    iput-object v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCApnReceiver:Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;

    .line 156
    :cond_15
    invoke-direct {p0}, Lcom/lge/ims/common/agents/dcm/DCApn;->cleanUpApns()V

    .line 158
    iput-object v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCNetWatcher:Lcom/lge/ims/common/agents/dcmif/IDCNetWatcher;

    .line 159
    iput-object v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCSettings:Lcom/lge/ims/common/agents/dcmif/IDCSettings;

    .line 161
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapLocalIP:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 162
    return-void
.end method

.method public connect(II)Z
    .registers 9
    .param p1, "apnType"  # I
    .param p2, "ipcanType"  # I

    .line 166
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const/16 v1, 0xb

    invoke-static {v1, v0}, Lcom/lge/ims/common/agents/AgentFactory;->getAgent(II)Lcom/lge/ims/common/agents/agentif/IAgent;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/agentif/ISharedState;

    .line 168
    .local v0, "ss":Lcom/lge/ims/common/agents/agentif/ISharedState;
    const/4 v1, 0x0

    if-nez v0, :cond_e

    .line 169
    return v1

    .line 172
    :cond_e
    invoke-interface {v0}, Lcom/lge/ims/common/agents/agentif/ISharedState;->isNativeBootCompleted()Z

    move-result v2

    if-nez v2, :cond_2e

    .line 173
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "native is not ready, apnType = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 174
    const/4 v1, 0x1

    return v1

    .line 178
    :cond_2e
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v2

    .line 180
    .local v2, "iApn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v2, :cond_4d

    .line 181
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "apn is null, apnType = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 182
    return v1

    .line 185
    :cond_4d
    invoke-interface {v2, p2}, Lcom/lge/ims/common/agents/dcmif/IApn;->connect(I)Z

    move-result v1

    return v1
.end method

.method public disconnect(III)V
    .registers 5
    .param p1, "apnType"  # I
    .param p2, "nTimeAfterRecover"  # I
    .param p3, "ipcanType"  # I

    .line 191
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    .line 193
    .local v0, "iApn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v0, :cond_7

    .line 194
    return-void

    .line 197
    :cond_7
    invoke-interface {v0, p3, p2}, Lcom/lge/ims/common/agents/dcmif/IApn;->disconnect(II)V

    .line 198
    return-void
.end method

.method public getApn(I)Ljava/lang/String;
    .registers 7
    .param p1, "apnType"  # I

    .line 229
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const/16 v1, 0x16

    invoke-static {v1, v0}, Lcom/lge/ims/common/agents/AgentFactory;->getAgent(II)Lcom/lge/ims/common/agents/agentif/IAgent;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/agentif/IIMSPhoneAgent;

    .line 231
    .local v0, "ipa":Lcom/lge/ims/common/agents/agentif/IIMSPhoneAgent;
    if-eqz v0, :cond_17

    .line 233
    invoke-static {p1}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getPhoneApnTypeFromType(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/lge/ims/common/agents/agentif/IIMSPhoneAgent;->getApn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 234
    .local v1, "apn":Ljava/lang/String;
    if-eqz v1, :cond_17

    .line 235
    return-object v1

    .line 239
    .end local v1  # "apn":Ljava/lang/String;
    :cond_17
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v1

    .line 241
    .local v1, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v1, :cond_1f

    .line 242
    const/4 v2, 0x0

    return-object v2

    .line 245
    :cond_1f
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "apn :: apnType="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", name="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Lcom/lge/ims/common/agents/dcmif/IApn;->getApn()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 247
    invoke-interface {v1}, Lcom/lge/ims/common/agents/dcmif/IApn;->getApn()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;
    .registers 6
    .param p1, "apnType"  # I

    .line 518
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/dcmif/IApn;

    .line 520
    .local v0, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v0, :cond_28

    .line 521
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IApn is null; type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 522
    const/4 v1, 0x0

    return-object v1

    .line 524
    :cond_28
    return-object v0
.end method

.method public getCachedLocalAddress(I)Ljava/lang/String;
    .registers 4
    .param p1, "apnType"  # I

    .line 423
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapLocalIP:Ljava/util/Hashtable;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getDataState(I)I
    .registers 4
    .param p1, "apnType"  # I

    .line 202
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    .line 204
    .local v0, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v0, :cond_c

    .line 205
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/lge/ims/common/agents/dcmif/EDataState;->convertFromTMtoImsType(I)I

    move-result v1

    return v1

    .line 208
    :cond_c
    invoke-interface {v0}, Lcom/lge/ims/common/agents/dcmif/IApn;->getDataState()I

    move-result v1

    invoke-static {v1}, Lcom/lge/ims/common/agents/dcmif/EDataState;->convertFromTMtoImsType(I)I

    move-result v1

    return v1
.end method

.method public getHostByName(IILjava/lang/String;)[Ljava/lang/String;
    .registers 11
    .param p1, "apnType"  # I
    .param p2, "ipVersion"  # I
    .param p3, "host"  # Ljava/lang/String;

    .line 252
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 253
    return-object v1

    .line 256
    :cond_6
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getNetworkByCapability(I)Landroid/net/Network;

    move-result-object v0

    .line 258
    .local v0, "nw":Landroid/net/Network;
    if-nez v0, :cond_25

    .line 259
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Network is null, apnType = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 260
    return-object v1

    .line 263
    :cond_25
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Network :: netId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/net/Network;->getNetId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 265
    const/4 v2, 0x0

    .line 268
    .local v2, "inetAddrs":[Ljava/net/InetAddress;
    :try_start_42
    invoke-virtual {v0, p3}, Landroid/net/Network;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v3
    :try_end_46
    .catch Ljava/net/UnknownHostException; {:try_start_42 .. :try_end_46} :catch_48

    move-object v2, v3

    .line 271
    goto :goto_65

    .line 269
    :catch_48
    move-exception v3

    .line 270
    .local v3, "e":Ljava/net/UnknownHostException;
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "UnknownHostException :: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/net/UnknownHostException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->e(ILjava/lang/String;)V

    .line 273
    .end local v3  # "e":Ljava/net/UnknownHostException;
    :goto_65
    if-nez v2, :cond_80

    .line 274
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "InetAddress[] is null, apnType = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 275
    return-object v1

    .line 278
    :cond_80
    array-length v3, v2

    if-nez v3, :cond_9c

    .line 279
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "InetAddress[] is zero-length, apnType = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 280
    return-object v1

    .line 283
    :cond_9c
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 285
    .local v3, "ipAddrs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v4

    if-ne p2, v4, :cond_c0

    .line 286
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_aa
    array-length v5, v2

    if-ge v4, v5, :cond_bf

    .line 287
    aget-object v5, v2, v4

    instance-of v5, v5, Ljava/net/Inet4Address;

    if-eqz v5, :cond_bc

    .line 288
    aget-object v5, v2, v4

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 286
    :cond_bc
    add-int/lit8 v4, v4, 0x1

    goto :goto_aa

    .end local v4  # "i":I
    :cond_bf
    goto :goto_d6

    .line 292
    :cond_c0
    const/4 v4, 0x0

    .restart local v4  # "i":I
    :goto_c1
    array-length v5, v2

    if-ge v4, v5, :cond_d6

    .line 293
    aget-object v5, v2, v4

    instance-of v5, v5, Ljava/net/Inet6Address;

    if-eqz v5, :cond_d3

    .line 294
    aget-object v5, v2, v4

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    :cond_d3
    add-int/lit8 v4, v4, 0x1

    goto :goto_c1

    .line 299
    .end local v4  # "i":I
    :cond_d6
    :goto_d6
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "apnType="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", ipVersion="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", size="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 300
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 299
    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 302
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_10d

    .line 303
    return-object v1

    .line 306
    :cond_10d
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1
.end method

.method public getIfaceId(I)I
    .registers 7
    .param p1, "apnType"  # I

    .line 311
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const/4 v1, -0x1

    if-nez v0, :cond_6

    .line 312
    return v1

    .line 315
    :cond_6
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getNetworkByCapability(I)Landroid/net/Network;

    move-result-object v0

    .line 317
    .local v0, "nw":Landroid/net/Network;
    if-nez v0, :cond_25

    .line 318
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Network is null, apnType = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 319
    return v1

    .line 322
    :cond_25
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Network :: apnType="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", netId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/net/Network;->getNetId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 324
    invoke-virtual {v0}, Landroid/net/Network;->getNetId()I

    move-result v1

    return v1
.end method

.method public getIfaceName(I)Ljava/lang/String;
    .registers 9
    .param p1, "apnType"  # I

    .line 330
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 331
    return-object v1

    .line 334
    :cond_6
    nop

    .line 335
    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 336
    .local v0, "cm":Landroid/net/ConnectivityManager;
    if-nez v0, :cond_12

    .line 337
    return-object v1

    .line 340
    :cond_12
    invoke-direct {p0, p1, v0}, Lcom/lge/ims/common/agents/dcm/DCApn;->getLinkProperties(ILandroid/net/ConnectivityManager;)Landroid/net/LinkProperties;

    move-result-object v2

    .line 341
    .local v2, "linkProperties":Landroid/net/LinkProperties;
    if-nez v2, :cond_31

    .line 342
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LinkProperties is null, apnType = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 343
    return-object v1

    .line 346
    :cond_31
    invoke-virtual {v2}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v3

    .line 347
    .local v3, "ifaceName":Ljava/lang/String;
    if-nez v3, :cond_50

    .line 348
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ifaceName is null, apnType = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 349
    return-object v1

    .line 352
    :cond_50
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NetworkInterface :: apnType="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", name="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 354
    return-object v3
.end method

.method public getIpcanCategory(I)I
    .registers 4
    .param p1, "apnType"  # I

    .line 360
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    .line 361
    .local v0, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-eqz v0, :cond_b

    invoke-interface {v0}, Lcom/lge/ims/common/agents/dcmif/IApn;->getIpcanCategory()I

    move-result v1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    return v1
.end method

.method public getLocalAddress(II)Ljava/lang/String;
    .registers 11
    .param p1, "apnType"  # I
    .param p2, "ipVersion"  # I

    .line 366
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 367
    return-object v1

    .line 370
    :cond_6
    const/4 v0, 0x0

    .line 376
    .local v0, "ipCacheRequired":Z
    const/4 v2, -0x1

    if-ne p2, v2, :cond_13

    .line 377
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v3, "cache is required"

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 378
    const/4 v0, 0x1

    .line 379
    const/4 p2, 0x0

    .line 382
    :cond_13
    if-nez p2, :cond_19

    .line 384
    invoke-direct {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getIpVersion(I)I

    move-result p2

    .line 388
    :cond_19
    iget-object v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    .line 389
    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 390
    .local v2, "cm":Landroid/net/ConnectivityManager;
    if-nez v2, :cond_26

    .line 391
    return-object v1

    .line 394
    :cond_26
    invoke-direct {p0, p1, v2}, Lcom/lge/ims/common/agents/dcm/DCApn;->getLinkProperties(ILandroid/net/ConnectivityManager;)Landroid/net/LinkProperties;

    move-result-object v3

    .line 395
    .local v3, "linkProperties":Landroid/net/LinkProperties;
    if-nez v3, :cond_45

    .line 396
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LinkProperties is null, apnType = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 397
    return-object v1

    .line 400
    :cond_45
    invoke-virtual {v3}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    move-result-object v4

    .line 401
    .local v4, "linkAddresses":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/net/LinkAddress;>;"
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_68

    .line 402
    iget v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LinkAddresses is empty, apnType = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 403
    return-object v1

    .line 406
    :cond_68
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LinkAddress :: apnType="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", size="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 408
    invoke-direct {p0, v4, p2}, Lcom/lge/ims/common/agents/dcm/DCApn;->getIPAddress(Ljava/util/Collection;I)Ljava/lang/String;

    move-result-object v1

    .line 410
    .local v1, "ip":Ljava/lang/String;
    if-eqz v0, :cond_a9

    .line 411
    if-nez v1, :cond_a0

    .line 412
    iget-object v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapLocalIP:Ljava/util/Hashtable;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a9

    .line 414
    :cond_a0
    iget-object v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapLocalIP:Ljava/util/Hashtable;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    :cond_a9
    :goto_a9
    return-object v1
.end method

.method public getMtu(I)I
    .registers 8
    .param p1, "apnType"  # I

    .line 454
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 455
    return v1

    .line 458
    :cond_6
    nop

    .line 459
    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 461
    .local v0, "cm":Landroid/net/ConnectivityManager;
    if-nez v0, :cond_12

    .line 462
    return v1

    .line 465
    :cond_12
    invoke-direct {p0, p1, v0}, Lcom/lge/ims/common/agents/dcm/DCApn;->getLinkProperties(ILandroid/net/ConnectivityManager;)Landroid/net/LinkProperties;

    move-result-object v2

    .line 467
    .local v2, "linkProperties":Landroid/net/LinkProperties;
    if-nez v2, :cond_31

    .line 468
    iget v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LinkProperties is null, apnType = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 469
    return v1

    .line 472
    :cond_31
    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MTU = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/LinkProperties;->getMtu()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", apnType = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 474
    invoke-virtual {v2}, Landroid/net/LinkProperties;->getMtu()I

    move-result v1

    return v1
.end method

.method public getNetworkByCapability(I)Landroid/net/Network;
    .registers 13
    .param p1, "apnType"  # I

    .line 529
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    .line 530
    return-object v1

    .line 533
    :cond_6
    sget-object v0, Lcom/lge/ims/common/agents/dcmif/EApnType;->WIFI:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v0}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v0

    if-ne v0, p1, :cond_1f

    .line 534
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const-string v2, "wifi"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 535
    .local v0, "wm":Landroid/net/wifi/WifiManager;
    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getCurrentNetwork()Landroid/net/Network;

    move-result-object v1

    :cond_1e
    return-object v1

    .line 536
    .end local v0  # "wm":Landroid/net/wifi/WifiManager;
    :cond_1f
    sget-object v0, Lcom/lge/ims/common/agents/dcmif/EApnType;->INTERNET:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v0}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v0

    const/4 v2, 0x0

    if-ne v0, p1, :cond_2d

    .line 537
    invoke-virtual {p0, p1, v2}, Lcom/lge/ims/common/agents/dcm/DCApn;->getNetworkByCapabilityWithTransportType(II)Landroid/net/Network;

    move-result-object v0

    return-object v0

    .line 541
    :cond_2d
    invoke-static {p1}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getNetCapabilityFromType(I)I

    move-result v0

    .line 543
    .local v0, "netCapaType":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_4d

    .line 544
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "no network capability type for the apn = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 545
    return-object v1

    .line 549
    :cond_4d
    iget-object v3, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    .line 550
    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    .line 552
    .local v3, "cm":Landroid/net/ConnectivityManager;
    if-nez v3, :cond_5a

    .line 553
    return-object v1

    .line 556
    :cond_5a
    invoke-virtual {v3}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v4

    .line 557
    .local v4, "nws":[Landroid/net/Network;
    if-nez v4, :cond_68

    .line 558
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v5, "networks are null"

    invoke-static {v2, v5}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 559
    return-object v1

    .line 562
    :cond_68
    const/4 v1, 0x0

    .line 564
    .local v1, "network":Landroid/net/Network;
    array-length v5, v4

    :goto_6a
    if-ge v2, v5, :cond_aa

    aget-object v6, v4, v2

    .line 565
    .local v6, "nw":Landroid/net/Network;
    invoke-virtual {v3, v6}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v7

    .line 567
    .local v7, "networkCapability":Landroid/net/NetworkCapabilities;
    if-eqz v7, :cond_a7

    .line 568
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v8

    if-eqz v8, :cond_9f

    .line 569
    invoke-virtual {v7}, Landroid/net/NetworkCapabilities;->getNetworkSpecifier()Landroid/net/NetworkSpecifier;

    move-result-object v8

    .line 571
    .local v8, "ns":Landroid/net/NetworkSpecifier;
    if-nez v8, :cond_81

    .line 572
    goto :goto_a7

    .line 575
    :cond_81
    instance-of v9, v8, Landroid/net/TelephonyNetworkSpecifier;

    if-eqz v9, :cond_a7

    .line 576
    new-instance v9, Landroid/net/TelephonyNetworkSpecifier$Builder;

    invoke-direct {v9}, Landroid/net/TelephonyNetworkSpecifier$Builder;-><init>()V

    iget v10, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    .line 577
    invoke-static {v10}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/net/TelephonyNetworkSpecifier$Builder;->setSubscriptionId(I)Landroid/net/TelephonyNetworkSpecifier$Builder;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/TelephonyNetworkSpecifier$Builder;->build()Landroid/net/TelephonyNetworkSpecifier;

    move-result-object v9

    .line 579
    .local v9, "tns":Landroid/net/TelephonyNetworkSpecifier;
    invoke-virtual {v9, v8}, Landroid/net/TelephonyNetworkSpecifier;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_9f

    .line 580
    goto :goto_a7

    .line 587
    .end local v8  # "ns":Landroid/net/NetworkSpecifier;
    .end local v9  # "tns":Landroid/net/TelephonyNetworkSpecifier;
    :cond_9f
    invoke-virtual {v7, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v8

    if-eqz v8, :cond_a7

    .line 588
    move-object v1, v6

    .line 589
    goto :goto_aa

    .line 564
    .end local v6  # "nw":Landroid/net/Network;
    .end local v7  # "networkCapability":Landroid/net/NetworkCapabilities;
    :cond_a7
    :goto_a7
    add-int/lit8 v2, v2, 0x1

    goto :goto_6a

    .line 594
    :cond_aa
    :goto_aa
    return-object v1
.end method

.method public getNetworkByCapabilityWithTransportType(II)Landroid/net/Network;
    .registers 14
    .param p1, "apnType"  # I
    .param p2, "transportType"  # I

    .line 599
    const/4 v0, 0x0

    .line 601
    .local v0, "network":Landroid/net/Network;
    iget-object v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    if-nez v1, :cond_7

    .line 602
    return-object v2

    .line 605
    :cond_7
    nop

    .line 606
    const-string v3, "connectivity"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 608
    .local v1, "cm":Landroid/net/ConnectivityManager;
    if-nez v1, :cond_13

    .line 609
    return-object v2

    .line 612
    :cond_13
    invoke-static {p1}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getNetCapabilityFromType(I)I

    move-result v3

    .line 614
    .local v3, "netCapaType":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_33

    .line 615
    iget v4, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no network capability type for the apn = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 616
    return-object v2

    .line 619
    :cond_33
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v4

    .line 620
    .local v4, "nws":[Landroid/net/Network;
    if-nez v4, :cond_41

    .line 621
    iget v5, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v6, "networks are null"

    invoke-static {v5, v6}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 622
    return-object v2

    .line 625
    :cond_41
    array-length v2, v4

    const/4 v5, 0x0

    :goto_43
    if-ge v5, v2, :cond_8c

    aget-object v6, v4, v5

    .line 626
    .local v6, "nw":Landroid/net/Network;
    invoke-virtual {v1, v6}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v7

    .line 628
    .local v7, "networkCapability":Landroid/net/NetworkCapabilities;
    if-eqz v7, :cond_89

    .line 629
    invoke-static {}, Lcom/lge/ims/common/util/MSimUtils;->isMultiSimEnabled()Z

    move-result v8

    if-eqz v8, :cond_7b

    const/4 v8, 0x1

    if-eq p2, v8, :cond_7b

    .line 630
    invoke-virtual {v7}, Landroid/net/NetworkCapabilities;->getNetworkSpecifier()Landroid/net/NetworkSpecifier;

    move-result-object v8

    .line 632
    .local v8, "ns":Landroid/net/NetworkSpecifier;
    if-nez v8, :cond_5d

    .line 633
    goto :goto_89

    .line 636
    :cond_5d
    instance-of v9, v8, Landroid/net/TelephonyNetworkSpecifier;

    if-eqz v9, :cond_89

    .line 637
    new-instance v9, Landroid/net/TelephonyNetworkSpecifier$Builder;

    invoke-direct {v9}, Landroid/net/TelephonyNetworkSpecifier$Builder;-><init>()V

    iget v10, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    .line 638
    invoke-static {v10}, Lcom/lge/ims/common/util/MSimUtils;->getSubId(I)I

    move-result v10

    invoke-virtual {v9, v10}, Landroid/net/TelephonyNetworkSpecifier$Builder;->setSubscriptionId(I)Landroid/net/TelephonyNetworkSpecifier$Builder;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/TelephonyNetworkSpecifier$Builder;->build()Landroid/net/TelephonyNetworkSpecifier;

    move-result-object v9

    .line 640
    .local v9, "tns":Landroid/net/TelephonyNetworkSpecifier;
    invoke-virtual {v9, v8}, Landroid/net/TelephonyNetworkSpecifier;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7b

    .line 641
    goto :goto_89

    .line 648
    .end local v8  # "ns":Landroid/net/NetworkSpecifier;
    .end local v9  # "tns":Landroid/net/TelephonyNetworkSpecifier;
    :cond_7b
    invoke-virtual {v7, v3}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v8

    if-eqz v8, :cond_89

    .line 649
    invoke-virtual {v7, p2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v8

    if-eqz v8, :cond_89

    .line 650
    move-object v0, v6

    .line 651
    goto :goto_8c

    .line 625
    .end local v6  # "nw":Landroid/net/Network;
    .end local v7  # "networkCapability":Landroid/net/NetworkCapabilities;
    :cond_89
    :goto_89
    add-int/lit8 v5, v5, 0x1

    goto :goto_43

    .line 657
    :cond_8c
    :goto_8c
    return-object v0
.end method

.method public getPcscfAddress(II)[Ljava/lang/String;
    .registers 6
    .param p1, "apnType"  # I
    .param p2, "ipVersion"  # I

    .line 429
    if-nez p2, :cond_6

    .line 431
    invoke-direct {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getIpVersion(I)I

    move-result p2

    .line 434
    :cond_6
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "P-CSCF address(PCO) :: apnType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 435
    invoke-static {p1}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getPhoneApnTypeFromType(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", ipVersion="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 434
    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 437
    invoke-direct {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getPcscfAddress(I)[Ljava/lang/String;

    move-result-object v0

    .line 438
    .local v0, "pcscfAddresses":[Ljava/lang/String;
    invoke-direct {p0, v0, p2}, Lcom/lge/ims/common/agents/dcm/DCApn;->getValidAddresses([Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 440
    .local v1, "validAddresses":[Ljava/lang/String;
    if-eqz v1, :cond_39

    array-length v2, v1

    if-nez v2, :cond_5e

    .line 441
    :cond_39
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4V6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v2

    if-ne p2, v2, :cond_4c

    .line 442
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v2

    invoke-direct {p0, v0, v2}, Lcom/lge/ims/common/agents/dcm/DCApn;->getValidAddresses([Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    goto :goto_5e

    .line 443
    :cond_4c
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV6V4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v2

    if-ne p2, v2, :cond_5e

    .line 444
    sget-object v2, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->IPV4:Lcom/lge/ims/common/agents/dcmif/EIpVersion;

    invoke-virtual {v2}, Lcom/lge/ims/common/agents/dcmif/EIpVersion;->getInt()I

    move-result v2

    invoke-direct {p0, v0, v2}, Lcom/lge/ims/common/agents/dcm/DCApn;->getValidAddresses([Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 448
    :cond_5e
    :goto_5e
    return-object v1
.end method

.method public init(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"  # Landroid/content/Context;

    .line 123
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->d(ILjava/lang/String;)V

    .line 125
    if-nez p1, :cond_a

    .line 126
    return-void

    .line 129
    :cond_a
    iput-object p1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    .line 131
    const/4 v0, 0x3

    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-static {v0, v1}, Lcom/lge/ims/common/agents/dcm/DCFactory;->getDC(II)Lcom/lge/ims/common/agents/dcmif/IDC;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/dcmif/IDCSettings;

    iput-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCSettings:Lcom/lge/ims/common/agents/dcmif/IDCSettings;

    .line 132
    if-nez v0, :cond_20

    .line 133
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v1, "IDCSettings is null"

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 136
    :cond_20
    const/4 v0, 0x4

    iget v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    invoke-static {v0, v1}, Lcom/lge/ims/common/agents/dcm/DCFactory;->getDC(II)Lcom/lge/ims/common/agents/dcmif/IDC;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/dcmif/IDCNetWatcher;

    iput-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCNetWatcher:Lcom/lge/ims/common/agents/dcmif/IDCNetWatcher;

    .line 137
    if-nez v0, :cond_34

    .line 138
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v1, "IDCNetWatcher is null"

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 141
    :cond_34
    invoke-direct {p0}, Lcom/lge/ims/common/agents/dcm/DCApn;->apnFactory()V

    .line 143
    new-instance v0, Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;

    invoke-direct {v0, p0}, Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;-><init>(Lcom/lge/ims/common/agents/dcm/DCApn;)V

    iput-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mDCApnReceiver:Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;

    .line 144
    iget-object v1, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Lcom/lge/ims/common/agents/dcm/DCApn$DCApnReceiver;->getFilter()Landroid/content/IntentFilter;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 145
    return-void
.end method

.method public isApnSupported(I)Z
    .registers 3
    .param p1, "apnType"  # I

    .line 224
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public isConnected(I)Z
    .registers 4
    .param p1, "apnType"  # I

    .line 213
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    .line 215
    .local v0, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v0, :cond_8

    .line 216
    const/4 v1, 0x0

    return v1

    .line 219
    :cond_8
    invoke-interface {v0}, Lcom/lge/ims/common/agents/dcmif/IApn;->isConnected()Z

    move-result v1

    return v1
.end method

.method public notifyIPCanChange(II)V
    .registers 4
    .param p1, "apnType"  # I
    .param p2, "ipcanType"  # I

    .line 683
    invoke-virtual {p0, p1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v0

    .line 684
    .local v0, "iApn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v0, :cond_7

    return-void

    .line 686
    :cond_7
    invoke-interface {v0, p2}, Lcom/lge/ims/common/agents/dcmif/IApn;->notifyIPCanChange(I)V

    .line 687
    return-void
.end method

.method public setApn(ILcom/lge/ims/common/agents/dcmif/IApn;)V
    .registers 6
    .param p1, "apnType"  # I
    .param p2, "apn"  # Lcom/lge/ims/common/agents/dcmif/IApn;

    .line 506
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "apnType : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 508
    if-nez p2, :cond_22

    .line 509
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v1, "Apn is null"

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 510
    return-void

    .line 513
    :cond_22
    iget-object v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mapApn:Ljava/util/Hashtable;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    return-void
.end method

.method public setIMSBootComplete()V
    .registers 6

    .line 479
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const-string v1, "native boot is completed"

    invoke-static {v0, v1}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 481
    iget v0, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    const/16 v1, 0xb

    invoke-static {v1, v0}, Lcom/lge/ims/common/agents/AgentFactory;->getAgent(II)Lcom/lge/ims/common/agents/agentif/IAgent;

    move-result-object v0

    check-cast v0, Lcom/lge/ims/common/agents/agentif/ISharedState;

    .line 483
    .local v0, "ss":Lcom/lge/ims/common/agents/agentif/ISharedState;
    if-nez v0, :cond_14

    .line 484
    return-void

    .line 487
    :cond_14
    invoke-interface {v0}, Lcom/lge/ims/common/agents/agentif/ISharedState;->isNativeBootCompleted()Z

    move-result v1

    if-nez v1, :cond_6c

    .line 488
    sget-object v1, Lcom/lge/ims/common/agents/dcmif/EApnType;->IMS:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v1}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/lge/ims/common/agents/dcm/DCApn;->getApnControl(I)Lcom/lge/ims/common/agents/dcmif/IApn;

    move-result-object v1

    .line 491
    .local v1, "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    if-nez v1, :cond_45

    .line 492
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Apn is not supported; apn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/lge/ims/common/agents/dcmif/EApnType;->IMS:Lcom/lge/ims/common/agents/dcmif/EApnType;

    invoke-virtual {v4}, Lcom/lge/ims/common/agents/dcmif/EApnType;->getType()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->w(ILjava/lang/String;)V

    .line 493
    return-void

    .line 495
    :cond_45
    iget v2, p0, Lcom/lge/ims/common/agents/dcm/DCApn;->mSlotId:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Apn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/lge/ims/common/log/ImsLog;->i(ILjava/lang/String;)V

    .line 497
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .line 498
    .local v2, "msg":Landroid/os/Message;
    const/16 v3, 0x67

    iput v3, v2, Landroid/os/Message;->what:I

    .line 500
    invoke-interface {v1, v2}, Lcom/lge/ims/common/agents/dcmif/IApn;->sendMessage(Landroid/os/Message;)Z

    .line 502
    .end local v1  # "apn":Lcom/lge/ims/common/agents/dcmif/IApn;
    .end local v2  # "msg":Landroid/os/Message;
    :cond_6c
    return-void
.end method
