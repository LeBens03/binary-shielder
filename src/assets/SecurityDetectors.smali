.class public final Lcom/example/test_app/SecurityDetectors;
.super Ljava/lang/Object;
.source "SecurityDetectors.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/test_app/SecurityDetectors$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSecurityDetectors.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SecurityDetectors.kt\ncom/example/test_app/SecurityDetectors\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,397:1\n12574#2,2:398\n12574#2,2:400\n12574#2,2:402\n*S KotlinDebug\n*F\n+ 1 SecurityDetectors.kt\ncom/example/test_app/SecurityDetectors\n*L\n161#1:398,2\n184#1:400,2\n312#1:402,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0006\u0010\u0006\u001a\u00020\u0007J\u0006\u0010\u0008\u001a\u00020\u0007J\u0006\u0010\t\u001a\u00020\u0007J\u0008\u0010\n\u001a\u00020\u0007H\u0002J\u0008\u0010\u000b\u001a\u00020\u0007H\u0002J\u0008\u0010\u000c\u001a\u00020\u0007H\u0002J\u0008\u0010\r\u001a\u00020\u0007H\u0002J\u0008\u0010\u000e\u001a\u00020\u0007H\u0002J\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0011\u001a\u00020\u0010H\u0002J\u0006\u0010\u0012\u001a\u00020\u0007J\u0008\u0010\u0013\u001a\u00020\u0007H\u0002J\u0008\u0010\u0014\u001a\u00020\u0007H\u0002J\u0008\u0010\u0015\u001a\u00020\u0007H\u0002J\u0008\u0010\u0016\u001a\u00020\u0007H\u0002J\u0006\u0010\u0017\u001a\u00020\u0018R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/example/test_app/SecurityDetectors;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "isDebuggerAttached",
        "",
        "isDeveloperModeEnabled",
        "isDeviceRooted",
        "checkRootBinaries",
        "checkRootManagementApps",
        "checkSuExists",
        "checkTestKeys",
        "checkDangerousProperties",
        "getSystemProperty",
        "",
        "key",
        "isEmulator",
        "checkBuildProperties",
        "checkEmulatorFiles",
        "checkOperatorName",
        "checkHardwareFeatures",
        "checkAllVectors",
        "Lcom/example/test_app/SecurityStatus;",
        "Companion",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I

.field public static final Companion:Lcom/example/test_app/SecurityDetectors$Companion;

.field private static final TAG:Ljava/lang/String; = "SecurityCheck"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/example/test_app/SecurityDetectors$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/example/test_app/SecurityDetectors$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/example/test_app/SecurityDetectors;->Companion:Lcom/example/test_app/SecurityDetectors$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/example/test_app/SecurityDetectors;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/test_app/SecurityDetectors;->context:Landroid/content/Context;

    return-void
.end method

