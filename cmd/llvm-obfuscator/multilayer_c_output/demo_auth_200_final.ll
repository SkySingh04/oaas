; ModuleID = '/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/multilayer_c_output/demo_auth_200_cycle1_obfuscated.bc'
source_filename = "/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/multilayer_c_output/demo_auth_200_string_encrypted.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.User = type { [64 x i8], [64 x i8], [64 x i8], i32 }
%struct.Session = type { [64 x i8], [128 x i8], i64, i32 }

@MASTER_PASSWORD = global ptr null, align 8
@API_KEY = global ptr null, align 8
@JWT_SECRET = global ptr null, align 8
@DB_CONNECTION_STRING = global ptr null, align 8
@ENCRYPTION_KEY = global ptr null, align 8
@OAUTH_CLIENT_SECRET = global ptr null, align 8
@LICENSE_KEY = global ptr null, align 8
@BACKUP_ADMIN_PASSWORD = global ptr null, align 8
@v_fbc01149fda7 = global i32 0, align 4
@constinit = private constant [21 x i8] c"\DE\FB\F2\F6\F1\DF\CC\FA\FC\EA\ED\FA\CF\FE\EC\EC\AD\AF\AD\AB\BE", align 1
@constinit.1 = private constant [29 x i8] c"\9E\86\B2\81\84\9B\88\B2\9D\9F\82\89\B2\8C\DE\8B\D5\89\D4\88\D9\8F\DA\8E\DF\8C\DC\8B\DB", align 1
@constinit.2 = private constant [41 x i8] c"\FA\FC\F9\EC\FB\D6\FA\EC\EA\FB\EC\FD\D6\E3\FE\FD\D6\FA\E0\EE\E7\E0\E7\EE\D6\E2\EC\F0\D6\ED\E6\D6\E7\E6\FD\D6\FA\E1\E8\FB\EC", align 1
@constinit.3 = private constant [63 x i8] c"\C6\D9\C5\C2\D1\C4\D3\C5\C7\DA\8C\99\99\D7\D2\DB\DF\D8\8C\F2\F4\E6\D7\C5\C5\84\86\84\82\97\F6\C6\C4\D9\D2\9B\D2\D4\98\D5\D9\DB\C6\D7\D8\CF\98\D5\D9\DB\8C\83\82\85\84\99\D7\C3\C2\DE\E9\D2\D4", align 1
@constinit.4 = private constant [29 x i8] c"\1F\1B\0Dlkhs\13\1F\0D\0A\1B\0Cs\15\1B\07slnljs\0D\1B\1D\0B\0C\1B", align 1
@constinit.5 = private constant [29 x i8] c"\FC\F2\E6\E7\FB\CC\E0\F6\F0\E1\F6\E7\CC\F2\AB\F1\AA\F0\A3\F7\A2\F6\A1\F5\A0\F4\A7\FB\A6", align 1
@constinit.6 = private constant [32 x i8] c"\D3\D8\C2\D3\C4\C6\C4\DF\C5\D3\BB\DA\DF\D5\BB\A4\A6\A4\A2\BB\CE\CF\CC\A1\AE\AF\BB\C0\D7\DA\DF\D2", align 1
@constinit.7 = private constant [26 x i8] c"\FE\DD\DF\D7\C9\CC\FD\D8\D1\D5\D2\FC\8E\8C\8E\88\9D\F9\D1\D9\CE\DB\D9\D2\DF\C5", align 1
@users = common global [5 x %struct.User] zeroinitializer, align 4
@.str = private unnamed_addr constant [22 x i8] c"Admin@SecurePass2024!\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"Dev@Pass2024!\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"Analyst@Pass2024!\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"Guest@Pass2024!\00", align 1
@current_session = global %struct.Session zeroinitializer, align 8
@.str.11 = private unnamed_addr constant [37 x i8] c"[AUTH] Invalid credentials provided\0A\00", align 1
@.str.12 = private unnamed_addr constant [46 x i8] c"[AUTH] User '%s' v_40c041842ccb successfully\0A\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"[AUTH] Role: %s | Access Level: %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [44 x i8] c"[AUTH] Authentication failed for user '%s'\0A\00", align 1
@.str.15 = private unnamed_addr constant [30 x i8] c"[API] Valid API key provided\0A\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"[API] Invalid API key\0A\00", align 1
@.str.17 = private unnamed_addr constant [10 x i8] c"JWT.%s.%s\00", align 1
@.str.18 = private unnamed_addr constant [36 x i8] c"[JWT] Token generated for user: %s\0A\00", align 1
@.str.19 = private unnamed_addr constant [35 x i8] c"[JWT] Token verified successfully\0A\00", align 1
@.str.20 = private unnamed_addr constant [33 x i8] c"[JWT] Token verification failed\0A\00", align 1
@.str.21 = private unnamed_addr constant [59 x i8] c"[ACCESS] User '%s' has sufficient access (level %d >= %d)\0A\00", align 1
@.str.22 = private unnamed_addr constant [53 x i8] c"[ACCESS] Access denied. User level %d < required %d\0A\00", align 1
@.str.23 = private unnamed_addr constant [32 x i8] c"[DB] Connecting to database...\0A\00", align 1
@.str.24 = private unnamed_addr constant [28 x i8] c"[DB] Connection string: %s\0A\00", align 1
@.str.25 = private unnamed_addr constant [29 x i8] c"[DB] Connection established\0A\00", align 1
@.str.26 = private unnamed_addr constant [22 x i8] c"ENCRYPTED[%s]WITH[%s]\00", align 1
@.str.27 = private unnamed_addr constant [41 x i8] c"[CRYPTO] Data encrypted with master key\0A\00", align 1
@.str.28 = private unnamed_addr constant [44 x i8] c"[OAUTH] Client v_40c041842ccb successfully\0A\00", align 1
@.str.29 = private unnamed_addr constant [36 x i8] c"[OAUTH] Invalid client credentials\0A\00", align 1
@.str.30 = private unnamed_addr constant [31 x i8] c"[LICENSE] No license provided\0A\00", align 1
@.str.31 = private unnamed_addr constant [45 x i8] c"[LICENSE] Valid enterprise license detected\0A\00", align 1
@.str.32 = private unnamed_addr constant [31 x i8] c"[LICENSE] Invalid license key\0A\00", align 1
@.str.33 = private unnamed_addr constant [44 x i8] c"[EMERGENCY] Emergency admin access granted\0A\00", align 1
@.str.34 = private unnamed_addr constant [16 x i8] c"emergency_admin\00", align 1
@.str.35 = private unnamed_addr constant [37 x i8] c"[EMERGENCY] Emergency access denied\0A\00", align 1
@.str.36 = private unnamed_addr constant [42 x i8] c"========================================\0A\00", align 1
@.str.37 = private unnamed_addr constant [31 x i8] c"  Enterprise Auth System v2.0\0A\00", align 1
@.str.38 = private unnamed_addr constant [29 x i8] c"  Multi-Layer Security Demo\0A\00", align 1
@.str.39 = private unnamed_addr constant [43 x i8] c"========================================\0A\0A\00", align 1
@.str.40 = private unnamed_addr constant [43 x i8] c"Usage: %s <username> <password> [options]\0A\00", align 1
@.str.41 = private unnamed_addr constant [11 x i8] c"\0AOptions:\0A\00", align 1
@.str.42 = private unnamed_addr constant [40 x i8] c"  --api-key <key>       Verify API key\0A\00", align 1
@.str.43 = private unnamed_addr constant [42 x i8] c"  --license <key>       Validate license\0A\00", align 1
@.str.44 = private unnamed_addr constant [48 x i8] c"  --emergency <pass>    Emergency admin access\0A\00", align 1
@.str.45 = private unnamed_addr constant [33 x i8] c"\0A[RESULT] Authentication failed\0A\00", align 1
@.str.46 = private unnamed_addr constant [10 x i8] c"--api-key\00", align 1
@.str.47 = private unnamed_addr constant [10 x i8] c"--license\00", align 1
@.str.48 = private unnamed_addr constant [12 x i8] c"--emergency\00", align 1
@.str.49 = private unnamed_addr constant [43 x i8] c"\0A========================================\0A\00", align 1
@.str.50 = private unnamed_addr constant [36 x i8] c"[RESULT] Authentication successful\0A\00", align 1
@.str.51 = private unnamed_addr constant [19 x i8] c"Session Token: %s\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_init_encrypted_strings, ptr null }]
@x = common global i32 0
@y = common global i32 0
@x.1 = common global i32 0
@y.2 = common global i32 0
@x.3 = common global i32 0
@y.4 = common global i32 0
@x.5 = common global i32 0
@y.6 = common global i32 0
@x.7 = common global i32 0
@y.8 = common global i32 0
@x.9 = common global i32 0
@y.10 = common global i32 0
@x.11 = common global i32 0
@y.12 = common global i32 0
@x.13 = common global i32 0
@y.14 = common global i32 0
@x.15 = common global i32 0
@y.16 = common global i32 0
@x.17 = common global i32 0
@y.18 = common global i32 0
@x.19 = common global i32 0
@y.20 = common global i32 0
@x.21 = common global i32 0
@y.22 = common global i32 0
@x.23 = common global i32 0
@y.24 = common global i32 0
@x.25 = common global i32 0
@y.26 = common global i32 0

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @_init_encrypted_strings() #0 {
  %1 = load i32, ptr @x, align 4
  %2 = load i32, ptr @y, align 4
  %3 = sub i32 %1, 1
  %4 = mul i32 %1, %3
  %5 = urem i32 %4, 2
  br label %.split

.split:                                           ; preds = %0
  %6 = icmp eq i32 %5, 0
  %7 = icmp slt i32 %2, 10
  br label %.split.split

.split.split:                                     ; preds = %.split
  %8 = lshr i1 %6, false
  %9 = lshr i1 %7, false
  %10 = select i1 %8, i1 true, i1 %9
  %11 = xor i1 %10, true
  %12 = xor i1 %11, true
  %13 = shl i1 %12, false
  %14 = or i1 false, %13
  br i1 %14, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %15 = alloca [21 x i8], align 1
  %16 = alloca [29 x i8], align 1
  %17 = alloca [41 x i8], align 1
  %18 = alloca [63 x i8], align 1
  %19 = alloca [29 x i8], align 1
  %20 = alloca [29 x i8], align 1
  %21 = alloca [32 x i8], align 1
  %22 = alloca [26 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %15, ptr align 1 @constinit, i64 21, i1 false)
  %23 = getelementptr inbounds [21 x i8], ptr %15, i64 0, i64 0
  %24 = call ptr @_xor_decrypt(ptr noundef %23, i32 noundef 21, i8 noundef zeroext -97)
  store ptr %24, ptr @MASTER_PASSWORD, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %16, ptr align 1 @constinit.1, i64 29, i1 false)
  %25 = getelementptr inbounds [29 x i8], ptr %16, i64 0, i64 0
  %26 = call ptr @_xor_decrypt(ptr noundef %25, i32 noundef 29, i8 noundef zeroext -19)
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  store ptr %26, ptr @API_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %17, ptr align 1 @constinit.2, i64 41, i1 false)
  %27 = getelementptr inbounds [41 x i8], ptr %17, i64 0, i64 0
  %28 = call ptr @_xor_decrypt(ptr noundef %27, i32 noundef 41, i8 noundef zeroext -119)
  store ptr %28, ptr @JWT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %18, ptr align 1 @constinit.3, i64 63, i1 false)
  %29 = getelementptr inbounds [63 x i8], ptr %18, i64 0, i64 0
  %30 = call ptr @_xor_decrypt(ptr noundef %29, i32 noundef 63, i8 noundef zeroext -74)
  store ptr %30, ptr @DB_CONNECTION_STRING, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %19, ptr align 1 @constinit.4, i64 29, i1 false)
  %31 = getelementptr inbounds [29 x i8], ptr %19, i64 0, i64 0
  %32 = call ptr @_xor_decrypt(ptr noundef %31, i32 noundef 29, i8 noundef zeroext 94)
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  store ptr %32, ptr @ENCRYPTION_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %20, ptr align 1 @constinit.5, i64 29, i1 false)
  %33 = getelementptr inbounds [29 x i8], ptr %20, i64 0, i64 0
  %34 = call ptr @_xor_decrypt(ptr noundef %33, i32 noundef 29, i8 noundef zeroext -109)
  store ptr %34, ptr @OAUTH_CLIENT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %21, ptr align 1 @constinit.6, i64 32, i1 false)
  %35 = getelementptr inbounds [32 x i8], ptr %21, i64 0, i64 0
  %36 = call ptr @_xor_decrypt(ptr noundef %35, i32 noundef 32, i8 noundef zeroext -106)
  store ptr %36, ptr @LICENSE_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %22, ptr align 1 @constinit.7, i64 26, i1 false)
  %37 = getelementptr inbounds [26 x i8], ptr %22, i64 0, i64 0
  %38 = call ptr @_xor_decrypt(ptr noundef %37, i32 noundef 26, i8 noundef zeroext -68)
  store ptr %38, ptr @BACKUP_ADMIN_PASSWORD, align 8
  %39 = load i32, ptr @x, align 4
  %40 = load i32, ptr @y, align 4
  %41 = sub i32 %39, 1
  %42 = mul i32 %39, %41
  %43 = urem i32 %42, 2
  %44 = icmp eq i32 %43, 0
  %45 = icmp slt i32 %40, 10
  %46 = lshr i1 %44, false
  %47 = lshr i1 %45, false
  %48 = select i1 %46, i1 true, i1 %47
  %49 = shl i1 %48, false
  %50 = or i1 false, %49
  br i1 %50, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret void

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %51 = alloca [21 x i8], align 1
  %52 = alloca [29 x i8], align 1
  %53 = alloca [41 x i8], align 1
  %54 = alloca [63 x i8], align 1
  %55 = alloca [29 x i8], align 1
  %56 = alloca [29 x i8], align 1
  %57 = alloca [32 x i8], align 1
  %58 = alloca [26 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %51, ptr align 1 @constinit, i64 21, i1 false)
  %59 = getelementptr inbounds [21 x i8], ptr %51, i64 0, i64 0
  %60 = call ptr @_xor_decrypt(ptr noundef %59, i32 noundef 21, i8 noundef zeroext -97)
  store ptr %60, ptr @MASTER_PASSWORD, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %52, ptr align 1 @constinit.1, i64 29, i1 false)
  %61 = getelementptr inbounds [29 x i8], ptr %52, i64 0, i64 0
  %62 = call ptr @_xor_decrypt(ptr noundef %61, i32 noundef 29, i8 noundef zeroext -19)
  store ptr %62, ptr @API_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %53, ptr align 1 @constinit.2, i64 41, i1 false)
  %63 = getelementptr inbounds [41 x i8], ptr %53, i64 0, i64 0
  %64 = call ptr @_xor_decrypt(ptr noundef %63, i32 noundef 41, i8 noundef zeroext -119)
  store ptr %64, ptr @JWT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %54, ptr align 1 @constinit.3, i64 63, i1 false)
  %65 = getelementptr inbounds [63 x i8], ptr %54, i64 0, i64 0
  %66 = call ptr @_xor_decrypt(ptr noundef %65, i32 noundef 63, i8 noundef zeroext -74)
  store ptr %66, ptr @DB_CONNECTION_STRING, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %55, ptr align 1 @constinit.4, i64 29, i1 false)
  %67 = getelementptr inbounds [29 x i8], ptr %55, i64 0, i64 0
  %68 = call ptr @_xor_decrypt(ptr noundef %67, i32 noundef 29, i8 noundef zeroext 94)
  store ptr %68, ptr @ENCRYPTION_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %56, ptr align 1 @constinit.5, i64 29, i1 false)
  %69 = getelementptr inbounds [29 x i8], ptr %56, i64 0, i64 0
  %70 = call ptr @_xor_decrypt(ptr noundef %69, i32 noundef 29, i8 noundef zeroext -109)
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  store ptr %70, ptr @OAUTH_CLIENT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %57, ptr align 1 @constinit.6, i64 32, i1 false)
  %71 = getelementptr inbounds [32 x i8], ptr %57, i64 0, i64 0
  %72 = call ptr @_xor_decrypt(ptr noundef %71, i32 noundef 32, i8 noundef zeroext -106)
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  store ptr %72, ptr @LICENSE_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %58, ptr align 1 @constinit.7, i64 26, i1 false)
  %73 = getelementptr inbounds [26 x i8], ptr %58, i64 0, i64 0
  %74 = call ptr @_xor_decrypt(ptr noundef %73, i32 noundef 26, i8 noundef zeroext -68)
  store ptr %74, ptr @BACKUP_ADMIN_PASSWORD, align 8
  br label %originalBB
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @_xor_decrypt(ptr noundef %0, i32 noundef %1, i8 noundef zeroext %2) #0 {
  %.reg2mem = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i8 %2, ptr %7, align 1
  %10 = load i32, ptr %6, align 4
  %11 = sub i32 0, %10
  %12 = sub i32 0, 1
  %13 = add i32 %11, %12
  %14 = sub i32 0, %13
  %15 = add nsw i32 %10, 1
  br label %.split

.split:                                           ; preds = %3
  %16 = sext i32 %14 to i64
  %17 = call ptr @malloc(i64 noundef %16) #6
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = icmp ne ptr %18, null
  store i1 %19, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 2026656824, ptr %switchVar, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %originalBBpart244
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 2026656824, label %first
    i32 -1509812133, label %47
    i32 -1704092656, label %48
    i32 -313108926, label %49
    i32 2045873696, label %54
    i32 1123561571, label %1245
    i32 -1352074440, label %1276
    i32 452825954, label %1306
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %20 = load i32, ptr @x.1, align 4
  %21 = load i32, ptr @y.2, align 4
  %22 = sub i32 %20, 1
  %23 = mul i32 %20, %22
  %24 = urem i32 %23, 2
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %25 = icmp eq i32 %24, 0
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  %26 = icmp slt i32 %21, 10
  %27 = lshr i1 %25, false
  %28 = lshr i1 %26, false
  %29 = select i1 %27, i1 true, i1 %28
  %30 = xor i1 %29, true
  %31 = xor i1 %30, true
  %32 = shl i1 %31, false
  %33 = or i1 false, %32
  br i1 %33, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %34 = load i32, ptr @x.1, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %35 = load i32, ptr @y.2, align 4
  %36 = sub i32 %34, 1
  %37 = mul i32 %34, %36
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %38 = urem i32 %37, 2
  %39 = icmp eq i32 %38, 0
  %40 = icmp slt i32 %35, 10
  %41 = lshr i1 %39, false
  %42 = lshr i1 %40, false
  %43 = select i1 %41, i1 true, i1 %42
  %44 = shl i1 %43, false
  %45 = or i1 false, %44
  br i1 %45, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %46 = select i1 %.reload, i32 -1704092656, i32 -1509812133
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %46, ptr %switchVar, align 4
  br label %loopEnd

47:                                               ; preds = %loopEntry.split
  store ptr null, ptr %4, align 8
  br label %.split46

.split46:                                         ; preds = %47
  store i32 452825954, ptr %switchVar, align 4
  br label %.split46.split

.split46.split:                                   ; preds = %.split46
  br label %loopEnd

48:                                               ; preds = %loopEntry.split
  store i32 0, ptr %9, align 4
  br label %.split47

.split47:                                         ; preds = %48
  store i32 -313108926, ptr %switchVar, align 4
  br label %.split47.split

.split47.split:                                   ; preds = %.split47
  br label %loopEnd

49:                                               ; preds = %loopEntry.split
  %50 = load i32, ptr %9, align 4
  %51 = load i32, ptr %6, align 4
  %52 = icmp slt i32 %50, %51
  %53 = select i1 %52, i32 2045873696, i32 -1352074440
  br label %.split48

.split48:                                         ; preds = %49
  store i32 %53, ptr %switchVar, align 4
  br label %.split48.split

.split48.split:                                   ; preds = %.split48
  br label %loopEnd

54:                                               ; preds = %loopEntry.split
  %55 = load ptr, ptr %5, align 8
  %56 = load i32, ptr %9, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, ptr %55, i64 %57
  %59 = load i8, ptr %58, align 1
  %60 = zext i8 %59 to i32
  br label %.split49

