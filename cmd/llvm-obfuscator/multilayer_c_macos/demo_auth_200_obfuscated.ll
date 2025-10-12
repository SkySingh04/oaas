; ModuleID = 'demo_auth_200_obfuscated.bc'
source_filename = "/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/multilayer_c_macos/demo_auth_200_string_encrypted.c"
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
  br label %.split

.split:                                           ; preds = %0
  %2 = load i32, ptr @y, align 4
  %3 = sub i32 %1, 1
  %4 = mul i32 %1, %3
  %5 = urem i32 %4, 2
  %6 = icmp eq i32 %5, 0
  %7 = icmp slt i32 %2, 10
  %8 = or i1 %6, %7
  br label %.split.split

.split.split:                                     ; preds = %.split
  br i1 %8, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %9 = alloca [21 x i8], align 1
  %10 = alloca [29 x i8], align 1
  %11 = alloca [41 x i8], align 1
  %12 = alloca [63 x i8], align 1
  %13 = alloca [29 x i8], align 1
  %14 = alloca [29 x i8], align 1
  %15 = alloca [32 x i8], align 1
  %16 = alloca [26 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %9, ptr align 1 @constinit, i64 21, i1 false)
  %17 = getelementptr inbounds [21 x i8], ptr %9, i64 0, i64 0
  %18 = call ptr @_xor_decrypt(ptr noundef %17, i32 noundef 21, i8 noundef zeroext -97)
  store ptr %18, ptr @MASTER_PASSWORD, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %10, ptr align 1 @constinit.1, i64 29, i1 false)
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %19 = getelementptr inbounds [29 x i8], ptr %10, i64 0, i64 0
  %20 = call ptr @_xor_decrypt(ptr noundef %19, i32 noundef 29, i8 noundef zeroext -19)
  store ptr %20, ptr @API_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %11, ptr align 1 @constinit.2, i64 41, i1 false)
  %21 = getelementptr inbounds [41 x i8], ptr %11, i64 0, i64 0
  %22 = call ptr @_xor_decrypt(ptr noundef %21, i32 noundef 41, i8 noundef zeroext -119)
  store ptr %22, ptr @JWT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %12, ptr align 1 @constinit.3, i64 63, i1 false)
  %23 = getelementptr inbounds [63 x i8], ptr %12, i64 0, i64 0
  %24 = call ptr @_xor_decrypt(ptr noundef %23, i32 noundef 63, i8 noundef zeroext -74)
  store ptr %24, ptr @DB_CONNECTION_STRING, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %13, ptr align 1 @constinit.4, i64 29, i1 false)
  %25 = getelementptr inbounds [29 x i8], ptr %13, i64 0, i64 0
  %26 = call ptr @_xor_decrypt(ptr noundef %25, i32 noundef 29, i8 noundef zeroext 94)
  store ptr %26, ptr @ENCRYPTION_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %14, ptr align 1 @constinit.5, i64 29, i1 false)
  %27 = getelementptr inbounds [29 x i8], ptr %14, i64 0, i64 0
  %28 = call ptr @_xor_decrypt(ptr noundef %27, i32 noundef 29, i8 noundef zeroext -109)
  store ptr %28, ptr @OAUTH_CLIENT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %15, ptr align 1 @constinit.6, i64 32, i1 false)
  %29 = getelementptr inbounds [32 x i8], ptr %15, i64 0, i64 0
  %30 = call ptr @_xor_decrypt(ptr noundef %29, i32 noundef 32, i8 noundef zeroext -106)
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  store ptr %30, ptr @LICENSE_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %16, ptr align 1 @constinit.7, i64 26, i1 false)
  %31 = getelementptr inbounds [26 x i8], ptr %16, i64 0, i64 0
  %32 = call ptr @_xor_decrypt(ptr noundef %31, i32 noundef 26, i8 noundef zeroext -68)
  store ptr %32, ptr @BACKUP_ADMIN_PASSWORD, align 8
  %33 = load i32, ptr @x, align 4
  %34 = load i32, ptr @y, align 4
  %35 = sub i32 %33, 1
  %36 = mul i32 %33, %35
  %37 = urem i32 %36, 2
  %38 = icmp eq i32 %37, 0
  %39 = icmp slt i32 %34, 10
  %40 = or i1 %38, %39
  br i1 %40, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret void

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %41 = alloca [21 x i8], align 1
  %42 = alloca [29 x i8], align 1
  %43 = alloca [41 x i8], align 1
  %44 = alloca [63 x i8], align 1
  %45 = alloca [29 x i8], align 1
  %46 = alloca [29 x i8], align 1
  %47 = alloca [32 x i8], align 1
  %48 = alloca [26 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %41, ptr align 1 @constinit, i64 21, i1 false)
  %49 = getelementptr inbounds [21 x i8], ptr %41, i64 0, i64 0
  %50 = call ptr @_xor_decrypt(ptr noundef %49, i32 noundef 21, i8 noundef zeroext -97)
  store ptr %50, ptr @MASTER_PASSWORD, align 8
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %42, ptr align 1 @constinit.1, i64 29, i1 false)
  %51 = getelementptr inbounds [29 x i8], ptr %42, i64 0, i64 0
  %52 = call ptr @_xor_decrypt(ptr noundef %51, i32 noundef 29, i8 noundef zeroext -19)
  store ptr %52, ptr @API_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %43, ptr align 1 @constinit.2, i64 41, i1 false)
  %53 = getelementptr inbounds [41 x i8], ptr %43, i64 0, i64 0
  %54 = call ptr @_xor_decrypt(ptr noundef %53, i32 noundef 41, i8 noundef zeroext -119)
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  store ptr %54, ptr @JWT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %44, ptr align 1 @constinit.3, i64 63, i1 false)
  %55 = getelementptr inbounds [63 x i8], ptr %44, i64 0, i64 0
  %56 = call ptr @_xor_decrypt(ptr noundef %55, i32 noundef 63, i8 noundef zeroext -74)
  store ptr %56, ptr @DB_CONNECTION_STRING, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %45, ptr align 1 @constinit.4, i64 29, i1 false)
  %57 = getelementptr inbounds [29 x i8], ptr %45, i64 0, i64 0
  %58 = call ptr @_xor_decrypt(ptr noundef %57, i32 noundef 29, i8 noundef zeroext 94)
  store ptr %58, ptr @ENCRYPTION_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %46, ptr align 1 @constinit.5, i64 29, i1 false)
  %59 = getelementptr inbounds [29 x i8], ptr %46, i64 0, i64 0
  %60 = call ptr @_xor_decrypt(ptr noundef %59, i32 noundef 29, i8 noundef zeroext -109)
  store ptr %60, ptr @OAUTH_CLIENT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %47, ptr align 1 @constinit.6, i64 32, i1 false)
  %61 = getelementptr inbounds [32 x i8], ptr %47, i64 0, i64 0
  %62 = call ptr @_xor_decrypt(ptr noundef %61, i32 noundef 32, i8 noundef zeroext -106)
  store ptr %62, ptr @LICENSE_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %48, ptr align 1 @constinit.7, i64 26, i1 false)
  %63 = getelementptr inbounds [26 x i8], ptr %48, i64 0, i64 0
  %64 = call ptr @_xor_decrypt(ptr noundef %63, i32 noundef 26, i8 noundef zeroext -68)
  store ptr %64, ptr @BACKUP_ADMIN_PASSWORD, align 8
  br label %originalBB
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @_xor_decrypt(ptr noundef %0, i32 noundef %1, i8 noundef zeroext %2) #0 {
  %.reg2mem = alloca i1, align 1
  br label %.split

.split:                                           ; preds = %3
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
  %11 = add i32 %10, -991637588
  %12 = add i32 %11, 1
  %13 = sub i32 %12, -991637588
  %14 = add nsw i32 %10, 1
  %15 = sext i32 %13 to i64
  %16 = call ptr @malloc(i64 noundef %15) #6
  store ptr %16, ptr %8, align 8
  %17 = load ptr, ptr %8, align 8
  %18 = icmp ne ptr %17, null
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %18, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -983276809, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -983276809, label %first
    i32 2050446743, label %20
    i32 1588930905, label %21
    i32 -1897826131, label %22
    i32 -504607104, label %27
    i32 662741517, label %47
    i32 -657344758, label %53
    i32 -163496587, label %59
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %19 = select i1 %.reload, i32 1588930905, i32 2050446743
  store i32 %19, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

20:                                               ; preds = %loopEntry.split
  store ptr null, ptr %4, align 8
  br label %.split2

.split2:                                          ; preds = %20
  store i32 -163496587, ptr %switchVar, align 4
  br label %.split2.split

.split2.split:                                    ; preds = %.split2
  br label %loopEnd

21:                                               ; preds = %loopEntry.split
  store i32 0, ptr %9, align 4
  br label %.split3

.split3:                                          ; preds = %21
  store i32 -1897826131, ptr %switchVar, align 4
  br label %.split3.split

.split3.split:                                    ; preds = %.split3
  br label %loopEnd

22:                                               ; preds = %loopEntry.split
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %6, align 4
  br label %.split4

.split4:                                          ; preds = %22
  %25 = icmp slt i32 %23, %24
  %26 = select i1 %25, i32 -504607104, i32 -657344758
  br label %.split4.split

.split4.split:                                    ; preds = %.split4
  store i32 %26, ptr %switchVar, align 4
  br label %loopEnd

27:                                               ; preds = %loopEntry.split
  %28 = load ptr, ptr %5, align 8
  %29 = load i32, ptr %9, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr %28, i64 %30
  br label %.split5

.split5:                                          ; preds = %27
  %32 = load i8, ptr %31, align 1
  %33 = zext i8 %32 to i32
  %34 = load i8, ptr %7, align 1
  %35 = zext i8 %34 to i32
  %36 = xor i32 %33, -1
  %37 = and i32 %35, %36
  %38 = xor i32 %35, -1
  br label %.split5.split

.split5.split:                                    ; preds = %.split5
  %39 = and i32 %33, %38
  %40 = or i32 %37, %39
  %41 = xor i32 %33, %35
  %42 = trunc i32 %40 to i8
  %43 = load ptr, ptr %8, align 8
  %44 = load i32, ptr %9, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, ptr %43, i64 %45
  store i8 %42, ptr %46, align 1
  store i32 662741517, ptr %switchVar, align 4
  br label %loopEnd

47:                                               ; preds = %loopEntry.split
  %48 = load i32, ptr %9, align 4
  %49 = add i32 %48, 1171414726
  %50 = add i32 %49, 1
  br label %.split6

.split6:                                          ; preds = %47
  %51 = sub i32 %50, 1171414726
  %52 = add nsw i32 %48, 1
  store i32 %51, ptr %9, align 4
  store i32 -1897826131, ptr %switchVar, align 4
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  br label %loopEnd

53:                                               ; preds = %loopEntry.split
  %54 = load ptr, ptr %8, align 8
  %55 = load i32, ptr %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, ptr %54, i64 %56
  store i8 0, ptr %57, align 1
  br label %.split7

.split7:                                          ; preds = %53
  %58 = load ptr, ptr %8, align 8
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  store ptr %58, ptr %4, align 8
  store i32 -163496587, ptr %switchVar, align 4
  br label %loopEnd

59:                                               ; preds = %loopEntry.split
  %60 = load ptr, ptr %4, align 8
  br label %.split8

.split8:                                          ; preds = %59
  ret ptr %60

loopEnd:                                          ; preds = %.split7.split, %.split6.split, %.split5.split, %.split4.split, %.split3.split, %.split2.split, %first.split.split, %switchDefault
  br label %loopEntry
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_0c7992b3d2d2() #0 {
  %1 = load i32, ptr @x.3, align 4
  br label %.split

.split:                                           ; preds = %0
  %2 = load i32, ptr @y.4, align 4
  %3 = sub i32 %1, 1
  %4 = mul i32 %1, %3
  br label %.split.split

