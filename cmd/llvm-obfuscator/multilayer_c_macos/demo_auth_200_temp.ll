; ModuleID = '/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/multilayer_c_macos/demo_auth_200_string_encrypted.c'
source_filename = "/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/multilayer_c_macos/demo_auth_200_string_encrypted.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
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

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @_init_encrypted_strings() #0 {
  %1 = alloca [21 x i8], align 1
  %2 = alloca [29 x i8], align 1
  %3 = alloca [41 x i8], align 1
  %4 = alloca [63 x i8], align 1
  %5 = alloca [29 x i8], align 1
  %6 = alloca [29 x i8], align 1
  %7 = alloca [32 x i8], align 1
  %8 = alloca [26 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @constinit, i64 21, i1 false)
  %9 = getelementptr inbounds [21 x i8], ptr %1, i64 0, i64 0
  %10 = call ptr @_xor_decrypt(ptr noundef %9, i32 noundef 21, i8 noundef zeroext -97)
  store ptr %10, ptr @MASTER_PASSWORD, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @constinit.1, i64 29, i1 false)
  %11 = getelementptr inbounds [29 x i8], ptr %2, i64 0, i64 0
  %12 = call ptr @_xor_decrypt(ptr noundef %11, i32 noundef 29, i8 noundef zeroext -19)
  store ptr %12, ptr @API_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @constinit.2, i64 41, i1 false)
  %13 = getelementptr inbounds [41 x i8], ptr %3, i64 0, i64 0
  %14 = call ptr @_xor_decrypt(ptr noundef %13, i32 noundef 41, i8 noundef zeroext -119)
  store ptr %14, ptr @JWT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %4, ptr align 1 @constinit.3, i64 63, i1 false)
  %15 = getelementptr inbounds [63 x i8], ptr %4, i64 0, i64 0
  %16 = call ptr @_xor_decrypt(ptr noundef %15, i32 noundef 63, i8 noundef zeroext -74)
  store ptr %16, ptr @DB_CONNECTION_STRING, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %5, ptr align 1 @constinit.4, i64 29, i1 false)
  %17 = getelementptr inbounds [29 x i8], ptr %5, i64 0, i64 0
  %18 = call ptr @_xor_decrypt(ptr noundef %17, i32 noundef 29, i8 noundef zeroext 94)
  store ptr %18, ptr @ENCRYPTION_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %6, ptr align 1 @constinit.5, i64 29, i1 false)
  %19 = getelementptr inbounds [29 x i8], ptr %6, i64 0, i64 0
  %20 = call ptr @_xor_decrypt(ptr noundef %19, i32 noundef 29, i8 noundef zeroext -109)
  store ptr %20, ptr @OAUTH_CLIENT_SECRET, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %7, ptr align 1 @constinit.6, i64 32, i1 false)
  %21 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0
  %22 = call ptr @_xor_decrypt(ptr noundef %21, i32 noundef 32, i8 noundef zeroext -106)
  store ptr %22, ptr @LICENSE_KEY, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %8, ptr align 1 @constinit.7, i64 26, i1 false)
  %23 = getelementptr inbounds [26 x i8], ptr %8, i64 0, i64 0
  %24 = call ptr @_xor_decrypt(ptr noundef %23, i32 noundef 26, i8 noundef zeroext -68)
  store ptr %24, ptr @BACKUP_ADMIN_PASSWORD, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @_xor_decrypt(ptr noundef %0, i32 noundef %1, i8 noundef zeroext %2) #0 {
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
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = call ptr @malloc(i64 noundef %12) #6
  store ptr %13, ptr %8, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %17, label %16

16:                                               ; preds = %3
  store ptr null, ptr %4, align 8
  br label %46

17:                                               ; preds = %3
  store i32 0, ptr %9, align 4
  br label %18

18:                                               ; preds = %37, %17
  %19 = load i32, ptr %9, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %40