.split49:                                         ; preds = %54
  %61 = load i8, ptr %7, align 1
  %62 = zext i8 %61 to i32
  %63 = lshr i32 %60, 0
  %64 = trunc i32 %63 to i1
  %65 = select i1 %64, i1 false, i1 true
  %66 = zext i1 %65 to i32
  %67 = shl i32 %66, 0
  %68 = or i32 0, %67
  %69 = lshr i32 %60, 1
  %70 = trunc i32 %69 to i1
  %71 = select i1 %70, i1 false, i1 true
  %72 = zext i1 %71 to i32
  %73 = shl i32 %72, 1
  %74 = or i32 %68, %73
  %75 = lshr i32 %60, 2
  %76 = trunc i32 %75 to i1
  %77 = select i1 %76, i1 false, i1 true
  %78 = zext i1 %77 to i32
  %79 = shl i32 %78, 2
  %80 = or i32 %74, %79
  %81 = lshr i32 %60, 3
  %82 = trunc i32 %81 to i1
  %83 = select i1 %82, i1 false, i1 true
  %84 = zext i1 %83 to i32
  %85 = shl i32 %84, 3
  %86 = or i32 %80, %85
  %87 = lshr i32 %60, 4
  %88 = trunc i32 %87 to i1
  %89 = select i1 %88, i1 false, i1 true
  %90 = zext i1 %89 to i32
  %91 = shl i32 %90, 4
  %92 = or i32 %86, %91
  %93 = lshr i32 %60, 5
  %94 = trunc i32 %93 to i1
  %95 = select i1 %94, i1 false, i1 true
  %96 = zext i1 %95 to i32
  %97 = shl i32 %96, 5
  %98 = or i32 %92, %97
  %99 = lshr i32 %60, 6
  %100 = trunc i32 %99 to i1
  %101 = select i1 %100, i1 false, i1 true
  %102 = zext i1 %101 to i32
  %103 = shl i32 %102, 6
  %104 = or i32 %98, %103
  %105 = lshr i32 %60, 7
  %106 = trunc i32 %105 to i1
  %107 = select i1 %106, i1 false, i1 true
  %108 = zext i1 %107 to i32
  %109 = shl i32 %108, 7
  %110 = or i32 %104, %109
  %111 = lshr i32 %60, 8
  %112 = trunc i32 %111 to i1
  %113 = select i1 %112, i1 false, i1 true
  %114 = zext i1 %113 to i32
  %115 = shl i32 %114, 8
  %116 = or i32 %110, %115
  %117 = lshr i32 %60, 9
  %118 = trunc i32 %117 to i1
  %119 = select i1 %118, i1 false, i1 true
  %120 = zext i1 %119 to i32
  %121 = shl i32 %120, 9
  %122 = or i32 %116, %121
  %123 = lshr i32 %60, 10
  %124 = trunc i32 %123 to i1
  %125 = select i1 %124, i1 false, i1 true
  %126 = zext i1 %125 to i32
  %127 = shl i32 %126, 10
  %128 = or i32 %122, %127
  %129 = lshr i32 %60, 11
  %130 = trunc i32 %129 to i1
  %131 = select i1 %130, i1 false, i1 true
  %132 = zext i1 %131 to i32
  %133 = shl i32 %132, 11
  %134 = or i32 %128, %133
  %135 = lshr i32 %60, 12
  %136 = trunc i32 %135 to i1
  %137 = select i1 %136, i1 false, i1 true
  %138 = zext i1 %137 to i32
  %139 = shl i32 %138, 12
  %140 = or i32 %134, %139
  %141 = lshr i32 %60, 13
  %142 = trunc i32 %141 to i1
  %143 = select i1 %142, i1 false, i1 true
  %144 = zext i1 %143 to i32
  %145 = shl i32 %144, 13
  %146 = or i32 %140, %145
  %147 = lshr i32 %60, 14
  %148 = trunc i32 %147 to i1
  %149 = select i1 %148, i1 false, i1 true
  %150 = zext i1 %149 to i32
  %151 = shl i32 %150, 14
  %152 = or i32 %146, %151
  %153 = lshr i32 %60, 15
  %154 = trunc i32 %153 to i1
  %155 = select i1 %154, i1 false, i1 true
  %156 = zext i1 %155 to i32
  %157 = shl i32 %156, 15
  %158 = or i32 %152, %157
  %159 = lshr i32 %60, 16
  %160 = trunc i32 %159 to i1
  %161 = select i1 %160, i1 false, i1 true
  %162 = zext i1 %161 to i32
  %163 = shl i32 %162, 16
  %164 = or i32 %158, %163
  %165 = lshr i32 %60, 17
  %166 = trunc i32 %165 to i1
  %167 = select i1 %166, i1 false, i1 true
  %168 = zext i1 %167 to i32
  %169 = shl i32 %168, 17
  %170 = or i32 %164, %169
  %171 = lshr i32 %60, 18
  %172 = trunc i32 %171 to i1
  %173 = select i1 %172, i1 false, i1 true
  %174 = zext i1 %173 to i32
  %175 = shl i32 %174, 18
  %176 = or i32 %170, %175
  %177 = lshr i32 %60, 19
  %178 = trunc i32 %177 to i1
  %179 = select i1 %178, i1 false, i1 true
  %180 = xor i1 %179, true
  %181 = xor i1 %180, true
  %182 = zext i1 %181 to i32
  %183 = shl i32 %182, 19
  %184 = or i32 %176, %183
  %185 = lshr i32 %60, 20
  %186 = trunc i32 %185 to i1
  %187 = select i1 %186, i1 false, i1 true
  %188 = zext i1 %187 to i32
  %189 = shl i32 %188, 20
  %190 = or i32 %184, %189
  %191 = lshr i32 %60, 21
  %192 = trunc i32 %191 to i1
  %193 = select i1 %192, i1 false, i1 true
  %194 = zext i1 %193 to i32
  %195 = shl i32 %194, 21
  %196 = or i32 %190, %195
  %197 = lshr i32 %60, 22
  %198 = trunc i32 %197 to i1
  %199 = select i1 %198, i1 false, i1 true
  %200 = zext i1 %199 to i32
  %201 = shl i32 %200, 22
  %202 = or i32 %196, %201
  %203 = lshr i32 %60, 23
  %204 = trunc i32 %203 to i1
  %205 = select i1 %204, i1 false, i1 true
  %206 = zext i1 %205 to i32
  %207 = shl i32 %206, 23
  %208 = or i32 %202, %207
  %209 = lshr i32 %60, 24
  %210 = trunc i32 %209 to i1
  %211 = select i1 %210, i1 false, i1 true
  %212 = zext i1 %211 to i32
  %213 = shl i32 %212, 24
  %214 = or i32 %208, %213
  %215 = lshr i32 %60, 25
  %216 = trunc i32 %215 to i1
  %217 = select i1 %216, i1 false, i1 true
  %218 = zext i1 %217 to i32
  %219 = shl i32 %218, 25
  %220 = or i32 %214, %219
  %221 = lshr i32 %60, 26
  %222 = trunc i32 %221 to i1
  %223 = select i1 %222, i1 false, i1 true
  %224 = zext i1 %223 to i32
  %225 = shl i32 %224, 26
  %226 = or i32 %220, %225
  %227 = lshr i32 %60, 27
  %228 = trunc i32 %227 to i1
  %229 = select i1 %228, i1 false, i1 true
  %230 = zext i1 %229 to i32
  %231 = shl i32 %230, 27
  %232 = or i32 %226, %231
  %233 = lshr i32 %60, 28
  %234 = trunc i32 %233 to i1
  %235 = select i1 %234, i1 false, i1 true
  %236 = zext i1 %235 to i32
  %237 = shl i32 %236, 28
  %238 = or i32 %232, %237
  %239 = lshr i32 %60, 29
  %240 = trunc i32 %239 to i1
  %241 = select i1 %240, i1 false, i1 true
  %242 = zext i1 %241 to i32
  %243 = shl i32 %242, 29
  %244 = or i32 %238, %243
  %245 = lshr i32 %60, 30
  %246 = trunc i32 %245 to i1
  %247 = select i1 %246, i1 false, i1 true
  %248 = xor i1 %247, false
  %249 = xor i1 %248, false
  %250 = zext i1 %249 to i32
  %251 = shl i32 %250, 30
  %252 = or i32 %244, %251
  %253 = lshr i32 %60, 31
  %254 = trunc i32 %253 to i1
  %255 = select i1 %254, i1 false, i1 true
  %256 = zext i1 %255 to i32
  %257 = shl i32 %256, 31
  %258 = or i32 %252, %257
  %259 = lshr i32 %62, 0
  %260 = trunc i32 %259 to i1
  %261 = lshr i32 %258, 0
  %262 = trunc i32 %261 to i1
  %263 = select i1 %260, i1 %262, i1 false
  %264 = zext i1 %263 to i32
  %265 = shl i32 %264, 0
  %266 = or i32 0, %265
  %267 = lshr i32 %62, 1
  %268 = trunc i32 %267 to i1
  %269 = lshr i32 %258, 1
  %270 = trunc i32 %269 to i1
  %271 = select i1 %268, i1 %270, i1 false
  %272 = zext i1 %271 to i32
  %273 = shl i32 %272, 1
  %274 = or i32 %266, %273
  %275 = lshr i32 %62, 2
  %276 = trunc i32 %275 to i1
  %277 = lshr i32 %258, 2
  %278 = trunc i32 %277 to i1
  %279 = select i1 %276, i1 %278, i1 false
  %280 = zext i1 %279 to i32
  %281 = shl i32 %280, 2
  %282 = or i32 %274, %281
  %283 = lshr i32 %62, 3
  %284 = trunc i32 %283 to i1
  %285 = lshr i32 %258, 3
  %286 = trunc i32 %285 to i1
  %287 = select i1 %284, i1 %286, i1 false
  %288 = zext i1 %287 to i32
  %289 = shl i32 %288, 3
  %290 = or i32 %282, %289
  %291 = lshr i32 %62, 4
  %292 = trunc i32 %291 to i1
  %293 = lshr i32 %258, 4
  %294 = trunc i32 %293 to i1
  %295 = select i1 %292, i1 %294, i1 false
  %296 = zext i1 %295 to i32
  %297 = shl i32 %296, 4
  %298 = or i32 %290, %297
  %299 = lshr i32 %62, 5
  %300 = trunc i32 %299 to i1
  %301 = lshr i32 %258, 5
  %302 = trunc i32 %301 to i1
  %303 = select i1 %300, i1 %302, i1 false
  %304 = zext i1 %303 to i32
  %305 = shl i32 %304, 5
  %306 = or i32 %298, %305
  %307 = lshr i32 %62, 6
  %308 = trunc i32 %307 to i1
  %309 = lshr i32 %258, 6
  %310 = trunc i32 %309 to i1
  %311 = select i1 %308, i1 %310, i1 false
  %312 = zext i1 %311 to i32
  %313 = shl i32 %312, 6
  %314 = or i32 %306, %313
  %315 = lshr i32 %62, 7
  %316 = trunc i32 %315 to i1
  %317 = lshr i32 %258, 7
  %318 = trunc i32 %317 to i1
  %319 = select i1 %316, i1 %318, i1 false
  %320 = zext i1 %319 to i32
  %321 = shl i32 %320, 7
  %322 = or i32 %314, %321
  %323 = lshr i32 %62, 8
  %324 = trunc i32 %323 to i1
  %325 = lshr i32 %258, 8
  %326 = trunc i32 %325 to i1
  %327 = select i1 %324, i1 %326, i1 false
  %328 = zext i1 %327 to i32
  %329 = shl i32 %328, 8
  %330 = or i32 %322, %329
  %331 = lshr i32 %62, 9
  %332 = trunc i32 %331 to i1
  %333 = lshr i32 %258, 9
  %334 = trunc i32 %333 to i1
  %335 = select i1 %332, i1 %334, i1 false
  %336 = zext i1 %335 to i32
  %337 = shl i32 %336, 9
  %338 = or i32 %330, %337
  %339 = lshr i32 %62, 10
  %340 = trunc i32 %339 to i1
  %341 = lshr i32 %258, 10
  %342 = trunc i32 %341 to i1
  %343 = select i1 %340, i1 %342, i1 false
  %344 = zext i1 %343 to i32
  %345 = shl i32 %344, 10
  %346 = or i32 %338, %345
  %347 = lshr i32 %62, 11
  %348 = trunc i32 %347 to i1
  %349 = lshr i32 %258, 11
  %350 = trunc i32 %349 to i1
  %351 = select i1 %348, i1 %350, i1 false
  %352 = zext i1 %351 to i32
  %353 = shl i32 %352, 11
  %354 = or i32 %346, %353
  %355 = lshr i32 %62, 12
  %356 = trunc i32 %355 to i1
  %357 = lshr i32 %258, 12
  %358 = trunc i32 %357 to i1
  %359 = select i1 %356, i1 %358, i1 false
  %360 = zext i1 %359 to i32
  %361 = shl i32 %360, 12
  %362 = or i32 %354, %361
  %363 = lshr i32 %62, 13
  %364 = trunc i32 %363 to i1
  %365 = lshr i32 %258, 13
  %366 = trunc i32 %365 to i1
  %367 = select i1 %364, i1 %366, i1 false
  %368 = zext i1 %367 to i32
  %369 = shl i32 %368, 13
  %370 = or i32 %362, %369
  %371 = lshr i32 %62, 14
  %372 = trunc i32 %371 to i1
  %373 = lshr i32 %258, 14
  %374 = trunc i32 %373 to i1
  %375 = select i1 %372, i1 %374, i1 false
  %376 = zext i1 %375 to i32
  %377 = shl i32 %376, 14
  %378 = or i32 %370, %377
  %379 = lshr i32 %62, 15
  %380 = trunc i32 %379 to i1
  %381 = lshr i32 %258, 15
  %382 = trunc i32 %381 to i1
  %383 = select i1 %380, i1 %382, i1 false
  %384 = zext i1 %383 to i32
  %385 = shl i32 %384, 15
  %386 = or i32 %378, %385
  %387 = lshr i32 %62, 16
  %388 = trunc i32 %387 to i1
  %389 = lshr i32 %258, 16
  %390 = trunc i32 %389 to i1
  %391 = select i1 %388, i1 %390, i1 false
  %392 = zext i1 %391 to i32
  %393 = shl i32 %392, 16
  %394 = or i32 %386, %393
  %395 = lshr i32 %62, 17
  %396 = trunc i32 %395 to i1
  %397 = lshr i32 %258, 17
  %398 = trunc i32 %397 to i1
  %399 = select i1 %396, i1 %398, i1 false
  %400 = zext i1 %399 to i32
  %401 = shl i32 %400, 17
  %402 = or i32 %394, %401
  %403 = lshr i32 %62, 18
  %404 = trunc i32 %403 to i1
  %405 = lshr i32 %258, 18
  %406 = trunc i32 %405 to i1
  %407 = select i1 %404, i1 %406, i1 false
  %408 = zext i1 %407 to i32
  %409 = shl i32 %408, 18
  %410 = or i32 %402, %409
  %411 = lshr i32 %62, 19
  %412 = trunc i32 %411 to i1
  %413 = lshr i32 %258, 19
  %414 = trunc i32 %413 to i1
  %415 = select i1 %412, i1 %414, i1 false
  %416 = zext i1 %415 to i32
  %417 = shl i32 %416, 19
  %418 = or i32 %410, %417
  %419 = lshr i32 %62, 20
  %420 = trunc i32 %419 to i1
  %421 = lshr i32 %258, 20
  %422 = trunc i32 %421 to i1
  %423 = select i1 %420, i1 %422, i1 false
  %424 = zext i1 %423 to i32
  %425 = shl i32 %424, 20
  %426 = or i32 %418, %425
  %427 = lshr i32 %62, 21
  %428 = trunc i32 %427 to i1
  %429 = lshr i32 %258, 21
  %430 = trunc i32 %429 to i1
  %431 = select i1 %428, i1 %430, i1 false
  %432 = zext i1 %431 to i32
  %433 = shl i32 %432, 21
  %434 = or i32 %426, %433
  %435 = lshr i32 %62, 22
  %436 = trunc i32 %435 to i1
  %437 = lshr i32 %258, 22
  %438 = trunc i32 %437 to i1
  %439 = select i1 %436, i1 %438, i1 false
  %440 = xor i1 %439, false
  %441 = xor i1 %440, false
  %442 = zext i1 %441 to i32
  %443 = shl i32 %442, 22
  %444 = or i32 %434, %443
  %445 = lshr i32 %62, 23
  %446 = trunc i32 %445 to i1
  %447 = lshr i32 %258, 23
  %448 = trunc i32 %447 to i1
  %449 = select i1 %446, i1 %448, i1 false
  %450 = zext i1 %449 to i32
  %451 = shl i32 %450, 23
  %452 = or i32 %444, %451
  %453 = lshr i32 %62, 24
  %454 = trunc i32 %453 to i1
  %455 = lshr i32 %258, 24
  %456 = trunc i32 %455 to i1
  %457 = select i1 %454, i1 %456, i1 false
  %458 = zext i1 %457 to i32
  %459 = shl i32 %458, 24
  %460 = or i32 %452, %459
  %461 = lshr i32 %62, 25
  %462 = trunc i32 %461 to i1
  %463 = lshr i32 %258, 25
  %464 = trunc i32 %463 to i1
  %465 = select i1 %462, i1 %464, i1 false
  %466 = zext i1 %465 to i32
  %467 = shl i32 %466, 25
  %468 = or i32 %460, %467
  %469 = lshr i32 %62, 26
  %470 = trunc i32 %469 to i1
  %471 = lshr i32 %258, 26
  %472 = trunc i32 %471 to i1
  %473 = select i1 %470, i1 %472, i1 false
  %474 = zext i1 %473 to i32
  %475 = shl i32 %474, 26
  %476 = or i32 %468, %475
  %477 = lshr i32 %62, 27
  %478 = trunc i32 %477 to i1
  %479 = lshr i32 %258, 27
  %480 = trunc i32 %479 to i1
  %481 = select i1 %478, i1 %480, i1 false
  %482 = zext i1 %481 to i32
  %483 = shl i32 %482, 27
  %484 = or i32 %476, %483
  %485 = lshr i32 %62, 28
  %486 = trunc i32 %485 to i1
  %487 = lshr i32 %258, 28
  %488 = trunc i32 %487 to i1
  %489 = select i1 %486, i1 %488, i1 false
  %490 = zext i1 %489 to i32
  %491 = shl i32 %490, 28
  %492 = or i32 %484, %491
  %493 = lshr i32 %62, 29
  %494 = trunc i32 %493 to i1
  %495 = lshr i32 %258, 29
  %496 = trunc i32 %495 to i1
  %497 = select i1 %494, i1 %496, i1 false
  %498 = zext i1 %497 to i32
  %499 = shl i32 %498, 29
  %500 = or i32 %492, %499
  %501 = lshr i32 %62, 30
  %502 = trunc i32 %501 to i1
  %503 = lshr i32 %258, 30
  %504 = trunc i32 %503 to i1
  %505 = select i1 %502, i1 %504, i1 false
  %506 = zext i1 %505 to i32
  %507 = shl i32 %506, 30
  %508 = or i32 %500, %507
  %509 = lshr i32 %62, 31
  %510 = trunc i32 %509 to i1
  %511 = lshr i32 %258, 31
  %512 = trunc i32 %511 to i1
  %513 = select i1 %510, i1 %512, i1 false
  %514 = zext i1 %513 to i32
  %515 = shl i32 %514, 31
  %516 = or i32 %508, %515
  %517 = lshr i32 %62, 0
  %518 = trunc i32 %517 to i1
  %519 = select i1 %518, i1 false, i1 true
  %520 = zext i1 %519 to i32
  %521 = shl i32 %520, 0
  %522 = or i32 0, %521
  %523 = lshr i32 %62, 1
  %524 = trunc i32 %523 to i1
  %525 = select i1 %524, i1 false, i1 true
  %526 = zext i1 %525 to i32
  %527 = shl i32 %526, 1
  %528 = or i32 %522, %527
  %529 = lshr i32 %62, 2
  %530 = trunc i32 %529 to i1
  %531 = select i1 %530, i1 false, i1 true
  %532 = zext i1 %531 to i32
  %533 = shl i32 %532, 2
  %534 = or i32 %528, %533
  %535 = lshr i32 %62, 3
  %536 = trunc i32 %535 to i1
  %537 = select i1 %536, i1 false, i1 true
  %538 = zext i1 %537 to i32
  %539 = shl i32 %538, 3
  %540 = or i32 %534, %539
  %541 = lshr i32 %62, 4
  %542 = trunc i32 %541 to i1
  %543 = select i1 %542, i1 false, i1 true
  %544 = zext i1 %543 to i32
  %545 = shl i32 %544, 4
  %546 = or i32 %540, %545
  %547 = lshr i32 %62, 5
  %548 = trunc i32 %547 to i1
  %549 = select i1 %548, i1 false, i1 true
  %550 = zext i1 %549 to i32
  %551 = shl i32 %550, 5
  %552 = or i32 %546, %551
  %553 = lshr i32 %62, 6
  %554 = trunc i32 %553 to i1
  %555 = select i1 %554, i1 false, i1 true
  %556 = zext i1 %555 to i32
  %557 = shl i32 %556, 6
  %558 = or i32 %552, %557
  %559 = lshr i32 %62, 7
  %560 = trunc i32 %559 to i1
  %561 = select i1 %560, i1 false, i1 true
  %562 = zext i1 %561 to i32
  %563 = shl i32 %562, 7
  %564 = or i32 %558, %563
  %565 = lshr i32 %62, 8
  %566 = trunc i32 %565 to i1
  %567 = select i1 %566, i1 false, i1 true
  %568 = zext i1 %567 to i32
  %569 = shl i32 %568, 8
  %570 = or i32 %564, %569
  %571 = lshr i32 %62, 9
  %572 = trunc i32 %571 to i1
  %573 = select i1 %572, i1 false, i1 true
  %574 = zext i1 %573 to i32
  %575 = shl i32 %574, 9
  %576 = or i32 %570, %575
  %577 = lshr i32 %62, 10
  %578 = trunc i32 %577 to i1
  %579 = select i1 %578, i1 false, i1 true
  %580 = zext i1 %579 to i32
  %581 = shl i32 %580, 10
  %582 = or i32 %576, %581
  %583 = lshr i32 %62, 11
  %584 = trunc i32 %583 to i1
  %585 = select i1 %584, i1 false, i1 true
  %586 = xor i1 %585, true
  %587 = xor i1 %586, true
  %588 = zext i1 %587 to i32
  %589 = shl i32 %588, 11
  %590 = or i32 %582, %589
  %591 = lshr i32 %62, 12
  %592 = trunc i32 %591 to i1
  %593 = select i1 %592, i1 false, i1 true
  %594 = zext i1 %593 to i32
  %595 = shl i32 %594, 12
  %596 = or i32 %590, %595
  %597 = lshr i32 %62, 13
  %598 = trunc i32 %597 to i1
  %599 = select i1 %598, i1 false, i1 true
  %600 = zext i1 %599 to i32
  %601 = shl i32 %600, 13
  %602 = or i32 %596, %601
  %603 = lshr i32 %62, 14
  %604 = trunc i32 %603 to i1
  %605 = select i1 %604, i1 false, i1 true
  %606 = zext i1 %605 to i32
  %607 = shl i32 %606, 14
  %608 = or i32 %602, %607
  %609 = lshr i32 %62, 15
  %610 = trunc i32 %609 to i1
  %611 = select i1 %610, i1 false, i1 true
  %612 = zext i1 %611 to i32
  %613 = shl i32 %612, 15
  %614 = or i32 %608, %613
  %615 = lshr i32 %62, 16
  %616 = trunc i32 %615 to i1
  %617 = select i1 %616, i1 false, i1 true
  %618 = zext i1 %617 to i32
  %619 = shl i32 %618, 16
  %620 = or i32 %614, %619
  %621 = lshr i32 %62, 17
  %622 = trunc i32 %621 to i1
  %623 = select i1 %622, i1 false, i1 true
  %624 = zext i1 %623 to i32
  %625 = shl i32 %624, 17
  %626 = or i32 %620, %625
  %627 = lshr i32 %62, 18
  %628 = trunc i32 %627 to i1
  %629 = select i1 %628, i1 false, i1 true
  %630 = zext i1 %629 to i32
  %631 = shl i32 %630, 18
  %632 = or i32 %626, %631
  %633 = lshr i32 %62, 19
  %634 = trunc i32 %633 to i1
  %635 = select i1 %634, i1 false, i1 true
  %636 = zext i1 %635 to i32
  %637 = shl i32 %636, 19
  %638 = or i32 %632, %637
  %639 = lshr i32 %62, 20
  %640 = trunc i32 %639 to i1
  %641 = select i1 %640, i1 false, i1 true
  %642 = zext i1 %641 to i32
  %643 = shl i32 %642, 20
  %644 = or i32 %638, %643
  %645 = lshr i32 %62, 21
  %646 = trunc i32 %645 to i1
  %647 = select i1 %646, i1 false, i1 true
  %648 = zext i1 %647 to i32
  %649 = shl i32 %648, 21
  %650 = or i32 %644, %649
  %651 = lshr i32 %62, 22
  %652 = trunc i32 %651 to i1
  %653 = select i1 %652, i1 false, i1 true
  %654 = zext i1 %653 to i32
  %655 = shl i32 %654, 22
  %656 = or i32 %650, %655
  %657 = lshr i32 %62, 23
  %658 = trunc i32 %657 to i1
  %659 = select i1 %658, i1 false, i1 true
  %660 = zext i1 %659 to i32
  %661 = shl i32 %660, 23
  %662 = or i32 %656, %661
  %663 = lshr i32 %62, 24
  %664 = trunc i32 %663 to i1
  %665 = select i1 %664, i1 false, i1 true
  %666 = zext i1 %665 to i32
  %667 = shl i32 %666, 24
  %668 = or i32 %662, %667
  %669 = lshr i32 %62, 25
  %670 = trunc i32 %669 to i1
  %671 = select i1 %670, i1 false, i1 true
  %672 = xor i1 %671, false
  %673 = xor i1 %672, false
  %674 = zext i1 %673 to i32
  %675 = shl i32 %674, 25
  %676 = or i32 %668, %675
  %677 = lshr i32 %62, 26
  %678 = trunc i32 %677 to i1
  %679 = select i1 %678, i1 false, i1 true
  %680 = zext i1 %679 to i32
  %681 = shl i32 %680, 26
  %682 = or i32 %676, %681
  %683 = lshr i32 %62, 27
  %684 = trunc i32 %683 to i1
  %685 = select i1 %684, i1 false, i1 true
  %686 = zext i1 %685 to i32
  %687 = shl i32 %686, 27
  %688 = or i32 %682, %687
  %689 = lshr i32 %62, 28
  %690 = trunc i32 %689 to i1
  %691 = select i1 %690, i1 false, i1 true
  %692 = zext i1 %691 to i32
  %693 = shl i32 %692, 28
  %694 = or i32 %688, %693
  %695 = lshr i32 %62, 29
  %696 = trunc i32 %695 to i1
  %697 = select i1 %696, i1 false, i1 true
  %698 = zext i1 %697 to i32
  %699 = shl i32 %698, 29
  %700 = or i32 %694, %699
  %701 = lshr i32 %62, 30
  %702 = trunc i32 %701 to i1
  %703 = select i1 %702, i1 false, i1 true
  %704 = zext i1 %703 to i32
  %705 = shl i32 %704, 30
  %706 = or i32 %700, %705
  %707 = lshr i32 %62, 31
  %708 = trunc i32 %707 to i1
  %709 = select i1 %708, i1 false, i1 true
  %710 = zext i1 %709 to i32
  %711 = shl i32 %710, 31
  %712 = or i32 %706, %711
  %713 = lshr i32 %60, 0
  %714 = trunc i32 %713 to i1
  %715 = lshr i32 %712, 0
  %716 = trunc i32 %715 to i1
  %717 = select i1 %714, i1 %716, i1 false
  %718 = zext i1 %717 to i32
  %719 = shl i32 %718, 0
  %720 = or i32 0, %719
  %721 = lshr i32 %60, 1
  %722 = trunc i32 %721 to i1
  %723 = lshr i32 %712, 1
  %724 = trunc i32 %723 to i1
  %725 = select i1 %722, i1 %724, i1 false
  %726 = zext i1 %725 to i32
  %727 = shl i32 %726, 1
  %728 = or i32 %720, %727
  %729 = lshr i32 %60, 2
  %730 = trunc i32 %729 to i1
  %731 = lshr i32 %712, 2
  %732 = trunc i32 %731 to i1
  %733 = select i1 %730, i1 %732, i1 false
  %734 = zext i1 %733 to i32
  %735 = shl i32 %734, 2
  %736 = or i32 %728, %735
  %737 = lshr i32 %60, 3
  %738 = trunc i32 %737 to i1
  %739 = lshr i32 %712, 3
  %740 = trunc i32 %739 to i1
  %741 = select i1 %738, i1 %740, i1 false
  %742 = xor i1 %741, false
  %743 = xor i1 %742, false
  %744 = zext i1 %743 to i32
  %745 = shl i32 %744, 3
  %746 = or i32 %736, %745
  %747 = lshr i32 %60, 4
  %748 = trunc i32 %747 to i1
  %749 = lshr i32 %712, 4
  %750 = trunc i32 %749 to i1
  %751 = select i1 %748, i1 %750, i1 false
  %752 = zext i1 %751 to i32
  %753 = shl i32 %752, 4
  %754 = or i32 %746, %753
  %755 = lshr i32 %60, 5
  %756 = trunc i32 %755 to i1
  %757 = lshr i32 %712, 5
  %758 = trunc i32 %757 to i1
  %759 = select i1 %756, i1 %758, i1 false
  %760 = zext i1 %759 to i32
  %761 = shl i32 %760, 5
  %762 = or i32 %754, %761
  %763 = lshr i32 %60, 6
  %764 = trunc i32 %763 to i1
  %765 = lshr i32 %712, 6
  %766 = trunc i32 %765 to i1
  %767 = select i1 %764, i1 %766, i1 false
  %768 = zext i1 %767 to i32
  %769 = shl i32 %768, 6
  %770 = or i32 %762, %769
  %771 = lshr i32 %60, 7
  %772 = trunc i32 %771 to i1
  %773 = lshr i32 %712, 7
  %774 = trunc i32 %773 to i1
  %775 = select i1 %772, i1 %774, i1 false
  %776 = zext i1 %775 to i32
  %777 = shl i32 %776, 7
  %778 = or i32 %770, %777
  %779 = lshr i32 %60, 8
  %780 = trunc i32 %779 to i1
  %781 = lshr i32 %712, 8
  %782 = trunc i32 %781 to i1
  %783 = select i1 %780, i1 %782, i1 false
  %784 = zext i1 %783 to i32
  %785 = shl i32 %784, 8
  %786 = or i32 %778, %785
  %787 = lshr i32 %60, 9
  %788 = trunc i32 %787 to i1
  %789 = lshr i32 %712, 9
  %790 = trunc i32 %789 to i1
  %791 = select i1 %788, i1 %790, i1 false
  %792 = zext i1 %791 to i32
  %793 = shl i32 %792, 9
  %794 = or i32 %786, %793
  %795 = lshr i32 %60, 10
  %796 = trunc i32 %795 to i1
  %797 = lshr i32 %712, 10
  %798 = trunc i32 %797 to i1
  %799 = select i1 %796, i1 %798, i1 false
  %800 = zext i1 %799 to i32
  %801 = shl i32 %800, 10
  %802 = or i32 %794, %801
  %803 = lshr i32 %60, 11
  %804 = trunc i32 %803 to i1
  %805 = lshr i32 %712, 11
  %806 = trunc i32 %805 to i1
  %807 = select i1 %804, i1 %806, i1 false
  %808 = xor i1 %807, false
  %809 = xor i1 %808, false
  %810 = zext i1 %809 to i32
  %811 = shl i32 %810, 11
  %812 = or i32 %802, %811
  %813 = lshr i32 %60, 12
  %814 = trunc i32 %813 to i1
  %815 = lshr i32 %712, 12
  %816 = trunc i32 %815 to i1
  %817 = select i1 %814, i1 %816, i1 false
  %818 = zext i1 %817 to i32
  %819 = shl i32 %818, 12
  %820 = or i32 %812, %819
  %821 = lshr i32 %60, 13
  %822 = trunc i32 %821 to i1
  %823 = lshr i32 %712, 13
  %824 = trunc i32 %823 to i1
  %825 = select i1 %822, i1 %824, i1 false
  %826 = zext i1 %825 to i32
  %827 = shl i32 %826, 13
  %828 = or i32 %820, %827
  %829 = lshr i32 %60, 14
  %830 = trunc i32 %829 to i1
  %831 = lshr i32 %712, 14
  %832 = trunc i32 %831 to i1
  %833 = select i1 %830, i1 %832, i1 false
  %834 = xor i1 %833, false
  %835 = xor i1 %834, false
  %836 = zext i1 %835 to i32
  %837 = shl i32 %836, 14
  %838 = or i32 %828, %837
  %839 = lshr i32 %60, 15
  %840 = trunc i32 %839 to i1
  %841 = lshr i32 %712, 15
  %842 = trunc i32 %841 to i1
  %843 = select i1 %840, i1 %842, i1 false
  %844 = zext i1 %843 to i32
  %845 = shl i32 %844, 15
  %846 = or i32 %838, %845
  %847 = lshr i32 %60, 16
  %848 = trunc i32 %847 to i1
  %849 = lshr i32 %712, 16
  %850 = trunc i32 %849 to i1
  %851 = select i1 %848, i1 %850, i1 false
  %852 = xor i1 %851, true
  %853 = xor i1 %852, true
  %854 = zext i1 %853 to i32
  %855 = shl i32 %854, 16
  %856 = or i32 %846, %855
  %857 = lshr i32 %60, 17
  %858 = trunc i32 %857 to i1
  %859 = lshr i32 %712, 17
  %860 = trunc i32 %859 to i1
  %861 = select i1 %858, i1 %860, i1 false
  %862 = zext i1 %861 to i32
  %863 = shl i32 %862, 17
  %864 = or i32 %856, %863
  %865 = lshr i32 %60, 18
  %866 = trunc i32 %865 to i1
  %867 = lshr i32 %712, 18
  %868 = trunc i32 %867 to i1
  %869 = select i1 %866, i1 %868, i1 false
  %870 = zext i1 %869 to i32
  %871 = shl i32 %870, 18
  %872 = or i32 %864, %871
  %873 = lshr i32 %60, 19
  %874 = trunc i32 %873 to i1
  %875 = lshr i32 %712, 19
  %876 = trunc i32 %875 to i1
  %877 = select i1 %874, i1 %876, i1 false
  %878 = zext i1 %877 to i32
  %879 = shl i32 %878, 19
  %880 = or i32 %872, %879
  %881 = lshr i32 %60, 20
  %882 = trunc i32 %881 to i1
  %883 = lshr i32 %712, 20
  %884 = trunc i32 %883 to i1
  %885 = select i1 %882, i1 %884, i1 false
  %886 = zext i1 %885 to i32
  %887 = shl i32 %886, 20
  %888 = or i32 %880, %887
  %889 = lshr i32 %60, 21
  %890 = trunc i32 %889 to i1
  %891 = lshr i32 %712, 21
  %892 = trunc i32 %891 to i1
  %893 = select i1 %890, i1 %892, i1 false
  %894 = zext i1 %893 to i32
  %895 = shl i32 %894, 21
  %896 = or i32 %888, %895
  %897 = lshr i32 %60, 22
  %898 = trunc i32 %897 to i1
  %899 = lshr i32 %712, 22
  %900 = trunc i32 %899 to i1
  %901 = select i1 %898, i1 %900, i1 false
  %902 = zext i1 %901 to i32
  %903 = shl i32 %902, 22
  %904 = or i32 %896, %903
  %905 = lshr i32 %60, 23
  %906 = trunc i32 %905 to i1
  %907 = lshr i32 %712, 23
  %908 = trunc i32 %907 to i1
  %909 = select i1 %906, i1 %908, i1 false
  %910 = zext i1 %909 to i32
  %911 = shl i32 %910, 23
  %912 = or i32 %904, %911
  %913 = lshr i32 %60, 24
  %914 = trunc i32 %913 to i1
  %915 = lshr i32 %712, 24
  %916 = trunc i32 %915 to i1
  %917 = select i1 %914, i1 %916, i1 false
  %918 = zext i1 %917 to i32
  %919 = shl i32 %918, 24
  %920 = or i32 %912, %919
  %921 = lshr i32 %60, 25
  %922 = trunc i32 %921 to i1
  %923 = lshr i32 %712, 25
  %924 = trunc i32 %923 to i1
  %925 = select i1 %922, i1 %924, i1 false
  %926 = zext i1 %925 to i32
  %927 = shl i32 %926, 25
  %928 = or i32 %920, %927
  %929 = lshr i32 %60, 26
  %930 = trunc i32 %929 to i1
  %931 = lshr i32 %712, 26
  %932 = trunc i32 %931 to i1
  %933 = select i1 %930, i1 %932, i1 false
  %934 = zext i1 %933 to i32
  %935 = shl i32 %934, 26
  %936 = or i32 %928, %935
  %937 = lshr i32 %60, 27
  %938 = trunc i32 %937 to i1
  %939 = lshr i32 %712, 27
  %940 = trunc i32 %939 to i1
  %941 = select i1 %938, i1 %940, i1 false
  %942 = zext i1 %941 to i32
  %943 = shl i32 %942, 27
  %944 = or i32 %936, %943
  %945 = lshr i32 %60, 28
  %946 = trunc i32 %945 to i1
  %947 = lshr i32 %712, 28
  %948 = trunc i32 %947 to i1
  %949 = select i1 %946, i1 %948, i1 false
  %950 = zext i1 %949 to i32
  %951 = shl i32 %950, 28
  %952 = or i32 %944, %951
  %953 = lshr i32 %60, 29
  %954 = trunc i32 %953 to i1
  %955 = lshr i32 %712, 29
  %956 = trunc i32 %955 to i1
  %957 = select i1 %954, i1 %956, i1 false
  %958 = zext i1 %957 to i32
  %959 = shl i32 %958, 29
  %960 = or i32 %952, %959
  %961 = lshr i32 %60, 30
  %962 = trunc i32 %961 to i1
  %963 = lshr i32 %712, 30
  %964 = trunc i32 %963 to i1
  %965 = select i1 %962, i1 %964, i1 false
  %966 = zext i1 %965 to i32
  %967 = shl i32 %966, 30
  %968 = or i32 %960, %967
  %969 = lshr i32 %60, 31
  %970 = trunc i32 %969 to i1
  %971 = lshr i32 %712, 31
  %972 = trunc i32 %971 to i1
  %973 = select i1 %970, i1 %972, i1 false
  %974 = zext i1 %973 to i32
  %975 = shl i32 %974, 31
  %976 = or i32 %968, %975
  %977 = lshr i32 %516, 0
  %978 = trunc i32 %977 to i1
  %979 = lshr i32 %976, 0
  %980 = trunc i32 %979 to i1
  %981 = select i1 %978, i1 true, i1 %980
  %982 = zext i1 %981 to i32
  %983 = shl i32 %982, 0
  %984 = or i32 0, %983
  %985 = lshr i32 %516, 1
  %986 = trunc i32 %985 to i1
  %987 = lshr i32 %976, 1
  %988 = trunc i32 %987 to i1
  %989 = select i1 %986, i1 true, i1 %988
  %990 = zext i1 %989 to i32
  %991 = shl i32 %990, 1
  %992 = or i32 %984, %991
  %993 = lshr i32 %516, 2
  %994 = trunc i32 %993 to i1
  %995 = lshr i32 %976, 2
  %996 = trunc i32 %995 to i1
  %997 = select i1 %994, i1 true, i1 %996
  %998 = zext i1 %997 to i32
  %999 = shl i32 %998, 2
  %1000 = or i32 %992, %999
  %1001 = lshr i32 %516, 3
  %1002 = trunc i32 %1001 to i1
  %1003 = lshr i32 %976, 3
  %1004 = trunc i32 %1003 to i1
  %1005 = select i1 %1002, i1 true, i1 %1004
  %1006 = zext i1 %1005 to i32
  %1007 = shl i32 %1006, 3
  %1008 = or i32 %1000, %1007
  %1009 = lshr i32 %516, 4
  %1010 = trunc i32 %1009 to i1
  %1011 = lshr i32 %976, 4
  %1012 = trunc i32 %1011 to i1
  %1013 = select i1 %1010, i1 true, i1 %1012
  %1014 = zext i1 %1013 to i32
  %1015 = shl i32 %1014, 4
  %1016 = or i32 %1008, %1015
  %1017 = lshr i32 %516, 5
  %1018 = trunc i32 %1017 to i1
  %1019 = lshr i32 %976, 5
  %1020 = trunc i32 %1019 to i1
  %1021 = select i1 %1018, i1 true, i1 %1020
  %1022 = zext i1 %1021 to i32
  %1023 = shl i32 %1022, 5
  %1024 = or i32 %1016, %1023
  %1025 = lshr i32 %516, 6
  %1026 = trunc i32 %1025 to i1
  %1027 = lshr i32 %976, 6
  %1028 = trunc i32 %1027 to i1
  %1029 = select i1 %1026, i1 true, i1 %1028
  %1030 = zext i1 %1029 to i32
  %1031 = shl i32 %1030, 6
  %1032 = or i32 %1024, %1031
  %1033 = lshr i32 %516, 7
  %1034 = trunc i32 %1033 to i1
  %1035 = lshr i32 %976, 7
  %1036 = trunc i32 %1035 to i1
  %1037 = select i1 %1034, i1 true, i1 %1036
  %1038 = zext i1 %1037 to i32
  %1039 = shl i32 %1038, 7
  %1040 = or i32 %1032, %1039
  %1041 = lshr i32 %516, 8
  %1042 = trunc i32 %1041 to i1
  %1043 = lshr i32 %976, 8
  %1044 = trunc i32 %1043 to i1
  %1045 = select i1 %1042, i1 true, i1 %1044
  %1046 = zext i1 %1045 to i32
  %1047 = shl i32 %1046, 8
  %1048 = or i32 %1040, %1047
  %1049 = lshr i32 %516, 9
  %1050 = trunc i32 %1049 to i1
  %1051 = lshr i32 %976, 9
  %1052 = trunc i32 %1051 to i1
  %1053 = select i1 %1050, i1 true, i1 %1052
  %1054 = zext i1 %1053 to i32
  %1055 = shl i32 %1054, 9
  %1056 = or i32 %1048, %1055
  %1057 = lshr i32 %516, 10
  %1058 = trunc i32 %1057 to i1
  %1059 = lshr i32 %976, 10
  %1060 = trunc i32 %1059 to i1
  %1061 = select i1 %1058, i1 true, i1 %1060
  %1062 = zext i1 %1061 to i32
  %1063 = shl i32 %1062, 10
  %1064 = or i32 %1056, %1063
  %1065 = lshr i32 %516, 11
  %1066 = trunc i32 %1065 to i1
  %1067 = lshr i32 %976, 11
  %1068 = trunc i32 %1067 to i1
  %1069 = select i1 %1066, i1 true, i1 %1068
  %1070 = zext i1 %1069 to i32
  %1071 = shl i32 %1070, 11
  %1072 = or i32 %1064, %1071
  %1073 = lshr i32 %516, 12
  %1074 = trunc i32 %1073 to i1
  %1075 = lshr i32 %976, 12
  %1076 = trunc i32 %1075 to i1
  %1077 = select i1 %1074, i1 true, i1 %1076
  %1078 = xor i1 %1077, true
  %1079 = xor i1 %1078, true
  %1080 = zext i1 %1079 to i32
  %1081 = shl i32 %1080, 12
  %1082 = or i32 %1072, %1081
  %1083 = lshr i32 %516, 13
  %1084 = trunc i32 %1083 to i1
  %1085 = lshr i32 %976, 13
  %1086 = trunc i32 %1085 to i1
  %1087 = select i1 %1084, i1 true, i1 %1086
  %1088 = xor i1 %1087, true
  %1089 = xor i1 %1088, true
  %1090 = zext i1 %1089 to i32
  %1091 = shl i32 %1090, 13
  %1092 = or i32 %1082, %1091
  %1093 = lshr i32 %516, 14
  %1094 = trunc i32 %1093 to i1
  %1095 = lshr i32 %976, 14
  %1096 = trunc i32 %1095 to i1
  %1097 = select i1 %1094, i1 true, i1 %1096
  %1098 = zext i1 %1097 to i32
  %1099 = shl i32 %1098, 14
  %1100 = or i32 %1092, %1099
  %1101 = lshr i32 %516, 15
  %1102 = trunc i32 %1101 to i1
  %1103 = lshr i32 %976, 15
  %1104 = trunc i32 %1103 to i1
  %1105 = select i1 %1102, i1 true, i1 %1104
  %1106 = zext i1 %1105 to i32
  %1107 = shl i32 %1106, 15
  %1108 = or i32 %1100, %1107
  %1109 = lshr i32 %516, 16
  %1110 = trunc i32 %1109 to i1
  %1111 = lshr i32 %976, 16
  %1112 = trunc i32 %1111 to i1
  %1113 = select i1 %1110, i1 true, i1 %1112
  %1114 = zext i1 %1113 to i32
  %1115 = shl i32 %1114, 16
  %1116 = or i32 %1108, %1115
  %1117 = lshr i32 %516, 17
  %1118 = trunc i32 %1117 to i1
  %1119 = lshr i32 %976, 17
  %1120 = trunc i32 %1119 to i1
  %1121 = select i1 %1118, i1 true, i1 %1120
  %1122 = zext i1 %1121 to i32
  %1123 = shl i32 %1122, 17
  %1124 = or i32 %1116, %1123
  %1125 = lshr i32 %516, 18
  %1126 = trunc i32 %1125 to i1
  %1127 = lshr i32 %976, 18
  %1128 = trunc i32 %1127 to i1
  %1129 = select i1 %1126, i1 true, i1 %1128
  %1130 = zext i1 %1129 to i32
  %1131 = shl i32 %1130, 18
  %1132 = or i32 %1124, %1131
  %1133 = lshr i32 %516, 19
  %1134 = trunc i32 %1133 to i1
  %1135 = lshr i32 %976, 19
  %1136 = trunc i32 %1135 to i1
  %1137 = select i1 %1134, i1 true, i1 %1136
  %1138 = zext i1 %1137 to i32
  %1139 = shl i32 %1138, 19
  %1140 = or i32 %1132, %1139
  %1141 = lshr i32 %516, 20
  %1142 = trunc i32 %1141 to i1
  %1143 = lshr i32 %976, 20
  %1144 = trunc i32 %1143 to i1
  %1145 = select i1 %1142, i1 true, i1 %1144
  %1146 = zext i1 %1145 to i32
  %1147 = shl i32 %1146, 20
  %1148 = or i32 %1140, %1147
  %1149 = lshr i32 %516, 21
  %1150 = trunc i32 %1149 to i1
  %1151 = lshr i32 %976, 21
  %1152 = trunc i32 %1151 to i1
  %1153 = select i1 %1150, i1 true, i1 %1152
  %1154 = zext i1 %1153 to i32
  %1155 = shl i32 %1154, 21
  %1156 = or i32 %1148, %1155
  %1157 = lshr i32 %516, 22
  %1158 = trunc i32 %1157 to i1
  %1159 = lshr i32 %976, 22
  %1160 = trunc i32 %1159 to i1
  %1161 = select i1 %1158, i1 true, i1 %1160
  %1162 = zext i1 %1161 to i32
  %1163 = shl i32 %1162, 22
  %1164 = or i32 %1156, %1163
  %1165 = lshr i32 %516, 23
  %1166 = trunc i32 %1165 to i1
  %1167 = lshr i32 %976, 23
  %1168 = trunc i32 %1167 to i1
  %1169 = select i1 %1166, i1 true, i1 %1168
  %1170 = zext i1 %1169 to i32
  %1171 = shl i32 %1170, 23
  %1172 = or i32 %1164, %1171
  %1173 = lshr i32 %516, 24
  %1174 = trunc i32 %1173 to i1
  %1175 = lshr i32 %976, 24
  %1176 = trunc i32 %1175 to i1
  %1177 = select i1 %1174, i1 true, i1 %1176
  %1178 = zext i1 %1177 to i32
  %1179 = shl i32 %1178, 24
  %1180 = or i32 %1172, %1179
  %1181 = lshr i32 %516, 25
  %1182 = trunc i32 %1181 to i1
  %1183 = lshr i32 %976, 25
  %1184 = trunc i32 %1183 to i1
  %1185 = select i1 %1182, i1 true, i1 %1184
  %1186 = zext i1 %1185 to i32
  %1187 = shl i32 %1186, 25
  %1188 = or i32 %1180, %1187
  %1189 = lshr i32 %516, 26
  %1190 = trunc i32 %1189 to i1
  %1191 = lshr i32 %976, 26
  %1192 = trunc i32 %1191 to i1
  %1193 = select i1 %1190, i1 true, i1 %1192
  %1194 = xor i1 %1193, false
  %1195 = xor i1 %1194, false
  %1196 = zext i1 %1195 to i32
  %1197 = shl i32 %1196, 26
  %1198 = or i32 %1188, %1197
  %1199 = lshr i32 %516, 27
  %1200 = trunc i32 %1199 to i1
  %1201 = lshr i32 %976, 27
  %1202 = trunc i32 %1201 to i1
  %1203 = select i1 %1200, i1 true, i1 %1202
  %1204 = zext i1 %1203 to i32
  %1205 = shl i32 %1204, 27
  %1206 = or i32 %1198, %1205
  %1207 = lshr i32 %516, 28
  %1208 = trunc i32 %1207 to i1
  %1209 = lshr i32 %976, 28
  %1210 = trunc i32 %1209 to i1
  %1211 = select i1 %1208, i1 true, i1 %1210
  %1212 = zext i1 %1211 to i32
  %1213 = shl i32 %1212, 28
  %1214 = or i32 %1206, %1213
  %1215 = lshr i32 %516, 29
  %1216 = trunc i32 %1215 to i1
  %1217 = lshr i32 %976, 29
  %1218 = trunc i32 %1217 to i1
  %1219 = select i1 %1216, i1 true, i1 %1218
  %1220 = zext i1 %1219 to i32
  %1221 = shl i32 %1220, 29
  %1222 = or i32 %1214, %1221
  %1223 = lshr i32 %516, 30
  %1224 = trunc i32 %1223 to i1
  %1225 = lshr i32 %976, 30
  %1226 = trunc i32 %1225 to i1
  %1227 = select i1 %1224, i1 true, i1 %1226
  %1228 = zext i1 %1227 to i32
  %1229 = shl i32 %1228, 30
  %1230 = or i32 %1222, %1229
  %1231 = lshr i32 %516, 31
  %1232 = trunc i32 %1231 to i1
  %1233 = lshr i32 %976, 31
  %1234 = trunc i32 %1233 to i1
  %1235 = select i1 %1232, i1 true, i1 %1234
  %1236 = zext i1 %1235 to i32
  %1237 = shl i32 %1236, 31
  %1238 = or i32 %1230, %1237
  %1239 = xor i32 %60, %62
  %1240 = trunc i32 %1238 to i8
  %1241 = load ptr, ptr %8, align 8
  %1242 = load i32, ptr %9, align 4
  %1243 = sext i32 %1242 to i64
  br label %.split49.split