.split.split:                                     ; preds = %.split
  %5 = urem i32 %4, 2
  %6 = icmp eq i32 %5, 0
  %7 = icmp slt i32 %2, 10
  %8 = or i1 %6, %7
  br i1 %8, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %9 = alloca [5 x i8], align 1
  %10 = alloca [13 x i8], align 1
  %11 = alloca [9 x i8], align 1
  %12 = alloca [9 x i8], align 1
  %13 = alloca [7 x i8], align 1
  %14 = alloca [7 x i8], align 1
  %15 = alloca [5 x i8], align 1
  %16 = alloca [5 x i8], align 1
  store i8 74, ptr %9, align 1
  %17 = getelementptr inbounds i8, ptr %9, i64 1
  store i8 79, ptr %17, align 1
  %18 = getelementptr inbounds i8, ptr %9, i64 2
  store i8 70, ptr %18, align 1
  %19 = getelementptr inbounds i8, ptr %9, i64 3
  store i8 66, ptr %19, align 1
  %20 = getelementptr inbounds i8, ptr %9, i64 4
  store i8 69, ptr %20, align 1
  %21 = getelementptr inbounds [5 x i8], ptr %9, i64 0, i64 0
  %22 = call ptr @_xor_decrypt(ptr noundef %21, i32 noundef 5, i8 noundef zeroext 43)
  %23 = call ptr @__strcpy_chk(ptr noundef @users, ptr noundef %22, i64 noundef 64) #7
  %24 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 1), ptr noundef @.str, i64 noundef 64) #7
  store i8 -90, ptr %10, align 1
  %25 = getelementptr inbounds i8, ptr %10, i64 1
  store i8 -93, ptr %25, align 1
  %26 = getelementptr inbounds i8, ptr %10, i64 2
  store i8 -86, ptr %26, align 1
  %27 = getelementptr inbounds i8, ptr %10, i64 3
  store i8 -82, ptr %27, align 1
  %28 = getelementptr inbounds i8, ptr %10, i64 4
  store i8 -87, ptr %28, align 1
  %29 = getelementptr inbounds i8, ptr %10, i64 5
  store i8 -82, ptr %29, align 1
  %30 = getelementptr inbounds i8, ptr %10, i64 6
  store i8 -76, ptr %30, align 1
  %31 = getelementptr inbounds i8, ptr %10, i64 7
  store i8 -77, ptr %31, align 1
  %32 = getelementptr inbounds i8, ptr %10, i64 8
  store i8 -75, ptr %32, align 1
  %33 = getelementptr inbounds i8, ptr %10, i64 9
  store i8 -90, ptr %33, align 1
  %34 = getelementptr inbounds i8, ptr %10, i64 10
  store i8 -77, ptr %34, align 1
  %35 = getelementptr inbounds i8, ptr %10, i64 11
  store i8 -88, ptr %35, align 1
  %36 = getelementptr inbounds i8, ptr %10, i64 12
  store i8 -75, ptr %36, align 1
  %37 = getelementptr inbounds [13 x i8], ptr %10, i64 0, i64 0
  %38 = call ptr @_xor_decrypt(ptr noundef %37, i32 noundef 13, i8 noundef zeroext -57)
  %39 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 2), ptr noundef %38, i64 noundef 64) #7
  store i32 9, ptr getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 3), align 4
  store i8 -80, ptr %11, align 1
  %40 = getelementptr inbounds i8, ptr %11, i64 1
  store i8 -79, ptr %40, align 1
  %41 = getelementptr inbounds i8, ptr %11, i64 2
  store i8 -94, ptr %41, align 1
  %42 = getelementptr inbounds i8, ptr %11, i64 3
  store i8 -79, ptr %42, align 1
  %43 = getelementptr inbounds i8, ptr %11, i64 4
  store i8 -72, ptr %43, align 1
  %44 = getelementptr inbounds i8, ptr %11, i64 5
  store i8 -69, ptr %44, align 1
  %45 = getelementptr inbounds i8, ptr %11, i64 6
  store i8 -92, ptr %45, align 1
  %46 = getelementptr inbounds i8, ptr %11, i64 7
  store i8 -79, ptr %46, align 1
  %47 = getelementptr inbounds i8, ptr %11, i64 8
  store i8 -90, ptr %47, align 1
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %48 = getelementptr inbounds [9 x i8], ptr %11, i64 0, i64 0
  %49 = call ptr @_xor_decrypt(ptr noundef %48, i32 noundef 9, i8 noundef zeroext -44)
  %50 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), ptr noundef %49, i64 noundef 64) #7
  %51 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 1), ptr noundef @.str.8, i64 noundef 64) #7
  store i8 50, ptr %12, align 1
  %52 = getelementptr inbounds i8, ptr %12, i64 1
  store i8 51, ptr %52, align 1
  %53 = getelementptr inbounds i8, ptr %12, i64 2
  store i8 32, ptr %53, align 1
  %54 = getelementptr inbounds i8, ptr %12, i64 3
  store i8 51, ptr %54, align 1
  %55 = getelementptr inbounds i8, ptr %12, i64 4
  store i8 58, ptr %55, align 1
  %56 = getelementptr inbounds i8, ptr %12, i64 5
  store i8 57, ptr %56, align 1
  %57 = getelementptr inbounds i8, ptr %12, i64 6
  store i8 38, ptr %57, align 1
  %58 = getelementptr inbounds i8, ptr %12, i64 7
  store i8 51, ptr %58, align 1
  %59 = getelementptr inbounds i8, ptr %12, i64 8
  store i8 36, ptr %59, align 1
  %60 = getelementptr inbounds [9 x i8], ptr %12, i64 0, i64 0
  %61 = call ptr @_xor_decrypt(ptr noundef %60, i32 noundef 9, i8 noundef zeroext 86)
  %62 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 2), ptr noundef %61, i64 noundef 64) #7
  store i32 5, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 3), align 4
  store i8 2, ptr %13, align 1
  %63 = getelementptr inbounds i8, ptr %13, i64 1
  store i8 13, ptr %63, align 1
  %64 = getelementptr inbounds i8, ptr %13, i64 2
  store i8 2, ptr %64, align 1
  %65 = getelementptr inbounds i8, ptr %13, i64 3
  store i8 15, ptr %65, align 1
  %66 = getelementptr inbounds i8, ptr %13, i64 4
  store i8 26, ptr %66, align 1
  %67 = getelementptr inbounds i8, ptr %13, i64 5
  store i8 16, ptr %67, align 1
  %68 = getelementptr inbounds i8, ptr %13, i64 6
  store i8 23, ptr %68, align 1
  %69 = getelementptr inbounds [7 x i8], ptr %13, i64 0, i64 0
  %70 = call ptr @_xor_decrypt(ptr noundef %69, i32 noundef 7, i8 noundef zeroext 99)
  %71 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), ptr noundef %70, i64 noundef 64) #7
  %72 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 1), ptr noundef @.str.9, i64 noundef 64) #7
  store i8 -62, ptr %14, align 1
  %73 = getelementptr inbounds i8, ptr %14, i64 1
  store i8 -51, ptr %73, align 1
  %74 = getelementptr inbounds i8, ptr %14, i64 2
  store i8 -62, ptr %74, align 1
  %75 = getelementptr inbounds i8, ptr %14, i64 3
  store i8 -49, ptr %75, align 1
  %76 = getelementptr inbounds i8, ptr %14, i64 4
  store i8 -38, ptr %76, align 1
  %77 = getelementptr inbounds i8, ptr %14, i64 5
  store i8 -48, ptr %77, align 1
  %78 = getelementptr inbounds i8, ptr %14, i64 6
  store i8 -41, ptr %78, align 1
  %79 = getelementptr inbounds [7 x i8], ptr %14, i64 0, i64 0
  %80 = call ptr @_xor_decrypt(ptr noundef %79, i32 noundef 7, i8 noundef zeroext -93)
  %81 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 2), ptr noundef %80, i64 noundef 64) #7
  store i32 3, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 3), align 4
  store i8 -84, ptr %15, align 1
  %82 = getelementptr inbounds i8, ptr %15, i64 1
  store i8 -66, ptr %82, align 1
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %83 = getelementptr inbounds i8, ptr %15, i64 2
  store i8 -82, ptr %83, align 1
  %84 = getelementptr inbounds i8, ptr %15, i64 3
  store i8 -72, ptr %84, align 1
  %85 = getelementptr inbounds i8, ptr %15, i64 4
  store i8 -65, ptr %85, align 1
  %86 = getelementptr inbounds [5 x i8], ptr %15, i64 0, i64 0
  %87 = call ptr @_xor_decrypt(ptr noundef %86, i32 noundef 5, i8 noundef zeroext -53)
  %88 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), ptr noundef %87, i64 noundef 64) #7
  %89 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 1), ptr noundef @.str.10, i64 noundef 64) #7
  store i8 58, ptr %16, align 1
  %90 = getelementptr inbounds i8, ptr %16, i64 1
  store i8 40, ptr %90, align 1
  %91 = getelementptr inbounds i8, ptr %16, i64 2
  store i8 56, ptr %91, align 1
  %92 = getelementptr inbounds i8, ptr %16, i64 3
  store i8 46, ptr %92, align 1
  %93 = getelementptr inbounds i8, ptr %16, i64 4
  store i8 41, ptr %93, align 1
  %94 = getelementptr inbounds [5 x i8], ptr %16, i64 0, i64 0
  %95 = call ptr @_xor_decrypt(ptr noundef %94, i32 noundef 5, i8 noundef zeroext 93)
  %96 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 2), ptr noundef %95, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 3), align 4
  store i32 4, ptr @v_fbc01149fda7, align 4
  %97 = load i32, ptr @x.3, align 4
  %98 = load i32, ptr @y.4, align 4
  %99 = sub i32 %97, 1
  %100 = mul i32 %97, %99
  %101 = urem i32 %100, 2
  %102 = icmp eq i32 %101, 0
  %103 = icmp slt i32 %98, 10
  %104 = or i1 %102, %103
  br i1 %104, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret void

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %105 = alloca [5 x i8], align 1
  %106 = alloca [13 x i8], align 1
  %107 = alloca [9 x i8], align 1
  %108 = alloca [9 x i8], align 1
  %109 = alloca [7 x i8], align 1
  %110 = alloca [7 x i8], align 1
  %111 = alloca [5 x i8], align 1
  %112 = alloca [5 x i8], align 1
  store i8 74, ptr %105, align 1
  %113 = getelementptr inbounds i8, ptr %105, i64 1
  store i8 79, ptr %113, align 1
  %114 = getelementptr inbounds i8, ptr %105, i64 2
  store i8 70, ptr %114, align 1
  %115 = getelementptr inbounds i8, ptr %105, i64 3
  store i8 66, ptr %115, align 1
  %116 = getelementptr inbounds i8, ptr %105, i64 4
  store i8 69, ptr %116, align 1
  %117 = getelementptr inbounds [5 x i8], ptr %105, i64 0, i64 0
  %118 = call ptr @_xor_decrypt(ptr noundef %117, i32 noundef 5, i8 noundef zeroext 43)
  %119 = call ptr @__strcpy_chk(ptr noundef @users, ptr noundef %118, i64 noundef 64) #7
  %120 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 1), ptr noundef @.str, i64 noundef 64) #7
  store i8 -90, ptr %106, align 1
  %121 = getelementptr inbounds i8, ptr %106, i64 1
  store i8 -93, ptr %121, align 1
  %122 = getelementptr inbounds i8, ptr %106, i64 2
  store i8 -86, ptr %122, align 1
  %123 = getelementptr inbounds i8, ptr %106, i64 3
  store i8 -82, ptr %123, align 1
  %124 = getelementptr inbounds i8, ptr %106, i64 4
  store i8 -87, ptr %124, align 1
  %125 = getelementptr inbounds i8, ptr %106, i64 5
  store i8 -82, ptr %125, align 1
  %126 = getelementptr inbounds i8, ptr %106, i64 6
  store i8 -76, ptr %126, align 1
  %127 = getelementptr inbounds i8, ptr %106, i64 7
  store i8 -77, ptr %127, align 1
  %128 = getelementptr inbounds i8, ptr %106, i64 8
  store i8 -75, ptr %128, align 1
  %129 = getelementptr inbounds i8, ptr %106, i64 9
  store i8 -90, ptr %129, align 1
  %130 = getelementptr inbounds i8, ptr %106, i64 10
  store i8 -77, ptr %130, align 1
  %131 = getelementptr inbounds i8, ptr %106, i64 11
  store i8 -88, ptr %131, align 1
  %132 = getelementptr inbounds i8, ptr %106, i64 12
  store i8 -75, ptr %132, align 1
  %133 = getelementptr inbounds [13 x i8], ptr %106, i64 0, i64 0
  %134 = call ptr @_xor_decrypt(ptr noundef %133, i32 noundef 13, i8 noundef zeroext -57)
  %135 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 2), ptr noundef %134, i64 noundef 64) #7
  store i32 9, ptr getelementptr inbounds (%struct.User, ptr @users, i32 0, i32 3), align 4
  store i8 -80, ptr %107, align 1
  %136 = getelementptr inbounds i8, ptr %107, i64 1
  store i8 -79, ptr %136, align 1
  %137 = getelementptr inbounds i8, ptr %107, i64 2
  store i8 -94, ptr %137, align 1
  %138 = getelementptr inbounds i8, ptr %107, i64 3
  store i8 -79, ptr %138, align 1
  %139 = getelementptr inbounds i8, ptr %107, i64 4
  store i8 -72, ptr %139, align 1
  %140 = getelementptr inbounds i8, ptr %107, i64 5
  store i8 -69, ptr %140, align 1
  %141 = getelementptr inbounds i8, ptr %107, i64 6
  store i8 -92, ptr %141, align 1
  %142 = getelementptr inbounds i8, ptr %107, i64 7
  store i8 -79, ptr %142, align 1
  %143 = getelementptr inbounds i8, ptr %107, i64 8
  store i8 -90, ptr %143, align 1
  %144 = getelementptr inbounds [9 x i8], ptr %107, i64 0, i64 0
  %145 = call ptr @_xor_decrypt(ptr noundef %144, i32 noundef 9, i8 noundef zeroext -44)
  %146 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), ptr noundef %145, i64 noundef 64) #7
  %147 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 1), ptr noundef @.str.8, i64 noundef 64) #7
  store i8 50, ptr %108, align 1
  %148 = getelementptr inbounds i8, ptr %108, i64 1
  store i8 51, ptr %148, align 1
  %149 = getelementptr inbounds i8, ptr %108, i64 2
  store i8 32, ptr %149, align 1
  %150 = getelementptr inbounds i8, ptr %108, i64 3
  store i8 51, ptr %150, align 1
  %151 = getelementptr inbounds i8, ptr %108, i64 4
  store i8 58, ptr %151, align 1
  %152 = getelementptr inbounds i8, ptr %108, i64 5
  store i8 57, ptr %152, align 1
  %153 = getelementptr inbounds i8, ptr %108, i64 6
  store i8 38, ptr %153, align 1
  %154 = getelementptr inbounds i8, ptr %108, i64 7
  store i8 51, ptr %154, align 1
  %155 = getelementptr inbounds i8, ptr %108, i64 8
  store i8 36, ptr %155, align 1
  %156 = getelementptr inbounds [9 x i8], ptr %108, i64 0, i64 0
  %157 = call ptr @_xor_decrypt(ptr noundef %156, i32 noundef 9, i8 noundef zeroext 86)
  %158 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 2), ptr noundef %157, i64 noundef 64) #7
  store i32 5, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 1), i32 0, i32 3), align 4
  store i8 2, ptr %109, align 1
  %159 = getelementptr inbounds i8, ptr %109, i64 1
  store i8 13, ptr %159, align 1
  %160 = getelementptr inbounds i8, ptr %109, i64 2
  store i8 2, ptr %160, align 1
  %161 = getelementptr inbounds i8, ptr %109, i64 3
  store i8 15, ptr %161, align 1
  %162 = getelementptr inbounds i8, ptr %109, i64 4
  store i8 26, ptr %162, align 1
  %163 = getelementptr inbounds i8, ptr %109, i64 5
  store i8 16, ptr %163, align 1
  %164 = getelementptr inbounds i8, ptr %109, i64 6
  store i8 23, ptr %164, align 1
  %165 = getelementptr inbounds [7 x i8], ptr %109, i64 0, i64 0
  %166 = call ptr @_xor_decrypt(ptr noundef %165, i32 noundef 7, i8 noundef zeroext 99)
  %167 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), ptr noundef %166, i64 noundef 64) #7
  %168 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 1), ptr noundef @.str.9, i64 noundef 64) #7
  store i8 -62, ptr %110, align 1
  %169 = getelementptr inbounds i8, ptr %110, i64 1
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  store i8 -51, ptr %169, align 1
  %170 = getelementptr inbounds i8, ptr %110, i64 2
  store i8 -62, ptr %170, align 1
  %171 = getelementptr inbounds i8, ptr %110, i64 3
  store i8 -49, ptr %171, align 1
  %172 = getelementptr inbounds i8, ptr %110, i64 4
  store i8 -38, ptr %172, align 1
  %173 = getelementptr inbounds i8, ptr %110, i64 5
  store i8 -48, ptr %173, align 1
  %174 = getelementptr inbounds i8, ptr %110, i64 6
  store i8 -41, ptr %174, align 1
  %175 = getelementptr inbounds [7 x i8], ptr %110, i64 0, i64 0
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  %176 = call ptr @_xor_decrypt(ptr noundef %175, i32 noundef 7, i8 noundef zeroext -93)
  %177 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 2), ptr noundef %176, i64 noundef 64) #7
  store i32 3, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 2), i32 0, i32 3), align 4
  store i8 -84, ptr %111, align 1
  %178 = getelementptr inbounds i8, ptr %111, i64 1
  store i8 -66, ptr %178, align 1
  %179 = getelementptr inbounds i8, ptr %111, i64 2
  store i8 -82, ptr %179, align 1
  %180 = getelementptr inbounds i8, ptr %111, i64 3
  store i8 -72, ptr %180, align 1
  %181 = getelementptr inbounds i8, ptr %111, i64 4
  store i8 -65, ptr %181, align 1
  %182 = getelementptr inbounds [5 x i8], ptr %111, i64 0, i64 0
  %183 = call ptr @_xor_decrypt(ptr noundef %182, i32 noundef 5, i8 noundef zeroext -53)
  %184 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), ptr noundef %183, i64 noundef 64) #7
  %185 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 1), ptr noundef @.str.10, i64 noundef 64) #7
  store i8 58, ptr %112, align 1
  %186 = getelementptr inbounds i8, ptr %112, i64 1
  store i8 40, ptr %186, align 1
  %187 = getelementptr inbounds i8, ptr %112, i64 2
  store i8 56, ptr %187, align 1
  %188 = getelementptr inbounds i8, ptr %112, i64 3
  store i8 46, ptr %188, align 1
  %189 = getelementptr inbounds i8, ptr %112, i64 4
  store i8 41, ptr %189, align 1
  %190 = getelementptr inbounds [5 x i8], ptr %112, i64 0, i64 0
  %191 = call ptr @_xor_decrypt(ptr noundef %190, i32 noundef 5, i8 noundef zeroext 93)
  %192 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 2), ptr noundef %191, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.User, ptr getelementptr inbounds ([5 x %struct.User], ptr @users, i64 0, i64 3), i32 0, i32 3), align 4
  store i32 4, ptr @v_fbc01149fda7, align 4
  br label %originalBB
}