22:                                               ; preds = %18
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = zext i8 %27 to i32
  %29 = load i8, ptr %7, align 1
  %30 = zext i8 %29 to i32
  %31 = xor i32 %28, %30
  %32 = trunc i32 %31 to i8
  %33 = load ptr, ptr %8, align 8
  %34 = load i32, ptr %9, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, ptr %33, i64 %35
  store i8 %32, ptr %36, align 1
  br label %37

37:                                               ; preds = %22
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %9, align 4
  br label %18, !llvm.loop !6

40:                                               ; preds = %18
  %41 = load ptr, ptr %8, align 8
  %42 = load i32, ptr %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, ptr %41, i64 %43
  store i8 0, ptr %44, align 1
  %45 = load ptr, ptr %8, align 8
  store ptr %45, ptr %4, align 8
  br label %46

46:                                               ; preds = %40, %16
  %47 = load ptr, ptr %4, align 8
  ret ptr %47
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

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
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %9, %2
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  store i32 0, ptr %3, align 4
  br label %61

14:                                               ; preds = %9
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %55, %14
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr @v_fbc01149fda7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %58

19:                                               ; preds = %15
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.User, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds [64 x i8], ptr %23, i64 0, i64 0
  %25 = load ptr, ptr %4, align 8
  %26 = call i32 @strcmp(ptr noundef %24, ptr noundef %25) #7
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %54

28:                                               ; preds = %19
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.User, ptr %31, i32 0, i32 1
  %33 = getelementptr inbounds [64 x i8], ptr %32, i64 0, i64 0
  %34 = load ptr, ptr %5, align 8
  %35 = call i32 @strcmp(ptr noundef %33, ptr noundef %34) #7
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %54

37:                                               ; preds = %28
  %38 = load ptr, ptr %4, align 8
  %39 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef %38, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  %40 = call i64 @time(ptr noundef null)
  store i64 %40, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 2), align 8
  %41 = load ptr, ptr %4, align 8
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %41)
  %43 = load i32, ptr %6, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.User, ptr %45, i32 0, i32 2
  %47 = getelementptr inbounds [64 x i8], ptr %46, i64 0, i64 0
  %48 = load i32, ptr %6, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %49
  %51 = getelementptr inbounds %struct.User, ptr %50, i32 0, i32 3
  %52 = load i32, ptr %51, align 4
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %47, i32 noundef %52)
  store i32 1, ptr %3, align 4
  br label %61

54:                                               ; preds = %28, %19
  br label %55

55:                                               ; preds = %54
  %56 = load i32, ptr %6, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %6, align 4
  br label %15, !llvm.loop !8

58:                                               ; preds = %15
  %59 = load ptr, ptr %4, align 8
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %59)
  store i32 0, ptr %3, align 4
  br label %61

61:                                               ; preds = %58, %37, %12
  %62 = load i32, ptr %3, align 4
  ret i32 %62
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @strcmp(ptr noundef, ptr noundef) #2

declare i64 @time(ptr noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_3ff16c1a3ff2(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %16

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr @API_KEY, align 8
  %10 = call i32 @strcmp(ptr noundef %8, ptr noundef %9) #7
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %7
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 1, ptr %2, align 4
  br label %16

14:                                               ; preds = %7
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  store i32 0, ptr %2, align 4
  br label %16

16:                                               ; preds = %14, %12, %6
  %17 = load i32, ptr %2, align 4
  ret i32 %17
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
  %10 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %5, i64 noundef 128, i32 noundef 0, i64 noundef %7, ptr noundef @.str.17, ptr noundef %8, ptr noundef %9)
  %11 = load ptr, ptr %4, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %11)
  ret void
}