.split49.split:                                   ; preds = %.split49
  %1244 = getelementptr inbounds i8, ptr %1241, i64 %1243
  store i8 %1240, ptr %1244, align 1
  store i32 1123561571, ptr %switchVar, align 4
  br label %loopEnd

1245:                                             ; preds = %loopEntry.split
  %1246 = load i32, ptr @x.1, align 4
  %1247 = load i32, ptr @y.2, align 4
  br label %.split50

.split50:                                         ; preds = %1245
  %1248 = sub i32 %1246, 1
  %1249 = mul i32 %1246, %1248
  %1250 = urem i32 %1249, 2
  %1251 = icmp eq i32 %1250, 0
  br label %.split50.split

.split50.split:                                   ; preds = %.split50
  %1252 = icmp slt i32 %1247, 10
  %1253 = lshr i1 %1251, false
  %1254 = lshr i1 %1252, false
  %1255 = select i1 %1253, i1 true, i1 %1254
  %1256 = shl i1 %1255, false
  %1257 = or i1 false, %1256
  br i1 %1257, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split50.split, %originalBB2alteredBB.split.split
  %1258 = load i32, ptr %9, align 4
  %1259 = sub i32 0, %1258
  %1260 = sub i32 0, 1
  %1261 = add i32 %1259, %1260
  %1262 = sub i32 0, %1261
  %1263 = add nsw i32 %1258, 1
  store i32 %1262, ptr %9, align 4
  store i32 -313108926, ptr %switchVar, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %1264 = load i32, ptr @x.1, align 4
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %1265 = load i32, ptr @y.2, align 4
  %1266 = sub i32 %1264, 1
  %1267 = mul i32 %1264, %1266
  %1268 = urem i32 %1267, 2
  %1269 = icmp eq i32 %1268, 0
  %1270 = icmp slt i32 %1265, 10
  %1271 = lshr i1 %1269, false
  %1272 = lshr i1 %1270, false
  %1273 = select i1 %1271, i1 true, i1 %1272
  %1274 = shl i1 %1273, false
  %1275 = or i1 false, %1274
  br i1 %1275, label %originalBBpart232, label %originalBB2alteredBB