; Function Attrs: nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_0a9fc93cc940(ptr noundef %0, ptr noundef %1) #0 {
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  br label %.split

.split:                                           ; preds = %2
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp ne ptr %7, null
  store i1 %8, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i32 551125656, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %9 = load i32, ptr @x.5, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  %10 = load i32, ptr @y.6, align 4
  %11 = sub i32 %9, 1
  %12 = mul i32 %9, %11
  %13 = urem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br label %loopEntry.split.split

loopEntry.split.split:                            ; preds = %loopEntry.split
  %15 = icmp slt i32 %10, 10
  %16 = or i1 %14, %15
  br i1 %16, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %loopEntry.split.split, %originalBBalteredBB.split
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %17 = load i32, ptr @x.5, align 4
  %18 = load i32, ptr @y.6, align 4
  %19 = sub i32 %17, 1
  %20 = mul i32 %17, %19
  %21 = urem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %23 = icmp slt i32 %18, 10
  %24 = or i1 %22, %23
  br i1 %24, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  switch i32 %switchVar1, label %switchDefault [
    i32 551125656, label %first
    i32 1645180615, label %42
    i32 -1967139918, label %46
    i32 140874118, label %48
    i32 861232569, label %65
    i32 -1468467268, label %86
    i32 -1923354367, label %96
    i32 -1462352505, label %106
    i32 -461256359, label %139
    i32 1874516292, label %140
    i32 1294022011, label %161
    i32 15957918, label %164
  ]

switchDefault:                                    ; preds = %originalBBpart2
  br label %loopEnd

first:                                            ; preds = %originalBBpart2
  %25 = load i32, ptr @x.5, align 4
  %26 = load i32, ptr @y.6, align 4
  %27 = sub i32 %25, 1
  br label %first.split

first.split:                                      ; preds = %first
  %28 = mul i32 %25, %27
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  %29 = urem i32 %28, 2
  %30 = icmp eq i32 %29, 0
  %31 = icmp slt i32 %26, 10
  %32 = or i1 %30, %31
  br i1 %32, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %first.split.split, %originalBB2alteredBB.split.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %33 = select i1 %.reload, i32 1645180615, i32 -1967139918
  store i32 %33, ptr %switchVar, align 4
  %34 = load i32, ptr @x.5, align 4
  %35 = load i32, ptr @y.6, align 4
  %36 = sub i32 %34, 1
  %37 = mul i32 %34, %36
  %38 = urem i32 %37, 2
  %39 = icmp eq i32 %38, 0
  %40 = icmp slt i32 %35, 10
  %41 = or i1 %39, %40
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %41, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

42:                                               ; preds = %originalBBpart2
  %43 = load ptr, ptr %5, align 8
  %44 = icmp ne ptr %43, null
  br label %.split30

.split30:                                         ; preds = %42
  %45 = select i1 %44, i32 140874118, i32 -1967139918
  br label %.split30.split

.split30.split:                                   ; preds = %.split30
  store i32 %45, ptr %switchVar, align 4
  br label %loopEnd

46:                                               ; preds = %originalBBpart2
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %.split31

.split31:                                         ; preds = %46
  store i32 0, ptr %3, align 4
  br label %.split31.split

.split31.split:                                   ; preds = %.split31
  store i32 15957918, ptr %switchVar, align 4
  br label %loopEnd

48:                                               ; preds = %originalBBpart2
  %49 = load i32, ptr @x.5, align 4
  %50 = load i32, ptr @y.6, align 4
  %51 = sub i32 %49, 1
  br label %.split32

.split32:                                         ; preds = %48
  %52 = mul i32 %49, %51
  br label %.split32.split

.split32.split:                                   ; preds = %.split32
  %53 = urem i32 %52, 2
  %54 = icmp eq i32 %53, 0
  %55 = icmp slt i32 %50, 10
  %56 = or i1 %54, %55
  br i1 %56, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split32.split, %originalBB6alteredBB.split.split
  store i32 0, ptr %6, align 4
  store i32 861232569, ptr %switchVar, align 4
  %57 = load i32, ptr @x.5, align 4
  %58 = load i32, ptr @y.6, align 4
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %59 = sub i32 %57, 1
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %60 = mul i32 %57, %59
  %61 = urem i32 %60, 2
  %62 = icmp eq i32 %61, 0
  %63 = icmp slt i32 %58, 10
  %64 = or i1 %62, %63
  br i1 %64, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

65:                                               ; preds = %originalBBpart2
  %66 = load i32, ptr @x.5, align 4
  %67 = load i32, ptr @y.6, align 4
  br label %.split33

.split33:                                         ; preds = %65
  %68 = sub i32 %66, 1
  %69 = mul i32 %66, %68
  %70 = urem i32 %69, 2
  %71 = icmp eq i32 %70, 0
  %72 = icmp slt i32 %67, 10
  %73 = or i1 %71, %72
  br label %.split33.split

.split33.split:                                   ; preds = %.split33
  br i1 %73, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split33.split, %originalBB10alteredBB.split.split
  %74 = load i32, ptr %6, align 4
  %75 = load i32, ptr @v_fbc01149fda7, align 4
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %76 = icmp slt i32 %74, %75
  %77 = select i1 %76, i32 -1468467268, i32 1294022011
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  store i32 %77, ptr %switchVar, align 4
  %78 = load i32, ptr @x.5, align 4
  %79 = load i32, ptr @y.6, align 4
  %80 = sub i32 %78, 1
  %81 = mul i32 %78, %80
  %82 = urem i32 %81, 2
  %83 = icmp eq i32 %82, 0
  %84 = icmp slt i32 %79, 10
  %85 = or i1 %83, %84
  br i1 %85, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

86:                                               ; preds = %originalBBpart2
  %87 = load i32, ptr %6, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %88
  br label %.split34

.split34:                                         ; preds = %86
  %90 = getelementptr inbounds %struct.User, ptr %89, i32 0, i32 0
  %91 = getelementptr inbounds [64 x i8], ptr %90, i64 0, i64 0
  %92 = load ptr, ptr %4, align 8
  %93 = call i32 @strcmp(ptr noundef %91, ptr noundef %92) #7
  br label %.split34.split

.split34.split:                                   ; preds = %.split34
  %94 = icmp eq i32 %93, 0
  %95 = select i1 %94, i32 -1923354367, i32 -461256359
  store i32 %95, ptr %switchVar, align 4
  br label %loopEnd

96:                                               ; preds = %originalBBpart2
  %97 = load i32, ptr %6, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.User, ptr %99, i32 0, i32 1
  %101 = getelementptr inbounds [64 x i8], ptr %100, i64 0, i64 0
  %102 = load ptr, ptr %5, align 8
  br label %.split35

.split35:                                         ; preds = %96
  %103 = call i32 @strcmp(ptr noundef %101, ptr noundef %102) #7
  %104 = icmp eq i32 %103, 0
  %105 = select i1 %104, i32 -1462352505, i32 -461256359
  br label %.split35.split

.split35.split:                                   ; preds = %.split35
  store i32 %105, ptr %switchVar, align 4
  br label %loopEnd

106:                                              ; preds = %originalBBpart2
  %107 = load i32, ptr @x.5, align 4
  %108 = load i32, ptr @y.6, align 4
  %109 = sub i32 %107, 1
  %110 = mul i32 %107, %109
  %111 = urem i32 %110, 2
  %112 = icmp eq i32 %111, 0
  %113 = icmp slt i32 %108, 10
  br label %.split36

.split36:                                         ; preds = %106
  %114 = or i1 %112, %113
  br label %.split36.split

.split36.split:                                   ; preds = %.split36
  br i1 %114, label %originalBB14, label %originalBB14alteredBB

originalBB14:                                     ; preds = %.split36.split, %originalBB14alteredBB.split.split
  %115 = load ptr, ptr %4, align 8
  %116 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef %115, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  %117 = call i64 @time(ptr noundef null)
  store i64 %117, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 2), align 8
  %118 = load ptr, ptr %4, align 8
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %118)
  %120 = load i32, ptr %6, align 4
  %121 = sext i32 %120 to i64
  br label %originalBB14.split

originalBB14.split:                               ; preds = %originalBB14
  %122 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.User, ptr %122, i32 0, i32 2
  %124 = getelementptr inbounds [64 x i8], ptr %123, i64 0, i64 0
  %125 = load i32, ptr %6, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %126
  %128 = getelementptr inbounds %struct.User, ptr %127, i32 0, i32 3
  %129 = load i32, ptr %128, align 4
  br label %originalBB14.split.split

originalBB14.split.split:                         ; preds = %originalBB14.split
  %130 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %124, i32 noundef %129)
  store i32 1, ptr %3, align 4
  store i32 15957918, ptr %switchVar, align 4
  %131 = load i32, ptr @x.5, align 4
  %132 = load i32, ptr @y.6, align 4
  %133 = sub i32 %131, 1
  %134 = mul i32 %131, %133
  %135 = urem i32 %134, 2
  %136 = icmp eq i32 %135, 0
  %137 = icmp slt i32 %132, 10
  %138 = or i1 %136, %137
  br i1 %138, label %originalBBpart216, label %originalBB14alteredBB

originalBBpart216:                                ; preds = %originalBB14.split.split
  br label %loopEnd