declare i32 @__snprintf_chk(ptr noundef, i64 noundef, i32 noundef, i64 noundef, ptr noundef, ...) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_9f5974383c59(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %16

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr @JWT_SECRET, align 8
  %10 = call ptr @strstr(ptr noundef %8, ptr noundef %9) #7
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %7
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  store i32 1, ptr %2, align 4
  br label %16

14:                                               ; preds = %7
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  store i32 0, ptr %2, align 4
  br label %16

16:                                               ; preds = %14, %12, %6
  %17 = load i32, ptr %2, align 4
  ret i32 %17
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
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %46, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr @v_fbc01149fda7, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %49

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.User, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [64 x i8], ptr %15, i64 0, i64 0
  %17 = load ptr, ptr %4, align 8
  %18 = call i32 @strcmp(ptr noundef %16, ptr noundef %17) #7
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %45

20:                                               ; preds = %11
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.User, ptr %23, i32 0, i32 3
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %5, align 4
  %27 = icmp sge i32 %25, %26
  br i1 %27, label %28, label %37

28:                                               ; preds = %20
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.User, ptr %32, i32 0, i32 3
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %5, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, ptr noundef %29, i32 noundef %34, i32 noundef %35)
  store i32 1, ptr %3, align 4
  br label %50

37:                                               ; preds = %20
  %38 = load i32, ptr %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.User, ptr %40, i32 0, i32 3
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr %5, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %42, i32 noundef %43)
  store i32 0, ptr %3, align 4
  br label %50

45:                                               ; preds = %11
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %6, align 4
  br label %7, !llvm.loop !9

49:                                               ; preds = %7
  store i32 0, ptr %3, align 4
  br label %50

50:                                               ; preds = %49, %37, %28
  %51 = load i32, ptr %3, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_420e96d771d4() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  %2 = load ptr, ptr @DB_CONNECTION_STRING, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, ptr noundef %2)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_f707f7349698(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i64 @llvm.objectsize.i64.p0(ptr %6, i1 false, i1 true, i1 false)
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr @ENCRYPTION_KEY, align 8
  %10 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %5, i64 noundef 256, i32 noundef 0, i64 noundef %7, ptr noundef @.str.26, ptr noundef %8, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_1a2ef98af176(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = load ptr, ptr %5, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %8, %2
  store i32 0, ptr %3, align 4
  br label %21

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr @OAUTH_CLIENT_SECRET, align 8
  %15 = call i32 @strcmp(ptr noundef %13, ptr noundef %14) #7
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %12
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  store i32 1, ptr %3, align 4
  br label %21

19:                                               ; preds = %12
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  store i32 0, ptr %3, align 4
  br label %21

21:                                               ; preds = %19, %17, %11
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_fcae2dd27871(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %8, label %6

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  store i32 0, ptr %2, align 4
  br label %17

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr @LICENSE_KEY, align 8
  %11 = call i32 @strcmp(ptr noundef %9, ptr noundef %10) #7
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  store i32 1, ptr %2, align 4
  br label %17

15:                                               ; preds = %8
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  store i32 0, ptr %2, align 4
  br label %17

17:                                               ; preds = %15, %13, %6
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_799bf1b7712b(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %17

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr @BACKUP_ADMIN_PASSWORD, align 8
  %10 = call i32 @strcmp(ptr noundef %8, ptr noundef %9) #7
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %7
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %14 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef @.str.34, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  store i32 1, ptr %2, align 4
  br label %17

15:                                               ; preds = %7
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  store i32 0, ptr %2, align 4
  br label %17

17:                                               ; preds = %15, %12, %6
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
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
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @f_0c7992b3d2d2()
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 3
  br i1 %15, label %16, label %25

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 0
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.40, ptr noundef %19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.42)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  store i32 1, ptr %3, align 4
  br label %129

25:                                               ; preds = %2
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 1
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds ptr, ptr %29, i64 2
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = call i32 @f_0a9fc93cc940(ptr noundef %32, ptr noundef %33)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %38, label %36

36:                                               ; preds = %25
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.45)
  store i32 1, ptr %3, align 4
  br label %129

38:                                               ; preds = %25
  %39 = getelementptr inbounds [128 x i8], ptr %8, i64 0, i64 0
  %40 = load ptr, ptr %6, align 8
  call void @f_12f52c0c0856(ptr noundef %39, ptr noundef %40)
  %41 = getelementptr inbounds [128 x i8], ptr %8, i64 0, i64 0
  %42 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1), ptr noundef %41, i64 noundef 128) #7
  %43 = load ptr, ptr %6, align 8
  %44 = call i32 @f_34ede220d91a(ptr noundef %43, i32 noundef 3)
  call void @f_420e96d771d4()
  store i32 3, ptr %9, align 4
  br label %45