originalBBpart232:                                ; preds = %originalBB2.split.split
  br label %loopEnd

1276:                                             ; preds = %loopEntry.split
  %1277 = load i32, ptr @x.1, align 4
  br label %.split51

.split51:                                         ; preds = %1276
  %1278 = load i32, ptr @y.2, align 4
  %1279 = sub i32 %1277, 1
  br label %.split51.split

.split51.split:                                   ; preds = %.split51
  %1280 = mul i32 %1277, %1279
  %1281 = urem i32 %1280, 2
  %1282 = icmp eq i32 %1281, 0
  %1283 = icmp slt i32 %1278, 10
  %1284 = lshr i1 %1282, false
  %1285 = lshr i1 %1283, false
  %1286 = select i1 %1284, i1 true, i1 %1285
  %1287 = shl i1 %1286, false
  %1288 = or i1 false, %1287
  br i1 %1288, label %originalBB34, label %originalBB34alteredBB

originalBB34:                                     ; preds = %.split51.split, %originalBB34alteredBB.split.split
  %1289 = load ptr, ptr %8, align 8
  %1290 = load i32, ptr %6, align 4
  %1291 = sext i32 %1290 to i64
  %1292 = getelementptr inbounds i8, ptr %1289, i64 %1291
  br label %originalBB34.split

originalBB34.split:                               ; preds = %originalBB34
  store i8 0, ptr %1292, align 1
  %1293 = load ptr, ptr %8, align 8
  store ptr %1293, ptr %4, align 8
  br label %originalBB34.split.split

originalBB34.split.split:                         ; preds = %originalBB34.split
  store i32 452825954, ptr %switchVar, align 4
  %1294 = load i32, ptr @x.1, align 4
  %1295 = load i32, ptr @y.2, align 4
  %1296 = sub i32 %1294, 1
  %1297 = mul i32 %1294, %1296
  %1298 = urem i32 %1297, 2
  %1299 = icmp eq i32 %1298, 0
  %1300 = icmp slt i32 %1295, 10
  %1301 = lshr i1 %1299, false
  %1302 = lshr i1 %1300, false
  %1303 = select i1 %1301, i1 true, i1 %1302
  %1304 = shl i1 %1303, false
  %1305 = or i1 false, %1304
  br i1 %1305, label %originalBBpart236, label %originalBB34alteredBB

originalBBpart236:                                ; preds = %originalBB34.split.split
  br label %loopEnd

1306:                                             ; preds = %loopEntry.split
  %1307 = load i32, ptr @x.1, align 4
  br label %.split52

.split52:                                         ; preds = %1306
  %1308 = load i32, ptr @y.2, align 4
  %1309 = sub i32 %1307, 1
  %1310 = mul i32 %1307, %1309
  br label %.split52.split

.split52.split:                                   ; preds = %.split52
  %1311 = urem i32 %1310, 2
  %1312 = icmp eq i32 %1311, 0
  %1313 = icmp slt i32 %1308, 10
  %1314 = lshr i1 %1312, false
  %1315 = lshr i1 %1313, false
  %1316 = select i1 %1314, i1 true, i1 %1315
  %1317 = shl i1 %1316, false
  %1318 = or i1 false, %1317
  br i1 %1318, label %originalBB38, label %originalBB38alteredBB

originalBB38:                                     ; preds = %.split52.split, %originalBB38alteredBB.split
  %1319 = load ptr, ptr %4, align 8
  %1320 = load i32, ptr @x.1, align 4
  br label %originalBB38.split

originalBB38.split:                               ; preds = %originalBB38
  %1321 = load i32, ptr @y.2, align 4
  %1322 = sub i32 %1320, 1
  %1323 = mul i32 %1320, %1322
  %1324 = urem i32 %1323, 2
  %1325 = icmp eq i32 %1324, 0
  %1326 = icmp slt i32 %1321, 10
  br label %originalBB38.split.split

originalBB38.split.split:                         ; preds = %originalBB38.split
  %1327 = lshr i1 %1325, false
  %1328 = lshr i1 %1326, false
  %1329 = select i1 %1327, i1 true, i1 %1328
  %1330 = shl i1 %1329, false
  %1331 = or i1 false, %1330
  br i1 %1331, label %originalBBpart240, label %originalBB38alteredBB

originalBBpart240:                                ; preds = %originalBB38.split.split
  ret ptr %1319

loopEnd:                                          ; preds = %originalBBpart236, %originalBBpart232, %.split49.split, %.split48.split, %.split47.split, %.split46.split, %first.split.split, %originalBBpart2
  %1332 = load i32, ptr @x.1, align 4
  %1333 = load i32, ptr @y.2, align 4
  %1334 = sub i32 %1332, 1
  %1335 = mul i32 %1332, %1334
  br label %loopEnd.split

loopEnd.split:                                    ; preds = %loopEnd
  %1336 = urem i32 %1335, 2
  %1337 = icmp eq i32 %1336, 0
  %1338 = icmp slt i32 %1333, 10
  br label %loopEnd.split.split

loopEnd.split.split:                              ; preds = %loopEnd.split
  %1339 = lshr i1 %1337, false
  %1340 = lshr i1 %1338, false
  %1341 = select i1 %1339, i1 true, i1 %1340
  %1342 = shl i1 %1341, false
  %1343 = or i1 false, %1342
  br i1 %1343, label %originalBB42, label %originalBB42alteredBB

originalBB42:                                     ; preds = %loopEnd.split.split, %originalBB42alteredBB
  %1344 = load i32, ptr @x.1, align 4
  br label %originalBB42.split

originalBB42.split:                               ; preds = %originalBB42
  %1345 = load i32, ptr @y.2, align 4
  %1346 = sub i32 %1344, 1
  br label %originalBB42.split.split

originalBB42.split.split:                         ; preds = %originalBB42.split
  %1347 = mul i32 %1344, %1346
  %1348 = urem i32 %1347, 2
  %1349 = icmp eq i32 %1348, 0
  %1350 = icmp slt i32 %1345, 10
  %1351 = lshr i1 %1349, false
  %1352 = lshr i1 %1350, false
  %1353 = select i1 %1351, i1 true, i1 %1352
  %1354 = shl i1 %1353, false
  %1355 = or i1 false, %1354
  br i1 %1355, label %originalBBpart244, label %originalBB42alteredBB

originalBBpart244:                                ; preds = %originalBB42.split.split
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split50.split
  %1356 = load i32, ptr %9, align 4
  %_ = shl i32 0, %1356
  %1357 = sub i32 0, %1356
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  %_3 = sub i32 0, 1
  %gen = mul i32 %_3, 1
  %_4 = shl i32 0, 1
  %_5 = shl i32 0, 1
  %_6 = sub i32 0, 0
  %gen7 = add i32 %_6, 1
  %_8 = shl i32 0, 1
  %1358 = sub i32 0, 1
  %_9 = sub i32 0, %1357
  %gen10 = add i32 %_9, %1358
  %1359 = add i32 %1357, %1358
  %_11 = sub i32 0, %1359
  %gen12 = mul i32 %_11, %1359
  %_13 = sub i32 0, 0
  %gen14 = add i32 %_13, %1359
  %_15 = shl i32 0, %1359
  %_16 = sub i32 0, 0
  %gen17 = add i32 %_16, %1359
  %_18 = shl i32 0, %1359
  %_19 = sub i32 0, 0
  %gen20 = add i32 %_19, %1359
  %_21 = sub i32 0, 0
  %gen22 = add i32 %_21, %1359
  %1360 = sub i32 0, %1359
  %_23 = shl i32 %1356, 1
  %_24 = shl i32 %1356, 1
  %_25 = sub i32 0, %1356
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  %gen26 = add i32 %_25, 1
  %_27 = sub i32 0, %1356
  %gen28 = add i32 %_27, 1
  %_29 = sub i32 %1356, 1
  %gen30 = mul i32 %_29, 1
  %1361 = add nsw i32 %1356, 1
  store i32 %1360, ptr %9, align 4
  store i32 -313108926, ptr %switchVar, align 4
  br label %originalBB2

originalBB34alteredBB:                            ; preds = %originalBB34.split.split, %.split51.split
  %1362 = load ptr, ptr %8, align 8
  %1363 = load i32, ptr %6, align 4
  br label %originalBB34alteredBB.split

originalBB34alteredBB.split:                      ; preds = %originalBB34alteredBB
  %1364 = sext i32 %1363 to i64
  %1365 = getelementptr inbounds i8, ptr %1362, i64 %1364
  store i8 0, ptr %1365, align 1
  %1366 = load ptr, ptr %8, align 8
  store ptr %1366, ptr %4, align 8
  br label %originalBB34alteredBB.split.split

originalBB34alteredBB.split.split:                ; preds = %originalBB34alteredBB.split
  store i32 452825954, ptr %switchVar, align 4
  br label %originalBB34

originalBB38alteredBB:                            ; preds = %originalBB38.split.split, %.split52.split
  %1367 = load ptr, ptr %4, align 8
  br label %originalBB38alteredBB.split

originalBB38alteredBB.split:                      ; preds = %originalBB38alteredBB
  br label %originalBB38

originalBB42alteredBB:                            ; preds = %originalBB42.split.split, %loopEnd.split.split
  br label %originalBB42
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_0c7992b3d2d2() #0 {
  %1 = alloca [5 x i8], align 1
  %2 = alloca [13 x i8], align 1
  %3 = alloca [9 x i8], align 1
  %4 = alloca [9 x i8], align 1
  %5 = alloca [7 x i8], align 1
  %6 = alloca [7 x i8], align 1
  %7 = alloca [5 x i8], align 1
  %8 = alloca [5 x i8], align 1
  store i8 74, ptr %1, align 1
  %9 = getelementptr inbounds i8, ptr %1, i64 1
  store i8 79, ptr %9, align 1
  %10 = getelementptr inbounds i8, ptr %1, i64 2
  store i8 70, ptr %10, align 1
  %11 = getelementptr inbounds i8, ptr %1, i64 3
  store i8 66, ptr %11, align 1
  %12 = getelementptr inbounds i8, ptr %1, i64 4
  store i8 69, ptr %12, align 1
  %13 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i64 0
  %14 = call ptr @_xor_decrypt(ptr noundef %13, i32 noundef 5, i8 noundef zeroext 43)
  %15 = call ptr @__strcpy_chk(ptr noundef @users, ptr noundef %14, i64 noundef 64) #7
  %16 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 1), ptr noundef @.str, i64 noundef 64) #7
  store i8 -90, ptr %2, align 1
  %17 = getelementptr inbounds i8, ptr %2, i64 1
  store i8 -93, ptr %17, align 1
  %18 = getelementptr inbounds i8, ptr %2, i64 2
  store i8 -86, ptr %18, align 1
  %19 = getelementptr inbounds i8, ptr %2, i64 3
  store i8 -82, ptr %19, align 1
  %20 = getelementptr inbounds i8, ptr %2, i64 4
  store i8 -87, ptr %20, align 1
  %21 = getelementptr inbounds i8, ptr %2, i64 5
  store i8 -82, ptr %21, align 1
  %22 = getelementptr inbounds i8, ptr %2, i64 6
  store i8 -76, ptr %22, align 1
  %23 = getelementptr inbounds i8, ptr %2, i64 7
  store i8 -77, ptr %23, align 1
  br label %.split

.split:                                           ; preds = %0
  %24 = getelementptr inbounds i8, ptr %2, i64 8
  store i8 -75, ptr %24, align 1
  %25 = getelementptr inbounds i8, ptr %2, i64 9
  store i8 -90, ptr %25, align 1
  %26 = getelementptr inbounds i8, ptr %2, i64 10
  store i8 -77, ptr %26, align 1
  %27 = getelementptr inbounds i8, ptr %2, i64 11
  store i8 -88, ptr %27, align 1
  %28 = getelementptr inbounds i8, ptr %2, i64 12
  store i8 -75, ptr %28, align 1
  %29 = getelementptr inbounds [13 x i8], ptr %2, i64 0, i64 0
  %30 = call ptr @_xor_decrypt(ptr noundef %29, i32 noundef 13, i8 noundef zeroext -57)
  %31 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 2), ptr noundef %30, i64 noundef 64) #7
  store i32 9, ptr getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 3), align 4
  store i8 -80, ptr %3, align 1
  %32 = getelementptr inbounds i8, ptr %3, i64 1
  store i8 -79, ptr %32, align 1
  %33 = getelementptr inbounds i8, ptr %3, i64 2
  store i8 -94, ptr %33, align 1
  %34 = getelementptr inbounds i8, ptr %3, i64 3
  store i8 -79, ptr %34, align 1
  %35 = getelementptr inbounds i8, ptr %3, i64 4
  store i8 -72, ptr %35, align 1
  %36 = getelementptr inbounds i8, ptr %3, i64 5
  store i8 -69, ptr %36, align 1
  %37 = getelementptr inbounds i8, ptr %3, i64 6
  store i8 -92, ptr %37, align 1
  %38 = getelementptr inbounds i8, ptr %3, i64 7
  store i8 -79, ptr %38, align 1
  %39 = getelementptr inbounds i8, ptr %3, i64 8
  store i8 -90, ptr %39, align 1
  %40 = getelementptr inbounds [9 x i8], ptr %3, i64 0, i64 0
  %41 = call ptr @_xor_decrypt(ptr noundef %40, i32 noundef 9, i8 noundef zeroext -44)
  %42 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), ptr noundef %41, i64 noundef 64) #7
  %43 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 1), ptr noundef @.str.8, i64 noundef 64) #7
  store i8 50, ptr %4, align 1
  %44 = getelementptr inbounds i8, ptr %4, i64 1
  store i8 51, ptr %44, align 1
  %45 = getelementptr inbounds i8, ptr %4, i64 2
  store i8 32, ptr %45, align 1
  %46 = getelementptr inbounds i8, ptr %4, i64 3
  store i8 51, ptr %46, align 1
  %47 = getelementptr inbounds i8, ptr %4, i64 4
  store i8 58, ptr %47, align 1
  %48 = getelementptr inbounds i8, ptr %4, i64 5
  store i8 57, ptr %48, align 1
  %49 = getelementptr inbounds i8, ptr %4, i64 6
  store i8 38, ptr %49, align 1
  %50 = getelementptr inbounds i8, ptr %4, i64 7
  store i8 51, ptr %50, align 1
  %51 = getelementptr inbounds i8, ptr %4, i64 8
  store i8 36, ptr %51, align 1
  %52 = getelementptr inbounds [9 x i8], ptr %4, i64 0, i64 0
  %53 = call ptr @_xor_decrypt(ptr noundef %52, i32 noundef 9, i8 noundef zeroext 86)
  %54 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 2), ptr noundef %53, i64 noundef 64) #7
  store i32 5, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 3), align 4
  store i8 2, ptr %5, align 1
  %55 = getelementptr inbounds i8, ptr %5, i64 1
  store i8 13, ptr %55, align 1
  %56 = getelementptr inbounds i8, ptr %5, i64 2
  store i8 2, ptr %56, align 1
  %57 = getelementptr inbounds i8, ptr %5, i64 3
  store i8 15, ptr %57, align 1
  %58 = getelementptr inbounds i8, ptr %5, i64 4
  store i8 26, ptr %58, align 1
  %59 = getelementptr inbounds i8, ptr %5, i64 5
  store i8 16, ptr %59, align 1
  %60 = getelementptr inbounds i8, ptr %5, i64 6
  store i8 23, ptr %60, align 1
  %61 = getelementptr inbounds [7 x i8], ptr %5, i64 0, i64 0
  %62 = call ptr @_xor_decrypt(ptr noundef %61, i32 noundef 7, i8 noundef zeroext 99)
  br label %.split.split

.split.split:                                     ; preds = %.split
  %63 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), ptr noundef %62, i64 noundef 64) #7
  %64 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 1), ptr noundef @.str.9, i64 noundef 64) #7
  store i8 -62, ptr %6, align 1
  %65 = getelementptr inbounds i8, ptr %6, i64 1
  store i8 -51, ptr %65, align 1
  %66 = getelementptr inbounds i8, ptr %6, i64 2
  store i8 -62, ptr %66, align 1
  %67 = getelementptr inbounds i8, ptr %6, i64 3
  store i8 -49, ptr %67, align 1
  %68 = getelementptr inbounds i8, ptr %6, i64 4
  store i8 -38, ptr %68, align 1
  %69 = getelementptr inbounds i8, ptr %6, i64 5
  store i8 -48, ptr %69, align 1
  %70 = getelementptr inbounds i8, ptr %6, i64 6
  store i8 -41, ptr %70, align 1
  %71 = getelementptr inbounds [7 x i8], ptr %6, i64 0, i64 0
  %72 = call ptr @_xor_decrypt(ptr noundef %71, i32 noundef 7, i8 noundef zeroext -93)
  %73 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 2), ptr noundef %72, i64 noundef 64) #7
  store i32 3, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 3), align 4
  store i8 -84, ptr %7, align 1
  %74 = getelementptr inbounds i8, ptr %7, i64 1
  store i8 -66, ptr %74, align 1
  %75 = getelementptr inbounds i8, ptr %7, i64 2
  store i8 -82, ptr %75, align 1
  %76 = getelementptr inbounds i8, ptr %7, i64 3
  store i8 -72, ptr %76, align 1
  %77 = getelementptr inbounds i8, ptr %7, i64 4
  store i8 -65, ptr %77, align 1
  %78 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %79 = call ptr @_xor_decrypt(ptr noundef %78, i32 noundef 5, i8 noundef zeroext -53)
  %80 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), ptr noundef %79, i64 noundef 64) #7
  %81 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 1), ptr noundef @.str.10, i64 noundef 64) #7
  store i8 58, ptr %8, align 1
  %82 = getelementptr inbounds i8, ptr %8, i64 1
  store i8 40, ptr %82, align 1
  %83 = getelementptr inbounds i8, ptr %8, i64 2
  store i8 56, ptr %83, align 1
  %84 = getelementptr inbounds i8, ptr %8, i64 3
  store i8 46, ptr %84, align 1
  %85 = getelementptr inbounds i8, ptr %8, i64 4
  store i8 41, ptr %85, align 1
  %86 = getelementptr inbounds [5 x i8], ptr %8, i64 0, i64 0
  %87 = call ptr @_xor_decrypt(ptr noundef %86, i32 noundef 5, i8 noundef zeroext 93)
  %88 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 2), ptr noundef %87, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 3), align 4
  store i32 4, ptr @v_fbc01149fda7, align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_0a9fc93cc940(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load i32, ptr @x.5, align 4
  %4 = load i32, ptr @y.6, align 4
  br label %.split

.split:                                           ; preds = %2
  %5 = sub i32 %3, 1
  %6 = mul i32 %3, %5
  %7 = urem i32 %6, 2
  br label %.split.split

.split.split:                                     ; preds = %.split
  %8 = icmp eq i32 %7, 0
  %9 = icmp slt i32 %4, 10
  %10 = lshr i1 %8, false
  %11 = lshr i1 %9, false
  %12 = select i1 %10, i1 true, i1 %11
  %13 = shl i1 %12, false
  %14 = or i1 false, %13
  br i1 %14, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %.reg2mem = alloca i1, align 1
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  store ptr %0, ptr %16, align 8
  store ptr %1, ptr %17, align 8
  %19 = load ptr, ptr %16, align 8
  %20 = icmp ne ptr %19, null
  store i1 %20, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  store i32 -488172322, ptr %switchVar, align 4
  %21 = load i32, ptr @x.5, align 4
  %22 = load i32, ptr @y.6, align 4
  %23 = sub i32 %21, 1
  %24 = mul i32 %21, %23
  %25 = urem i32 %24, 2
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %26 = icmp eq i32 %25, 0
  %27 = icmp slt i32 %22, 10
  %28 = lshr i1 %26, false
  %29 = lshr i1 %27, false
  %30 = select i1 %28, i1 true, i1 %29
  %31 = shl i1 %30, false
  %32 = or i1 false, %31
  br i1 %32, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEntry

loopEntry:                                        ; preds = %originalBBpart2, %originalBBpart248
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -488172322, label %first
    i32 -632802454, label %34
    i32 -26393378, label %38
    i32 -2116816468, label %40
    i32 1915395874, label %41
    i32 -1873289614, label %70
    i32 -180618682, label %80
    i32 -402071025, label %90
    i32 2115840762, label %131
    i32 -1696738060, label %132
    i32 1008400300, label %162
    i32 -1479388530, label %165
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %33 = select i1 %.reload, i32 -632802454, i32 -26393378
  store i32 %33, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

34:                                               ; preds = %loopEntry.split
  %35 = load ptr, ptr %17, align 8
  br label %.split50

.split50:                                         ; preds = %34
  %36 = icmp ne ptr %35, null
  %37 = select i1 %36, i32 -2116816468, i32 -26393378
  br label %.split50.split

.split50.split:                                   ; preds = %.split50
  store i32 %37, ptr %switchVar, align 4
  br label %loopEnd

38:                                               ; preds = %loopEntry.split
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %.split51

.split51:                                         ; preds = %38
  store i32 0, ptr %15, align 4
  br label %.split51.split

.split51.split:                                   ; preds = %.split51
  store i32 -1479388530, ptr %switchVar, align 4
  br label %loopEnd

40:                                               ; preds = %loopEntry.split
  store i32 0, ptr %18, align 4
  br label %.split52

.split52:                                         ; preds = %40
  store i32 1915395874, ptr %switchVar, align 4
  br label %.split52.split

.split52.split:                                   ; preds = %.split52
  br label %loopEnd

41:                                               ; preds = %loopEntry.split
  %42 = load i32, ptr @x.5, align 4
  %43 = load i32, ptr @y.6, align 4
  %44 = sub i32 %42, 1
  br label %.split53

.split53:                                         ; preds = %41
  %45 = mul i32 %42, %44
  %46 = urem i32 %45, 2
  %47 = icmp eq i32 %46, 0
  br label %.split53.split

.split53.split:                                   ; preds = %.split53
  %48 = icmp slt i32 %43, 10
  %49 = lshr i1 %47, false
  %50 = lshr i1 %48, false
  %51 = select i1 %49, i1 true, i1 %50
  %52 = shl i1 %51, false
  %53 = or i1 false, %52
  br i1 %53, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split53.split, %originalBB2alteredBB.split.split
  %54 = load i32, ptr %18, align 4
  %55 = load i32, ptr @v_fbc01149fda7, align 4
  %56 = icmp slt i32 %54, %55
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %57 = select i1 %56, i32 -1873289614, i32 1008400300
  store i32 %57, ptr %switchVar, align 4
  %58 = load i32, ptr @x.5, align 4
  %59 = load i32, ptr @y.6, align 4
  %60 = sub i32 %58, 1
  %61 = mul i32 %58, %60
  %62 = urem i32 %61, 2
  %63 = icmp eq i32 %62, 0
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %64 = icmp slt i32 %59, 10
  %65 = lshr i1 %63, false
  %66 = lshr i1 %64, false
  %67 = select i1 %65, i1 true, i1 %66
  %68 = shl i1 %67, false
  %69 = or i1 false, %68
  br i1 %69, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

70:                                               ; preds = %loopEntry.split
  %71 = load i32, ptr %18, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %72
  br label %.split54

.split54:                                         ; preds = %70
  %74 = getelementptr inbounds %struct.User, ptr %73, i32 0, i32 0
  %75 = getelementptr inbounds [64 x i8], ptr %74, i64 0, i64 0
  %76 = load ptr, ptr %16, align 8
  %77 = call i32 @strcmp(ptr noundef %75, ptr noundef %76) #7
  %78 = icmp eq i32 %77, 0
  %79 = select i1 %78, i32 -180618682, i32 2115840762
  store i32 %79, ptr %switchVar, align 4
  br label %.split54.split

.split54.split:                                   ; preds = %.split54
  br label %loopEnd

80:                                               ; preds = %loopEntry.split
  %81 = load i32, ptr %18, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.User, ptr %83, i32 0, i32 1
  br label %.split55

.split55:                                         ; preds = %80
  %85 = getelementptr inbounds [64 x i8], ptr %84, i64 0, i64 0
  %86 = load ptr, ptr %17, align 8
  %87 = call i32 @strcmp(ptr noundef %85, ptr noundef %86) #7
  %88 = icmp eq i32 %87, 0
  %89 = select i1 %88, i32 -402071025, i32 2115840762
  br label %.split55.split

.split55.split:                                   ; preds = %.split55
  store i32 %89, ptr %switchVar, align 4
  br label %loopEnd

90:                                               ; preds = %loopEntry.split
  %91 = load i32, ptr @x.5, align 4
  br label %.split56

.split56:                                         ; preds = %90
  %92 = load i32, ptr @y.6, align 4
  %93 = sub i32 %91, 1
  br label %.split56.split

.split56.split:                                   ; preds = %.split56
  %94 = mul i32 %91, %93
  %95 = urem i32 %94, 2
  %96 = icmp eq i32 %95, 0
  %97 = icmp slt i32 %92, 10
  %98 = lshr i1 %96, false
  %99 = lshr i1 %97, false
  %100 = select i1 %98, i1 true, i1 %99
  %101 = shl i1 %100, false
  %102 = or i1 false, %101
  br i1 %102, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split56.split, %originalBB6alteredBB.split.split
  %103 = load ptr, ptr %16, align 8
  %104 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef %103, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  %105 = call i64 @time(ptr noundef null)
  store i64 %105, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 2), align 8
  %106 = load ptr, ptr %16, align 8
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %106)
  %108 = load i32, ptr %18, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %109
  %111 = getelementptr inbounds %struct.User, ptr %110, i32 0, i32 2
  %112 = getelementptr inbounds [64 x i8], ptr %111, i64 0, i64 0
  %113 = load i32, ptr %18, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %114
  %116 = getelementptr inbounds %struct.User, ptr %115, i32 0, i32 3
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %117 = load i32, ptr %116, align 4
  %118 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %112, i32 noundef %117)
  store i32 1, ptr %15, align 4
  store i32 -1479388530, ptr %switchVar, align 4
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %119 = load i32, ptr @x.5, align 4
  %120 = load i32, ptr @y.6, align 4
  %121 = sub i32 %119, 1
  %122 = mul i32 %119, %121
  %123 = urem i32 %122, 2
  %124 = icmp eq i32 %123, 0
  %125 = icmp slt i32 %120, 10
  %126 = lshr i1 %124, false
  %127 = lshr i1 %125, false
  %128 = select i1 %126, i1 true, i1 %127
  %129 = shl i1 %128, false
  %130 = or i1 false, %129
  br i1 %130, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