139:                                              ; preds = %originalBBpart2
  store i32 1874516292, ptr %switchVar, align 4
  br label %.split37

.split37:                                         ; preds = %139
  br label %loopEnd

140:                                              ; preds = %originalBBpart2
  %141 = load i32, ptr @x.5, align 4
  %142 = load i32, ptr @y.6, align 4
  br label %.split38

.split38:                                         ; preds = %140
  %143 = sub i32 %141, 1
  %144 = mul i32 %141, %143
  %145 = urem i32 %144, 2
  br label %.split38.split

.split38.split:                                   ; preds = %.split38
  %146 = icmp eq i32 %145, 0
  %147 = icmp slt i32 %142, 10
  %148 = or i1 %146, %147
  br i1 %148, label %originalBB18, label %originalBB18alteredBB

originalBB18:                                     ; preds = %.split38.split, %originalBB18alteredBB.split.split
  %149 = load i32, ptr %6, align 4
  br label %originalBB18.split

originalBB18.split:                               ; preds = %originalBB18
  %150 = sub i32 0, 1
  %151 = sub i32 %149, %150
  br label %originalBB18.split.split

originalBB18.split.split:                         ; preds = %originalBB18.split
  %152 = add nsw i32 %149, 1
  store i32 %151, ptr %6, align 4
  store i32 861232569, ptr %switchVar, align 4
  %153 = load i32, ptr @x.5, align 4
  %154 = load i32, ptr @y.6, align 4
  %155 = sub i32 %153, 1
  %156 = mul i32 %153, %155
  %157 = urem i32 %156, 2
  %158 = icmp eq i32 %157, 0
  %159 = icmp slt i32 %154, 10
  %160 = or i1 %158, %159
  br i1 %160, label %originalBBpart228, label %originalBB18alteredBB

originalBBpart228:                                ; preds = %originalBB18.split.split
  br label %loopEnd

161:                                              ; preds = %originalBBpart2
  %162 = load ptr, ptr %4, align 8
  br label %.split39

.split39:                                         ; preds = %161
  %163 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %162)
  br label %.split39.split

.split39.split:                                   ; preds = %.split39
  store i32 0, ptr %3, align 4
  store i32 15957918, ptr %switchVar, align 4
  br label %loopEnd

164:                                              ; preds = %originalBBpart2
  %165 = load i32, ptr %3, align 4
  br label %.split40

.split40:                                         ; preds = %164
  ret i32 %165

loopEnd:                                          ; preds = %.split39.split, %originalBBpart228, %.split37, %originalBBpart216, %.split35.split, %.split34.split, %originalBBpart212, %originalBBpart28, %.split31.split, %.split30.split, %originalBBpart24, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %loopEntry.split.split
  %switchVar1alteredBB = load i32, ptr %switchVar, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %first.split.split
  %.reloadalteredBB = load i1, ptr %.reg2mem, align 1
  %166 = select i1 %.reloadalteredBB, i32 1645180615, i32 -1967139918
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 %166, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split32.split
  store i32 0, ptr %6, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  store i32 861232569, ptr %switchVar, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split33.split
  %167 = load i32, ptr %6, align 4
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  %168 = load i32, ptr @v_fbc01149fda7, align 4
  %169 = icmp slt i32 %167, %168
  %170 = select i1 %169, i32 -1468467268, i32 1294022011
  store i32 %170, ptr %switchVar, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  br label %originalBB10

originalBB14alteredBB:                            ; preds = %originalBB14.split.split, %.split36.split
  %171 = load ptr, ptr %4, align 8
  %172 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef %171, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  %173 = call i64 @time(ptr noundef null)
  store i64 %173, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 2), align 8
  %174 = load ptr, ptr %4, align 8
  br label %originalBB14alteredBB.split

originalBB14alteredBB.split:                      ; preds = %originalBB14alteredBB
  %175 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %174)
  %176 = load i32, ptr %6, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %177
  %179 = getelementptr inbounds %struct.User, ptr %178, i32 0, i32 2
  %180 = getelementptr inbounds [64 x i8], ptr %179, i64 0, i64 0
  br label %originalBB14alteredBB.split.split

originalBB14alteredBB.split.split:                ; preds = %originalBB14alteredBB.split
  %181 = load i32, ptr %6, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %182
  %184 = getelementptr inbounds %struct.User, ptr %183, i32 0, i32 3
  %185 = load i32, ptr %184, align 4
  %186 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %180, i32 noundef %185)
  store i32 1, ptr %3, align 4
  store i32 15957918, ptr %switchVar, align 4
  br label %originalBB14

originalBB18alteredBB:                            ; preds = %originalBB18.split.split, %.split38.split
  %187 = load i32, ptr %6, align 4
  %_ = sub i32 0, 1
  %gen = mul i32 %_, 1
  %_19 = shl i32 0, 1
  %_20 = sub i32 0, 0
  %gen21 = add i32 %_20, 1
  %_22 = sub i32 0, 1
  br label %originalBB18alteredBB.split

originalBB18alteredBB.split:                      ; preds = %originalBB18alteredBB
  %gen23 = mul i32 %_22, 1
  %188 = sub i32 0, 1
  %189 = sub i32 %187, %188
  %_24 = sub i32 %187, 1
  br label %originalBB18alteredBB.split.split

originalBB18alteredBB.split.split:                ; preds = %originalBB18alteredBB.split
  %gen25 = mul i32 %_24, 1
  %_26 = shl i32 %187, 1
  %190 = add nsw i32 %187, 1
  store i32 %189, ptr %6, align 4
  store i32 861232569, ptr %switchVar, align 4
  br label %originalBB18
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
  %4 = load ptr, ptr %3, align 8
  br label %.split

.split:                                           ; preds = %1
  %5 = icmp ne ptr %4, null
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -76481863, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -76481863, label %first
    i32 1272411313, label %7
    i32 -2016541000, label %8
    i32 -633238366, label %30
    i32 -1761586366, label %32
    i32 -667690024, label %34
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %6 = select i1 %.reload, i32 -2016541000, i32 1272411313
  store i32 %6, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

7:                                                ; preds = %loopEntry.split
  store i32 0, ptr %2, align 4
  br label %.split2

.split2:                                          ; preds = %7
  store i32 -667690024, ptr %switchVar, align 4
  br label %.split2.split

.split2.split:                                    ; preds = %.split2
  br label %loopEnd

8:                                                ; preds = %loopEntry.split
  %9 = load i32, ptr @x.7, align 4
  %10 = load i32, ptr @y.8, align 4
  %11 = sub i32 %9, 1
  %12 = mul i32 %9, %11
  %13 = urem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br label %.split3

.split3:                                          ; preds = %8
  %15 = icmp slt i32 %10, 10
  %16 = or i1 %14, %15
  br label %.split3.split

.split3.split:                                    ; preds = %.split3
  br i1 %16, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split3.split, %originalBBalteredBB.split.split
  %17 = load ptr, ptr %3, align 8
  %18 = load ptr, ptr @API_KEY, align 8
  %19 = call i32 @strcmp(ptr noundef %17, ptr noundef %18) #7
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 -633238366, i32 -1761586366
  store i32 %21, ptr %switchVar, align 4
  %22 = load i32, ptr @x.7, align 4
  %23 = load i32, ptr @y.8, align 4
  %24 = sub i32 %22, 1
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %25 = mul i32 %22, %24
  %26 = urem i32 %25, 2
  %27 = icmp eq i32 %26, 0
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %28 = icmp slt i32 %23, 10
  %29 = or i1 %27, %28
  br i1 %29, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

30:                                               ; preds = %loopEntry.split
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %.split4

.split4:                                          ; preds = %30
  store i32 1, ptr %2, align 4
  store i32 -667690024, ptr %switchVar, align 4
  br label %.split4.split

.split4.split:                                    ; preds = %.split4
  br label %loopEnd

32:                                               ; preds = %loopEntry.split
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %.split5

.split5:                                          ; preds = %32
  store i32 0, ptr %2, align 4
  br label %.split5.split

.split5.split:                                    ; preds = %.split5
  store i32 -667690024, ptr %switchVar, align 4
  br label %loopEnd

34:                                               ; preds = %loopEntry.split
  %35 = load i32, ptr %2, align 4
  br label %.split6

.split6:                                          ; preds = %34
  ret i32 %35

loopEnd:                                          ; preds = %.split5.split, %.split4.split, %originalBBpart2, %.split2.split, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split3.split
  %36 = load ptr, ptr %3, align 8
  %37 = load ptr, ptr @API_KEY, align 8
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %38 = call i32 @strcmp(ptr noundef %36, ptr noundef %37) #7
  %39 = icmp eq i32 %38, 0
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  %40 = select i1 %39, i32 -633238366, i32 -1761586366
  store i32 %40, ptr %switchVar, align 4
  br label %originalBB
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_12f52c0c0856(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load i32, ptr @x.9, align 4
  %4 = load i32, ptr @y.10, align 4
  %5 = sub i32 %3, 1
  %6 = mul i32 %3, %5
  %7 = urem i32 %6, 2
  br label %.split

.split:                                           ; preds = %2
  %8 = icmp eq i32 %7, 0
  br label %.split.split

.split.split:                                     ; preds = %.split
  %9 = icmp slt i32 %4, 10
  %10 = or i1 %8, %9
  br i1 %10, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %11, align 8
  store ptr %1, ptr %12, align 8
  %13 = load ptr, ptr %11, align 8
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %14 = load ptr, ptr %11, align 8
  %15 = call i64 @llvm.objectsize.i64.p0(ptr %14, i1 false, i1 true, i1 false)
  %16 = load ptr, ptr %12, align 8
  %17 = load ptr, ptr @JWT_SECRET, align 8
  %18 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %13, i64 noundef 128, i32 noundef 0, i64 noundef %15, ptr noundef @.str.17, ptr noundef %16, ptr noundef %17)
  %19 = load ptr, ptr %12, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %19)
  %21 = load i32, ptr @x.9, align 4
  %22 = load i32, ptr @y.10, align 4
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %23 = sub i32 %21, 1
  %24 = mul i32 %21, %23
  %25 = urem i32 %24, 2
  %26 = icmp eq i32 %25, 0
  %27 = icmp slt i32 %22, 10
  %28 = or i1 %26, %27
  br i1 %28, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret void

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  store ptr %0, ptr %29, align 8
  store ptr %1, ptr %30, align 8
  %31 = load ptr, ptr %29, align 8
  %32 = load ptr, ptr %29, align 8
  %33 = call i64 @llvm.objectsize.i64.p0(ptr %32, i1 false, i1 true, i1 false)
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %34 = load ptr, ptr %30, align 8
  %35 = load ptr, ptr @JWT_SECRET, align 8
  %36 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %31, i64 noundef 128, i32 noundef 0, i64 noundef %33, ptr noundef @.str.17, ptr noundef %34, ptr noundef %35)
  %37 = load ptr, ptr %30, align 8
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %37)
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB
}

declare i32 @__snprintf_chk(ptr noundef, i64 noundef, i32 noundef, i64 noundef, ptr noundef, ...) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_9f5974383c59(ptr noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  br label %.split

.split:                                           ; preds = %1
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -932679643, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -932679643, label %first
    i32 -813729091, label %23
    i32 938176204, label %40
    i32 -1755446618, label %46
    i32 1297669642, label %48
    i32 144826424, label %50
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %6 = load i32, ptr @x.11, align 4
  %7 = load i32, ptr @y.12, align 4
  %8 = sub i32 %6, 1
  %9 = mul i32 %6, %8
  %10 = urem i32 %9, 2
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %11 = icmp eq i32 %10, 0
  %12 = icmp slt i32 %7, 10
  %13 = or i1 %11, %12
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  br i1 %13, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %14 = load i32, ptr @x.11, align 4
  %15 = load i32, ptr @y.12, align 4
  %16 = sub i32 %14, 1
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %17 = mul i32 %14, %16
  %18 = urem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  %20 = icmp slt i32 %15, 10
  %21 = or i1 %19, %20
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %21, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %22 = select i1 %.reload, i32 938176204, i32 -813729091
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %22, ptr %switchVar, align 4
  br label %loopEnd

23:                                               ; preds = %loopEntry.split
  %24 = load i32, ptr @x.11, align 4
  %25 = load i32, ptr @y.12, align 4
  br label %.split6

.split6:                                          ; preds = %23
  %26 = sub i32 %24, 1
  %27 = mul i32 %24, %26
  %28 = urem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  %30 = icmp slt i32 %25, 10
  %31 = or i1 %29, %30
  br i1 %31, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split6.split, %originalBB2alteredBB.split.split
  store i32 0, ptr %2, align 4
  store i32 144826424, ptr %switchVar, align 4
  %32 = load i32, ptr @x.11, align 4
  %33 = load i32, ptr @y.12, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %34 = sub i32 %32, 1
  %35 = mul i32 %32, %34
  %36 = urem i32 %35, 2
  %37 = icmp eq i32 %36, 0
  %38 = icmp slt i32 %33, 10
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %39 = or i1 %37, %38
  br i1 %39, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

40:                                               ; preds = %loopEntry.split
  %41 = load ptr, ptr %3, align 8
  %42 = load ptr, ptr @JWT_SECRET, align 8
  br label %.split7

.split7:                                          ; preds = %40
  %43 = call ptr @strstr(ptr noundef %41, ptr noundef %42) #7
  %44 = icmp ne ptr %43, null
  %45 = select i1 %44, i32 -1755446618, i32 1297669642
  store i32 %45, ptr %switchVar, align 4
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  br label %loopEnd

46:                                               ; preds = %loopEntry.split
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  store i32 1, ptr %2, align 4
  br label %.split8

.split8:                                          ; preds = %46
  store i32 144826424, ptr %switchVar, align 4
  br label %.split8.split

.split8.split:                                    ; preds = %.split8
  br label %loopEnd

48:                                               ; preds = %loopEntry.split
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %.split9

.split9:                                          ; preds = %48
  store i32 0, ptr %2, align 4
  store i32 144826424, ptr %switchVar, align 4
  br label %.split9.split

.split9.split:                                    ; preds = %.split9
  br label %loopEnd

50:                                               ; preds = %loopEntry.split
  %51 = load i32, ptr %2, align 4
  br label %.split10

.split10:                                         ; preds = %50
  ret i32 %51

loopEnd:                                          ; preds = %.split9.split, %.split8.split, %.split7.split, %originalBBpart24, %first.split.split, %originalBBpart2
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split6.split
  store i32 0, ptr %2, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 144826424, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2
}