45:                                               ; preds = %121, %38
  %46 = load i32, ptr %9, align 4
  %47 = load i32, ptr %4, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %124

49:                                               ; preds = %45
  %50 = load ptr, ptr %5, align 8
  %51 = load i32, ptr %9, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds ptr, ptr %50, i64 %52
  %54 = load ptr, ptr %53, align 8
  %55 = call i32 @strcmp(ptr noundef %54, ptr noundef @.str.46) #7
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %72

57:                                               ; preds = %49
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %58, 1
  %60 = load i32, ptr %4, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %72

62:                                               ; preds = %57
  %63 = load ptr, ptr %5, align 8
  %64 = load i32, ptr %9, align 4
  %65 = add nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds ptr, ptr %63, i64 %66
  %68 = load ptr, ptr %67, align 8
  %69 = call i32 @f_3ff16c1a3ff2(ptr noundef %68)
  %70 = load i32, ptr %9, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %9, align 4
  br label %120

72:                                               ; preds = %57, %49
  %73 = load ptr, ptr %5, align 8
  %74 = load i32, ptr %9, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds ptr, ptr %73, i64 %75
  %77 = load ptr, ptr %76, align 8
  %78 = call i32 @strcmp(ptr noundef %77, ptr noundef @.str.47) #7
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %95

80:                                               ; preds = %72
  %81 = load i32, ptr %9, align 4
  %82 = add nsw i32 %81, 1
  %83 = load i32, ptr %4, align 4
  %84 = icmp slt i32 %82, %83
  br i1 %84, label %85, label %95

85:                                               ; preds = %80
  %86 = load ptr, ptr %5, align 8
  %87 = load i32, ptr %9, align 4
  %88 = add nsw i32 %87, 1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds ptr, ptr %86, i64 %89
  %91 = load ptr, ptr %90, align 8
  %92 = call i32 @f_fcae2dd27871(ptr noundef %91)
  %93 = load i32, ptr %9, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %9, align 4
  br label %119

95:                                               ; preds = %80, %72
  %96 = load ptr, ptr %5, align 8
  %97 = load i32, ptr %9, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds ptr, ptr %96, i64 %98
  %100 = load ptr, ptr %99, align 8
  %101 = call i32 @strcmp(ptr noundef %100, ptr noundef @.str.48) #7
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %118

103:                                              ; preds = %95
  %104 = load i32, ptr %9, align 4
  %105 = add nsw i32 %104, 1
  %106 = load i32, ptr %4, align 4
  %107 = icmp slt i32 %105, %106
  br i1 %107, label %108, label %118

108:                                              ; preds = %103
  %109 = load ptr, ptr %5, align 8
  %110 = load i32, ptr %9, align 4
  %111 = add nsw i32 %110, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds ptr, ptr %109, i64 %112
  %114 = load ptr, ptr %113, align 8
  %115 = call i32 @f_799bf1b7712b(ptr noundef %114)
  %116 = load i32, ptr %9, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %9, align 4
  br label %118

118:                                              ; preds = %108, %103, %95
  br label %119

119:                                              ; preds = %118, %85
  br label %120

120:                                              ; preds = %119, %62
  br label %121

121:                                              ; preds = %120
  %122 = load i32, ptr %9, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %9, align 4
  br label %45, !llvm.loop !10

124:                                              ; preds = %45
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.49)
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str.50)
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.51, ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1))
  %128 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  store i32 0, ptr %3, align 4
  br label %129

129:                                              ; preds = %124, %36, %16
  %130 = load i32, ptr %3, align 4
  ret i32 %130
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