131:                                              ; preds = %loopEntry.split
  store i32 -1696738060, ptr %switchVar, align 4
  br label %.split57

.split57:                                         ; preds = %131
  br label %loopEnd

132:                                              ; preds = %loopEntry.split
  %133 = load i32, ptr @x.5, align 4
  %134 = load i32, ptr @y.6, align 4
  %135 = sub i32 %133, 1
  %136 = mul i32 %133, %135
  br label %.split58

.split58:                                         ; preds = %132
  %137 = urem i32 %136, 2
  %138 = icmp eq i32 %137, 0
  br label %.split58.split

.split58.split:                                   ; preds = %.split58
  %139 = icmp slt i32 %134, 10
  %140 = lshr i1 %138, false
  %141 = lshr i1 %139, false
  %142 = select i1 %140, i1 true, i1 %141
  %143 = shl i1 %142, false
  %144 = or i1 false, %143
  br i1 %144, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split58.split, %originalBB10alteredBB.split.split
  %145 = load i32, ptr %18, align 4
  %146 = sub i32 %145, 583226460
  %147 = add i32 %146, 1
  %148 = add i32 %147, 583226460
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %149 = add nsw i32 %145, 1
  store i32 %148, ptr %18, align 4
  store i32 1915395874, ptr %switchVar, align 4
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %150 = load i32, ptr @x.5, align 4
  %151 = load i32, ptr @y.6, align 4
  %152 = sub i32 %150, 1
  %153 = mul i32 %150, %152
  %154 = urem i32 %153, 2
  %155 = icmp eq i32 %154, 0
  %156 = icmp slt i32 %151, 10
  %157 = lshr i1 %155, false
  %158 = lshr i1 %156, false
  %159 = select i1 %157, i1 true, i1 %158
  %160 = shl i1 %159, false
  %161 = or i1 false, %160
  br i1 %161, label %originalBBpart240, label %originalBB10alteredBB

originalBBpart240:                                ; preds = %originalBB10.split.split
  br label %loopEnd

162:                                              ; preds = %loopEntry.split
  %163 = load ptr, ptr %16, align 8
  %164 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %163)
  store i32 0, ptr %15, align 4
  br label %.split59

.split59:                                         ; preds = %162
  store i32 -1479388530, ptr %switchVar, align 4
  br label %.split59.split

.split59.split:                                   ; preds = %.split59
  br label %loopEnd

165:                                              ; preds = %loopEntry.split
  %166 = load i32, ptr @x.5, align 4
  %167 = load i32, ptr @y.6, align 4
  %168 = sub i32 %166, 1
  %169 = mul i32 %166, %168
  %170 = urem i32 %169, 2
  %171 = icmp eq i32 %170, 0
  %172 = icmp slt i32 %167, 10
  br label %.split60

.split60:                                         ; preds = %165
  %173 = lshr i1 %171, false
  %174 = lshr i1 %172, false
  %175 = select i1 %173, i1 true, i1 %174
  %176 = shl i1 %175, false
  %177 = or i1 false, %176
  br label %.split60.split

.split60.split:                                   ; preds = %.split60
  br i1 %177, label %originalBB42, label %originalBB42alteredBB

originalBB42:                                     ; preds = %.split60.split, %originalBB42alteredBB.split
  %178 = load i32, ptr %15, align 4
  %179 = load i32, ptr @x.5, align 4
  %180 = load i32, ptr @y.6, align 4
  %181 = sub i32 %179, 1
  %182 = mul i32 %179, %181
  %183 = urem i32 %182, 2
  br label %originalBB42.split

originalBB42.split:                               ; preds = %originalBB42
  %184 = icmp eq i32 %183, 0
  %185 = icmp slt i32 %180, 10
  %186 = lshr i1 %184, false
  %187 = lshr i1 %185, false
  %188 = select i1 %186, i1 true, i1 %187
  %189 = shl i1 %188, false
  %190 = or i1 false, %189
  br label %originalBB42.split.split

originalBB42.split.split:                         ; preds = %originalBB42.split
  br i1 %190, label %originalBBpart244, label %originalBB42alteredBB

originalBBpart244:                                ; preds = %originalBB42.split.split
  ret i32 %178

loopEnd:                                          ; preds = %.split59.split, %originalBBpart240, %.split57, %originalBBpart28, %.split55.split, %.split54.split, %originalBBpart24, %.split52.split, %.split51.split, %.split50.split, %first.split.split, %switchDefault
  %191 = load i32, ptr @x.5, align 4
  br label %loopEnd.split

loopEnd.split:                                    ; preds = %loopEnd
  %192 = load i32, ptr @y.6, align 4
  %193 = sub i32 %191, 1
  %194 = mul i32 %191, %193
  %195 = urem i32 %194, 2
  %196 = icmp eq i32 %195, 0
  %197 = icmp slt i32 %192, 10
  %198 = lshr i1 %196, false
  %199 = lshr i1 %197, false
  %200 = select i1 %198, i1 true, i1 %199
  %201 = shl i1 %200, false
  %202 = or i1 false, %201
  br label %loopEnd.split.split

loopEnd.split.split:                              ; preds = %loopEnd.split
  br i1 %202, label %originalBB46, label %originalBB46alteredBB

originalBB46:                                     ; preds = %loopEnd.split.split, %originalBB46alteredBB
  %203 = load i32, ptr @x.5, align 4
  %204 = load i32, ptr @y.6, align 4
  %205 = sub i32 %203, 1
  %206 = mul i32 %203, %205
  br label %originalBB46.split

originalBB46.split:                               ; preds = %originalBB46
  %207 = urem i32 %206, 2
  %208 = icmp eq i32 %207, 0
  br label %originalBB46.split.split

originalBB46.split.split:                         ; preds = %originalBB46.split
  %209 = icmp slt i32 %204, 10
  %210 = lshr i1 %208, false
  %211 = lshr i1 %209, false
  %212 = select i1 %210, i1 true, i1 %211
  %213 = shl i1 %212, false
  %214 = or i1 false, %213
  br i1 %214, label %originalBBpart248, label %originalBB46alteredBB

originalBBpart248:                                ; preds = %originalBB46.split.split
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %.reg2memalteredBB = alloca i1, align 1
  %215 = alloca i32, align 4
  %216 = alloca ptr, align 8
  %217 = alloca ptr, align 8
  %218 = alloca i32, align 4
  store ptr %0, ptr %216, align 8
  store ptr %1, ptr %217, align 8
  %219 = load ptr, ptr %216, align 8
  %220 = icmp ne ptr %219, null
  store i1 %220, ptr %.reg2memalteredBB, align 1
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %switchVaralteredBB = alloca i32, align 4
  store i32 -488172322, ptr %switchVaralteredBB, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split53.split
  %221 = load i32, ptr %18, align 4
  %222 = load i32, ptr @v_fbc01149fda7, align 4
  %223 = icmp slt i32 %221, %222
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  %224 = select i1 %223, i32 -1873289614, i32 1008400300
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  store i32 %224, ptr %switchVar, align 4
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split56.split
  %225 = load ptr, ptr %16, align 8
  %226 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef %225, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  %227 = call i64 @time(ptr noundef null)
  store i64 %227, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 2), align 8
  %228 = load ptr, ptr %16, align 8
  %229 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %228)
  %230 = load i32, ptr %18, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %231 = sext i32 %230 to i64
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  %232 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %231
  %233 = getelementptr inbounds %struct.User, ptr %232, i32 0, i32 2
  %234 = getelementptr inbounds [64 x i8], ptr %233, i64 0, i64 0
  %235 = load i32, ptr %18, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %236
  %238 = getelementptr inbounds %struct.User, ptr %237, i32 0, i32 3
  %239 = load i32, ptr %238, align 4
  %240 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %234, i32 noundef %239)
  store i32 1, ptr %15, align 4
  store i32 -1479388530, ptr %switchVar, align 4
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split58.split
  %241 = load i32, ptr %18, align 4
  %_ = shl i32 %241, 583226460
  %_11 = shl i32 %241, 583226460
  %_12 = sub i32 %241, 583226460
  %gen = mul i32 %_12, 583226460
  %_13 = shl i32 %241, 583226460
  %_14 = sub i32 %241, 583226460
  %gen15 = mul i32 %_14, 583226460
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  %_16 = sub i32 %241, 583226460
  %gen17 = mul i32 %_16, 583226460
  %_18 = sub i32 %241, 583226460
  %gen19 = mul i32 %_18, 583226460
  %_20 = sub i32 %241, 583226460
  %gen21 = mul i32 %_20, 583226460
  %_22 = sub i32 0, %241
  %gen23 = add i32 %_22, 583226460
  %242 = sub i32 %241, 583226460
  %_24 = sub i32 %242, 1
  %gen25 = mul i32 %_24, 1
  %243 = add i32 %242, 1
  %_26 = shl i32 %243, 583226460
  %_27 = sub i32 %243, 583226460
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  %gen28 = mul i32 %_27, 583226460
  %_29 = shl i32 %243, 583226460
  %244 = add i32 %243, 583226460
  %_30 = shl i32 %241, 1
  %_31 = shl i32 %241, 1
  %_32 = sub i32 %241, 1
  %gen33 = mul i32 %_32, 1
  %_34 = shl i32 %241, 1
  %_35 = sub i32 0, %241
  %gen36 = add i32 %_35, 1
  %_37 = sub i32 %241, 1
  %gen38 = mul i32 %_37, 1
  %245 = add nsw i32 %241, 1
  store i32 %244, ptr %18, align 4
  store i32 1915395874, ptr %switchVar, align 4
  br label %originalBB10

originalBB42alteredBB:                            ; preds = %originalBB42.split.split, %.split60.split
  %246 = load i32, ptr %15, align 4
  br label %originalBB42alteredBB.split

originalBB42alteredBB.split:                      ; preds = %originalBB42alteredBB
  br label %originalBB42

originalBB46alteredBB:                            ; preds = %originalBB46.split.split, %loopEnd.split.split
  br label %originalBB46
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @strcmp(ptr noundef, ptr noundef) #2

declare i64 @time(ptr noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_3ff16c1a3ff2(ptr noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  br label %.split

.split:                                           ; preds = %1
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 125662700, ptr %switchVar, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %6 = load i32, ptr @x.7, align 4
  %7 = load i32, ptr @y.8, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  %8 = sub i32 %6, 1
  %9 = mul i32 %6, %8
  %10 = urem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  %12 = icmp slt i32 %7, 10
  br label %loopEntry.split.split

loopEntry.split.split:                            ; preds = %loopEntry.split
  %13 = lshr i1 %11, false
  %14 = lshr i1 %12, false
  %15 = select i1 %13, i1 true, i1 %14
  %16 = shl i1 %15, false
  %17 = or i1 false, %16
  br i1 %17, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %loopEntry.split.split, %originalBBalteredBB.split
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %18 = load i32, ptr @x.7, align 4
  %19 = load i32, ptr @y.8, align 4
  %20 = sub i32 %18, 1
  %21 = mul i32 %18, %20
  %22 = urem i32 %21, 2
  %23 = icmp eq i32 %22, 0
  %24 = icmp slt i32 %19, 10
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %25 = lshr i1 %23, false
  %26 = lshr i1 %24, false
  %27 = select i1 %25, i1 true, i1 %26
  %28 = shl i1 %27, false
  %29 = or i1 false, %28
  br i1 %29, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  switch i32 %switchVar1, label %switchDefault [
    i32 125662700, label %first
    i32 1400300282, label %79
    i32 -1965951717, label %80
    i32 -1448726516, label %86
    i32 1648072502, label %112
    i32 -1064939683, label %114
  ]

switchDefault:                                    ; preds = %originalBBpart2
  %30 = load i32, ptr @x.7, align 4
  %31 = load i32, ptr @y.8, align 4
  %32 = sub i32 %30, 1
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %33 = mul i32 %30, %32
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  %34 = urem i32 %33, 2
  %35 = icmp eq i32 %34, 0
  %36 = icmp slt i32 %31, 10
  %37 = lshr i1 %35, false
  %38 = lshr i1 %36, false
  %39 = select i1 %37, i1 true, i1 %38
  %40 = shl i1 %39, false
  %41 = or i1 false, %40
  br i1 %41, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %switchDefault.split.split, %originalBB2alteredBB
  %42 = load i32, ptr @x.7, align 4
  %43 = load i32, ptr @y.8, align 4
  %44 = sub i32 %42, 1
  %45 = mul i32 %42, %44
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %46 = urem i32 %45, 2
  %47 = icmp eq i32 %46, 0
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %48 = icmp slt i32 %43, 10
  %49 = lshr i1 %47, false
  %50 = lshr i1 %48, false
  %51 = select i1 %49, i1 true, i1 %50
  %52 = shl i1 %51, false
  %53 = or i1 false, %52
  br i1 %53, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

first:                                            ; preds = %originalBBpart2
  %54 = load i32, ptr @x.7, align 4
  %55 = load i32, ptr @y.8, align 4
  br label %first.split

first.split:                                      ; preds = %first
  %56 = sub i32 %54, 1
  %57 = mul i32 %54, %56
  %58 = urem i32 %57, 2
  %59 = icmp eq i32 %58, 0
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  %60 = icmp slt i32 %55, 10
  %61 = lshr i1 %59, false
  %62 = lshr i1 %60, false
  %63 = select i1 %61, i1 true, i1 %62
  %64 = shl i1 %63, false
  %65 = or i1 false, %64
  br i1 %65, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %first.split.split, %originalBB6alteredBB.split.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %66 = select i1 %.reload, i32 -1965951717, i32 1400300282
  store i32 %66, ptr %switchVar, align 4
  %67 = load i32, ptr @x.7, align 4
  %68 = load i32, ptr @y.8, align 4
  %69 = sub i32 %67, 1
  %70 = mul i32 %67, %69
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %71 = urem i32 %70, 2
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %72 = icmp eq i32 %71, 0
  %73 = icmp slt i32 %68, 10
  %74 = lshr i1 %72, false
  %75 = lshr i1 %73, false
  %76 = select i1 %74, i1 true, i1 %75
  %77 = shl i1 %76, false
  %78 = or i1 false, %77
  br i1 %78, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

79:                                               ; preds = %originalBBpart2
  store i32 0, ptr %2, align 4
  br label %.split14

.split14:                                         ; preds = %79
  store i32 -1064939683, ptr %switchVar, align 4
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  br label %loopEnd

80:                                               ; preds = %originalBBpart2
  %81 = load ptr, ptr %3, align 8
  br label %.split15

.split15:                                         ; preds = %80
  %82 = load ptr, ptr @API_KEY, align 8
  %83 = call i32 @strcmp(ptr noundef %81, ptr noundef %82) #7
  %84 = icmp eq i32 %83, 0
  br label %.split15.split

.split15.split:                                   ; preds = %.split15
  %85 = select i1 %84, i32 -1448726516, i32 1648072502
  store i32 %85, ptr %switchVar, align 4
  br label %loopEnd

86:                                               ; preds = %originalBBpart2
  %87 = load i32, ptr @x.7, align 4
  %88 = load i32, ptr @y.8, align 4
  br label %.split16

.split16:                                         ; preds = %86
  %89 = sub i32 %87, 1
  %90 = mul i32 %87, %89
  %91 = urem i32 %90, 2
  br label %.split16.split

.split16.split:                                   ; preds = %.split16
  %92 = icmp eq i32 %91, 0
  %93 = icmp slt i32 %88, 10
  %94 = lshr i1 %92, false
  %95 = lshr i1 %93, false
  %96 = select i1 %94, i1 true, i1 %95
  %97 = shl i1 %96, false
  %98 = or i1 false, %97
  br i1 %98, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split16.split, %originalBB10alteredBB.split.split
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 1, ptr %2, align 4
  store i32 -1064939683, ptr %switchVar, align 4
  %100 = load i32, ptr @x.7, align 4
  %101 = load i32, ptr @y.8, align 4
  %102 = sub i32 %100, 1
  %103 = mul i32 %100, %102
  %104 = urem i32 %103, 2
  %105 = icmp eq i32 %104, 0
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %106 = icmp slt i32 %101, 10
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %107 = lshr i1 %105, false
  %108 = lshr i1 %106, false
  %109 = select i1 %107, i1 true, i1 %108
  %110 = shl i1 %109, false
  %111 = or i1 false, %110
  br i1 %111, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

112:                                              ; preds = %originalBBpart2
  %113 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  store i32 0, ptr %2, align 4
  br label %.split17

.split17:                                         ; preds = %112
  store i32 -1064939683, ptr %switchVar, align 4
  br label %.split17.split

.split17.split:                                   ; preds = %.split17
  br label %loopEnd

114:                                              ; preds = %originalBBpart2
  %115 = load i32, ptr %2, align 4
  br label %.split18

.split18:                                         ; preds = %114
  ret i32 %115

loopEnd:                                          ; preds = %.split17.split, %originalBBpart212, %.split15.split, %.split14.split, %originalBBpart28, %originalBBpart24
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %loopEntry.split.split
  %switchVar1alteredBB = load i32, ptr %switchVar, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %switchDefault.split.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %first.split.split
  %.reloadalteredBB = load i1, ptr %.reg2mem, align 1
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %116 = select i1 %.reloadalteredBB, i32 -1965951717, i32 1400300282
  store i32 %116, ptr %switchVar, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split16.split
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 1, ptr %2, align 4
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  store i32 -1064939683, ptr %switchVar, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  br label %originalBB10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_12f52c0c0856(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i64 @llvm.objectsize.i64.p0(ptr %6, i1 false, i1 true, i1 false)
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr @JWT_SECRET, align 8
  br label %.split

.split:                                           ; preds = %2
  %10 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %5, i64 noundef 128, i32 noundef 0, i64 noundef %7, ptr noundef @.str.17, ptr noundef %8, ptr noundef %9)
  br label %.split.split

.split.split:                                     ; preds = %.split
  %11 = load ptr, ptr %4, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %11)
  ret void
}