; Function Attrs: nounwind
declare ptr @strstr(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_34ede220d91a(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  br label %.split

.split:                                           ; preds = %2
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  %switchVar = alloca i32, align 4
  store i32 538694140, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 538694140, label %23
    i32 -419042617, label %44
    i32 534982709, label %54
    i32 142750689, label %63
    i32 -2137766383, label %72
    i32 673983808, label %96
    i32 1256401433, label %97
    i32 -827936070, label %104
    i32 738694734, label %105
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %7 = load i32, ptr @x.13, align 4
  %8 = load i32, ptr @y.14, align 4
  %9 = sub i32 %7, 1
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %10 = mul i32 %7, %9
  %11 = urem i32 %10, 2
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  %12 = icmp eq i32 %11, 0
  %13 = icmp slt i32 %8, 10
  %14 = or i1 %12, %13
  br i1 %14, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %15 = load i32, ptr @x.13, align 4
  %16 = load i32, ptr @y.14, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %17 = sub i32 %15, 1
  %18 = mul i32 %15, %17
  %19 = urem i32 %18, 2
  %20 = icmp eq i32 %19, 0
  %21 = icmp slt i32 %16, 10
  %22 = or i1 %20, %21
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %22, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

23:                                               ; preds = %loopEntry.split
  %24 = load i32, ptr @x.13, align 4
  %25 = load i32, ptr @y.14, align 4
  %26 = sub i32 %24, 1
  %27 = mul i32 %24, %26
  %28 = urem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br label %.split10

.split10:                                         ; preds = %23
  %30 = icmp slt i32 %25, 10
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  %31 = or i1 %29, %30
  br i1 %31, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split10.split, %originalBB2alteredBB.split.split
  %32 = load i32, ptr %6, align 4
  %33 = load i32, ptr @v_fbc01149fda7, align 4
  %34 = icmp slt i32 %32, %33
  %35 = select i1 %34, i32 -419042617, i32 -827936070
  store i32 %35, ptr %switchVar, align 4
  %36 = load i32, ptr @x.13, align 4
  %37 = load i32, ptr @y.14, align 4
  %38 = sub i32 %36, 1
  %39 = mul i32 %36, %38
  %40 = urem i32 %39, 2
  %41 = icmp eq i32 %40, 0
  %42 = icmp slt i32 %37, 10
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %43 = or i1 %41, %42
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %43, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

44:                                               ; preds = %loopEntry.split
  %45 = load i32, ptr %6, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %46
  %48 = getelementptr inbounds %struct.User, ptr %47, i32 0, i32 0
  %49 = getelementptr inbounds [64 x i8], ptr %48, i64 0, i64 0
  br label %.split11

.split11:                                         ; preds = %44
  %50 = load ptr, ptr %4, align 8
  %51 = call i32 @strcmp(ptr noundef %49, ptr noundef %50) #7
  %52 = icmp eq i32 %51, 0
  br label %.split11.split

.split11.split:                                   ; preds = %.split11
  %53 = select i1 %52, i32 534982709, i32 673983808
  store i32 %53, ptr %switchVar, align 4
  br label %loopEnd

54:                                               ; preds = %loopEntry.split
  %55 = load i32, ptr %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %56
  br label %.split12

.split12:                                         ; preds = %54
  %58 = getelementptr inbounds %struct.User, ptr %57, i32 0, i32 3
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %5, align 4
  %61 = icmp sge i32 %59, %60
  %62 = select i1 %61, i32 142750689, i32 -2137766383
  br label %.split12.split

.split12.split:                                   ; preds = %.split12
  store i32 %62, ptr %switchVar, align 4
  br label %loopEnd

63:                                               ; preds = %loopEntry.split
  %64 = load ptr, ptr %4, align 8
  %65 = load i32, ptr %6, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %66
  br label %.split13

.split13:                                         ; preds = %63
  %68 = getelementptr inbounds %struct.User, ptr %67, i32 0, i32 3
  %69 = load i32, ptr %68, align 4
  br label %.split13.split

.split13.split:                                   ; preds = %.split13
  %70 = load i32, ptr %5, align 4
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, ptr noundef %64, i32 noundef %69, i32 noundef %70)
  store i32 1, ptr %3, align 4
  store i32 738694734, ptr %switchVar, align 4
  br label %loopEnd

72:                                               ; preds = %loopEntry.split
  %73 = load i32, ptr @x.13, align 4
  %74 = load i32, ptr @y.14, align 4
  br label %.split14

.split14:                                         ; preds = %72
  %75 = sub i32 %73, 1
  %76 = mul i32 %73, %75
  %77 = urem i32 %76, 2
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  %78 = icmp eq i32 %77, 0
  %79 = icmp slt i32 %74, 10
  %80 = or i1 %78, %79
  br i1 %80, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split14.split, %originalBB6alteredBB.split.split
  %81 = load i32, ptr %6, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.User, ptr %83, i32 0, i32 3
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %85 = load i32, ptr %84, align 4
  %86 = load i32, ptr %5, align 4
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %85, i32 noundef %86)
  store i32 0, ptr %3, align 4
  store i32 738694734, ptr %switchVar, align 4
  %88 = load i32, ptr @x.13, align 4
  %89 = load i32, ptr @y.14, align 4
  %90 = sub i32 %88, 1
  %91 = mul i32 %88, %90
  %92 = urem i32 %91, 2
  %93 = icmp eq i32 %92, 0
  %94 = icmp slt i32 %89, 10
  %95 = or i1 %93, %94
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  br i1 %95, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

96:                                               ; preds = %loopEntry.split
  store i32 1256401433, ptr %switchVar, align 4
  br label %.split15

.split15:                                         ; preds = %96
  br label %loopEnd

97:                                               ; preds = %loopEntry.split
  %98 = load i32, ptr %6, align 4
  %99 = sub i32 0, %98
  %100 = sub i32 0, 1
  br label %.split16

.split16:                                         ; preds = %97
  %101 = add i32 %99, %100
  %102 = sub i32 0, %101
  br label %.split16.split

.split16.split:                                   ; preds = %.split16
  %103 = add nsw i32 %98, 1
  store i32 %102, ptr %6, align 4
  store i32 538694140, ptr %switchVar, align 4
  br label %loopEnd

104:                                              ; preds = %loopEntry.split
  store i32 0, ptr %3, align 4
  br label %.split17

.split17:                                         ; preds = %104
  store i32 738694734, ptr %switchVar, align 4
  br label %.split17.split

.split17.split:                                   ; preds = %.split17
  br label %loopEnd

105:                                              ; preds = %loopEntry.split
  %106 = load i32, ptr %3, align 4
  br label %.split18

.split18:                                         ; preds = %105
  ret i32 %106

loopEnd:                                          ; preds = %.split17.split, %.split16.split, %.split15, %originalBBpart28, %.split13.split, %.split12.split, %.split11.split, %originalBBpart24, %originalBBpart2
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split10.split
  %107 = load i32, ptr %6, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  %108 = load i32, ptr @v_fbc01149fda7, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  %109 = icmp slt i32 %107, %108
  %110 = select i1 %109, i32 -419042617, i32 -827936070
  store i32 %110, ptr %switchVar, align 4
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split14.split
  %111 = load i32, ptr %6, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %112
  %114 = getelementptr inbounds %struct.User, ptr %113, i32 0, i32 3
  %115 = load i32, ptr %114, align 4
  %116 = load i32, ptr %5, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %115, i32 noundef %116)
  store i32 0, ptr %3, align 4
  store i32 738694734, ptr %switchVar, align 4
  br label %originalBB6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_420e96d771d4() #0 {
  %1 = load i32, ptr @x.15, align 4
  %2 = load i32, ptr @y.16, align 4
  %3 = sub i32 %1, 1
  %4 = mul i32 %1, %3
  br label %.split

.split:                                           ; preds = %0
  %5 = urem i32 %4, 2
  %6 = icmp eq i32 %5, 0
  %7 = icmp slt i32 %2, 10
  br label %.split.split