.method private final checkBuildProperties()Z
    .locals 10

    .line 267
    nop

    .line 260
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 261
    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 262
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 263
    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 264
    sget-object v4, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 265
    sget-object v5, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 266
    sget-object v6, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "toLowerCase(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 267
    nop

    .line 259
    nop

    .line 269
    .local v0, "buildDetails":Ljava/lang/String;
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v2, "generic"

    move-object v3, v2

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    invoke-static {v1, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 270
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v3, "unknown"

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v1, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 271
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v3, "emulator"

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v1, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 272
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v3, "sdk"

    move-object v7, v3

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {v1, v7, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 273
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v7, "genymotion"

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {v1, v7, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 274
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v7, "x86"

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {v1, v7, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 275
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v7, "goldfish"

    move-object v8, v7

    check-cast v8, Ljava/lang/CharSequence;

    invoke-static {v1, v8, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 276
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v8, "ranchu"

    move-object v9, v8

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v1, v9, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 277
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v9, "test-keys"

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v1, v9, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 278
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v9, "vbox"

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v1, v9, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 279
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const-string v9, "nox"

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v1, v9, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 280
    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 281
    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-static {v1, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 282
    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    const-string v7, "vbox86"

    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 283
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 284
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    const-string v3, "google_sdk"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 285
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    const-string v3, "sdk_x86"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 286
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v3, "MODEL"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    const-string v7, "Emulator"

    check-cast v7, Ljava/lang/CharSequence;

    invoke-static {v1, v7, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 287
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    const-string v3, "Android SDK built for x86"

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v1, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 288
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v3, "MANUFACTURER"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    const-string v3, "Genymotion"

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v1, v3, v4, v5, v6}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 289
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v3, "BRAND"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1, v2, v4, v5, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v3, "DEVICE"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1, v2, v4, v5, v6}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v4, 0x1

    .line 269
    :cond_1
    return v4
.end method

.method private final checkDangerousProperties()Z
    .locals 3

    .line 221
    const-string v0, "ro.debuggable"

    invoke-direct {p0, v0}, Lcom/example/test_app/SecurityDetectors;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 222
    .local v0, "debuggable":Ljava/lang/String;
    const-string v1, "ro.secure"

    invoke-direct {p0, v1}, Lcom/example/test_app/SecurityDetectors;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 224
    .local v1, "secure":Ljava/lang/String;
    const-string v2, "1"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "0"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    :goto_1
    return v2
.end method

.method private final checkEmulatorFiles()Z
    .locals 11

    .line 298
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "/dev/socket/qemud"

    aput-object v2, v0, v1

    .line 299
    const/4 v3, 0x1

    const-string v4, "/dev/qemu_pipe"

    aput-object v4, v0, v3

    .line 298
    nop

    .line 301
    const-string v5, "/dev/socket/genyd"

    const/4 v6, 0x2

    aput-object v5, v0, v6

    .line 298
    nop

    .line 302
    const-string v5, "/dev/socket/baseband_genyd"

    const/4 v6, 0x3

    aput-object v5, v0, v6

    .line 298
    nop

    .line 304
    const-string v5, "/system/lib/libc_malloc_debug_qemu.so"

    const/4 v6, 0x4

    aput-object v5, v0, v6

    .line 298
    nop

    .line 305
    const-string v5, "/sys/qemu_trace"

    const/4 v6, 0x5

    aput-object v5, v0, v6

    .line 298
    nop

    .line 306
    const-string v5, "/system/bin/qemu-props"

    const/4 v6, 0x6

    aput-object v5, v0, v6

    .line 298
    nop

    .line 308
    const/4 v5, 0x7

    aput-object v2, v0, v5

    .line 298
    nop

    .line 309
    const/16 v2, 0x8

    aput-object v4, v0, v2

    .line 298
    nop

    .line 296
    nop

    .line 312
    .local v0, "emulatorFiles":[Ljava/lang/String;
    move-object v2, v0

    .local v2, "$this$any\\1":[Ljava/lang/Object;
    const/4 v4, 0x0

    .line 402
    .local v4, "$i$f$any\\1\\312":I
    array-length v5, v2

    move v6, v1

    :goto_0
    if-ge v6, v5, :cond_1

    aget-object v7, v2, v6

    .local v7, "element\\1":Ljava/lang/Object;
    move-object v8, v7

    .local v8, "path\\2":Ljava/lang/String;
    const/4 v9, 0x0

    .line 313
    .local v9, "$i$a$-any-SecurityDetectors$checkEmulatorFiles$1\\2\\402\\0":I
    nop

    .line 314
    :try_start_0
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 315
    :catch_0
    move-exception v10

    .line 316
    .local v10, "<unused var>\\2":Ljava/lang/Exception;
    move v10, v1

    .line 317
    .end local v10    # "<unused var>\\2":Ljava/lang/Exception;
    :goto_1
    nop

    .line 402
    .end local v8    # "path\\2":Ljava/lang/String;
    .end local v9    # "$i$a$-any-SecurityDetectors$checkEmulatorFiles$1\\2\\402\\0":I
    if-eqz v10, :cond_0

    move v1, v3

    goto :goto_2

    .end local v7    # "element\\1":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 403
    :cond_1
    nop

    .line 312
    .end local v2    # "$this$any\\1":[Ljava/lang/Object;
    .end local v4    # "$i$f$any\\1\\312":I
    :goto_2
    return v1
.end method

.method private final checkHardwareFeatures()Z
    .locals 3

    .line 341
    nop

    .line 343
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/example/test_app/SecurityDetectors;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "android.hardware.camera"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 344
    iget-object v1, p0, Lcom/example/test_app/SecurityDetectors;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "android.hardware.bluetooth"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 345
    :catch_0
    move-exception v1

    .line 346
    .local v1, "<unused var>":Ljava/lang/Exception;
    nop

    .line 341
    .end local v1    # "<unused var>":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return v0
.end method

.method private final checkOperatorName()Z
    .locals 7

    .line 325
    nop

    .line 326
    const/4 v0, 0x0

    :try_start_0
    const-class v1, Landroid/telephony/TelephonyManager;

    .line 327
    const-string v2, "getNetworkOperatorName"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 326
    nop

    .line 328
    .local v1, "operatorName":Ljava/lang/reflect/Method;
    nop

    .line 329
    iget-object v2, p0, Lcom/example/test_app/SecurityDetectors;->context:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    new-array v3, v0, [Ljava/lang/Object;

    .line 328
    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Ljava/lang/String;

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    check-cast v2, Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v2, v4

    .line 331
    .local v2, "networkOperator":Ljava/lang/String;
    :goto_0
    if-eqz v2, :cond_1

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "toLowerCase(...)"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v3, :cond_1

    check-cast v3, Ljava/lang/CharSequence;

    const-string v5, "android"

    check-cast v5, Ljava/lang/CharSequence;

    const/4 v6, 0x2

    invoke-static {v3, v5, v0, v6, v4}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    move v0, v4

    goto :goto_1

    .line 332
    .end local v1    # "operatorName":Ljava/lang/reflect/Method;
    .end local v2    # "networkOperator":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 333
    .local v1, "<unused var>":Ljava/lang/Exception;
    nop

    .line 325
    .end local v1    # "<unused var>":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return v0
.end method

.method private final checkRootBinaries()Z
    .locals 11

    .line 149
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "/system/app/Superuser.apk"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 150
    const-string v1, "/sbin/su"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    .line 149
    nop

    .line 151
    const-string v1, "/system/bin/su"

    const/4 v4, 0x2

    aput-object v1, v0, v4

    .line 149
    nop

    .line 152
    const-string v1, "/system/xbin/su"

    const/4 v4, 0x3

    aput-object v1, v0, v4

    .line 149
    nop

    .line 153
    const-string v1, "/data/local/xbin/su"

    const/4 v4, 0x4

    aput-object v1, v0, v4

    .line 149
    nop

    .line 154
    const-string v1, "/data/local/bin/su"

    const/4 v4, 0x5

    aput-object v1, v0, v4

    .line 149
    nop

    .line 155
    const-string v1, "/system/sd/xbin/su"

    const/4 v4, 0x6

    aput-object v1, v0, v4

    .line 149
    nop

    .line 156
    const-string v1, "/system/bin/failsafe/su"

    const/4 v4, 0x7

    aput-object v1, v0, v4

    .line 149
    nop

    .line 157
    const-string v1, "/data/local/su"

    const/16 v4, 0x8

    aput-object v1, v0, v4

    .line 149
    nop

    .line 158
    const-string v1, "/su/bin/su"

    const/16 v4, 0x9

    aput-object v1, v0, v4

    .line 149
    nop

    .line 148
    nop

    .line 161
    .local v0, "suPaths":[Ljava/lang/String;
    move-object v1, v0

    .local v1, "$this$any\\1":[Ljava/lang/Object;
    const/4 v4, 0x0

    .line 398
    .local v4, "$i$f$any\\1\\161":I
    array-length v5, v1

    move v6, v2

    :goto_0
    if-ge v6, v5, :cond_1

    aget-object v7, v1, v6

    .local v7, "element\\1":Ljava/lang/Object;
    move-object v8, v7

    .local v8, "path\\2":Ljava/lang/String;
    const/4 v9, 0x0

    .line 162
    .local v9, "$i$a$-any-SecurityDetectors$checkRootBinaries$1\\2\\398\\0":I
    nop

    .line 163
    :try_start_0
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 164
    :catch_0
    move-exception v10

    .line 165
    .local v10, "<unused var>\\2":Ljava/lang/Exception;
    move v10, v2

    .line 166
    .end local v10    # "<unused var>\\2":Ljava/lang/Exception;
    :goto_1
    nop

    .line 398
    .end local v8    # "path\\2":Ljava/lang/String;
    .end local v9    # "$i$a$-any-SecurityDetectors$checkRootBinaries$1\\2\\398\\0":I
    if-eqz v10, :cond_0

    move v2, v3

    goto :goto_2

    .end local v7    # "element\\1":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 399
    :cond_1
    nop

    .line 161
    .end local v1    # "$this$any\\1":[Ljava/lang/Object;
    .end local v4    # "$i$f$any\\1\\161":I
    :goto_2
    return v2
.end method

.method private final checkRootManagementApps()Z
    .locals 11

    .line 175
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "com.noshufou.android.su"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 176
    const-string v1, "com.noshufou.android.su.elite"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    .line 175
    nop

    .line 177
    const-string v1, "eu.chainfire.supersu"

    const/4 v4, 0x2

    aput-object v1, v0, v4

    .line 175
    nop

    .line 178
    const-string v1, "com.koushikdutta.superuser"

    const/4 v4, 0x3

    aput-object v1, v0, v4

    .line 175
    nop

    .line 179
    const-string v1, "com.thirdparty.superuser"

    const/4 v4, 0x4

    aput-object v1, v0, v4

    .line 175
    nop

    .line 180
    const-string v1, "com.yellowes.su"

    const/4 v4, 0x5

    aput-object v1, v0, v4

    .line 175
    nop

    .line 181
    const-string v1, "com.topjohnwu.magisk"

    const/4 v4, 0x6

    aput-object v1, v0, v4

    .line 175
    nop

    .line 174
    nop

    .line 184
    .local v0, "rootPackages":[Ljava/lang/String;
    move-object v1, v0

    .local v1, "$this$any\\1":[Ljava/lang/Object;
    const/4 v4, 0x0

    .line 400
    .local v4, "$i$f$any\\1\\184":I
    array-length v5, v1

    move v6, v2

    :goto_0
    if-ge v6, v5, :cond_1

    aget-object v7, v1, v6

    .local v7, "element\\1":Ljava/lang/Object;
    move-object v8, v7

    .local v8, "packageName\\2":Ljava/lang/String;
    const/4 v9, 0x0

    .line 185
    .local v9, "$i$a$-any-SecurityDetectors$checkRootManagementApps$1\\2\\400\\0":I
    nop

    .line 186
    :try_start_0
    iget-object v10, p0, Lcom/example/test_app/SecurityDetectors;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v10, v8, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    move v10, v3

    goto :goto_1

    .line 188
    :catch_0
    move-exception v10

    .line 189
    .local v10, "<unused var>\\2":Ljava/lang/Exception;
    move v10, v2

    .line 190
    .end local v10    # "<unused var>\\2":Ljava/lang/Exception;
    :goto_1
    nop

    .line 400
    .end local v8    # "packageName\\2":Ljava/lang/String;
    .end local v9    # "$i$a$-any-SecurityDetectors$checkRootManagementApps$1\\2\\400\\0":I
    if-eqz v10, :cond_0

    move v2, v3

    goto :goto_2

    .end local v7    # "element\\1":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 401
    :cond_1
    nop

    .line 184
    .end local v1    # "$this$any\\1":[Ljava/lang/Object;
    .end local v4    # "$i$f$any\\1\\184":I
    :goto_2
    return v2
.end method

.method private final checkSuExists()Z
    .locals 6

    .line 198
    nop

    .line 199
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "which"

    aput-object v3, v2, v0

    const-string v3, "su"

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    .line 200
    .local v1, "process":Ljava/lang/Process;
    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    const-string v3, "getInputStream(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v3, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    check-cast v5, Ljava/io/Reader;

    instance-of v2, v5, Ljava/io/BufferedReader;

    if-eqz v2, :cond_0

    check-cast v5, Ljava/io/BufferedReader;

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/io/BufferedReader;

    const/16 v3, 0x2000

    invoke-direct {v2, v5, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    move-object v5, v2

    .line 201
    .local v5, "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 202
    .local v2, "suPath":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 203
    if-eqz v2, :cond_2

    move-object v3, v2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v3, :cond_1

    move v3, v4

    goto :goto_1

    :cond_1
    move v3, v0

    :goto_1
    if-ne v3, v4, :cond_2

    move v0, v4

    goto :goto_2

    .line 204
    .end local v1    # "process":Ljava/lang/Process;
    .end local v2    # "suPath":Ljava/lang/String;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 205
    .local v1, "<unused var>":Ljava/lang/Exception;
    nop

    .line 198
    .end local v1    # "<unused var>":Ljava/lang/Exception;
    :cond_2
    :goto_2
    return v0
.end method

.method private final checkTestKeys()Z
    .locals 6

    .line 213
    sget-object v0, Landroid/os/Build;->TAGS:Ljava/lang/String;

    .line 214
    .local v0, "buildTags":Ljava/lang/String;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    const-string v3, "test-keys"

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {v2, v3, v1, v4, v5}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private final getSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .line 231
    nop

    .line 232
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getprop "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    .line 233
    .local v0, "process":Ljava/lang/Process;
    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    const-string v2, "getInputStream(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    check-cast v3, Ljava/io/Reader;

    instance-of v1, v3, Ljava/io/BufferedReader;

    if-eqz v1, :cond_0

    check-cast v3, Ljava/io/BufferedReader;

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/io/BufferedReader;

    const/16 v2, 0x2000

    invoke-direct {v1, v3, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    move-object v3, v1

    .line 234
    .local v3, "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 235
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    nop

    .end local v0    # "process":Ljava/lang/Process;
    .end local v1    # "value":Ljava/lang/String;
    .end local v3    # "reader":Ljava/io/BufferedReader;
    goto :goto_1

    .line 237
    :catch_0
    move-exception v0

    .line 238
    .local v0, "<unused var>":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 231
    .end local v0    # "<unused var>":Ljava/lang/Exception;
    :goto_1
    return-object v1
.end method

.method public static final performSecurityChecks(Landroid/app/Activity;)Lcom/example/test_app/SecurityStatus;
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/example/test_app/SecurityDetectors;->Companion:Lcom/example/test_app/SecurityDetectors$Companion;

    invoke-virtual {v0, p0}, Lcom/example/test_app/SecurityDetectors$Companion;->performSecurityChecks(Landroid/app/Activity;)Lcom/example/test_app/SecurityStatus;

    move-result-object v0

    .line 52
    return-object v0
.end method


# virtual methods
.method public final checkAllVectors()Lcom/example/test_app/SecurityStatus;
    .locals 5

    .line 356
    new-instance v0, Lcom/example/test_app/SecurityStatus;

    .line 357
    invoke-virtual {p0}, Lcom/example/test_app/SecurityDetectors;->isDebuggerAttached()Z

    move-result v1

    .line 358
    invoke-virtual {p0}, Lcom/example/test_app/SecurityDetectors;->isDeveloperModeEnabled()Z

    move-result v2

    .line 359
    invoke-virtual {p0}, Lcom/example/test_app/SecurityDetectors;->isDeviceRooted()Z

    move-result v3

    .line 360
    invoke-virtual {p0}, Lcom/example/test_app/SecurityDetectors;->isEmulator()Z

    move-result v4

    .line 356
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/example/test_app/SecurityStatus;-><init>(ZZZZ)V

    return-object v0
.end method

.method public final isDebuggerAttached()Z
    .locals 2

    .line 96
    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 97
    return v1

    .line 101
    :cond_0
    invoke-static {}, Landroid/os/Debug;->waitingForDebugger()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    return v1

    .line 106
    :cond_1
    iget-object v0, p0, Lcom/example/test_app/SecurityDetectors;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 108
    .local v1, "isDebuggable":Z
    :goto_0
    return v1
.end method

.method public final isDeveloperModeEnabled()Z
    .locals 3

    .line 118
    nop

    .line 120
    nop

    .line 121
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/example/test_app/SecurityDetectors;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 122
    const-string v2, "development_settings_enabled"

    .line 123
    nop

    .line 120
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 125
    :catch_0
    move-exception v1

    .line 126
    .local v1, "<unused var>":Ljava/lang/Exception;
    nop

    .line 118
    .end local v1    # "<unused var>":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return v0
.end method

.method public final isDeviceRooted()Z
    .locals 1

    .line 137
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkRootBinaries()Z

    move-result v0

    if-nez v0, :cond_1

    .line 138
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkRootManagementApps()Z

    move-result v0

    if-nez v0, :cond_1

    .line 139
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkSuExists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 140
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkTestKeys()Z

    move-result v0

    if-nez v0, :cond_1

    .line 141
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkDangerousProperties()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 137
    :goto_1
    return v0
.end method

.method public final isEmulator()Z
    .locals 1

    .line 249
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkBuildProperties()Z

    move-result v0

    if-nez v0, :cond_1

    .line 250
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkEmulatorFiles()Z

    move-result v0

    if-nez v0, :cond_1

    .line 251
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkOperatorName()Z

    move-result v0

    if-nez v0, :cond_1

    .line 252
    invoke-direct {p0}, Lcom/example/test_app/SecurityDetectors;->checkHardwareFeatures()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 249
    :goto_1
    return v0
.end method