declare i32 @__snprintf_chk(ptr noundef, i64 noundef, i32 noundef, i64 noundef, ptr noundef, ...) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_9f5974383c59(ptr noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  br label %.split

.split:                                           ; preds = %1
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -1450820200, ptr %switchVar, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -1450820200, label %first
    i32 1225040456, label %31
    i32 239382129, label %32
    i32 -173874733, label %38
    i32 -2436505, label %64
    i32 -1364133187, label %90
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %6 = load i32, ptr @x.11, align 4
  %7 = load i32, ptr @y.12, align 4
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %8 = sub i32 %6, 1
  %9 = mul i32 %6, %8
  %10 = urem i32 %9, 2
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  %11 = icmp eq i32 %10, 0
  %12 = icmp slt i32 %7, 10
  %13 = lshr i1 %11, false
  %14 = lshr i1 %12, false
  %15 = select i1 %13, i1 true, i1 %14
  %16 = shl i1 %15, false
  %17 = or i1 false, %16
  br i1 %17, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %18 = load i32, ptr @x.11, align 4
  %19 = load i32, ptr @y.12, align 4
  %20 = sub i32 %18, 1
  %21 = mul i32 %18, %20
  %22 = urem i32 %21, 2
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %23 = icmp eq i32 %22, 0
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %24 = icmp slt i32 %19, 10
  %25 = lshr i1 %23, false
  %26 = lshr i1 %24, false
  %27 = select i1 %25, i1 true, i1 %26
  %28 = shl i1 %27, false
  %29 = or i1 false, %28
  br i1 %29, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %30 = select i1 %.reload, i32 239382129, i32 1225040456
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %30, ptr %switchVar, align 4
  br label %loopEnd

31:                                               ; preds = %loopEntry.split
  store i32 0, ptr %2, align 4
  br label %.split14

.split14:                                         ; preds = %31
  store i32 -1364133187, ptr %switchVar, align 4
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  br label %loopEnd

32:                                               ; preds = %loopEntry.split
  %33 = load ptr, ptr %3, align 8
  %34 = load ptr, ptr @JWT_SECRET, align 8
  %35 = call ptr @strstr(ptr noundef %33, ptr noundef %34) #7
  %36 = icmp ne ptr %35, null
  %37 = select i1 %36, i32 -173874733, i32 -2436505
  br label %.split15

.split15:                                         ; preds = %32
  store i32 %37, ptr %switchVar, align 4
  br label %.split15.split

.split15.split:                                   ; preds = %.split15
  br label %loopEnd

38:                                               ; preds = %loopEntry.split
  %39 = load i32, ptr @x.11, align 4
  %40 = load i32, ptr @y.12, align 4
  %41 = sub i32 %39, 1
  %42 = mul i32 %39, %41
  %43 = urem i32 %42, 2
  %44 = icmp eq i32 %43, 0
  br label %.split16

.split16:                                         ; preds = %38
  %45 = icmp slt i32 %40, 10
  %46 = lshr i1 %44, false
  %47 = lshr i1 %45, false
  %48 = select i1 %46, i1 true, i1 %47
  %49 = shl i1 %48, false
  %50 = or i1 false, %49
  br label %.split16.split

.split16.split:                                   ; preds = %.split16
  br i1 %50, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split16.split, %originalBB2alteredBB.split.split
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  store i32 1, ptr %2, align 4
  store i32 -1364133187, ptr %switchVar, align 4
  %52 = load i32, ptr @x.11, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %53 = load i32, ptr @y.12, align 4
  %54 = sub i32 %52, 1
  %55 = mul i32 %52, %54
  %56 = urem i32 %55, 2
  %57 = icmp eq i32 %56, 0
  %58 = icmp slt i32 %53, 10
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %59 = lshr i1 %57, false
  %60 = lshr i1 %58, false
  %61 = select i1 %59, i1 true, i1 %60
  %62 = shl i1 %61, false
  %63 = or i1 false, %62
  br i1 %63, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

64:                                               ; preds = %loopEntry.split
  %65 = load i32, ptr @x.11, align 4
  %66 = load i32, ptr @y.12, align 4
  %67 = sub i32 %65, 1
  %68 = mul i32 %65, %67
  br label %.split17

.split17:                                         ; preds = %64
  %69 = urem i32 %68, 2
  %70 = icmp eq i32 %69, 0
  %71 = icmp slt i32 %66, 10
  br label %.split17.split

.split17.split:                                   ; preds = %.split17
  %72 = lshr i1 %70, false
  %73 = lshr i1 %71, false
  %74 = select i1 %72, i1 true, i1 %73
  %75 = shl i1 %74, false
  %76 = or i1 false, %75
  br i1 %76, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split17.split, %originalBB6alteredBB.split.split
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  store i32 0, ptr %2, align 4
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  store i32 -1364133187, ptr %switchVar, align 4
  %78 = load i32, ptr @x.11, align 4
  %79 = load i32, ptr @y.12, align 4
  %80 = sub i32 %78, 1
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %81 = mul i32 %78, %80
  %82 = urem i32 %81, 2
  %83 = icmp eq i32 %82, 0
  %84 = icmp slt i32 %79, 10
  %85 = lshr i1 %83, false
  %86 = lshr i1 %84, false
  %87 = select i1 %85, i1 true, i1 %86
  %88 = shl i1 %87, false
  %89 = or i1 false, %88
  br i1 %89, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

90:                                               ; preds = %loopEntry.split
  %91 = load i32, ptr @x.11, align 4
  %92 = load i32, ptr @y.12, align 4
  %93 = sub i32 %91, 1
  %94 = mul i32 %91, %93
  %95 = urem i32 %94, 2
  %96 = icmp eq i32 %95, 0
  %97 = icmp slt i32 %92, 10
  br label %.split18

.split18:                                         ; preds = %90
  %98 = lshr i1 %96, false
  %99 = lshr i1 %97, false
  %100 = select i1 %98, i1 true, i1 %99
  %101 = shl i1 %100, false
  %102 = or i1 false, %101
  br label %.split18.split

.split18.split:                                   ; preds = %.split18
  br i1 %102, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split18.split, %originalBB10alteredBB.split
  %103 = load i32, ptr %2, align 4
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %104 = load i32, ptr @x.11, align 4
  %105 = load i32, ptr @y.12, align 4
  %106 = sub i32 %104, 1
  %107 = mul i32 %104, %106
  %108 = urem i32 %107, 2
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %109 = icmp eq i32 %108, 0
  %110 = icmp slt i32 %105, 10
  %111 = lshr i1 %109, false
  %112 = lshr i1 %110, false
  %113 = select i1 %111, i1 true, i1 %112
  %114 = shl i1 %113, false
  %115 = or i1 false, %114
  br i1 %115, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  ret i32 %103

loopEnd:                                          ; preds = %originalBBpart28, %originalBBpart24, %.split15.split, %.split14.split, %first.split.split, %originalBBpart2
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split16.split
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  store i32 1, ptr %2, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 -1364133187, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split17.split
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  store i32 0, ptr %2, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  store i32 -1364133187, ptr %switchVar, align 4
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split18.split
  %118 = load i32, ptr %2, align 4
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  br label %originalBB10
}

; Function Attrs: nounwind
declare ptr @strstr(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_34ede220d91a(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  br label %.split

.split:                                           ; preds = %2
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %switchVar = alloca i32, align 4
  store i32 -448213129, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %originalBBpart216
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -448213129, label %7
    i32 -27608971, label %12
    i32 478845223, label %22
    i32 970866125, label %55
    i32 1120387181, label %64
    i32 222001136, label %98
    i32 -99371522, label %123
    i32 -1033735633, label %129
    i32 663526605, label %130
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

7:                                                ; preds = %loopEntry.split
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr @v_fbc01149fda7, align 4
  br label %.split18

.split18:                                         ; preds = %7
  %10 = icmp slt i32 %8, %9
  br label %.split18.split

.split18.split:                                   ; preds = %.split18
  %11 = select i1 %10, i32 -27608971, i32 -1033735633
  store i32 %11, ptr %switchVar, align 4
  br label %loopEnd

12:                                               ; preds = %loopEntry.split
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.User, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [64 x i8], ptr %16, i64 0, i64 0
  br label %.split19

.split19:                                         ; preds = %12
  %18 = load ptr, ptr %4, align 8
  %19 = call i32 @strcmp(ptr noundef %17, ptr noundef %18) #7
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 478845223, i32 222001136
  store i32 %21, ptr %switchVar, align 4
  br label %.split19.split

.split19.split:                                   ; preds = %.split19
  br label %loopEnd

22:                                               ; preds = %loopEntry.split
  %23 = load i32, ptr @x.13, align 4
  %24 = load i32, ptr @y.14, align 4
  %25 = sub i32 %23, 1
  %26 = mul i32 %23, %25
  %27 = urem i32 %26, 2
  %28 = icmp eq i32 %27, 0
  br label %.split20

.split20:                                         ; preds = %22
  %29 = icmp slt i32 %24, 10
  br label %.split20.split

.split20.split:                                   ; preds = %.split20
  %30 = lshr i1 %28, false
  %31 = lshr i1 %29, false
  %32 = select i1 %30, i1 true, i1 %31
  %33 = shl i1 %32, false
  %34 = or i1 false, %33
  br i1 %34, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split20.split, %originalBBalteredBB.split.split
  %35 = load i32, ptr %6, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %36
  %38 = getelementptr inbounds %struct.User, ptr %37, i32 0, i32 3
  %39 = load i32, ptr %38, align 4
  %40 = load i32, ptr %5, align 4
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %41 = icmp sge i32 %39, %40
  %42 = select i1 %41, i32 970866125, i32 1120387181
  store i32 %42, ptr %switchVar, align 4
  %43 = load i32, ptr @x.13, align 4
  %44 = load i32, ptr @y.14, align 4
  %45 = sub i32 %43, 1
  %46 = mul i32 %43, %45
  %47 = urem i32 %46, 2
  %48 = icmp eq i32 %47, 0
  %49 = icmp slt i32 %44, 10
  %50 = lshr i1 %48, false
  %51 = lshr i1 %49, false
  %52 = select i1 %50, i1 true, i1 %51
  %53 = shl i1 %52, false
  %54 = or i1 false, %53
  br i1 %54, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

55:                                               ; preds = %loopEntry.split
  %56 = load ptr, ptr %4, align 8
  br label %.split21

.split21:                                         ; preds = %55
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %58
  %60 = getelementptr inbounds %struct.User, ptr %59, i32 0, i32 3
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %5, align 4
  br label %.split21.split

.split21.split:                                   ; preds = %.split21
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, ptr noundef %56, i32 noundef %61, i32 noundef %62)
  store i32 1, ptr %3, align 4
  store i32 663526605, ptr %switchVar, align 4
  br label %loopEnd

64:                                               ; preds = %loopEntry.split
  %65 = load i32, ptr @x.13, align 4
  %66 = load i32, ptr @y.14, align 4
  %67 = sub i32 %65, 1
  %68 = mul i32 %65, %67
  %69 = urem i32 %68, 2
  %70 = icmp eq i32 %69, 0
  %71 = icmp slt i32 %66, 10
  br label %.split22

.split22:                                         ; preds = %64
  %72 = lshr i1 %70, false
  %73 = lshr i1 %71, false
  %74 = select i1 %72, i1 true, i1 %73
  %75 = shl i1 %74, false
  %76 = or i1 false, %75
  br label %.split22.split

.split22.split:                                   ; preds = %.split22
  br i1 %76, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split22.split, %originalBB2alteredBB.split.split
  %77 = load i32, ptr %6, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %78
  %80 = getelementptr inbounds %struct.User, ptr %79, i32 0, i32 3
  %81 = load i32, ptr %80, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %82 = load i32, ptr %5, align 4
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %81, i32 noundef %82)
  store i32 0, ptr %3, align 4
  store i32 663526605, ptr %switchVar, align 4
  %84 = load i32, ptr @x.13, align 4
  %85 = load i32, ptr @y.14, align 4
  %86 = sub i32 %84, 1
  %87 = mul i32 %84, %86
  %88 = urem i32 %87, 2
  %89 = icmp eq i32 %88, 0
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %90 = icmp slt i32 %85, 10
  %91 = lshr i1 %89, false
  %92 = lshr i1 %90, false
  %93 = select i1 %91, i1 true, i1 %92
  %94 = xor i1 %93, false
  %95 = xor i1 %94, false
  %96 = shl i1 %95, false
  %97 = or i1 false, %96
  br i1 %97, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

98:                                               ; preds = %loopEntry.split
  %99 = load i32, ptr @x.13, align 4
  %100 = load i32, ptr @y.14, align 4
  br label %.split23

.split23:                                         ; preds = %98
  %101 = sub i32 %99, 1
  %102 = mul i32 %99, %101
  %103 = urem i32 %102, 2
  %104 = icmp eq i32 %103, 0
  %105 = icmp slt i32 %100, 10
  br label %.split23.split

.split23.split:                                   ; preds = %.split23
  %106 = lshr i1 %104, false
  %107 = lshr i1 %105, false
  %108 = select i1 %106, i1 true, i1 %107
  %109 = shl i1 %108, false
  %110 = or i1 false, %109
  br i1 %110, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split23.split, %originalBB6alteredBB.split
  store i32 -99371522, ptr %switchVar, align 4
  %111 = load i32, ptr @x.13, align 4
  %112 = load i32, ptr @y.14, align 4
  %113 = sub i32 %111, 1
  %114 = mul i32 %111, %113
  %115 = urem i32 %114, 2
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %116 = icmp eq i32 %115, 0
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %117 = icmp slt i32 %112, 10
  %118 = lshr i1 %116, false
  %119 = lshr i1 %117, false
  %120 = select i1 %118, i1 true, i1 %119
  %121 = shl i1 %120, false
  %122 = or i1 false, %121
  br i1 %122, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

123:                                              ; preds = %loopEntry.split
  %124 = load i32, ptr %6, align 4
  br label %.split24

.split24:                                         ; preds = %123
  %125 = sub i32 %124, 431063796
  %126 = add i32 %125, 1
  %127 = add i32 %126, 431063796
  %128 = add nsw i32 %124, 1
  store i32 %127, ptr %6, align 4
  br label %.split24.split

.split24.split:                                   ; preds = %.split24
  store i32 -448213129, ptr %switchVar, align 4
  br label %loopEnd

129:                                              ; preds = %loopEntry.split
  store i32 0, ptr %3, align 4
  br label %.split25

.split25:                                         ; preds = %129
  store i32 663526605, ptr %switchVar, align 4
  br label %.split25.split

.split25.split:                                   ; preds = %.split25
  br label %loopEnd

130:                                              ; preds = %loopEntry.split
  %131 = load i32, ptr @x.13, align 4
  %132 = load i32, ptr @y.14, align 4
  br label %.split26

.split26:                                         ; preds = %130
  %133 = sub i32 %131, 1
  br label %.split26.split

.split26.split:                                   ; preds = %.split26
  %134 = mul i32 %131, %133
  %135 = urem i32 %134, 2
  %136 = icmp eq i32 %135, 0
  %137 = icmp slt i32 %132, 10
  %138 = lshr i1 %136, false
  %139 = lshr i1 %137, false
  %140 = select i1 %138, i1 true, i1 %139
  %141 = shl i1 %140, false
  %142 = or i1 false, %141
  br i1 %142, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split26.split, %originalBB10alteredBB.split
  %143 = load i32, ptr %3, align 4
  %144 = load i32, ptr @x.13, align 4
  %145 = load i32, ptr @y.14, align 4
  %146 = sub i32 %144, 1
  %147 = mul i32 %144, %146
  %148 = urem i32 %147, 2
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %149 = icmp eq i32 %148, 0
  %150 = icmp slt i32 %145, 10
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %151 = lshr i1 %149, false
  %152 = lshr i1 %150, false
  %153 = select i1 %151, i1 true, i1 %152
  %154 = shl i1 %153, false
  %155 = or i1 false, %154
  br i1 %155, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  ret i32 %143

loopEnd:                                          ; preds = %.split25.split, %.split24.split, %originalBBpart28, %originalBBpart24, %.split21.split, %originalBBpart2, %.split19.split, %.split18.split, %switchDefault
  %156 = load i32, ptr @x.13, align 4
  %157 = load i32, ptr @y.14, align 4
  %158 = sub i32 %156, 1
  br label %loopEnd.split

loopEnd.split:                                    ; preds = %loopEnd
  %159 = mul i32 %156, %158
  %160 = urem i32 %159, 2
  %161 = icmp eq i32 %160, 0
  br label %loopEnd.split.split

loopEnd.split.split:                              ; preds = %loopEnd.split
  %162 = icmp slt i32 %157, 10
  %163 = lshr i1 %161, false
  %164 = lshr i1 %162, false
  %165 = select i1 %163, i1 true, i1 %164
  %166 = shl i1 %165, false
  %167 = or i1 false, %166
  br i1 %167, label %originalBB14, label %originalBB14alteredBB

originalBB14:                                     ; preds = %loopEnd.split.split, %originalBB14alteredBB
  %168 = load i32, ptr @x.13, align 4
  br label %originalBB14.split

originalBB14.split:                               ; preds = %originalBB14
  %169 = load i32, ptr @y.14, align 4
  %170 = sub i32 %168, 1
  %171 = mul i32 %168, %170
  %172 = urem i32 %171, 2
  br label %originalBB14.split.split

originalBB14.split.split:                         ; preds = %originalBB14.split
  %173 = icmp eq i32 %172, 0
  %174 = icmp slt i32 %169, 10
  %175 = lshr i1 %173, false
  %176 = lshr i1 %174, false
  %177 = select i1 %175, i1 true, i1 %176
  %178 = shl i1 %177, false
  %179 = or i1 false, %178
  br i1 %179, label %originalBBpart216, label %originalBB14alteredBB

originalBBpart216:                                ; preds = %originalBB14.split.split
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split20.split
  %180 = load i32, ptr %6, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %181
  %183 = getelementptr inbounds %struct.User, ptr %182, i32 0, i32 3
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %184 = load i32, ptr %183, align 4
  %185 = load i32, ptr %5, align 4
  %186 = icmp sge i32 %184, %185
  %187 = select i1 %186, i32 970866125, i32 1120387181
  store i32 %187, ptr %switchVar, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split22.split
  %188 = load i32, ptr %6, align 4
  %189 = sext i32 %188 to i64
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  %190 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %189
  %191 = getelementptr inbounds %struct.User, ptr %190, i32 0, i32 3
  %192 = load i32, ptr %191, align 4
  %193 = load i32, ptr %5, align 4
  %194 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %192, i32 noundef %193)
  store i32 0, ptr %3, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  store i32 663526605, ptr %switchVar, align 4
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split23.split
  store i32 -99371522, ptr %switchVar, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split26.split
  %195 = load i32, ptr %3, align 4
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  br label %originalBB10

originalBB14alteredBB:                            ; preds = %originalBB14.split.split, %loopEnd.split.split
  br label %originalBB14
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_420e96d771d4() #0 {
  %1 = load i32, ptr @x.15, align 4
  %2 = load i32, ptr @y.16, align 4
  %3 = sub i32 %1, 1
  br label %.split

.split:                                           ; preds = %0
  %4 = mul i32 %1, %3
  %5 = urem i32 %4, 2
  %6 = icmp eq i32 %5, 0
  %7 = icmp slt i32 %2, 10
  br label %.split.split

.split.split:                                     ; preds = %.split
  %8 = lshr i1 %6, false
  %9 = lshr i1 %7, false
  %10 = select i1 %8, i1 true, i1 %9
  %11 = shl i1 %10, false
  %12 = or i1 false, %11
  br i1 %12, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  %14 = load ptr, ptr @DB_CONNECTION_STRING, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, ptr noundef %14)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %17 = load i32, ptr @x.15, align 4
  %18 = load i32, ptr @y.16, align 4
  %19 = sub i32 %17, 1
  %20 = mul i32 %17, %19
  %21 = urem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  %23 = icmp slt i32 %18, 10
  %24 = lshr i1 %22, false
  %25 = lshr i1 %23, false
  %26 = select i1 %24, i1 true, i1 %25
  %27 = shl i1 %26, false
  %28 = or i1 false, %27
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %28, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret void

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  %30 = load ptr, ptr @DB_CONNECTION_STRING, align 8
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, ptr noundef %30)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_f707f7349698(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load i32, ptr @x.17, align 4
  br label %.split

.split:                                           ; preds = %2
  %4 = load i32, ptr @y.18, align 4
  %5 = sub i32 %3, 1
  %6 = mul i32 %3, %5
  %7 = urem i32 %6, 2
  %8 = icmp eq i32 %7, 0
  %9 = icmp slt i32 %4, 10
  br label %.split.split

.split.split:                                     ; preds = %.split
  %10 = lshr i1 %8, false
  %11 = lshr i1 %9, false
  %12 = select i1 %10, i1 true, i1 %11
  %13 = shl i1 %12, false
  %14 = or i1 false, %13
  br i1 %14, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  store ptr %0, ptr %15, align 8
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  store ptr %1, ptr %16, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %16, align 8
  %19 = call i64 @llvm.objectsize.i64.p0(ptr %18, i1 false, i1 true, i1 false)
  %20 = load ptr, ptr %15, align 8
  %21 = load ptr, ptr @ENCRYPTION_KEY, align 8
  %22 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %17, i64 noundef 256, i32 noundef 0, i64 noundef %19, ptr noundef @.str.26, ptr noundef %20, ptr noundef %21)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %24 = load i32, ptr @x.17, align 4
  %25 = load i32, ptr @y.18, align 4
  %26 = sub i32 %24, 1
  %27 = mul i32 %24, %26
  %28 = urem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  %30 = icmp slt i32 %25, 10
  %31 = lshr i1 %29, false
  %32 = lshr i1 %30, false
  %33 = select i1 %31, i1 true, i1 %32
  %34 = shl i1 %33, false
  %35 = or i1 false, %34
  br i1 %35, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret void

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  store ptr %0, ptr %36, align 8
  store ptr %1, ptr %37, align 8
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %38 = load ptr, ptr %37, align 8
  %39 = load ptr, ptr %37, align 8
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  %40 = call i64 @llvm.objectsize.i64.p0(ptr %39, i1 false, i1 true, i1 false)
  %41 = load ptr, ptr %36, align 8
  %42 = load ptr, ptr @ENCRYPTION_KEY, align 8
  %43 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %38, i64 noundef 256, i32 noundef 0, i64 noundef %40, ptr noundef @.str.26, ptr noundef %41, ptr noundef %42)
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  br label %originalBB
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_1a2ef98af176(ptr noundef %0, ptr noundef %1) #0 {
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  br label %.split

.split:                                           ; preds = %2
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  br label %.split.split

.split.split:                                     ; preds = %.split
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  store i1 %7, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -1464786625, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -1464786625, label %first
    i32 -16827548, label %9
    i32 -762906843, label %13
    i32 -1853230946, label %14
    i32 1129505306, label %20
    i32 -1065924899, label %22
    i32 638094440, label %24
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %8 = select i1 %.reload, i32 -16827548, i32 -762906843
  br label %first.split

first.split:                                      ; preds = %first
  store i32 %8, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

9:                                                ; preds = %loopEntry.split
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br label %.split2

.split2:                                          ; preds = %9
  %12 = select i1 %11, i32 -1853230946, i32 -762906843
  store i32 %12, ptr %switchVar, align 4
  br label %.split2.split

.split2.split:                                    ; preds = %.split2
  br label %loopEnd

13:                                               ; preds = %loopEntry.split
  store i32 0, ptr %3, align 4
  br label %.split3

.split3:                                          ; preds = %13
  store i32 638094440, ptr %switchVar, align 4
  br label %.split3.split

.split3.split:                                    ; preds = %.split3
  br label %loopEnd

14:                                               ; preds = %loopEntry.split
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr @OAUTH_CLIENT_SECRET, align 8
  %17 = call i32 @strcmp(ptr noundef %15, ptr noundef %16) #7
  %18 = icmp eq i32 %17, 0
  br label %.split4

.split4:                                          ; preds = %14
  %19 = select i1 %18, i32 1129505306, i32 -1065924899
  br label %.split4.split

.split4.split:                                    ; preds = %.split4
  store i32 %19, ptr %switchVar, align 4
  br label %loopEnd

20:                                               ; preds = %loopEntry.split
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  br label %.split5

.split5:                                          ; preds = %20
  store i32 1, ptr %3, align 4
  store i32 638094440, ptr %switchVar, align 4
  br label %.split5.split