.split.split:                                     ; preds = %.split
  %8 = or i1 %6, %7
  br i1 %8, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  %10 = load ptr, ptr @DB_CONNECTION_STRING, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, ptr noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %13 = load i32, ptr @x.15, align 4
  %14 = load i32, ptr @y.16, align 4
  %15 = sub i32 %13, 1
  %16 = mul i32 %13, %15
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %17 = urem i32 %16, 2
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %18 = icmp eq i32 %17, 0
  %19 = icmp slt i32 %14, 10
  %20 = or i1 %18, %19
  br i1 %20, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  ret void

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %22 = load ptr, ptr @DB_CONNECTION_STRING, align 8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, ptr noundef %22)
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %originalBB
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_f707f7349698(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  br label %.split

.split:                                           ; preds = %2
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  br label %.split.split

.split.split:                                     ; preds = %.split
  %7 = call i64 @llvm.objectsize.i64.p0(ptr %6, i1 false, i1 true, i1 false)
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr @ENCRYPTION_KEY, align 8
  %10 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %5, i64 noundef 256, i32 noundef 0, i64 noundef %7, ptr noundef @.str.26, ptr noundef %8, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_1a2ef98af176(ptr noundef %0, ptr noundef %1) #0 {
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  br label %.split

.split:                                           ; preds = %2
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %7, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -579075315, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %8 = load i32, ptr @x.19, align 4
  %9 = load i32, ptr @y.20, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  %10 = sub i32 %8, 1
  %11 = mul i32 %8, %10
  %12 = urem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  %14 = icmp slt i32 %9, 10
  %15 = or i1 %13, %14
  br label %loopEntry.split.split

loopEntry.split.split:                            ; preds = %loopEntry.split
  br i1 %15, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %loopEntry.split.split, %originalBBalteredBB.split
  %switchVar1 = load i32, ptr %switchVar, align 4
  %16 = load i32, ptr @x.19, align 4
  %17 = load i32, ptr @y.20, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %18 = sub i32 %16, 1
  %19 = mul i32 %16, %18
  %20 = urem i32 %19, 2
  %21 = icmp eq i32 %20, 0
  %22 = icmp slt i32 %17, 10
  %23 = or i1 %21, %22
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %23, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  switch i32 %switchVar1, label %switchDefault [
    i32 -579075315, label %first
    i32 1110459433, label %25
    i32 1021653995, label %29
    i32 702866563, label %30
    i32 1746217254, label %36
    i32 -1789007238, label %38
    i32 -440792108, label %56
  ]

switchDefault:                                    ; preds = %originalBBpart2
  br label %loopEnd

first:                                            ; preds = %originalBBpart2
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %24 = select i1 %.reload, i32 1110459433, i32 1021653995
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %24, ptr %switchVar, align 4
  br label %loopEnd

25:                                               ; preds = %originalBBpart2
  %26 = load ptr, ptr %5, align 8
  %27 = icmp ne ptr %26, null
  %28 = select i1 %27, i32 702866563, i32 1021653995
  br label %.split6

.split6:                                          ; preds = %25
  store i32 %28, ptr %switchVar, align 4
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  br label %loopEnd

29:                                               ; preds = %originalBBpart2
  store i32 0, ptr %3, align 4
  br label %.split7

.split7:                                          ; preds = %29
  store i32 -440792108, ptr %switchVar, align 4
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  br label %loopEnd

30:                                               ; preds = %originalBBpart2
  %31 = load ptr, ptr %5, align 8
  br label %.split8

.split8:                                          ; preds = %30
  %32 = load ptr, ptr @OAUTH_CLIENT_SECRET, align 8
  %33 = call i32 @strcmp(ptr noundef %31, ptr noundef %32) #7
  %34 = icmp eq i32 %33, 0
  br label %.split8.split

.split8.split:                                    ; preds = %.split8
  %35 = select i1 %34, i32 1746217254, i32 -1789007238
  store i32 %35, ptr %switchVar, align 4
  br label %loopEnd

36:                                               ; preds = %originalBBpart2
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  store i32 1, ptr %3, align 4
  br label %.split9

.split9:                                          ; preds = %36
  store i32 -440792108, ptr %switchVar, align 4
  br label %.split9.split

.split9.split:                                    ; preds = %.split9
  br label %loopEnd

38:                                               ; preds = %originalBBpart2
  %39 = load i32, ptr @x.19, align 4
  %40 = load i32, ptr @y.20, align 4
  br label %.split10

.split10:                                         ; preds = %38
  %41 = sub i32 %39, 1
  %42 = mul i32 %39, %41
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  %43 = urem i32 %42, 2
  %44 = icmp eq i32 %43, 0
  %45 = icmp slt i32 %40, 10
  %46 = or i1 %44, %45
  br i1 %46, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split10.split, %originalBB2alteredBB.split.split
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  store i32 0, ptr %3, align 4
  store i32 -440792108, ptr %switchVar, align 4
  %48 = load i32, ptr @x.19, align 4
  %49 = load i32, ptr @y.20, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %50 = sub i32 %48, 1
  %51 = mul i32 %48, %50
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %52 = urem i32 %51, 2
  %53 = icmp eq i32 %52, 0
  %54 = icmp slt i32 %49, 10
  %55 = or i1 %53, %54
  br i1 %55, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

56:                                               ; preds = %originalBBpart2
  %57 = load i32, ptr %3, align 4
  br label %.split11

.split11:                                         ; preds = %56
  ret i32 %57

loopEnd:                                          ; preds = %originalBBpart24, %.split9.split, %.split8.split, %.split7.split, %.split6.split, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %loopEntry.split.split
  %switchVar1alteredBB = load i32, ptr %switchVar, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split10.split
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 0, ptr %3, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  store i32 -440792108, ptr %switchVar, align 4
  br label %originalBB2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_fcae2dd27871(ptr noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  br label %.split

.split:                                           ; preds = %1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 1313056953, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 1313056953, label %first
    i32 -265990802, label %7
    i32 -1184644414, label %25
    i32 -782728471, label %47
    i32 -1121139589, label %49
    i32 -523395580, label %51
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %6 = select i1 %.reload, i32 -1184644414, i32 -265990802
  br label %first.split

first.split:                                      ; preds = %first
  store i32 %6, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

7:                                                ; preds = %loopEntry.split
  %8 = load i32, ptr @x.21, align 4
  %9 = load i32, ptr @y.22, align 4
  br label %.split10

.split10:                                         ; preds = %7
  %10 = sub i32 %8, 1
  %11 = mul i32 %8, %10
  %12 = urem i32 %11, 2
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  %13 = icmp eq i32 %12, 0
  %14 = icmp slt i32 %9, 10
  %15 = or i1 %13, %14
  br i1 %15, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split10.split, %originalBBalteredBB.split.split
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  store i32 0, ptr %2, align 4
  store i32 -523395580, ptr %switchVar, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %17 = load i32, ptr @x.21, align 4
  %18 = load i32, ptr @y.22, align 4
  %19 = sub i32 %17, 1
  %20 = mul i32 %17, %19
  %21 = urem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  %23 = icmp slt i32 %18, 10
  %24 = or i1 %22, %23
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %24, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

25:                                               ; preds = %loopEntry.split
  %26 = load i32, ptr @x.21, align 4
  %27 = load i32, ptr @y.22, align 4
  %28 = sub i32 %26, 1
  br label %.split11

.split11:                                         ; preds = %25
  %29 = mul i32 %26, %28
  %30 = urem i32 %29, 2
  %31 = icmp eq i32 %30, 0
  %32 = icmp slt i32 %27, 10
  br label %.split11.split

.split11.split:                                   ; preds = %.split11
  %33 = or i1 %31, %32
  br i1 %33, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split11.split, %originalBB2alteredBB.split.split
  %34 = load ptr, ptr %3, align 8
  %35 = load ptr, ptr @LICENSE_KEY, align 8
  %36 = call i32 @strcmp(ptr noundef %34, ptr noundef %35) #7
  %37 = icmp eq i32 %36, 0
  %38 = select i1 %37, i32 -782728471, i32 -1121139589
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  store i32 %38, ptr %switchVar, align 4
  %39 = load i32, ptr @x.21, align 4
  %40 = load i32, ptr @y.22, align 4
  %41 = sub i32 %39, 1
  %42 = mul i32 %39, %41
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %43 = urem i32 %42, 2
  %44 = icmp eq i32 %43, 0
  %45 = icmp slt i32 %40, 10
  %46 = or i1 %44, %45
  br i1 %46, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

47:                                               ; preds = %loopEntry.split
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  br label %.split12

.split12:                                         ; preds = %47
  store i32 1, ptr %2, align 4
  br label %.split12.split

.split12.split:                                   ; preds = %.split12
  store i32 -523395580, ptr %switchVar, align 4
  br label %loopEnd

49:                                               ; preds = %loopEntry.split
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  br label %.split13

.split13:                                         ; preds = %49
  store i32 0, ptr %2, align 4
  br label %.split13.split

.split13.split:                                   ; preds = %.split13
  store i32 -523395580, ptr %switchVar, align 4
  br label %loopEnd

51:                                               ; preds = %loopEntry.split
  %52 = load i32, ptr @x.21, align 4
  %53 = load i32, ptr @y.22, align 4
  %54 = sub i32 %52, 1
  br label %.split14

.split14:                                         ; preds = %51
  %55 = mul i32 %52, %54
  %56 = urem i32 %55, 2
  %57 = icmp eq i32 %56, 0
  %58 = icmp slt i32 %53, 10
  %59 = or i1 %57, %58
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  br i1 %59, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split14.split, %originalBB6alteredBB.split
  %60 = load i32, ptr %2, align 4
  %61 = load i32, ptr @x.21, align 4
  %62 = load i32, ptr @y.22, align 4
  %63 = sub i32 %61, 1
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %64 = mul i32 %61, %63
  %65 = urem i32 %64, 2
  %66 = icmp eq i32 %65, 0
  %67 = icmp slt i32 %62, 10
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %68 = or i1 %66, %67
  br i1 %68, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  ret i32 %60

loopEnd:                                          ; preds = %.split13.split, %.split12.split, %originalBBpart24, %originalBBpart2, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split10.split
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  store i32 0, ptr %2, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  store i32 -523395580, ptr %switchVar, align 4
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split11.split
  %70 = load ptr, ptr %3, align 8
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  %71 = load ptr, ptr @LICENSE_KEY, align 8
  %72 = call i32 @strcmp(ptr noundef %70, ptr noundef %71) #7
  %73 = icmp eq i32 %72, 0
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  %74 = select i1 %73, i32 -782728471, i32 -1121139589
  store i32 %74, ptr %switchVar, align 4
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split14.split
  %75 = load i32, ptr %2, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  br label %originalBB6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_799bf1b7712b(ptr noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  br label %.split

.split:                                           ; preds = %1
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i32 -2033312339, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -2033312339, label %first
    i32 1357182835, label %7
    i32 -1047910500, label %24
    i32 -470830074, label %30
    i32 -1341092987, label %49
    i32 1475433494, label %51
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %6 = select i1 %.reload, i32 -1047910500, i32 1357182835
  br label %first.split

first.split:                                      ; preds = %first
  store i32 %6, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

7:                                                ; preds = %loopEntry.split
  %8 = load i32, ptr @x.23, align 4
  %9 = load i32, ptr @y.24, align 4
  %10 = sub i32 %8, 1
  br label %.split10

.split10:                                         ; preds = %7
  %11 = mul i32 %8, %10
  %12 = urem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  %14 = icmp slt i32 %9, 10
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  %15 = or i1 %13, %14
  br i1 %15, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split10.split, %originalBBalteredBB.split.split
  store i32 0, ptr %2, align 4
  store i32 1475433494, ptr %switchVar, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %16 = load i32, ptr @x.23, align 4
  %17 = load i32, ptr @y.24, align 4
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %18 = sub i32 %16, 1
  %19 = mul i32 %16, %18
  %20 = urem i32 %19, 2
  %21 = icmp eq i32 %20, 0
  %22 = icmp slt i32 %17, 10
  %23 = or i1 %21, %22
  br i1 %23, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

24:                                               ; preds = %loopEntry.split
  %25 = load ptr, ptr %3, align 8
  br label %.split11

.split11:                                         ; preds = %24
  %26 = load ptr, ptr @BACKUP_ADMIN_PASSWORD, align 8
  %27 = call i32 @strcmp(ptr noundef %25, ptr noundef %26) #7
  %28 = icmp eq i32 %27, 0
  %29 = select i1 %28, i32 -470830074, i32 -1341092987
  br label %.split11.split

.split11.split:                                   ; preds = %.split11
  store i32 %29, ptr %switchVar, align 4
  br label %loopEnd

30:                                               ; preds = %loopEntry.split
  %31 = load i32, ptr @x.23, align 4
  %32 = load i32, ptr @y.24, align 4
  %33 = sub i32 %31, 1
  %34 = mul i32 %31, %33
  %35 = urem i32 %34, 2
  %36 = icmp eq i32 %35, 0
  br label %.split12

.split12:                                         ; preds = %30
  %37 = icmp slt i32 %32, 10
  %38 = or i1 %36, %37
  br label %.split12.split

.split12.split:                                   ; preds = %.split12
  br i1 %38, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split12.split, %originalBB2alteredBB.split.split
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %40 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef @.str.34, i64 noundef 64) #7
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  store i32 1, ptr %2, align 4
  store i32 1475433494, ptr %switchVar, align 4
  %41 = load i32, ptr @x.23, align 4
  %42 = load i32, ptr @y.24, align 4
  %43 = sub i32 %41, 1
  %44 = mul i32 %41, %43
  %45 = urem i32 %44, 2
  %46 = icmp eq i32 %45, 0
  %47 = icmp slt i32 %42, 10
  %48 = or i1 %46, %47
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %48, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

49:                                               ; preds = %loopEntry.split
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  br label %.split13

.split13:                                         ; preds = %49
  store i32 0, ptr %2, align 4
  store i32 1475433494, ptr %switchVar, align 4
  br label %.split13.split

.split13.split:                                   ; preds = %.split13
  br label %loopEnd

51:                                               ; preds = %loopEntry.split
  %52 = load i32, ptr @x.23, align 4
  %53 = load i32, ptr @y.24, align 4
  br label %.split14

.split14:                                         ; preds = %51
  %54 = sub i32 %52, 1
  %55 = mul i32 %52, %54
  %56 = urem i32 %55, 2
  %57 = icmp eq i32 %56, 0
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  %58 = icmp slt i32 %53, 10
  %59 = or i1 %57, %58
  br i1 %59, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split14.split, %originalBB6alteredBB.split
  %60 = load i32, ptr %2, align 4
  %61 = load i32, ptr @x.23, align 4
  %62 = load i32, ptr @y.24, align 4
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %63 = sub i32 %61, 1
  %64 = mul i32 %61, %63
  %65 = urem i32 %64, 2
  %66 = icmp eq i32 %65, 0
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %67 = icmp slt i32 %62, 10
  %68 = or i1 %66, %67
  br i1 %68, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  ret i32 %60

loopEnd:                                          ; preds = %.split13.split, %originalBBpart24, %.split11.split, %originalBBpart2, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split10.split
  store i32 0, ptr %2, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  store i32 1475433494, ptr %switchVar, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split12.split
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  %70 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef @.str.34, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  store i32 1, ptr %2, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  store i32 1475433494, ptr %switchVar, align 4
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split14.split
  %71 = load i32, ptr %2, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  br label %originalBB6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca [128 x i8], align 1
  %9 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  br label %.split

.split:                                           ; preds = %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @f_0c7992b3d2d2()
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 3
  store i1 %15, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 965905062, ptr %switchVar, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 965905062, label %first
    i32 237468825, label %33
    i32 519644570, label %42
    i32 -373756070, label %54
    i32 607918908, label %72
    i32 963127154, label %79
    i32 -1361213050, label %84
    i32 -163152664, label %93
    i32 560208856, label %117
    i32 1397802013, label %149
    i32 1486328708, label %174
    i32 -1885109288, label %184
    i32 1886757602, label %216
    i32 -1500834673, label %225
    i32 526318068, label %234
    i32 2010915323, label %251
    i32 480796586, label %252
    i32 -1716369066, label %253
    i32 1135594938, label %254
    i32 1118145575, label %260
    i32 -109186688, label %265
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %16 = load i32, ptr @x.25, align 4
  %17 = load i32, ptr @y.26, align 4
  %18 = sub i32 %16, 1
  %19 = mul i32 %16, %18
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %20 = urem i32 %19, 2
  %21 = icmp eq i32 %20, 0
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  %22 = icmp slt i32 %17, 10
  %23 = or i1 %21, %22
  br i1 %23, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %24 = load i32, ptr @x.25, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %25 = load i32, ptr @y.26, align 4
  %26 = sub i32 %24, 1
  %27 = mul i32 %24, %26
  %28 = urem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  %30 = icmp slt i32 %25, 10
  %31 = or i1 %29, %30
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %31, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %32 = select i1 %.reload, i32 237468825, i32 519644570
  store i32 %32, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

33:                                               ; preds = %loopEntry.split
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds ptr, ptr %34, i64 0
  %36 = load ptr, ptr %35, align 8
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.40, ptr noundef %36)
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.42)
  br label %.split146

.split146:                                        ; preds = %33
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  br label %.split146.split

.split146.split:                                  ; preds = %.split146
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  store i32 1, ptr %3, align 4
  store i32 -109186688, ptr %switchVar, align 4
  br label %loopEnd

42:                                               ; preds = %loopEntry.split
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds ptr, ptr %43, i64 1
  %45 = load ptr, ptr %44, align 8
  store ptr %45, ptr %6, align 8
  %46 = load ptr, ptr %5, align 8
  %47 = getelementptr inbounds ptr, ptr %46, i64 2
  %48 = load ptr, ptr %47, align 8
  br label %.split147

.split147:                                        ; preds = %42
  store ptr %48, ptr %7, align 8
  %49 = load ptr, ptr %6, align 8
  %50 = load ptr, ptr %7, align 8
  br label %.split147.split