.split5.split:                                    ; preds = %.split5
  br label %loopEnd

22:                                               ; preds = %loopEntry.split
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  br label %.split6

.split6:                                          ; preds = %22
  store i32 0, ptr %3, align 4
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  store i32 638094440, ptr %switchVar, align 4
  br label %loopEnd

24:                                               ; preds = %loopEntry.split
  %25 = load i32, ptr @x.19, align 4
  br label %.split7

.split7:                                          ; preds = %24
  %26 = load i32, ptr @y.20, align 4
  %27 = sub i32 %25, 1
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  %28 = mul i32 %25, %27
  %29 = urem i32 %28, 2
  %30 = icmp eq i32 %29, 0
  %31 = icmp slt i32 %26, 10
  %32 = lshr i1 %30, false
  %33 = lshr i1 %31, false
  %34 = select i1 %32, i1 true, i1 %33
  %35 = shl i1 %34, false
  %36 = or i1 false, %35
  br i1 %36, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split7.split, %originalBBalteredBB.split
  %37 = load i32, ptr %3, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %38 = load i32, ptr @x.19, align 4
  %39 = load i32, ptr @y.20, align 4
  %40 = sub i32 %38, 1
  %41 = mul i32 %38, %40
  %42 = urem i32 %41, 2
  %43 = icmp eq i32 %42, 0
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %44 = icmp slt i32 %39, 10
  %45 = lshr i1 %43, false
  %46 = lshr i1 %44, false
  %47 = select i1 %45, i1 true, i1 %46
  %48 = shl i1 %47, false
  %49 = or i1 false, %48
  br i1 %49, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret i32 %37

loopEnd:                                          ; preds = %.split6.split, %.split5.split, %.split4.split, %.split3.split, %.split2.split, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split7.split
  %50 = load i32, ptr %3, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  br label %originalBB
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_fcae2dd27871(ptr noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  br label %.split

.split:                                           ; preds = %1
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -1968565644, ptr %switchVar, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %6 = load i32, ptr @x.21, align 4
  %7 = load i32, ptr @y.22, align 4
  %8 = sub i32 %6, 1
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  %9 = mul i32 %6, %8
  br label %loopEntry.split.split

loopEntry.split.split:                            ; preds = %loopEntry.split
  %10 = urem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  %12 = icmp slt i32 %7, 10
  %13 = lshr i1 %11, false
  %14 = lshr i1 %12, false
  %15 = select i1 %13, i1 true, i1 %14
  %16 = shl i1 %15, false
  %17 = or i1 false, %16
  br i1 %17, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %loopEntry.split.split, %originalBBalteredBB.split
  %switchVar1 = load i32, ptr %switchVar, align 4
  %18 = load i32, ptr @x.21, align 4
  %19 = load i32, ptr @y.22, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %20 = sub i32 %18, 1
  %21 = mul i32 %18, %20
  %22 = urem i32 %21, 2
  %23 = icmp eq i32 %22, 0
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %24 = icmp slt i32 %19, 10
  %25 = lshr i1 %23, false
  %26 = lshr i1 %24, false
  %27 = select i1 %25, i1 true, i1 %26
  %28 = shl i1 %27, false
  %29 = or i1 false, %28
  br i1 %29, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  switch i32 %switchVar1, label %switchDefault [
    i32 -1968565644, label %first
    i32 -1598022696, label %31
    i32 -205602350, label %33
    i32 814460083, label %39
    i32 320062187, label %41
    i32 -1011269394, label %67
  ]

switchDefault:                                    ; preds = %originalBBpart2
  br label %loopEnd

first:                                            ; preds = %originalBBpart2
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %30 = select i1 %.reload, i32 -205602350, i32 -1598022696
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %30, ptr %switchVar, align 4
  br label %loopEnd

31:                                               ; preds = %originalBBpart2
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  br label %.split6

.split6:                                          ; preds = %31
  store i32 0, ptr %2, align 4
  store i32 -1011269394, ptr %switchVar, align 4
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  br label %loopEnd

33:                                               ; preds = %originalBBpart2
  %34 = load ptr, ptr %3, align 8
  %35 = load ptr, ptr @LICENSE_KEY, align 8
  %36 = call i32 @strcmp(ptr noundef %34, ptr noundef %35) #7
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 814460083, i32 320062187
  br label %.split7

.split7:                                          ; preds = %33
  store i32 %38, ptr %switchVar, align 4
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  br label %loopEnd

39:                                               ; preds = %originalBBpart2
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  br label %.split8

.split8:                                          ; preds = %39
  store i32 1, ptr %2, align 4
  br label %.split8.split

.split8.split:                                    ; preds = %.split8
  store i32 -1011269394, ptr %switchVar, align 4
  br label %loopEnd

41:                                               ; preds = %originalBBpart2
  %42 = load i32, ptr @x.21, align 4
  br label %.split9

.split9:                                          ; preds = %41
  %43 = load i32, ptr @y.22, align 4
  %44 = sub i32 %42, 1
  %45 = mul i32 %42, %44
  %46 = urem i32 %45, 2
  %47 = icmp eq i32 %46, 0
  br label %.split9.split

.split9.split:                                    ; preds = %.split9
  %48 = icmp slt i32 %43, 10
  %49 = lshr i1 %47, false
  %50 = lshr i1 %48, false
  %51 = select i1 %49, i1 true, i1 %50
  %52 = shl i1 %51, false
  %53 = or i1 false, %52
  br i1 %53, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split9.split, %originalBB2alteredBB.split.split
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  store i32 0, ptr %2, align 4
  store i32 -1011269394, ptr %switchVar, align 4
  %55 = load i32, ptr @x.21, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %56 = load i32, ptr @y.22, align 4
  %57 = sub i32 %55, 1
  %58 = mul i32 %55, %57
  %59 = urem i32 %58, 2
  %60 = icmp eq i32 %59, 0
  %61 = icmp slt i32 %56, 10
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %62 = lshr i1 %60, false
  %63 = lshr i1 %61, false
  %64 = select i1 %62, i1 true, i1 %63
  %65 = shl i1 %64, false
  %66 = or i1 false, %65
  br i1 %66, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

67:                                               ; preds = %originalBBpart2
  %68 = load i32, ptr %2, align 4
  br label %.split10

.split10:                                         ; preds = %67
  ret i32 %68

loopEnd:                                          ; preds = %originalBBpart24, %.split8.split, %.split7.split, %.split6.split, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %loopEntry.split.split
  %switchVar1alteredBB = load i32, ptr %switchVar, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split9.split
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  store i32 0, ptr %2, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 -1011269394, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_799bf1b7712b(ptr noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  br label %.split

.split:                                           ; preds = %1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  br label %.split.split

.split.split:                                     ; preds = %.split
  %switchVar = alloca i32, align 4
  store i32 -866717135, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %originalBBpart216
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -866717135, label %first
    i32 -1121879301, label %31
    i32 433524607, label %56
    i32 1141335798, label %86
    i32 -1493254562, label %89
    i32 678725452, label %115
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %6 = load i32, ptr @x.23, align 4
  %7 = load i32, ptr @y.24, align 4
  %8 = sub i32 %6, 1
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %9 = mul i32 %6, %8
  %10 = urem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  %12 = icmp slt i32 %7, 10
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  %13 = lshr i1 %11, false
  %14 = lshr i1 %12, false
  %15 = select i1 %13, i1 true, i1 %14
  %16 = shl i1 %15, false
  %17 = or i1 false, %16
  br i1 %17, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %18 = load i32, ptr @x.23, align 4
  %19 = load i32, ptr @y.24, align 4
  %20 = sub i32 %18, 1
  %21 = mul i32 %18, %20
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %22 = urem i32 %21, 2
  %23 = icmp eq i32 %22, 0
  %24 = icmp slt i32 %19, 10
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %25 = lshr i1 %23, false
  %26 = lshr i1 %24, false
  %27 = select i1 %25, i1 true, i1 %26
  %28 = shl i1 %27, false
  %29 = or i1 false, %28
  br i1 %29, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %30 = select i1 %.reload, i32 433524607, i32 -1121879301
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %30, ptr %switchVar, align 4
  br label %loopEnd

31:                                               ; preds = %loopEntry.split
  %32 = load i32, ptr @x.23, align 4
  br label %.split18

.split18:                                         ; preds = %31
  %33 = load i32, ptr @y.24, align 4
  %34 = sub i32 %32, 1
  %35 = mul i32 %32, %34
  %36 = urem i32 %35, 2
  %37 = icmp eq i32 %36, 0
  br label %.split18.split

.split18.split:                                   ; preds = %.split18
  %38 = icmp slt i32 %33, 10
  %39 = lshr i1 %37, false
  %40 = lshr i1 %38, false
  %41 = select i1 %39, i1 true, i1 %40
  %42 = shl i1 %41, false
  %43 = or i1 false, %42
  br i1 %43, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split18.split, %originalBB2alteredBB.split.split
  store i32 0, ptr %2, align 4
  store i32 678725452, ptr %switchVar, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %44 = load i32, ptr @x.23, align 4
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %45 = load i32, ptr @y.24, align 4
  %46 = sub i32 %44, 1
  %47 = mul i32 %44, %46
  %48 = urem i32 %47, 2
  %49 = icmp eq i32 %48, 0
  %50 = icmp slt i32 %45, 10
  %51 = lshr i1 %49, false
  %52 = lshr i1 %50, false
  %53 = select i1 %51, i1 true, i1 %52
  %54 = shl i1 %53, false
  %55 = or i1 false, %54
  br i1 %55, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

56:                                               ; preds = %loopEntry.split
  %57 = load i32, ptr @x.23, align 4
  %58 = load i32, ptr @y.24, align 4
  br label %.split19

.split19:                                         ; preds = %56
  %59 = sub i32 %57, 1
  %60 = mul i32 %57, %59
  %61 = urem i32 %60, 2
  %62 = icmp eq i32 %61, 0
  %63 = icmp slt i32 %58, 10
  %64 = lshr i1 %62, false
  %65 = lshr i1 %63, false
  %66 = select i1 %64, i1 true, i1 %65
  %67 = shl i1 %66, false
  %68 = or i1 false, %67
  br label %.split19.split

.split19.split:                                   ; preds = %.split19
  br i1 %68, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split19.split, %originalBB6alteredBB.split.split
  %69 = load ptr, ptr %3, align 8
  %70 = load ptr, ptr @BACKUP_ADMIN_PASSWORD, align 8
  %71 = call i32 @strcmp(ptr noundef %69, ptr noundef %70) #7
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %72 = icmp eq i32 %71, 0
  %73 = select i1 %72, i32 1141335798, i32 -1493254562
  store i32 %73, ptr %switchVar, align 4
  %74 = load i32, ptr @x.23, align 4
  %75 = load i32, ptr @y.24, align 4
  %76 = sub i32 %74, 1
  %77 = mul i32 %74, %76
  %78 = urem i32 %77, 2
  %79 = icmp eq i32 %78, 0
  %80 = icmp slt i32 %75, 10
  %81 = lshr i1 %79, false
  %82 = lshr i1 %80, false
  %83 = select i1 %81, i1 true, i1 %82
  %84 = shl i1 %83, false
  %85 = or i1 false, %84
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  br i1 %85, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

86:                                               ; preds = %loopEntry.split
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %88 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef @.str.34, i64 noundef 64) #7
  br label %.split20

.split20:                                         ; preds = %86
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  br label %.split20.split

.split20.split:                                   ; preds = %.split20
  store i32 1, ptr %2, align 4
  store i32 678725452, ptr %switchVar, align 4
  br label %loopEnd

89:                                               ; preds = %loopEntry.split
  %90 = load i32, ptr @x.23, align 4
  %91 = load i32, ptr @y.24, align 4
  %92 = sub i32 %90, 1
  br label %.split21

.split21:                                         ; preds = %89
  %93 = mul i32 %90, %92
  br label %.split21.split

.split21.split:                                   ; preds = %.split21
  %94 = urem i32 %93, 2
  %95 = icmp eq i32 %94, 0
  %96 = icmp slt i32 %91, 10
  %97 = lshr i1 %95, false
  %98 = lshr i1 %96, false
  %99 = select i1 %97, i1 true, i1 %98
  %100 = shl i1 %99, false
  %101 = or i1 false, %100
  br i1 %101, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split21.split, %originalBB10alteredBB.split.split
  %102 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  store i32 0, ptr %2, align 4
  store i32 678725452, ptr %switchVar, align 4
  %103 = load i32, ptr @x.23, align 4
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %104 = load i32, ptr @y.24, align 4
  %105 = sub i32 %103, 1
  %106 = mul i32 %103, %105
  %107 = urem i32 %106, 2
  %108 = icmp eq i32 %107, 0
  %109 = icmp slt i32 %104, 10
  %110 = lshr i1 %108, false
  %111 = lshr i1 %109, false
  %112 = select i1 %110, i1 true, i1 %111
  %113 = shl i1 %112, false
  %114 = or i1 false, %113
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  br i1 %114, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

115:                                              ; preds = %loopEntry.split
  %116 = load i32, ptr %2, align 4
  br label %.split22

.split22:                                         ; preds = %115
  ret i32 %116

loopEnd:                                          ; preds = %originalBBpart212, %.split20.split, %originalBBpart28, %originalBBpart24, %first.split.split, %originalBBpart2
  %117 = load i32, ptr @x.23, align 4
  %118 = load i32, ptr @y.24, align 4
  %119 = sub i32 %117, 1
  %120 = mul i32 %117, %119
  %121 = urem i32 %120, 2
  br label %loopEnd.split

loopEnd.split:                                    ; preds = %loopEnd
  %122 = icmp eq i32 %121, 0
  br label %loopEnd.split.split

loopEnd.split.split:                              ; preds = %loopEnd.split
  %123 = icmp slt i32 %118, 10
  %124 = lshr i1 %122, false
  %125 = lshr i1 %123, false
  %126 = select i1 %124, i1 true, i1 %125
  %127 = shl i1 %126, false
  %128 = or i1 false, %127
  br i1 %128, label %originalBB14, label %originalBB14alteredBB

originalBB14:                                     ; preds = %loopEnd.split.split, %originalBB14alteredBB
  %129 = load i32, ptr @x.23, align 4
  %130 = load i32, ptr @y.24, align 4
  %131 = sub i32 %129, 1
  %132 = mul i32 %129, %131
  %133 = urem i32 %132, 2
  br label %originalBB14.split

originalBB14.split:                               ; preds = %originalBB14
  %134 = icmp eq i32 %133, 0
  %135 = icmp slt i32 %130, 10
  br label %originalBB14.split.split

originalBB14.split.split:                         ; preds = %originalBB14.split
  %136 = lshr i1 %134, false
  %137 = lshr i1 %135, false
  %138 = select i1 %136, i1 true, i1 %137
  %139 = shl i1 %138, false
  %140 = or i1 false, %139
  br i1 %140, label %originalBBpart216, label %originalBB14alteredBB

originalBBpart216:                                ; preds = %originalBB14.split.split
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split18.split
  store i32 0, ptr %2, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 678725452, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split19.split
  %141 = load ptr, ptr %3, align 8
  %142 = load ptr, ptr @BACKUP_ADMIN_PASSWORD, align 8
  %143 = call i32 @strcmp(ptr noundef %141, ptr noundef %142) #7
  %144 = icmp eq i32 %143, 0
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %145 = select i1 %144, i32 1141335798, i32 -1493254562
  store i32 %145, ptr %switchVar, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split21.split
  %146 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  store i32 0, ptr %2, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  store i32 678725452, ptr %switchVar, align 4
  br label %originalBB10

originalBB14alteredBB:                            ; preds = %originalBB14.split.split, %loopEnd.split.split
  br label %originalBB14
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = load i32, ptr @x.25, align 4
  %4 = load i32, ptr @y.26, align 4
  %5 = sub i32 %3, 1
  %6 = mul i32 %3, %5
  br label %.split

.split:                                           ; preds = %2
  %7 = urem i32 %6, 2
  %8 = icmp eq i32 %7, 0
  %9 = icmp slt i32 %4, 10
  br label %.split.split

.split.split:                                     ; preds = %.split
  %10 = lshr i1 %8, false
  %11 = lshr i1 %9, false
  %12 = select i1 %10, i1 true, i1 %11
  %13 = shl i1 %12, false
  %14 = or i1 false, %13
  br i1 %14, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %.reg2mem = alloca i1, align 1
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca [128 x i8], align 1
  %21 = alloca i32, align 4
  store i32 0, ptr %15, align 4
  store i32 %0, ptr %16, align 4
  store ptr %1, ptr %17, align 8
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @f_0c7992b3d2d2()
  %26 = load i32, ptr %16, align 4
  %27 = icmp slt i32 %26, 3
  store i1 %27, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -1148712977, ptr %switchVar, align 4
  %28 = load i32, ptr @x.25, align 4
  %29 = load i32, ptr @y.26, align 4
  %30 = sub i32 %28, 1
  %31 = mul i32 %28, %30
  %32 = urem i32 %31, 2
  %33 = icmp eq i32 %32, 0
  %34 = icmp slt i32 %29, 10
  %35 = lshr i1 %33, false
  %36 = lshr i1 %34, false
  %37 = select i1 %35, i1 true, i1 %36
  %38 = shl i1 %37, false
  %39 = or i1 false, %38
  br i1 %39, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEntry

loopEntry:                                        ; preds = %originalBBpart2, %originalBBpart271
  %40 = load i32, ptr @x.25, align 4
  %41 = load i32, ptr @y.26, align 4
  %42 = sub i32 %40, 1
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  %43 = mul i32 %40, %42
  %44 = urem i32 %43, 2
  %45 = icmp eq i32 %44, 0
  br label %loopEntry.split.split

loopEntry.split.split:                            ; preds = %loopEntry.split
  %46 = icmp slt i32 %41, 10
  %47 = lshr i1 %45, false
  %48 = lshr i1 %46, false
  %49 = select i1 %47, i1 true, i1 %48
  %50 = shl i1 %49, false
  %51 = or i1 false, %50
  br i1 %51, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %loopEntry.split.split, %originalBB2alteredBB.split
  %switchVar1 = load i32, ptr %switchVar, align 4
  %52 = load i32, ptr @x.25, align 4
  %53 = load i32, ptr @y.26, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %54 = sub i32 %52, 1
  %55 = mul i32 %52, %54
  %56 = urem i32 %55, 2
  %57 = icmp eq i32 %56, 0
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %58 = icmp slt i32 %53, 10
  %59 = lshr i1 %57, false
  %60 = lshr i1 %58, false
  %61 = select i1 %59, i1 true, i1 %60
  %62 = xor i1 %61, false
  %63 = xor i1 %62, false
  %64 = shl i1 %63, false
  %65 = or i1 false, %64
  br i1 %65, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  switch i32 %switchVar1, label %switchDefault [
    i32 -1148712977, label %first
    i32 392616241, label %67
    i32 61494598, label %76
    i32 -1959249072, label %112
    i32 675741022, label %114
    i32 -1675227412, label %145
    i32 -1514688279, label %150
    i32 1492173927, label %183
    i32 -772433326, label %216
    i32 1114789043, label %233
    i32 342036711, label %242
    i32 -5249730, label %275
    i32 408179483, label %291
    i32 -2087433644, label %300
    i32 308439383, label %309
    i32 1765376719, label %325
    i32 1565231443, label %326
    i32 -1092639304, label %327
    i32 1520811975, label %328
    i32 -1969196207, label %334
    i32 -395288014, label %339
  ]

switchDefault:                                    ; preds = %originalBBpart24
  br label %loopEnd

first:                                            ; preds = %originalBBpart24
  %.reload = load i1, ptr %.reg2mem, align 1
  %66 = select i1 %.reload, i32 392616241, i32 61494598
  br label %first.split

first.split:                                      ; preds = %first
  store i32 %66, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

67:                                               ; preds = %originalBBpart24
  %68 = load ptr, ptr %17, align 8
  br label %.split73

.split73:                                         ; preds = %67
  %69 = getelementptr inbounds ptr, ptr %68, i64 0
  %70 = load ptr, ptr %69, align 8
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.40, ptr noundef %70)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str.42)
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  store i32 1, ptr %15, align 4
  br label %.split73.split

.split73.split:                                   ; preds = %.split73
  store i32 -395288014, ptr %switchVar, align 4
  br label %loopEnd

76:                                               ; preds = %originalBBpart24
  %77 = load i32, ptr @x.25, align 4
  br label %.split74

.split74:                                         ; preds = %76
  %78 = load i32, ptr @y.26, align 4
  br label %.split74.split

.split74.split:                                   ; preds = %.split74
  %79 = sub i32 %77, 1
  %80 = mul i32 %77, %79
  %81 = urem i32 %80, 2
  %82 = icmp eq i32 %81, 0
  %83 = icmp slt i32 %78, 10
  %84 = lshr i1 %82, false
  %85 = lshr i1 %83, false
  %86 = select i1 %84, i1 true, i1 %85
  %87 = shl i1 %86, false
  %88 = or i1 false, %87
  br i1 %88, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split74.split, %originalBB6alteredBB.split.split
  %89 = load ptr, ptr %17, align 8
  %90 = getelementptr inbounds ptr, ptr %89, i64 1
  %91 = load ptr, ptr %90, align 8
  store ptr %91, ptr %18, align 8
  %92 = load ptr, ptr %17, align 8
  %93 = getelementptr inbounds ptr, ptr %92, i64 2
  %94 = load ptr, ptr %93, align 8
  store ptr %94, ptr %19, align 8
  %95 = load ptr, ptr %18, align 8
  %96 = load ptr, ptr %19, align 8
  %97 = call i32 @f_0a9fc93cc940(ptr noundef %95, ptr noundef %96)
  %98 = icmp ne i32 %97, 0
  %99 = select i1 %98, i32 675741022, i32 -1959249072
  store i32 %99, ptr %switchVar, align 4
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %100 = load i32, ptr @x.25, align 4
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %101 = load i32, ptr @y.26, align 4
  %102 = sub i32 %100, 1
  %103 = mul i32 %100, %102
  %104 = urem i32 %103, 2
  %105 = icmp eq i32 %104, 0
  %106 = icmp slt i32 %101, 10
  %107 = lshr i1 %105, false
  %108 = lshr i1 %106, false
  %109 = select i1 %107, i1 true, i1 %108
  %110 = shl i1 %109, false
  %111 = or i1 false, %110
  br i1 %111, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

112:                                              ; preds = %originalBBpart24
  %113 = call i32 (ptr, ...) @printf(ptr noundef @.str.45)
  store i32 1, ptr %15, align 4
  br label %.split75

.split75:                                         ; preds = %112
  store i32 -395288014, ptr %switchVar, align 4
  br label %.split75.split

.split75.split:                                   ; preds = %.split75
  br label %loopEnd

114:                                              ; preds = %originalBBpart24
  %115 = load i32, ptr @x.25, align 4
  %116 = load i32, ptr @y.26, align 4
  br label %.split76

.split76:                                         ; preds = %114
  %117 = sub i32 %115, 1
  %118 = mul i32 %115, %117
  %119 = urem i32 %118, 2
  br label %.split76.split

.split76.split:                                   ; preds = %.split76
  %120 = icmp eq i32 %119, 0
  %121 = icmp slt i32 %116, 10
  %122 = lshr i1 %120, false
  %123 = lshr i1 %121, false
  %124 = select i1 %122, i1 true, i1 %123
  %125 = shl i1 %124, false
  %126 = or i1 false, %125
  br i1 %126, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split76.split, %originalBB10alteredBB.split.split
  %127 = getelementptr inbounds [128 x i8], ptr %20, i64 0, i64 0
  %128 = load ptr, ptr %18, align 8
  call void @f_12f52c0c0856(ptr noundef %127, ptr noundef %128)
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %129 = getelementptr inbounds [128 x i8], ptr %20, i64 0, i64 0
  %130 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1), ptr noundef %129, i64 noundef 128) #7
  %131 = load ptr, ptr %18, align 8
  %132 = call i32 @f_34ede220d91a(ptr noundef %131, i32 noundef 3)
  call void @f_420e96d771d4()
  store i32 3, ptr %21, align 4
  store i32 -1675227412, ptr %switchVar, align 4
  %133 = load i32, ptr @x.25, align 4
  %134 = load i32, ptr @y.26, align 4
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %135 = sub i32 %133, 1
  %136 = mul i32 %133, %135
  %137 = urem i32 %136, 2
  %138 = icmp eq i32 %137, 0
  %139 = icmp slt i32 %134, 10
  %140 = lshr i1 %138, false
  %141 = lshr i1 %139, false
  %142 = select i1 %140, i1 true, i1 %141
  %143 = shl i1 %142, false
  %144 = or i1 false, %143
  br i1 %144, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

145:                                              ; preds = %originalBBpart24
  %146 = load i32, ptr %21, align 4
  br label %.split77

.split77:                                         ; preds = %145
  %147 = load i32, ptr %16, align 4
  %148 = icmp slt i32 %146, %147
  %149 = select i1 %148, i32 -1514688279, i32 -1969196207
  store i32 %149, ptr %switchVar, align 4
  br label %.split77.split

.split77.split:                                   ; preds = %.split77
  br label %loopEnd

150:                                              ; preds = %originalBBpart24
  %151 = load i32, ptr @x.25, align 4
  br label %.split78

.split78:                                         ; preds = %150
  %152 = load i32, ptr @y.26, align 4
  br label %.split78.split

.split78.split:                                   ; preds = %.split78
  %153 = sub i32 %151, 1
  %154 = mul i32 %151, %153
  %155 = urem i32 %154, 2
  %156 = icmp eq i32 %155, 0
  %157 = icmp slt i32 %152, 10
  %158 = lshr i1 %156, false
  %159 = lshr i1 %157, false
  %160 = select i1 %158, i1 true, i1 %159
  %161 = shl i1 %160, false
  %162 = or i1 false, %161
  br i1 %162, label %originalBB14, label %originalBB14alteredBB

originalBB14:                                     ; preds = %.split78.split, %originalBB14alteredBB.split.split
  %163 = load ptr, ptr %17, align 8
  %164 = load i32, ptr %21, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds ptr, ptr %163, i64 %165
  %167 = load ptr, ptr %166, align 8
  %168 = call i32 @strcmp(ptr noundef %167, ptr noundef @.str.46) #7
  %169 = icmp eq i32 %168, 0
  %170 = select i1 %169, i32 1492173927, i32 1114789043
  store i32 %170, ptr %switchVar, align 4
  br label %originalBB14.split

originalBB14.split:                               ; preds = %originalBB14
  %171 = load i32, ptr @x.25, align 4
  %172 = load i32, ptr @y.26, align 4
  %173 = sub i32 %171, 1
  %174 = mul i32 %171, %173
  %175 = urem i32 %174, 2
  %176 = icmp eq i32 %175, 0
  %177 = icmp slt i32 %172, 10
  %178 = lshr i1 %176, false
  %179 = lshr i1 %177, false
  %180 = select i1 %178, i1 true, i1 %179
  %181 = shl i1 %180, false
  %182 = or i1 false, %181
  br label %originalBB14.split.split

originalBB14.split.split:                         ; preds = %originalBB14.split
  br i1 %182, label %originalBBpart216, label %originalBB14alteredBB

originalBBpart216:                                ; preds = %originalBB14.split.split
  br label %loopEnd

183:                                              ; preds = %originalBBpart24
  %184 = load i32, ptr @x.25, align 4
  %185 = load i32, ptr @y.26, align 4
  br label %.split79

.split79:                                         ; preds = %183
  %186 = sub i32 %184, 1
  %187 = mul i32 %184, %186
  br label %.split79.split

.split79.split:                                   ; preds = %.split79
  %188 = urem i32 %187, 2
  %189 = icmp eq i32 %188, 0
  %190 = icmp slt i32 %185, 10
  %191 = lshr i1 %189, false
  %192 = lshr i1 %190, false
  %193 = select i1 %191, i1 true, i1 %192
  %194 = shl i1 %193, false
  %195 = or i1 false, %194
  br i1 %195, label %originalBB18, label %originalBB18alteredBB

originalBB18:                                     ; preds = %.split79.split, %originalBB18alteredBB.split.split
  %196 = load i32, ptr %21, align 4
  br label %originalBB18.split

originalBB18.split:                               ; preds = %originalBB18
  %197 = add i32 %196, -2073992350
  %198 = add i32 %197, 1
  %199 = sub i32 %198, -2073992350
  %200 = add nsw i32 %196, 1
  %201 = load i32, ptr %16, align 4
  %202 = icmp slt i32 %199, %201
  %203 = select i1 %202, i32 -772433326, i32 1114789043
  store i32 %203, ptr %switchVar, align 4
  %204 = load i32, ptr @x.25, align 4
  %205 = load i32, ptr @y.26, align 4
  %206 = sub i32 %204, 1
  %207 = mul i32 %204, %206
  br label %originalBB18.split.split

originalBB18.split.split:                         ; preds = %originalBB18.split
  %208 = urem i32 %207, 2
  %209 = icmp eq i32 %208, 0
  %210 = icmp slt i32 %205, 10
  %211 = lshr i1 %209, false
  %212 = lshr i1 %210, false
  %213 = select i1 %211, i1 true, i1 %212
  %214 = shl i1 %213, false
  %215 = or i1 false, %214
  br i1 %215, label %originalBBpart240, label %originalBB18alteredBB

originalBBpart240:                                ; preds = %originalBB18.split.split
  br label %loopEnd

216:                                              ; preds = %originalBBpart24
  %217 = load ptr, ptr %17, align 8
  %218 = load i32, ptr %21, align 4
  br label %.split80

.split80:                                         ; preds = %216
  %219 = sub i32 %218, -118603589
  %220 = add i32 %219, 1
  %221 = add i32 %220, -118603589
  %222 = add nsw i32 %218, 1
  %223 = sext i32 %221 to i64
  %224 = getelementptr inbounds ptr, ptr %217, i64 %223
  %225 = load ptr, ptr %224, align 8
  %226 = call i32 @f_3ff16c1a3ff2(ptr noundef %225)
  br label %.split80.split

.split80.split:                                   ; preds = %.split80
  %227 = load i32, ptr %21, align 4
  %228 = sub i32 0, %227
  %229 = sub i32 0, 1
  %230 = add i32 %228, %229
  %231 = sub i32 0, %230
  %232 = add nsw i32 %227, 1
  store i32 %231, ptr %21, align 4
  store i32 -1092639304, ptr %switchVar, align 4
  br label %loopEnd

233:                                              ; preds = %originalBBpart24
  %234 = load ptr, ptr %17, align 8
  %235 = load i32, ptr %21, align 4
  %236 = sext i32 %235 to i64
  br label %.split81

.split81:                                         ; preds = %233
  %237 = getelementptr inbounds ptr, ptr %234, i64 %236
  %238 = load ptr, ptr %237, align 8
  br label %.split81.split

.split81.split:                                   ; preds = %.split81
  %239 = call i32 @strcmp(ptr noundef %238, ptr noundef @.str.47) #7
  %240 = icmp eq i32 %239, 0
  %241 = select i1 %240, i32 342036711, i32 408179483
  store i32 %241, ptr %switchVar, align 4
  br label %loopEnd

242:                                              ; preds = %originalBBpart24
  %243 = load i32, ptr @x.25, align 4
  %244 = load i32, ptr @y.26, align 4
  %245 = sub i32 %243, 1
  %246 = mul i32 %243, %245
  %247 = urem i32 %246, 2
  %248 = icmp eq i32 %247, 0
  br label %.split82

.split82:                                         ; preds = %242
  %249 = icmp slt i32 %244, 10
  br label %.split82.split

.split82.split:                                   ; preds = %.split82
  %250 = lshr i1 %248, false
  %251 = lshr i1 %249, false
  %252 = select i1 %250, i1 true, i1 %251
  %253 = shl i1 %252, false
  %254 = or i1 false, %253
  br i1 %254, label %originalBB42, label %originalBB42alteredBB

originalBB42:                                     ; preds = %.split82.split, %originalBB42alteredBB.split.split
  %255 = load i32, ptr %21, align 4
  %256 = add i32 %255, 1346911468
  %257 = add i32 %256, 1
  br label %originalBB42.split

originalBB42.split:                               ; preds = %originalBB42
  %258 = sub i32 %257, 1346911468
  %259 = add nsw i32 %255, 1
  %260 = load i32, ptr %16, align 4
  %261 = icmp slt i32 %258, %260
  %262 = select i1 %261, i32 -5249730, i32 408179483
  store i32 %262, ptr %switchVar, align 4
  %263 = load i32, ptr @x.25, align 4
  br label %originalBB42.split.split

originalBB42.split.split:                         ; preds = %originalBB42.split
  %264 = load i32, ptr @y.26, align 4
  %265 = sub i32 %263, 1
  %266 = mul i32 %263, %265
  %267 = urem i32 %266, 2
  %268 = icmp eq i32 %267, 0
  %269 = icmp slt i32 %264, 10
  %270 = lshr i1 %268, false
  %271 = lshr i1 %269, false
  %272 = select i1 %270, i1 true, i1 %271
  %273 = shl i1 %272, false
  %274 = or i1 false, %273
  br i1 %274, label %originalBBpart267, label %originalBB42alteredBB

originalBBpart267:                                ; preds = %originalBB42.split.split
  br label %loopEnd

275:                                              ; preds = %originalBBpart24
  %276 = load ptr, ptr %17, align 8
  br label %.split83

.split83:                                         ; preds = %275
  %277 = load i32, ptr %21, align 4
  %278 = sub i32 %277, 707088942
  %279 = add i32 %278, 1
  %280 = add i32 %279, 707088942
  br label %.split83.split

.split83.split:                                   ; preds = %.split83
  %281 = add nsw i32 %277, 1
  %282 = sext i32 %280 to i64
  %283 = getelementptr inbounds ptr, ptr %276, i64 %282
  %284 = load ptr, ptr %283, align 8
  %285 = call i32 @f_fcae2dd27871(ptr noundef %284)
  %286 = load i32, ptr %21, align 4
  %287 = sub i32 %286, -445973117
  %288 = add i32 %287, 1
  %289 = add i32 %288, -445973117
  %290 = add nsw i32 %286, 1
  store i32 %289, ptr %21, align 4
  store i32 1565231443, ptr %switchVar, align 4
  br label %loopEnd

291:                                              ; preds = %originalBBpart24
  %292 = load ptr, ptr %17, align 8
  %293 = load i32, ptr %21, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds ptr, ptr %292, i64 %294
  br label %.split84

.split84:                                         ; preds = %291
  %296 = load ptr, ptr %295, align 8
  br label %.split84.split

.split84.split:                                   ; preds = %.split84
  %297 = call i32 @strcmp(ptr noundef %296, ptr noundef @.str.48) #7
  %298 = icmp eq i32 %297, 0
  %299 = select i1 %298, i32 -2087433644, i32 1765376719
  store i32 %299, ptr %switchVar, align 4
  br label %loopEnd

300:                                              ; preds = %originalBBpart24
  %301 = load i32, ptr %21, align 4
  %302 = sub i32 %301, -1605729958
  %303 = add i32 %302, 1
  %304 = add i32 %303, -1605729958
  %305 = add nsw i32 %301, 1
  %306 = load i32, ptr %16, align 4
  %307 = icmp slt i32 %304, %306
  br label %.split85

.split85:                                         ; preds = %300
  %308 = select i1 %307, i32 308439383, i32 1765376719
  br label %.split85.split

.split85.split:                                   ; preds = %.split85
  store i32 %308, ptr %switchVar, align 4
  br label %loopEnd

309:                                              ; preds = %originalBBpart24
  %310 = load ptr, ptr %17, align 8
  %311 = load i32, ptr %21, align 4
  %312 = add i32 %311, 973169923
  %313 = add i32 %312, 1
  %314 = sub i32 %313, 973169923
  %315 = add nsw i32 %311, 1
  br label %.split86

.split86:                                         ; preds = %309
  %316 = sext i32 %314 to i64
  %317 = getelementptr inbounds ptr, ptr %310, i64 %316
  %318 = load ptr, ptr %317, align 8
  %319 = call i32 @f_799bf1b7712b(ptr noundef %318)
  %320 = load i32, ptr %21, align 4
  %321 = add i32 %320, 1699134549
  br label %.split86.split

.split86.split:                                   ; preds = %.split86
  %322 = add i32 %321, 1
  %323 = sub i32 %322, 1699134549
  %324 = add nsw i32 %320, 1
  store i32 %323, ptr %21, align 4
  store i32 1765376719, ptr %switchVar, align 4
  br label %loopEnd

325:                                              ; preds = %originalBBpart24
  store i32 1565231443, ptr %switchVar, align 4
  br label %.split87

.split87:                                         ; preds = %325
  br label %loopEnd

326:                                              ; preds = %originalBBpart24
  store i32 -1092639304, ptr %switchVar, align 4
  br label %.split88

.split88:                                         ; preds = %326
  br label %loopEnd

327:                                              ; preds = %originalBBpart24
  store i32 1520811975, ptr %switchVar, align 4
  br label %.split89

.split89:                                         ; preds = %327
  br label %loopEnd

328:                                              ; preds = %originalBBpart24
  %329 = load i32, ptr %21, align 4
  br label %.split90

.split90:                                         ; preds = %328
  %330 = sub i32 %329, 1153438336
  %331 = add i32 %330, 1
  br label %.split90.split

.split90.split:                                   ; preds = %.split90
  %332 = add i32 %331, 1153438336
  %333 = add nsw i32 %329, 1
  store i32 %332, ptr %21, align 4
  store i32 -1675227412, ptr %switchVar, align 4
  br label %loopEnd

334:                                              ; preds = %originalBBpart24
  %335 = call i32 (ptr, ...) @printf(ptr noundef @.str.49)
  %336 = call i32 (ptr, ...) @printf(ptr noundef @.str.50)
  %337 = call i32 (ptr, ...) @printf(ptr noundef @.str.51, ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1))
  br label %.split91

.split91:                                         ; preds = %334
  %338 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  br label %.split91.split

.split91.split:                                   ; preds = %.split91
  store i32 0, ptr %15, align 4
  store i32 -395288014, ptr %switchVar, align 4
  br label %loopEnd

339:                                              ; preds = %originalBBpart24
  %340 = load i32, ptr %15, align 4
  br label %.split92

.split92:                                         ; preds = %339
  ret i32 %340

loopEnd:                                          ; preds = %.split91.split, %.split90.split, %.split89, %.split88, %.split87, %.split86.split, %.split85.split, %.split84.split, %.split83.split, %originalBBpart267, %.split81.split, %.split80.split, %originalBBpart240, %originalBBpart216, %.split77.split, %originalBBpart212, %.split75.split, %originalBBpart28, %.split73.split, %first.split.split, %switchDefault
  %341 = load i32, ptr @x.25, align 4
  %342 = load i32, ptr @y.26, align 4
  br label %loopEnd.split

loopEnd.split:                                    ; preds = %loopEnd
  %343 = sub i32 %341, 1
  %344 = mul i32 %341, %343
  %345 = urem i32 %344, 2
  br label %loopEnd.split.split

loopEnd.split.split:                              ; preds = %loopEnd.split
  %346 = icmp eq i32 %345, 0
  %347 = icmp slt i32 %342, 10
  %348 = lshr i1 %346, false
  %349 = lshr i1 %347, false
  %350 = select i1 %348, i1 true, i1 %349
  %351 = shl i1 %350, false
  %352 = or i1 false, %351
  br i1 %352, label %originalBB69, label %originalBB69alteredBB

originalBB69:                                     ; preds = %loopEnd.split.split, %originalBB69alteredBB
  %353 = load i32, ptr @x.25, align 4
  br label %originalBB69.split

originalBB69.split:                               ; preds = %originalBB69
  %354 = load i32, ptr @y.26, align 4
  %355 = sub i32 %353, 1
  %356 = mul i32 %353, %355
  %357 = urem i32 %356, 2
  %358 = icmp eq i32 %357, 0
  %359 = icmp slt i32 %354, 10
  %360 = lshr i1 %358, false
  %361 = lshr i1 %359, false
  %362 = select i1 %360, i1 true, i1 %361
  %363 = shl i1 %362, false
  %364 = or i1 false, %363
  br label %originalBB69.split.split

originalBB69.split.split:                         ; preds = %originalBB69.split
  br i1 %364, label %originalBBpart271, label %originalBB69alteredBB

originalBBpart271:                                ; preds = %originalBB69.split.split
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %.reg2memalteredBB = alloca i1, align 1
  %365 = alloca i32, align 4
  %366 = alloca i32, align 4
  %367 = alloca ptr, align 8
  %368 = alloca ptr, align 8
  %369 = alloca ptr, align 8
  %370 = alloca [128 x i8], align 1
  %371 = alloca i32, align 4
  store i32 0, ptr %365, align 4
  store i32 %0, ptr %366, align 4
  store ptr %1, ptr %367, align 8
  %372 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %373 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %374 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %375 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @f_0c7992b3d2d2()
  %376 = load i32, ptr %366, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  %377 = icmp slt i32 %376, 3
  store i1 %377, ptr %.reg2memalteredBB, align 1
  %switchVaralteredBB = alloca i32, align 4
  store i32 -1148712977, ptr %switchVaralteredBB, align 4
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %loopEntry.split.split
  %switchVar1alteredBB = load i32, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split74.split
  %378 = load ptr, ptr %17, align 8
  %379 = getelementptr inbounds ptr, ptr %378, i64 1
  %380 = load ptr, ptr %379, align 8
  store ptr %380, ptr %18, align 8
  %381 = load ptr, ptr %17, align 8
  %382 = getelementptr inbounds ptr, ptr %381, i64 2
  %383 = load ptr, ptr %382, align 8
  store ptr %383, ptr %19, align 8
  %384 = load ptr, ptr %18, align 8
  %385 = load ptr, ptr %19, align 8
  %386 = call i32 @f_0a9fc93cc940(ptr noundef %384, ptr noundef %385)
  %387 = icmp ne i32 %386, 0
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %388 = select i1 %387, i32 675741022, i32 -1959249072
  store i32 %388, ptr %switchVar, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split76.split
  %389 = getelementptr inbounds [128 x i8], ptr %20, i64 0, i64 0
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  %390 = load ptr, ptr %18, align 8
  call void @f_12f52c0c0856(ptr noundef %389, ptr noundef %390)
  %391 = getelementptr inbounds [128 x i8], ptr %20, i64 0, i64 0
  %392 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1), ptr noundef %391, i64 noundef 128) #7
  %393 = load ptr, ptr %18, align 8
  %394 = call i32 @f_34ede220d91a(ptr noundef %393, i32 noundef 3)
  call void @f_420e96d771d4()
  store i32 3, ptr %21, align 4
  store i32 -1675227412, ptr %switchVar, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  br label %originalBB10

originalBB14alteredBB:                            ; preds = %originalBB14.split.split, %.split78.split
  %395 = load ptr, ptr %17, align 8
  %396 = load i32, ptr %21, align 4
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds ptr, ptr %395, i64 %397
  br label %originalBB14alteredBB.split

originalBB14alteredBB.split:                      ; preds = %originalBB14alteredBB
  %399 = load ptr, ptr %398, align 8
  %400 = call i32 @strcmp(ptr noundef %399, ptr noundef @.str.46) #7
  %401 = icmp eq i32 %400, 0
  br label %originalBB14alteredBB.split.split

originalBB14alteredBB.split.split:                ; preds = %originalBB14alteredBB.split
  %402 = select i1 %401, i32 1492173927, i32 1114789043
  store i32 %402, ptr %switchVar, align 4
  br label %originalBB14

originalBB18alteredBB:                            ; preds = %originalBB18.split.split, %.split79.split
  %403 = load i32, ptr %21, align 4
  %404 = add i32 %403, -2073992350
  %_ = sub i32 %404, 1
  %gen = mul i32 %_, 1
  %_19 = sub i32 0, %404
  %gen20 = add i32 %_19, 1
  %_21 = sub i32 0, %404
  %gen22 = add i32 %_21, 1
  %405 = add i32 %404, 1
  %_23 = sub i32 %405, -2073992350
  %gen24 = mul i32 %_23, -2073992350
  %_25 = sub i32 0, %405
  %gen26 = add i32 %_25, -2073992350
  %_27 = sub i32 %405, -2073992350
  %gen28 = mul i32 %_27, -2073992350
  %_29 = shl i32 %405, -2073992350
  br label %originalBB18alteredBB.split

originalBB18alteredBB.split:                      ; preds = %originalBB18alteredBB
  %_30 = sub i32 %405, -2073992350
  %gen31 = mul i32 %_30, -2073992350
  %_32 = shl i32 %405, -2073992350
  %406 = sub i32 %405, -2073992350
  %_33 = sub i32 0, %403
  %gen34 = add i32 %_33, 1
  %_35 = sub i32 0, %403
  %gen36 = add i32 %_35, 1
  %_37 = sub i32 %403, 1
  br label %originalBB18alteredBB.split.split

originalBB18alteredBB.split.split:                ; preds = %originalBB18alteredBB.split
  %gen38 = mul i32 %_37, 1
  %407 = add nsw i32 %403, 1
  %408 = load i32, ptr %16, align 4
  %409 = icmp slt i32 %406, %408
  %410 = select i1 %409, i32 -772433326, i32 1114789043
  store i32 %410, ptr %switchVar, align 4
  br label %originalBB18

originalBB42alteredBB:                            ; preds = %originalBB42.split.split, %.split82.split
  %411 = load i32, ptr %21, align 4
  %_43 = sub i32 %411, 1346911468
  %gen44 = mul i32 %_43, 1346911468
  %_45 = sub i32 %411, 1346911468
  br label %originalBB42alteredBB.split

originalBB42alteredBB.split:                      ; preds = %originalBB42alteredBB
  %gen46 = mul i32 %_45, 1346911468
  %_47 = sub i32 0, %411
  %gen48 = add i32 %_47, 1346911468
  %412 = add i32 %411, 1346911468
  %_49 = sub i32 %412, 1
  %gen50 = mul i32 %_49, 1
  %_51 = shl i32 %412, 1
  %413 = add i32 %412, 1
  %_52 = sub i32 0, %413
  br label %originalBB42alteredBB.split.split

originalBB42alteredBB.split.split:                ; preds = %originalBB42alteredBB.split
  %gen53 = add i32 %_52, 1346911468
  %_54 = sub i32 %413, 1346911468
  %gen55 = mul i32 %_54, 1346911468
  %_56 = sub i32 0, %413
  %gen57 = add i32 %_56, 1346911468
  %414 = sub i32 %413, 1346911468
  %_58 = shl i32 %411, 1
  %_59 = sub i32 0, %411
  %gen60 = add i32 %_59, 1
  %_61 = sub i32 0, %411
  %gen62 = add i32 %_61, 1
  %_63 = shl i32 %411, 1
  %_64 = sub i32 0, %411
  %gen65 = add i32 %_64, 1
  %415 = add nsw i32 %411, 1
  %416 = load i32, ptr %16, align 4
  %417 = icmp slt i32 %414, %416
  %418 = select i1 %417, i32 -5249730, i32 408179483
  store i32 %418, ptr %switchVar, align 4
  br label %originalBB42

originalBB69alteredBB:                            ; preds = %originalBB69.split.split, %loopEnd.split.split
  br label %originalBB69
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #5

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { allocsize(0) }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 17.0.0 (clang-1700.0.13.3)"}