.split147.split:                                  ; preds = %.split147
  %51 = call i32 @f_0a9fc93cc940(ptr noundef %49, ptr noundef %50)
  %52 = icmp ne i32 %51, 0
  %53 = select i1 %52, i32 607918908, i32 -373756070
  store i32 %53, ptr %switchVar, align 4
  br label %loopEnd

54:                                               ; preds = %loopEntry.split
  %55 = load i32, ptr @x.25, align 4
  %56 = load i32, ptr @y.26, align 4
  %57 = sub i32 %55, 1
  %58 = mul i32 %55, %57
  br label %.split148

.split148:                                        ; preds = %54
  %59 = urem i32 %58, 2
  %60 = icmp eq i32 %59, 0
  br label %.split148.split

.split148.split:                                  ; preds = %.split148
  %61 = icmp slt i32 %56, 10
  %62 = or i1 %60, %61
  br i1 %62, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split148.split, %originalBB2alteredBB.split.split
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.45)
  store i32 1, ptr %3, align 4
  store i32 -109186688, ptr %switchVar, align 4
  %64 = load i32, ptr @x.25, align 4
  %65 = load i32, ptr @y.26, align 4
  %66 = sub i32 %64, 1
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %67 = mul i32 %64, %66
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %68 = urem i32 %67, 2
  %69 = icmp eq i32 %68, 0
  %70 = icmp slt i32 %65, 10
  %71 = or i1 %69, %70
  br i1 %71, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

72:                                               ; preds = %loopEntry.split
  %73 = getelementptr inbounds [128 x i8], ptr %8, i64 0, i64 0
  %74 = load ptr, ptr %6, align 8
  br label %.split149

.split149:                                        ; preds = %72
  call void @f_12f52c0c0856(ptr noundef %73, ptr noundef %74)
  %75 = getelementptr inbounds [128 x i8], ptr %8, i64 0, i64 0
  %76 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1), ptr noundef %75, i64 noundef 128) #7
  br label %.split149.split

.split149.split:                                  ; preds = %.split149
  %77 = load ptr, ptr %6, align 8
  %78 = call i32 @f_34ede220d91a(ptr noundef %77, i32 noundef 3)
  call void @f_420e96d771d4()
  store i32 3, ptr %9, align 4
  store i32 963127154, ptr %switchVar, align 4
  br label %loopEnd

79:                                               ; preds = %loopEntry.split
  %80 = load i32, ptr %9, align 4
  %81 = load i32, ptr %4, align 4
  %82 = icmp slt i32 %80, %81
  br label %.split150

.split150:                                        ; preds = %79
  %83 = select i1 %82, i32 -1361213050, i32 1118145575
  store i32 %83, ptr %switchVar, align 4
  br label %.split150.split

.split150.split:                                  ; preds = %.split150
  br label %loopEnd

84:                                               ; preds = %loopEntry.split
  %85 = load ptr, ptr %5, align 8
  %86 = load i32, ptr %9, align 4
  br label %.split151

.split151:                                        ; preds = %84
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds ptr, ptr %85, i64 %87
  %89 = load ptr, ptr %88, align 8
  %90 = call i32 @strcmp(ptr noundef %89, ptr noundef @.str.46) #7
  %91 = icmp eq i32 %90, 0
  br label %.split151.split

.split151.split:                                  ; preds = %.split151
  %92 = select i1 %91, i32 -163152664, i32 1397802013
  store i32 %92, ptr %switchVar, align 4
  br label %loopEnd

93:                                               ; preds = %loopEntry.split
  %94 = load i32, ptr @x.25, align 4
  %95 = load i32, ptr @y.26, align 4
  br label %.split152

.split152:                                        ; preds = %93
  %96 = sub i32 %94, 1
  %97 = mul i32 %94, %96
  %98 = urem i32 %97, 2
  br label %.split152.split

.split152.split:                                  ; preds = %.split152
  %99 = icmp eq i32 %98, 0
  %100 = icmp slt i32 %95, 10
  %101 = or i1 %99, %100
  br i1 %101, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split152.split, %originalBB6alteredBB.split.split
  %102 = load i32, ptr %9, align 4
  %103 = sub i32 0, 1
  %104 = sub i32 %102, %103
  %105 = add nsw i32 %102, 1
  %106 = load i32, ptr %4, align 4
  %107 = icmp slt i32 %104, %106
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %108 = select i1 %107, i32 560208856, i32 1397802013
  store i32 %108, ptr %switchVar, align 4
  %109 = load i32, ptr @x.25, align 4
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %110 = load i32, ptr @y.26, align 4
  %111 = sub i32 %109, 1
  %112 = mul i32 %109, %111
  %113 = urem i32 %112, 2
  %114 = icmp eq i32 %113, 0
  %115 = icmp slt i32 %110, 10
  %116 = or i1 %114, %115
  br i1 %116, label %originalBBpart217, label %originalBB6alteredBB

originalBBpart217:                                ; preds = %originalBB6.split.split
  br label %loopEnd

117:                                              ; preds = %loopEntry.split
  %118 = load i32, ptr @x.25, align 4
  %119 = load i32, ptr @y.26, align 4
  br label %.split153

.split153:                                        ; preds = %117
  %120 = sub i32 %118, 1
  %121 = mul i32 %118, %120
  %122 = urem i32 %121, 2
  br label %.split153.split

.split153.split:                                  ; preds = %.split153
  %123 = icmp eq i32 %122, 0
  %124 = icmp slt i32 %119, 10
  %125 = or i1 %123, %124
  br i1 %125, label %originalBB19, label %originalBB19alteredBB

originalBB19:                                     ; preds = %.split153.split, %originalBB19alteredBB.split.split
  %126 = load ptr, ptr %5, align 8
  %127 = load i32, ptr %9, align 4
  %128 = add i32 %127, 151568954
  %129 = add i32 %128, 1
  %130 = sub i32 %129, 151568954
  %131 = add nsw i32 %127, 1
  %132 = sext i32 %130 to i64
  %133 = getelementptr inbounds ptr, ptr %126, i64 %132
  %134 = load ptr, ptr %133, align 8
  %135 = call i32 @f_3ff16c1a3ff2(ptr noundef %134)
  %136 = load i32, ptr %9, align 4
  %137 = sub i32 %136, 984422404
  %138 = add i32 %137, 1
  %139 = add i32 %138, 984422404
  %140 = add nsw i32 %136, 1
  br label %originalBB19.split

originalBB19.split:                               ; preds = %originalBB19
  store i32 %139, ptr %9, align 4
  store i32 -1716369066, ptr %switchVar, align 4
  %141 = load i32, ptr @x.25, align 4
  %142 = load i32, ptr @y.26, align 4
  %143 = sub i32 %141, 1
  %144 = mul i32 %141, %143
  %145 = urem i32 %144, 2
  %146 = icmp eq i32 %145, 0
  br label %originalBB19.split.split

originalBB19.split.split:                         ; preds = %originalBB19.split
  %147 = icmp slt i32 %142, 10
  %148 = or i1 %146, %147
  br i1 %148, label %originalBBpart283, label %originalBB19alteredBB

originalBBpart283:                                ; preds = %originalBB19.split.split
  br label %loopEnd

149:                                              ; preds = %loopEntry.split
  %150 = load i32, ptr @x.25, align 4
  br label %.split154

.split154:                                        ; preds = %149
  %151 = load i32, ptr @y.26, align 4
  br label %.split154.split

.split154.split:                                  ; preds = %.split154
  %152 = sub i32 %150, 1
  %153 = mul i32 %150, %152
  %154 = urem i32 %153, 2
  %155 = icmp eq i32 %154, 0
  %156 = icmp slt i32 %151, 10
  %157 = or i1 %155, %156
  br i1 %157, label %originalBB85, label %originalBB85alteredBB

originalBB85:                                     ; preds = %.split154.split, %originalBB85alteredBB.split.split
  %158 = load ptr, ptr %5, align 8
  %159 = load i32, ptr %9, align 4
  %160 = sext i32 %159 to i64
  br label %originalBB85.split

originalBB85.split:                               ; preds = %originalBB85
  %161 = getelementptr inbounds ptr, ptr %158, i64 %160
  %162 = load ptr, ptr %161, align 8
  %163 = call i32 @strcmp(ptr noundef %162, ptr noundef @.str.47) #7
  %164 = icmp eq i32 %163, 0
  %165 = select i1 %164, i32 1486328708, i32 1886757602
  store i32 %165, ptr %switchVar, align 4
  %166 = load i32, ptr @x.25, align 4
  %167 = load i32, ptr @y.26, align 4
  %168 = sub i32 %166, 1
  %169 = mul i32 %166, %168
  %170 = urem i32 %169, 2
  %171 = icmp eq i32 %170, 0
  %172 = icmp slt i32 %167, 10
  %173 = or i1 %171, %172
  br label %originalBB85.split.split

originalBB85.split.split:                         ; preds = %originalBB85.split
  br i1 %173, label %originalBBpart287, label %originalBB85alteredBB

originalBBpart287:                                ; preds = %originalBB85.split.split
  br label %loopEnd

174:                                              ; preds = %loopEntry.split
  %175 = load i32, ptr %9, align 4
  %176 = sub i32 0, %175
  %177 = sub i32 0, 1
  %178 = add i32 %176, %177
  %179 = sub i32 0, %178
  %180 = add nsw i32 %175, 1
  br label %.split155

.split155:                                        ; preds = %174
  %181 = load i32, ptr %4, align 4
  %182 = icmp slt i32 %179, %181
  br label %.split155.split

.split155.split:                                  ; preds = %.split155
  %183 = select i1 %182, i32 -1885109288, i32 1886757602
  store i32 %183, ptr %switchVar, align 4
  br label %loopEnd

184:                                              ; preds = %loopEntry.split
  %185 = load i32, ptr @x.25, align 4
  %186 = load i32, ptr @y.26, align 4
  %187 = sub i32 %185, 1
  %188 = mul i32 %185, %187
  br label %.split156

.split156:                                        ; preds = %184
  %189 = urem i32 %188, 2
  br label %.split156.split

.split156.split:                                  ; preds = %.split156
  %190 = icmp eq i32 %189, 0
  %191 = icmp slt i32 %186, 10
  %192 = or i1 %190, %191
  br i1 %192, label %originalBB89, label %originalBB89alteredBB

originalBB89:                                     ; preds = %.split156.split, %originalBB89alteredBB.split.split
  %193 = load ptr, ptr %5, align 8
  %194 = load i32, ptr %9, align 4
  br label %originalBB89.split

originalBB89.split:                               ; preds = %originalBB89
  %195 = add i32 %194, -480669263
  %196 = add i32 %195, 1
  %197 = sub i32 %196, -480669263
  %198 = add nsw i32 %194, 1
  %199 = sext i32 %197 to i64
  %200 = getelementptr inbounds ptr, ptr %193, i64 %199
  %201 = load ptr, ptr %200, align 8
  %202 = call i32 @f_fcae2dd27871(ptr noundef %201)
  %203 = load i32, ptr %9, align 4
  %204 = sub i32 %203, 1719147282
  br label %originalBB89.split.split

originalBB89.split.split:                         ; preds = %originalBB89.split
  %205 = add i32 %204, 1
  %206 = add i32 %205, 1719147282
  %207 = add nsw i32 %203, 1
  store i32 %206, ptr %9, align 4
  store i32 480796586, ptr %switchVar, align 4
  %208 = load i32, ptr @x.25, align 4
  %209 = load i32, ptr @y.26, align 4
  %210 = sub i32 %208, 1
  %211 = mul i32 %208, %210
  %212 = urem i32 %211, 2
  %213 = icmp eq i32 %212, 0
  %214 = icmp slt i32 %209, 10
  %215 = or i1 %213, %214
  br i1 %215, label %originalBBpart2140, label %originalBB89alteredBB

originalBBpart2140:                               ; preds = %originalBB89.split.split
  br label %loopEnd

216:                                              ; preds = %loopEntry.split
  %217 = load ptr, ptr %5, align 8
  br label %.split157

.split157:                                        ; preds = %216
  %218 = load i32, ptr %9, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds ptr, ptr %217, i64 %219
  %221 = load ptr, ptr %220, align 8
  %222 = call i32 @strcmp(ptr noundef %221, ptr noundef @.str.48) #7
  br label %.split157.split

.split157.split:                                  ; preds = %.split157
  %223 = icmp eq i32 %222, 0
  %224 = select i1 %223, i32 -1500834673, i32 2010915323
  store i32 %224, ptr %switchVar, align 4
  br label %loopEnd

225:                                              ; preds = %loopEntry.split
  %226 = load i32, ptr %9, align 4
  br label %.split158

.split158:                                        ; preds = %225
  %227 = sub i32 %226, -68512595
  %228 = add i32 %227, 1
  %229 = add i32 %228, -68512595
  %230 = add nsw i32 %226, 1
  br label %.split158.split

.split158.split:                                  ; preds = %.split158
  %231 = load i32, ptr %4, align 4
  %232 = icmp slt i32 %229, %231
  %233 = select i1 %232, i32 526318068, i32 2010915323
  store i32 %233, ptr %switchVar, align 4
  br label %loopEnd

234:                                              ; preds = %loopEntry.split
  %235 = load ptr, ptr %5, align 8
  %236 = load i32, ptr %9, align 4
  %237 = sub i32 0, %236
  %238 = sub i32 0, 1
  %239 = add i32 %237, %238
  br label %.split159

.split159:                                        ; preds = %234
  %240 = sub i32 0, %239
  %241 = add nsw i32 %236, 1
  %242 = sext i32 %240 to i64
  br label %.split159.split

.split159.split:                                  ; preds = %.split159
  %243 = getelementptr inbounds ptr, ptr %235, i64 %242
  %244 = load ptr, ptr %243, align 8
  %245 = call i32 @f_799bf1b7712b(ptr noundef %244)
  %246 = load i32, ptr %9, align 4
  %247 = add i32 %246, -723734525
  %248 = add i32 %247, 1
  %249 = sub i32 %248, -723734525
  %250 = add nsw i32 %246, 1
  store i32 %249, ptr %9, align 4
  store i32 2010915323, ptr %switchVar, align 4
  br label %loopEnd

251:                                              ; preds = %loopEntry.split
  store i32 480796586, ptr %switchVar, align 4
  br label %.split160

.split160:                                        ; preds = %251
  br label %loopEnd

252:                                              ; preds = %loopEntry.split
  store i32 -1716369066, ptr %switchVar, align 4
  br label %.split161

.split161:                                        ; preds = %252
  br label %loopEnd

253:                                              ; preds = %loopEntry.split
  store i32 1135594938, ptr %switchVar, align 4
  br label %.split162

.split162:                                        ; preds = %253
  br label %loopEnd

254:                                              ; preds = %loopEntry.split
  %255 = load i32, ptr %9, align 4
  %256 = add i32 %255, -951252497
  br label %.split163

.split163:                                        ; preds = %254
  %257 = add i32 %256, 1
  %258 = sub i32 %257, -951252497
  %259 = add nsw i32 %255, 1
  br label %.split163.split

.split163.split:                                  ; preds = %.split163
  store i32 %258, ptr %9, align 4
  store i32 963127154, ptr %switchVar, align 4
  br label %loopEnd

260:                                              ; preds = %loopEntry.split
  %261 = call i32 (ptr, ...) @printf(ptr noundef @.str.49)
  br label %.split164

.split164:                                        ; preds = %260
  %262 = call i32 (ptr, ...) @printf(ptr noundef @.str.50)
  %263 = call i32 (ptr, ...) @printf(ptr noundef @.str.51, ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1))
  %264 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  store i32 0, ptr %3, align 4
  store i32 -109186688, ptr %switchVar, align 4
  br label %.split164.split

.split164.split:                                  ; preds = %.split164
  br label %loopEnd

265:                                              ; preds = %loopEntry.split
  %266 = load i32, ptr @x.25, align 4
  br label %.split165

.split165:                                        ; preds = %265
  %267 = load i32, ptr @y.26, align 4
  %268 = sub i32 %266, 1
  %269 = mul i32 %266, %268
  %270 = urem i32 %269, 2
  %271 = icmp eq i32 %270, 0
  %272 = icmp slt i32 %267, 10
  %273 = or i1 %271, %272
  br label %.split165.split

.split165.split:                                  ; preds = %.split165
  br i1 %273, label %originalBB142, label %originalBB142alteredBB

originalBB142:                                    ; preds = %.split165.split, %originalBB142alteredBB.split
  %274 = load i32, ptr %3, align 4
  %275 = load i32, ptr @x.25, align 4
  %276 = load i32, ptr @y.26, align 4
  %277 = sub i32 %275, 1
  %278 = mul i32 %275, %277
  %279 = urem i32 %278, 2
  br label %originalBB142.split

originalBB142.split:                              ; preds = %originalBB142
  %280 = icmp eq i32 %279, 0
  br label %originalBB142.split.split

originalBB142.split.split:                        ; preds = %originalBB142.split
  %281 = icmp slt i32 %276, 10
  %282 = or i1 %280, %281
  br i1 %282, label %originalBBpart2144, label %originalBB142alteredBB

originalBBpart2144:                               ; preds = %originalBB142.split.split
  ret i32 %274

loopEnd:                                          ; preds = %.split164.split, %.split163.split, %.split162, %.split161, %.split160, %.split159.split, %.split158.split, %.split157.split, %originalBBpart2140, %.split155.split, %originalBBpart287, %originalBBpart283, %originalBBpart217, %.split151.split, %.split150.split, %.split149.split, %originalBBpart24, %.split147.split, %.split146.split, %first.split.split, %originalBBpart2
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split148.split
  %283 = call i32 (ptr, ...) @printf(ptr noundef @.str.45)
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 1, ptr %3, align 4
  store i32 -109186688, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split152.split
  %284 = load i32, ptr %9, align 4
  %_ = shl i32 0, 1
  %_7 = sub i32 0, 0
  %gen = add i32 %_7, 1
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %285 = sub i32 0, 1
  %_8 = sub i32 0, %284
  %gen9 = add i32 %_8, %285
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  %286 = sub i32 %284, %285
  %_10 = shl i32 %284, 1
  %_11 = sub i32 0, %284
  %gen12 = add i32 %_11, 1
  %_13 = shl i32 %284, 1
  %_14 = sub i32 %284, 1
  %gen15 = mul i32 %_14, 1
  %287 = add nsw i32 %284, 1
  %288 = load i32, ptr %4, align 4
  %289 = icmp slt i32 %286, %288
  %290 = select i1 %289, i32 560208856, i32 1397802013
  store i32 %290, ptr %switchVar, align 4
  br label %originalBB6

originalBB19alteredBB:                            ; preds = %originalBB19.split.split, %.split153.split
  %291 = load ptr, ptr %5, align 8
  %292 = load i32, ptr %9, align 4
  %_20 = sub i32 0, %292
  %gen21 = add i32 %_20, 151568954
  %_22 = sub i32 0, %292
  %gen23 = add i32 %_22, 151568954
  %_24 = sub i32 %292, 151568954
  %gen25 = mul i32 %_24, 151568954
  %_26 = sub i32 0, %292
  br label %originalBB19alteredBB.split

originalBB19alteredBB.split:                      ; preds = %originalBB19alteredBB
  %gen27 = add i32 %_26, 151568954
  %_28 = sub i32 %292, 151568954
  %gen29 = mul i32 %_28, 151568954
  %_30 = sub i32 0, %292
  %gen31 = add i32 %_30, 151568954
  %_32 = sub i32 %292, 151568954
  %gen33 = mul i32 %_32, 151568954
  %_34 = shl i32 %292, 151568954
  %293 = add i32 %292, 151568954
  %_35 = sub i32 0, %293
  %gen36 = add i32 %_35, 1
  %_37 = shl i32 %293, 1
  %_38 = sub i32 0, %293
  %gen39 = add i32 %_38, 1
  %_40 = shl i32 %293, 1
  %_41 = shl i32 %293, 1
  %_42 = sub i32 %293, 1
  %gen43 = mul i32 %_42, 1
  %_44 = shl i32 %293, 1
  %294 = add i32 %293, 1
  %_45 = sub i32 %294, 151568954
  %gen46 = mul i32 %_45, 151568954
  %_47 = sub i32 %294, 151568954
  %gen48 = mul i32 %_47, 151568954
  %295 = sub i32 %294, 151568954
  %_49 = shl i32 %292, 1
  %_50 = sub i32 %292, 1
  %gen51 = mul i32 %_50, 1
  %_52 = shl i32 %292, 1
  %296 = add nsw i32 %292, 1
  %297 = sext i32 %295 to i64
  %298 = getelementptr inbounds ptr, ptr %291, i64 %297
  %299 = load ptr, ptr %298, align 8
  %300 = call i32 @f_3ff16c1a3ff2(ptr noundef %299)
  %301 = load i32, ptr %9, align 4
  %_53 = shl i32 %301, 984422404
  %_54 = sub i32 %301, 984422404
  %gen55 = mul i32 %_54, 984422404
  %_56 = sub i32 %301, 984422404
  %gen57 = mul i32 %_56, 984422404
  %_58 = sub i32 0, %301
  %gen59 = add i32 %_58, 984422404
  %_60 = shl i32 %301, 984422404
  %_61 = sub i32 0, %301
  %gen62 = add i32 %_61, 984422404
  %_63 = sub i32 0, %301
  %gen64 = add i32 %_63, 984422404
  %302 = sub i32 %301, 984422404
  %_65 = sub i32 0, %302
  %gen66 = add i32 %_65, 1
  %_67 = sub i32 0, %302
  %gen68 = add i32 %_67, 1
  %_69 = sub i32 %302, 1
  %gen70 = mul i32 %_69, 1
  %_71 = shl i32 %302, 1
  %_72 = sub i32 0, %302
  %gen73 = add i32 %_72, 1
  %303 = add i32 %302, 1
  %_74 = shl i32 %303, 984422404
  %_75 = sub i32 0, %303
  %gen76 = add i32 %_75, 984422404
  %_77 = shl i32 %303, 984422404
  %_78 = sub i32 0, %303
  %gen79 = add i32 %_78, 984422404
  %304 = add i32 %303, 984422404
  %_80 = sub i32 %301, 1
  %gen81 = mul i32 %_80, 1
  %305 = add nsw i32 %301, 1
  store i32 %304, ptr %9, align 4
  store i32 -1716369066, ptr %switchVar, align 4
  br label %originalBB19alteredBB.split.split

originalBB19alteredBB.split.split:                ; preds = %originalBB19alteredBB.split
  br label %originalBB19

originalBB85alteredBB:                            ; preds = %originalBB85.split.split, %.split154.split
  %306 = load ptr, ptr %5, align 8
  %307 = load i32, ptr %9, align 4
  %308 = sext i32 %307 to i64
  br label %originalBB85alteredBB.split

originalBB85alteredBB.split:                      ; preds = %originalBB85alteredBB
  %309 = getelementptr inbounds ptr, ptr %306, i64 %308
  %310 = load ptr, ptr %309, align 8
  br label %originalBB85alteredBB.split.split

originalBB85alteredBB.split.split:                ; preds = %originalBB85alteredBB.split
  %311 = call i32 @strcmp(ptr noundef %310, ptr noundef @.str.47) #7
  %312 = icmp eq i32 %311, 0
  %313 = select i1 %312, i32 1486328708, i32 1886757602
  store i32 %313, ptr %switchVar, align 4
  br label %originalBB85

originalBB89alteredBB:                            ; preds = %originalBB89.split.split, %.split156.split
  %314 = load ptr, ptr %5, align 8
  %315 = load i32, ptr %9, align 4
  %_90 = sub i32 0, %315
  br label %originalBB89alteredBB.split

originalBB89alteredBB.split:                      ; preds = %originalBB89alteredBB
  %gen91 = add i32 %_90, -480669263
  %_92 = sub i32 0, %315
  %gen93 = add i32 %_92, -480669263
  %_94 = sub i32 %315, -480669263
  %gen95 = mul i32 %_94, -480669263
  %_96 = sub i32 0, %315
  %gen97 = add i32 %_96, -480669263
  %316 = add i32 %315, -480669263
  %317 = add i32 %316, 1
  %_98 = shl i32 %317, -480669263
  br label %originalBB89alteredBB.split.split

originalBB89alteredBB.split.split:                ; preds = %originalBB89alteredBB.split
  %_99 = sub i32 %317, -480669263
  %gen100 = mul i32 %_99, -480669263
  %318 = sub i32 %317, -480669263
  %_101 = shl i32 %315, 1
  %_102 = sub i32 0, %315
  %gen103 = add i32 %_102, 1
  %_104 = sub i32 0, %315
  %gen105 = add i32 %_104, 1
  %_106 = sub i32 0, %315
  %gen107 = add i32 %_106, 1
  %319 = add nsw i32 %315, 1
  %320 = sext i32 %318 to i64
  %321 = getelementptr inbounds ptr, ptr %314, i64 %320
  %322 = load ptr, ptr %321, align 8
  %323 = call i32 @f_fcae2dd27871(ptr noundef %322)
  %324 = load i32, ptr %9, align 4
  %_108 = shl i32 %324, 1719147282
  %_109 = shl i32 %324, 1719147282
  %_110 = sub i32 %324, 1719147282
  %gen111 = mul i32 %_110, 1719147282
  %_112 = sub i32 0, %324
  %gen113 = add i32 %_112, 1719147282
  %_114 = sub i32 %324, 1719147282
  %gen115 = mul i32 %_114, 1719147282
  %_116 = sub i32 %324, 1719147282
  %gen117 = mul i32 %_116, 1719147282
  %_118 = shl i32 %324, 1719147282
  %325 = sub i32 %324, 1719147282
  %_119 = sub i32 0, %325
  %gen120 = add i32 %_119, 1
  %_121 = shl i32 %325, 1
  %_122 = shl i32 %325, 1
  %_123 = sub i32 0, %325
  %gen124 = add i32 %_123, 1
  %_125 = sub i32 0, %325
  %gen126 = add i32 %_125, 1
  %_127 = sub i32 %325, 1
  %gen128 = mul i32 %_127, 1
  %_129 = sub i32 %325, 1
  %gen130 = mul i32 %_129, 1
  %_131 = sub i32 %325, 1
  %gen132 = mul i32 %_131, 1
  %326 = add i32 %325, 1
  %_133 = shl i32 %326, 1719147282
  %_134 = sub i32 %326, 1719147282
  %gen135 = mul i32 %_134, 1719147282
  %327 = add i32 %326, 1719147282
  %_136 = shl i32 %324, 1
  %_137 = sub i32 %324, 1
  %gen138 = mul i32 %_137, 1
  %328 = add nsw i32 %324, 1
  store i32 %327, ptr %9, align 4
  store i32 480796586, ptr %switchVar, align 4
  br label %originalBB89

originalBB142alteredBB:                           ; preds = %originalBB142.split.split, %.split165.split
  %329 = load i32, ptr %3, align 4
  br label %originalBB142alteredBB.split

originalBB142alteredBB.split:                     ; preds = %originalBB142alteredBB
  br label %originalBB142
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
