; ModuleID = 'demo_auth_200_obfuscated.bc'
source_filename = "/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/test_complete/c_macos/demo_auth_200_string_encrypted.c"
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
  %1 = alloca [21 x i8], align 1
  %2 = alloca [29 x i8], align 1
  %3 = alloca [41 x i8], align 1
  %4 = alloca [63 x i8], align 1
  %5 = alloca [29 x i8], align 1
  %6 = alloca [29 x i8], align 1
  %7 = alloca [32 x i8], align 1
  %8 = alloca [26 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @constinit, i64 21, i1 false)
  br label %.split

.split:                                           ; preds = %0
  %9 = getelementptr inbounds [21 x i8], ptr %1, i64 0, i64 0
  %10 = call ptr @_xor_decrypt(ptr noundef %9, i32 noundef 21, i8 noundef zeroext -97)
  br label %.split.split

.split.split:                                     ; preds = %.split
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
  %.reg2mem = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  br label %.split

.split:                                           ; preds = %3
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i8 %2, ptr %7, align 1
  %10 = load i32, ptr %6, align 4
  %11 = add i32 %10, -1744158406
  %12 = add i32 %11, 1
  %13 = sub i32 %12, -1744158406
  %14 = add nsw i32 %10, 1
  br label %.split.split

.split.split:                                     ; preds = %.split
  %15 = sext i32 %13 to i64
  %16 = call ptr @malloc(i64 noundef %15) #6
  store ptr %16, ptr %8, align 8
  %17 = load ptr, ptr %8, align 8
  %18 = icmp ne ptr %17, null
  store i1 %18, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 810004953, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 810004953, label %first
    i32 1773363885, label %36
    i32 1407282240, label %53
    i32 -1631334820, label %70
    i32 -1581950988, label %91
    i32 417613441, label %116
    i32 -730197196, label %121
    i32 1614649557, label %127
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %19 = load i32, ptr @x.1, align 4
  br label %first.split

first.split:                                      ; preds = %first
  %20 = load i32, ptr @y.2, align 4
  %21 = sub i32 %19, 1
  %22 = mul i32 %19, %21
  %23 = urem i32 %22, 2
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  %24 = icmp eq i32 %23, 0
  %25 = icmp slt i32 %20, 10
  %26 = or i1 %24, %25
  br i1 %26, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %first.split.split, %originalBBalteredBB.split.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %27 = select i1 %.reload, i32 1407282240, i32 1773363885
  store i32 %27, ptr %switchVar, align 4
  %28 = load i32, ptr @x.1, align 4
  %29 = load i32, ptr @y.2, align 4
  %30 = sub i32 %28, 1
  %31 = mul i32 %28, %30
  %32 = urem i32 %31, 2
  %33 = icmp eq i32 %32, 0
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %34 = icmp slt i32 %29, 10
  %35 = or i1 %33, %34
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %35, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

36:                                               ; preds = %loopEntry.split
  %37 = load i32, ptr @x.1, align 4
  %38 = load i32, ptr @y.2, align 4
  %39 = sub i32 %37, 1
  %40 = mul i32 %37, %39
  br label %.split18

.split18:                                         ; preds = %36
  %41 = urem i32 %40, 2
  %42 = icmp eq i32 %41, 0
  %43 = icmp slt i32 %38, 10
  %44 = or i1 %42, %43
  br label %.split18.split

.split18.split:                                   ; preds = %.split18
  br i1 %44, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split18.split, %originalBB2alteredBB.split.split
  store ptr null, ptr %4, align 8
  store i32 1614649557, ptr %switchVar, align 4
  %45 = load i32, ptr @x.1, align 4
  %46 = load i32, ptr @y.2, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %47 = sub i32 %45, 1
  %48 = mul i32 %45, %47
  %49 = urem i32 %48, 2
  %50 = icmp eq i32 %49, 0
  %51 = icmp slt i32 %46, 10
  %52 = or i1 %50, %51
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %52, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

53:                                               ; preds = %loopEntry.split
  %54 = load i32, ptr @x.1, align 4
  %55 = load i32, ptr @y.2, align 4
  %56 = sub i32 %54, 1
  br label %.split19

.split19:                                         ; preds = %53
  %57 = mul i32 %54, %56
  %58 = urem i32 %57, 2
  %59 = icmp eq i32 %58, 0
  br label %.split19.split

.split19.split:                                   ; preds = %.split19
  %60 = icmp slt i32 %55, 10
  %61 = or i1 %59, %60
  br i1 %61, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split19.split, %originalBB6alteredBB.split.split
  store i32 0, ptr %9, align 4
  store i32 -1631334820, ptr %switchVar, align 4
  %62 = load i32, ptr @x.1, align 4
  %63 = load i32, ptr @y.2, align 4
  %64 = sub i32 %62, 1
  %65 = mul i32 %62, %64
  %66 = urem i32 %65, 2
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %67 = icmp eq i32 %66, 0
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %68 = icmp slt i32 %63, 10
  %69 = or i1 %67, %68
  br i1 %69, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

70:                                               ; preds = %loopEntry.split
  %71 = load i32, ptr @x.1, align 4
  %72 = load i32, ptr @y.2, align 4
  br label %.split20

.split20:                                         ; preds = %70
  %73 = sub i32 %71, 1
  %74 = mul i32 %71, %73
  %75 = urem i32 %74, 2
  %76 = icmp eq i32 %75, 0
  %77 = icmp slt i32 %72, 10
  %78 = or i1 %76, %77
  br label %.split20.split

.split20.split:                                   ; preds = %.split20
  br i1 %78, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split20.split, %originalBB10alteredBB.split.split
  %79 = load i32, ptr %9, align 4
  %80 = load i32, ptr %6, align 4
  %81 = icmp slt i32 %79, %80
  %82 = select i1 %81, i32 -1581950988, i32 -730197196
  store i32 %82, ptr %switchVar, align 4
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %83 = load i32, ptr @x.1, align 4
  %84 = load i32, ptr @y.2, align 4
  %85 = sub i32 %83, 1
  %86 = mul i32 %83, %85
  %87 = urem i32 %86, 2
  %88 = icmp eq i32 %87, 0
  %89 = icmp slt i32 %84, 10
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %90 = or i1 %88, %89
  br i1 %90, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

91:                                               ; preds = %loopEntry.split
  %92 = load ptr, ptr %5, align 8
  %93 = load i32, ptr %9, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, ptr %92, i64 %94
  %96 = load i8, ptr %95, align 1
  %97 = zext i8 %96 to i32
  %98 = load i8, ptr %7, align 1
  %99 = zext i8 %98 to i32
  %100 = xor i32 %97, -1
  %101 = and i32 34760790, %100
  %102 = xor i32 34760790, -1
  %103 = and i32 %97, %102
  %104 = xor i32 %99, -1
  %105 = and i32 %104, 34760790
  %106 = and i32 %99, %102
  %107 = or i32 %101, %103
  %108 = or i32 %105, %106
  %109 = xor i32 %107, %108
  %110 = xor i32 %97, %99
  %111 = trunc i32 %109 to i8
  %112 = load ptr, ptr %8, align 8
  br label %.split21

.split21:                                         ; preds = %91
  %113 = load i32, ptr %9, align 4
  %114 = sext i32 %113 to i64
  br label %.split21.split

.split21.split:                                   ; preds = %.split21
  %115 = getelementptr inbounds i8, ptr %112, i64 %114
  store i8 %111, ptr %115, align 1
  store i32 417613441, ptr %switchVar, align 4
  br label %loopEnd

116:                                              ; preds = %loopEntry.split
  %117 = load i32, ptr %9, align 4
  %118 = sub i32 0, 1
  %119 = sub i32 %117, %118
  %120 = add nsw i32 %117, 1
  br label %.split22

.split22:                                         ; preds = %116
  store i32 %119, ptr %9, align 4
  store i32 -1631334820, ptr %switchVar, align 4
  br label %.split22.split

.split22.split:                                   ; preds = %.split22
  br label %loopEnd

121:                                              ; preds = %loopEntry.split
  %122 = load ptr, ptr %8, align 8
  %123 = load i32, ptr %6, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8, ptr %122, i64 %124
  store i8 0, ptr %125, align 1
  %126 = load ptr, ptr %8, align 8
  store ptr %126, ptr %4, align 8
  br label %.split23

.split23:                                         ; preds = %121
  store i32 1614649557, ptr %switchVar, align 4
  br label %.split23.split

.split23.split:                                   ; preds = %.split23
  br label %loopEnd

127:                                              ; preds = %loopEntry.split
  %128 = load i32, ptr @x.1, align 4
  br label %.split24

.split24:                                         ; preds = %127
  %129 = load i32, ptr @y.2, align 4
  %130 = sub i32 %128, 1
  br label %.split24.split

.split24.split:                                   ; preds = %.split24
  %131 = mul i32 %128, %130
  %132 = urem i32 %131, 2
  %133 = icmp eq i32 %132, 0
  %134 = icmp slt i32 %129, 10
  %135 = or i1 %133, %134
  br i1 %135, label %originalBB14, label %originalBB14alteredBB

originalBB14:                                     ; preds = %.split24.split, %originalBB14alteredBB.split
  %136 = load ptr, ptr %4, align 8
  %137 = load i32, ptr @x.1, align 4
  %138 = load i32, ptr @y.2, align 4
  br label %originalBB14.split

originalBB14.split:                               ; preds = %originalBB14
  %139 = sub i32 %137, 1
  %140 = mul i32 %137, %139
  %141 = urem i32 %140, 2
  %142 = icmp eq i32 %141, 0
  %143 = icmp slt i32 %138, 10
  %144 = or i1 %142, %143
  br label %originalBB14.split.split

originalBB14.split.split:                         ; preds = %originalBB14.split
  br i1 %144, label %originalBBpart216, label %originalBB14alteredBB

originalBBpart216:                                ; preds = %originalBB14.split.split
  ret ptr %136

loopEnd:                                          ; preds = %.split23.split, %.split22.split, %.split21.split, %originalBBpart212, %originalBBpart28, %originalBBpart24, %originalBBpart2, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %first.split.split
  %.reloadalteredBB = load i1, ptr %.reg2mem, align 1
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %145 = select i1 %.reloadalteredBB, i32 1407282240, i32 1773363885
  store i32 %145, ptr %switchVar, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split18.split
  store ptr null, ptr %4, align 8
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 1614649557, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split19.split
  store i32 0, ptr %9, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  store i32 -1631334820, ptr %switchVar, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split20.split
  %146 = load i32, ptr %9, align 4
  %147 = load i32, ptr %6, align 4
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  %148 = icmp slt i32 %146, %147
  %149 = select i1 %148, i32 -1581950988, i32 -730197196
  store i32 %149, ptr %switchVar, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  br label %originalBB10

originalBB14alteredBB:                            ; preds = %originalBB14.split.split, %.split24.split
  %150 = load ptr, ptr %4, align 8
  br label %originalBB14alteredBB.split

originalBB14alteredBB.split:                      ; preds = %originalBB14alteredBB
  br label %originalBB14
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
  br label %.split

.split:                                           ; preds = %0
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
  br label %.split.split

.split.split:                                     ; preds = %.split
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
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  br label %.split

.split:                                           ; preds = %2
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  br label %.split.split

.split.split:                                     ; preds = %.split
  %8 = icmp ne ptr %7, null
  store i1 %8, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -1603463812, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -1603463812, label %first
    i32 -1922148634, label %26
    i32 1281165337, label %30
    i32 -1646818857, label %48
    i32 -486523331, label %65
    i32 1027914663, label %86
    i32 -295702646, label %96
    i32 1893030006, label %106
    i32 -1105976461, label %139
    i32 -1564189858, label %140
    i32 1439652841, label %146
    i32 -1110950282, label %149
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %9 = load i32, ptr @x.5, align 4
  %10 = load i32, ptr @y.6, align 4
  br label %first.split

first.split:                                      ; preds = %first
  %11 = sub i32 %9, 1
  %12 = mul i32 %9, %11
  %13 = urem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  %15 = icmp slt i32 %10, 10
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  %16 = or i1 %14, %15
  br i1 %16, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %first.split.split, %originalBBalteredBB.split.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %17 = select i1 %.reload, i32 -1922148634, i32 1281165337
  store i32 %17, ptr %switchVar, align 4
  %18 = load i32, ptr @x.5, align 4
  %19 = load i32, ptr @y.6, align 4
  %20 = sub i32 %18, 1
  %21 = mul i32 %18, %20
  %22 = urem i32 %21, 2
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %23 = icmp eq i32 %22, 0
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %24 = icmp slt i32 %19, 10
  %25 = or i1 %23, %24
  br i1 %25, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

26:                                               ; preds = %loopEntry.split
  %27 = load ptr, ptr %5, align 8
  %28 = icmp ne ptr %27, null
  %29 = select i1 %28, i32 -1646818857, i32 1281165337
  br label %.split22

.split22:                                         ; preds = %26
  store i32 %29, ptr %switchVar, align 4
  br label %.split22.split

.split22.split:                                   ; preds = %.split22
  br label %loopEnd

30:                                               ; preds = %loopEntry.split
  %31 = load i32, ptr @x.5, align 4
  %32 = load i32, ptr @y.6, align 4
  %33 = sub i32 %31, 1
  br label %.split23

.split23:                                         ; preds = %30
  %34 = mul i32 %31, %33
  %35 = urem i32 %34, 2
  %36 = icmp eq i32 %35, 0
  %37 = icmp slt i32 %32, 10
  %38 = or i1 %36, %37
  br label %.split23.split

.split23.split:                                   ; preds = %.split23
  br i1 %38, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split23.split, %originalBB2alteredBB.split.split
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  store i32 0, ptr %3, align 4
  store i32 -1110950282, ptr %switchVar, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %40 = load i32, ptr @x.5, align 4
  %41 = load i32, ptr @y.6, align 4
  %42 = sub i32 %40, 1
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %43 = mul i32 %40, %42
  %44 = urem i32 %43, 2
  %45 = icmp eq i32 %44, 0
  %46 = icmp slt i32 %41, 10
  %47 = or i1 %45, %46
  br i1 %47, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

48:                                               ; preds = %loopEntry.split
  %49 = load i32, ptr @x.5, align 4
  %50 = load i32, ptr @y.6, align 4
  %51 = sub i32 %49, 1
  br label %.split24

.split24:                                         ; preds = %48
  %52 = mul i32 %49, %51
  br label %.split24.split

.split24.split:                                   ; preds = %.split24
  %53 = urem i32 %52, 2
  %54 = icmp eq i32 %53, 0
  %55 = icmp slt i32 %50, 10
  %56 = or i1 %54, %55
  br i1 %56, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split24.split, %originalBB6alteredBB.split.split
  store i32 0, ptr %6, align 4
  store i32 -486523331, ptr %switchVar, align 4
  %57 = load i32, ptr @x.5, align 4
  %58 = load i32, ptr @y.6, align 4
  %59 = sub i32 %57, 1
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %60 = mul i32 %57, %59
  %61 = urem i32 %60, 2
  %62 = icmp eq i32 %61, 0
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %63 = icmp slt i32 %58, 10
  %64 = or i1 %62, %63
  br i1 %64, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

65:                                               ; preds = %loopEntry.split
  %66 = load i32, ptr @x.5, align 4
  %67 = load i32, ptr @y.6, align 4
  br label %.split25

.split25:                                         ; preds = %65
  %68 = sub i32 %66, 1
  %69 = mul i32 %66, %68
  %70 = urem i32 %69, 2
  %71 = icmp eq i32 %70, 0
  br label %.split25.split

.split25.split:                                   ; preds = %.split25
  %72 = icmp slt i32 %67, 10
  %73 = or i1 %71, %72
  br i1 %73, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split25.split, %originalBB10alteredBB.split.split
  %74 = load i32, ptr %6, align 4
  %75 = load i32, ptr @v_fbc01149fda7, align 4
  %76 = icmp slt i32 %74, %75
  %77 = select i1 %76, i32 1027914663, i32 1439652841
  store i32 %77, ptr %switchVar, align 4
  %78 = load i32, ptr @x.5, align 4
  %79 = load i32, ptr @y.6, align 4
  %80 = sub i32 %78, 1
  %81 = mul i32 %78, %80
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %82 = urem i32 %81, 2
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %83 = icmp eq i32 %82, 0
  %84 = icmp slt i32 %79, 10
  %85 = or i1 %83, %84
  br i1 %85, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

86:                                               ; preds = %loopEntry.split
  %87 = load i32, ptr %6, align 4
  %88 = sext i32 %87 to i64
  br label %.split26

.split26:                                         ; preds = %86
  %89 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %88
  %90 = getelementptr inbounds %struct.User, ptr %89, i32 0, i32 0
  %91 = getelementptr inbounds [64 x i8], ptr %90, i64 0, i64 0
  br label %.split26.split

.split26.split:                                   ; preds = %.split26
  %92 = load ptr, ptr %4, align 8
  %93 = call i32 @strcmp(ptr noundef %91, ptr noundef %92) #7
  %94 = icmp eq i32 %93, 0
  %95 = select i1 %94, i32 -295702646, i32 -1105976461
  store i32 %95, ptr %switchVar, align 4
  br label %loopEnd

96:                                               ; preds = %loopEntry.split
  %97 = load i32, ptr %6, align 4
  br label %.split27

.split27:                                         ; preds = %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.User, ptr %99, i32 0, i32 1
  %101 = getelementptr inbounds [64 x i8], ptr %100, i64 0, i64 0
  %102 = load ptr, ptr %5, align 8
  br label %.split27.split

.split27.split:                                   ; preds = %.split27
  %103 = call i32 @strcmp(ptr noundef %101, ptr noundef %102) #7
  %104 = icmp eq i32 %103, 0
  %105 = select i1 %104, i32 1893030006, i32 -1105976461
  store i32 %105, ptr %switchVar, align 4
  br label %loopEnd

106:                                              ; preds = %loopEntry.split
  %107 = load i32, ptr @x.5, align 4
  br label %.split28

.split28:                                         ; preds = %106
  %108 = load i32, ptr @y.6, align 4
  %109 = sub i32 %107, 1
  %110 = mul i32 %107, %109
  %111 = urem i32 %110, 2
  %112 = icmp eq i32 %111, 0
  %113 = icmp slt i32 %108, 10
  br label %.split28.split

.split28.split:                                   ; preds = %.split28
  %114 = or i1 %112, %113
  br i1 %114, label %originalBB14, label %originalBB14alteredBB

originalBB14:                                     ; preds = %.split28.split, %originalBB14alteredBB.split.split
  %115 = load ptr, ptr %4, align 8
  %116 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef %115, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  br label %originalBB14.split

originalBB14.split:                               ; preds = %originalBB14
  %117 = call i64 @time(ptr noundef null)
  store i64 %117, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 2), align 8
  %118 = load ptr, ptr %4, align 8
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %118)
  %120 = load i32, ptr %6, align 4
  br label %originalBB14.split.split

originalBB14.split.split:                         ; preds = %originalBB14.split
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.User, ptr %122, i32 0, i32 2
  %124 = getelementptr inbounds [64 x i8], ptr %123, i64 0, i64 0
  %125 = load i32, ptr %6, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %126
  %128 = getelementptr inbounds %struct.User, ptr %127, i32 0, i32 3
  %129 = load i32, ptr %128, align 4
  %130 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %124, i32 noundef %129)
  store i32 1, ptr %3, align 4
  store i32 -1110950282, ptr %switchVar, align 4
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

139:                                              ; preds = %loopEntry.split
  store i32 -1564189858, ptr %switchVar, align 4
  br label %.split29

.split29:                                         ; preds = %139
  br label %loopEnd

140:                                              ; preds = %loopEntry.split
  %141 = load i32, ptr %6, align 4
  br label %.split30

.split30:                                         ; preds = %140
  %142 = sub i32 %141, 2063983924
  %143 = add i32 %142, 1
  %144 = add i32 %143, 2063983924
  %145 = add nsw i32 %141, 1
  store i32 %144, ptr %6, align 4
  br label %.split30.split

.split30.split:                                   ; preds = %.split30
  store i32 -486523331, ptr %switchVar, align 4
  br label %loopEnd

146:                                              ; preds = %loopEntry.split
  %147 = load ptr, ptr %4, align 8
  br label %.split31

.split31:                                         ; preds = %146
  %148 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %147)
  br label %.split31.split

.split31.split:                                   ; preds = %.split31
  store i32 0, ptr %3, align 4
  store i32 -1110950282, ptr %switchVar, align 4
  br label %loopEnd

149:                                              ; preds = %loopEntry.split
  %150 = load i32, ptr @x.5, align 4
  %151 = load i32, ptr @y.6, align 4
  br label %.split32

.split32:                                         ; preds = %149
  %152 = sub i32 %150, 1
  br label %.split32.split

.split32.split:                                   ; preds = %.split32
  %153 = mul i32 %150, %152
  %154 = urem i32 %153, 2
  %155 = icmp eq i32 %154, 0
  %156 = icmp slt i32 %151, 10
  %157 = or i1 %155, %156
  br i1 %157, label %originalBB18, label %originalBB18alteredBB

originalBB18:                                     ; preds = %.split32.split, %originalBB18alteredBB.split
  %158 = load i32, ptr %3, align 4
  br label %originalBB18.split

originalBB18.split:                               ; preds = %originalBB18
  %159 = load i32, ptr @x.5, align 4
  %160 = load i32, ptr @y.6, align 4
  %161 = sub i32 %159, 1
  %162 = mul i32 %159, %161
  br label %originalBB18.split.split

originalBB18.split.split:                         ; preds = %originalBB18.split
  %163 = urem i32 %162, 2
  %164 = icmp eq i32 %163, 0
  %165 = icmp slt i32 %160, 10
  %166 = or i1 %164, %165
  br i1 %166, label %originalBBpart220, label %originalBB18alteredBB

originalBBpart220:                                ; preds = %originalBB18.split.split
  ret i32 %158

loopEnd:                                          ; preds = %.split31.split, %.split30.split, %.split29, %originalBBpart216, %.split27.split, %.split26.split, %originalBBpart212, %originalBBpart28, %originalBBpart24, %.split22.split, %originalBBpart2, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %first.split.split
  %.reloadalteredBB = load i1, ptr %.reg2mem, align 1
  %167 = select i1 %.reloadalteredBB, i32 -1922148634, i32 1281165337
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  store i32 %167, ptr %switchVar, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split23.split
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 0, ptr %3, align 4
  store i32 -1110950282, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split24.split
  store i32 0, ptr %6, align 4
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  store i32 -486523331, ptr %switchVar, align 4
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split25.split
  %169 = load i32, ptr %6, align 4
  %170 = load i32, ptr @v_fbc01149fda7, align 4
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  %171 = icmp slt i32 %169, %170
  %172 = select i1 %171, i32 1027914663, i32 1439652841
  store i32 %172, ptr %switchVar, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  br label %originalBB10

originalBB14alteredBB:                            ; preds = %originalBB14.split.split, %.split28.split
  %173 = load ptr, ptr %4, align 8
  %174 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef %173, i64 noundef 64) #7
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  %175 = call i64 @time(ptr noundef null)
  store i64 %175, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 2), align 8
  br label %originalBB14alteredBB.split

originalBB14alteredBB.split:                      ; preds = %originalBB14alteredBB
  %176 = load ptr, ptr %4, align 8
  %177 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %176)
  %178 = load i32, ptr %6, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %179
  %181 = getelementptr inbounds %struct.User, ptr %180, i32 0, i32 2
  %182 = getelementptr inbounds [64 x i8], ptr %181, i64 0, i64 0
  %183 = load i32, ptr %6, align 4
  br label %originalBB14alteredBB.split.split

originalBB14alteredBB.split.split:                ; preds = %originalBB14alteredBB.split
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %184
  %186 = getelementptr inbounds %struct.User, ptr %185, i32 0, i32 3
  %187 = load i32, ptr %186, align 4
  %188 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %182, i32 noundef %187)
  store i32 1, ptr %3, align 4
  store i32 -1110950282, ptr %switchVar, align 4
  br label %originalBB14

originalBB18alteredBB:                            ; preds = %originalBB18.split.split, %.split32.split
  %189 = load i32, ptr %3, align 4
  br label %originalBB18alteredBB.split

originalBB18alteredBB.split:                      ; preds = %originalBB18alteredBB
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
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  br label %.split

.split:                                           ; preds = %1
  %switchVar = alloca i32, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i32 21428151, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 21428151, label %first
    i32 -1192747924, label %23
    i32 1448227572, label %40
    i32 -1774985956, label %62
    i32 -499639172, label %64
    i32 818135741, label %66
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %6 = load i32, ptr @x.7, align 4
  %7 = load i32, ptr @y.8, align 4
  %8 = sub i32 %6, 1
  %9 = mul i32 %6, %8
  %10 = urem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %12 = icmp slt i32 %7, 10
  %13 = or i1 %11, %12
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  br i1 %13, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %14 = load i32, ptr @x.7, align 4
  %15 = load i32, ptr @y.8, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %16 = sub i32 %14, 1
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
  %22 = select i1 %.reload, i32 1448227572, i32 -1192747924
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %22, ptr %switchVar, align 4
  br label %loopEnd

23:                                               ; preds = %loopEntry.split
  %24 = load i32, ptr @x.7, align 4
  %25 = load i32, ptr @y.8, align 4
  %26 = sub i32 %24, 1
  br label %.split10

.split10:                                         ; preds = %23
  %27 = mul i32 %24, %26
  %28 = urem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  %30 = icmp slt i32 %25, 10
  %31 = or i1 %29, %30
  br i1 %31, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split10.split, %originalBB2alteredBB.split.split
  store i32 0, ptr %2, align 4
  store i32 818135741, ptr %switchVar, align 4
  %32 = load i32, ptr @x.7, align 4
  %33 = load i32, ptr @y.8, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %34 = sub i32 %32, 1
  %35 = mul i32 %32, %34
  %36 = urem i32 %35, 2
  %37 = icmp eq i32 %36, 0
  %38 = icmp slt i32 %33, 10
  %39 = or i1 %37, %38
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %39, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

40:                                               ; preds = %loopEntry.split
  %41 = load i32, ptr @x.7, align 4
  %42 = load i32, ptr @y.8, align 4
  %43 = sub i32 %41, 1
  %44 = mul i32 %41, %43
  br label %.split11

.split11:                                         ; preds = %40
  %45 = urem i32 %44, 2
  %46 = icmp eq i32 %45, 0
  %47 = icmp slt i32 %42, 10
  %48 = or i1 %46, %47
  br label %.split11.split

.split11.split:                                   ; preds = %.split11
  br i1 %48, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split11.split, %originalBB6alteredBB.split.split
  %49 = load ptr, ptr %3, align 8
  %50 = load ptr, ptr @API_KEY, align 8
  %51 = call i32 @strcmp(ptr noundef %49, ptr noundef %50) #7
  %52 = icmp eq i32 %51, 0
  %53 = select i1 %52, i32 -1774985956, i32 -499639172
  store i32 %53, ptr %switchVar, align 4
  %54 = load i32, ptr @x.7, align 4
  %55 = load i32, ptr @y.8, align 4
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %56 = sub i32 %54, 1
  %57 = mul i32 %54, %56
  %58 = urem i32 %57, 2
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %59 = icmp eq i32 %58, 0
  %60 = icmp slt i32 %55, 10
  %61 = or i1 %59, %60
  br i1 %61, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

62:                                               ; preds = %loopEntry.split
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %.split12

.split12:                                         ; preds = %62
  store i32 1, ptr %2, align 4
  br label %.split12.split

.split12.split:                                   ; preds = %.split12
  store i32 818135741, ptr %switchVar, align 4
  br label %loopEnd

64:                                               ; preds = %loopEntry.split
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %.split13

.split13:                                         ; preds = %64
  store i32 0, ptr %2, align 4
  store i32 818135741, ptr %switchVar, align 4
  br label %.split13.split

.split13.split:                                   ; preds = %.split13
  br label %loopEnd

66:                                               ; preds = %loopEntry.split
  %67 = load i32, ptr %2, align 4
  br label %.split14

.split14:                                         ; preds = %66
  ret i32 %67

loopEnd:                                          ; preds = %.split13.split, %.split12.split, %originalBBpart28, %originalBBpart24, %first.split.split, %originalBBpart2
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split10.split
  store i32 0, ptr %2, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 818135741, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split11.split
  %68 = load ptr, ptr %3, align 8
  %69 = load ptr, ptr @API_KEY, align 8
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %70 = call i32 @strcmp(ptr noundef %68, ptr noundef %69) #7
  %71 = icmp eq i32 %70, 0
  %72 = select i1 %71, i32 -1774985956, i32 -499639172
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  store i32 %72, ptr %switchVar, align 4
  br label %originalBB6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_12f52c0c0856(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  br label %.split

.split:                                           ; preds = %2
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i64 @llvm.objectsize.i64.p0(ptr %6, i1 false, i1 true, i1 false)
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr @JWT_SECRET, align 8
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
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -198201808, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -198201808, label %first
    i32 1020369265, label %7
    i32 -1890540318, label %8
    i32 2005839357, label %14
    i32 -952381495, label %16
    i32 -58025601, label %18
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %6 = select i1 %.reload, i32 -1890540318, i32 1020369265
  store i32 %6, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

7:                                                ; preds = %loopEntry.split
  store i32 0, ptr %2, align 4
  br label %.split2

.split2:                                          ; preds = %7
  store i32 -58025601, ptr %switchVar, align 4
  br label %.split2.split

.split2.split:                                    ; preds = %.split2
  br label %loopEnd

8:                                                ; preds = %loopEntry.split
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr @JWT_SECRET, align 8
  br label %.split3

.split3:                                          ; preds = %8
  %11 = call ptr @strstr(ptr noundef %9, ptr noundef %10) #7
  %12 = icmp ne ptr %11, null
  %13 = select i1 %12, i32 2005839357, i32 -952381495
  br label %.split3.split

.split3.split:                                    ; preds = %.split3
  store i32 %13, ptr %switchVar, align 4
  br label %loopEnd

14:                                               ; preds = %loopEntry.split
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  store i32 1, ptr %2, align 4
  br label %.split4

.split4:                                          ; preds = %14
  store i32 -58025601, ptr %switchVar, align 4
  br label %.split4.split

.split4.split:                                    ; preds = %.split4
  br label %loopEnd

16:                                               ; preds = %loopEntry.split
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  store i32 0, ptr %2, align 4
  br label %.split5

.split5:                                          ; preds = %16
  store i32 -58025601, ptr %switchVar, align 4
  br label %.split5.split

.split5.split:                                    ; preds = %.split5
  br label %loopEnd

18:                                               ; preds = %loopEntry.split
  %19 = load i32, ptr %2, align 4
  br label %.split6

.split6:                                          ; preds = %18
  ret i32 %19

loopEnd:                                          ; preds = %.split5.split, %.split4.split, %.split3.split, %.split2.split, %first.split.split, %switchDefault
  br label %loopEntry
}

; Function Attrs: nounwind
declare ptr @strstr(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_34ede220d91a(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load i32, ptr @x.13, align 4
  br label %.split

.split:                                           ; preds = %2
  %4 = load i32, ptr @y.14, align 4
  %5 = sub i32 %3, 1
  %6 = mul i32 %3, %5
  %7 = urem i32 %6, 2
  %8 = icmp eq i32 %7, 0
  %9 = icmp slt i32 %4, 10
  br label %.split.split

.split.split:                                     ; preds = %.split
  %10 = or i1 %8, %9
  br i1 %10, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %12, align 8
  store i32 %1, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %switchVar = alloca i32, align 4
  store i32 -312674859, ptr %switchVar, align 4
  %15 = load i32, ptr @x.13, align 4
  %16 = load i32, ptr @y.14, align 4
  %17 = sub i32 %15, 1
  %18 = mul i32 %15, %17
  %19 = urem i32 %18, 2
  %20 = icmp eq i32 %19, 0
  %21 = icmp slt i32 %16, 10
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %22 = or i1 %20, %21
  br i1 %22, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEntry

loopEntry:                                        ; preds = %originalBBpart2, %loopEnd
  %23 = load i32, ptr @x.13, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  %24 = load i32, ptr @y.14, align 4
  %25 = sub i32 %23, 1
  %26 = mul i32 %23, %25
  %27 = urem i32 %26, 2
  br label %loopEntry.split.split

loopEntry.split.split:                            ; preds = %loopEntry.split
  %28 = icmp eq i32 %27, 0
  %29 = icmp slt i32 %24, 10
  %30 = or i1 %28, %29
  br i1 %30, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %loopEntry.split.split, %originalBB2alteredBB.split
  %switchVar1 = load i32, ptr %switchVar, align 4
  %31 = load i32, ptr @x.13, align 4
  %32 = load i32, ptr @y.14, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %33 = sub i32 %31, 1
  %34 = mul i32 %31, %33
  %35 = urem i32 %34, 2
  %36 = icmp eq i32 %35, 0
  %37 = icmp slt i32 %32, 10
  %38 = or i1 %36, %37
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %38, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  switch i32 %switchVar1, label %switchDefault [
    i32 -312674859, label %55
    i32 -1361237258, label %60
    i32 -344846339, label %70
    i32 1509484, label %79
    i32 58385324, label %88
    i32 -935915040, label %96
    i32 -68810, label %97
    i32 516396966, label %103
    i32 -184520938, label %104
  ]

switchDefault:                                    ; preds = %originalBBpart24
  %39 = load i32, ptr @x.13, align 4
  %40 = load i32, ptr @y.14, align 4
  %41 = sub i32 %39, 1
  %42 = mul i32 %39, %41
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %43 = urem i32 %42, 2
  %44 = icmp eq i32 %43, 0
  %45 = icmp slt i32 %40, 10
  %46 = or i1 %44, %45
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  br i1 %46, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %switchDefault.split.split, %originalBB6alteredBB
  %47 = load i32, ptr @x.13, align 4
  %48 = load i32, ptr @y.14, align 4
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %49 = sub i32 %47, 1
  %50 = mul i32 %47, %49
  %51 = urem i32 %50, 2
  %52 = icmp eq i32 %51, 0
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %53 = icmp slt i32 %48, 10
  %54 = or i1 %52, %53
  br i1 %54, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

55:                                               ; preds = %originalBBpart24
  %56 = load i32, ptr %14, align 4
  %57 = load i32, ptr @v_fbc01149fda7, align 4
  br label %.split10

.split10:                                         ; preds = %55
  %58 = icmp slt i32 %56, %57
  %59 = select i1 %58, i32 -1361237258, i32 516396966
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  store i32 %59, ptr %switchVar, align 4
  br label %loopEnd

60:                                               ; preds = %originalBBpart24
  %61 = load i32, ptr %14, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %62
  br label %.split11

.split11:                                         ; preds = %60
  %64 = getelementptr inbounds %struct.User, ptr %63, i32 0, i32 0
  %65 = getelementptr inbounds [64 x i8], ptr %64, i64 0, i64 0
  %66 = load ptr, ptr %12, align 8
  %67 = call i32 @strcmp(ptr noundef %65, ptr noundef %66) #7
  br label %.split11.split

.split11.split:                                   ; preds = %.split11
  %68 = icmp eq i32 %67, 0
  %69 = select i1 %68, i32 -344846339, i32 -935915040
  store i32 %69, ptr %switchVar, align 4
  br label %loopEnd

70:                                               ; preds = %originalBBpart24
  %71 = load i32, ptr %14, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %72
  %74 = getelementptr inbounds %struct.User, ptr %73, i32 0, i32 3
  %75 = load i32, ptr %74, align 4
  %76 = load i32, ptr %13, align 4
  %77 = icmp sge i32 %75, %76
  %78 = select i1 %77, i32 1509484, i32 58385324
  br label %.split12

.split12:                                         ; preds = %70
  store i32 %78, ptr %switchVar, align 4
  br label %.split12.split

.split12.split:                                   ; preds = %.split12
  br label %loopEnd

79:                                               ; preds = %originalBBpart24
  %80 = load ptr, ptr %12, align 8
  %81 = load i32, ptr %14, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.User, ptr %83, i32 0, i32 3
  %85 = load i32, ptr %84, align 4
  %86 = load i32, ptr %13, align 4
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, ptr noundef %80, i32 noundef %85, i32 noundef %86)
  br label %.split13

.split13:                                         ; preds = %79
  store i32 1, ptr %11, align 4
  br label %.split13.split

.split13.split:                                   ; preds = %.split13
  store i32 -184520938, ptr %switchVar, align 4
  br label %loopEnd

88:                                               ; preds = %originalBBpart24
  %89 = load i32, ptr %14, align 4
  %90 = sext i32 %89 to i64
  br label %.split14

.split14:                                         ; preds = %88
  %91 = getelementptr inbounds [5 x %struct.User], ptr @users, i64 0, i64 %90
  %92 = getelementptr inbounds %struct.User, ptr %91, i32 0, i32 3
  %93 = load i32, ptr %92, align 4
  %94 = load i32, ptr %13, align 4
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %93, i32 noundef %94)
  store i32 0, ptr %11, align 4
  store i32 -184520938, ptr %switchVar, align 4
  br label %loopEnd

96:                                               ; preds = %originalBBpart24
  store i32 -68810, ptr %switchVar, align 4
  br label %.split15

.split15:                                         ; preds = %96
  br label %loopEnd

97:                                               ; preds = %originalBBpart24
  %98 = load i32, ptr %14, align 4
  br label %.split16

.split16:                                         ; preds = %97
  %99 = sub i32 %98, -624720056
  %100 = add i32 %99, 1
  %101 = add i32 %100, -624720056
  br label %.split16.split

.split16.split:                                   ; preds = %.split16
  %102 = add nsw i32 %98, 1
  store i32 %101, ptr %14, align 4
  store i32 -312674859, ptr %switchVar, align 4
  br label %loopEnd

103:                                              ; preds = %originalBBpart24
  store i32 0, ptr %11, align 4
  br label %.split17

.split17:                                         ; preds = %103
  store i32 -184520938, ptr %switchVar, align 4
  br label %.split17.split

.split17.split:                                   ; preds = %.split17
  br label %loopEnd

104:                                              ; preds = %originalBBpart24
  %105 = load i32, ptr %11, align 4
  br label %.split18

.split18:                                         ; preds = %104
  ret i32 %105

loopEnd:                                          ; preds = %.split17.split, %.split16.split, %.split15, %.split14.split, %.split13.split, %.split12.split, %.split11.split, %.split10.split, %originalBBpart28
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %106 = alloca i32, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %107 = alloca ptr, align 8
  %108 = alloca i32, align 4
  %109 = alloca i32, align 4
  store ptr %0, ptr %107, align 8
  store i32 %1, ptr %108, align 4
  store i32 0, ptr %109, align 4
  %switchVaralteredBB = alloca i32, align 4
  store i32 -312674859, ptr %switchVaralteredBB, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %loopEntry.split.split
  %switchVar1alteredBB = load i32, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %switchDefault.split.split
  br label %originalBB6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f_420e96d771d4() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %.split

.split:                                           ; preds = %0
  %2 = load ptr, ptr @DB_CONNECTION_STRING, align 8
  br label %.split.split

.split.split:                                     ; preds = %.split
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
  br label %.split

.split:                                           ; preds = %2
  %7 = call i64 @llvm.objectsize.i64.p0(ptr %6, i1 false, i1 true, i1 false)
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr @ENCRYPTION_KEY, align 8
  br label %.split.split

.split.split:                                     ; preds = %.split
  %10 = call i32 (ptr, i64, i32, i64, ptr, ...) @__snprintf_chk(ptr noundef %5, i64 noundef 256, i32 noundef 0, i64 noundef %7, ptr noundef @.str.26, ptr noundef %8, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_1a2ef98af176(ptr noundef %0, ptr noundef %1) #0 {
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br label %.split

.split:                                           ; preds = %2
  store i1 %7, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 1926519337, ptr %switchVar, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 1926519337, label %first
    i32 805883313, label %25
    i32 -511422603, label %29
    i32 -1553169716, label %46
    i32 -174588686, label %52
    i32 348895315, label %54
    i32 750450811, label %56
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %8 = load i32, ptr @x.19, align 4
  br label %first.split

first.split:                                      ; preds = %first
  %9 = load i32, ptr @y.20, align 4
  %10 = sub i32 %8, 1
  %11 = mul i32 %8, %10
  %12 = urem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  %14 = icmp slt i32 %9, 10
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  %15 = or i1 %13, %14
  br i1 %15, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %first.split.split, %originalBBalteredBB.split.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %16 = select i1 %.reload, i32 805883313, i32 -511422603
  store i32 %16, ptr %switchVar, align 4
  %17 = load i32, ptr @x.19, align 4
  %18 = load i32, ptr @y.20, align 4
  %19 = sub i32 %17, 1
  %20 = mul i32 %17, %19
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %21 = urem i32 %20, 2
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %22 = icmp eq i32 %21, 0
  %23 = icmp slt i32 %18, 10
  %24 = or i1 %22, %23
  br i1 %24, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

25:                                               ; preds = %loopEntry.split
  %26 = load ptr, ptr %5, align 8
  %27 = icmp ne ptr %26, null
  %28 = select i1 %27, i32 -1553169716, i32 -511422603
  br label %.split6

.split6:                                          ; preds = %25
  store i32 %28, ptr %switchVar, align 4
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  br label %loopEnd

29:                                               ; preds = %loopEntry.split
  %30 = load i32, ptr @x.19, align 4
  br label %.split7

.split7:                                          ; preds = %29
  %31 = load i32, ptr @y.20, align 4
  %32 = sub i32 %30, 1
  %33 = mul i32 %30, %32
  %34 = urem i32 %33, 2
  %35 = icmp eq i32 %34, 0
  %36 = icmp slt i32 %31, 10
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  %37 = or i1 %35, %36
  br i1 %37, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split7.split, %originalBB2alteredBB.split.split
  store i32 0, ptr %3, align 4
  store i32 750450811, ptr %switchVar, align 4
  %38 = load i32, ptr @x.19, align 4
  %39 = load i32, ptr @y.20, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %40 = sub i32 %38, 1
  %41 = mul i32 %38, %40
  %42 = urem i32 %41, 2
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %43 = icmp eq i32 %42, 0
  %44 = icmp slt i32 %39, 10
  %45 = or i1 %43, %44
  br i1 %45, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

46:                                               ; preds = %loopEntry.split
  %47 = load ptr, ptr %5, align 8
  br label %.split8

.split8:                                          ; preds = %46
  %48 = load ptr, ptr @OAUTH_CLIENT_SECRET, align 8
  %49 = call i32 @strcmp(ptr noundef %47, ptr noundef %48) #7
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 -174588686, i32 348895315
  store i32 %51, ptr %switchVar, align 4
  br label %.split8.split

.split8.split:                                    ; preds = %.split8
  br label %loopEnd

52:                                               ; preds = %loopEntry.split
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  store i32 1, ptr %3, align 4
  br label %.split9

.split9:                                          ; preds = %52
  store i32 750450811, ptr %switchVar, align 4
  br label %.split9.split

.split9.split:                                    ; preds = %.split9
  br label %loopEnd

54:                                               ; preds = %loopEntry.split
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  br label %.split10

.split10:                                         ; preds = %54
  store i32 0, ptr %3, align 4
  store i32 750450811, ptr %switchVar, align 4
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  br label %loopEnd

56:                                               ; preds = %loopEntry.split
  %57 = load i32, ptr %3, align 4
  br label %.split11

.split11:                                         ; preds = %56
  ret i32 %57

loopEnd:                                          ; preds = %.split10.split, %.split9.split, %.split8.split, %originalBBpart24, %.split6.split, %originalBBpart2, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %first.split.split
  %.reloadalteredBB = load i1, ptr %.reg2mem, align 1
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %58 = select i1 %.reloadalteredBB, i32 805883313, i32 -511422603
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  store i32 %58, ptr %switchVar, align 4
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split7.split
  store i32 0, ptr %3, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 750450811, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_fcae2dd27871(ptr noundef %0) #0 {
  %2 = load i32, ptr @x.21, align 4
  %3 = load i32, ptr @y.22, align 4
  %4 = sub i32 %2, 1
  br label %.split

.split:                                           ; preds = %1
  %5 = mul i32 %2, %4
  %6 = urem i32 %5, 2
  %7 = icmp eq i32 %6, 0
  br label %.split.split

.split.split:                                     ; preds = %.split
  %8 = icmp slt i32 %3, 10
  %9 = or i1 %7, %8
  br i1 %9, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %.reg2mem = alloca i1, align 1
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %11, align 8
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  store i1 %13, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 1970311159, ptr %switchVar, align 4
  %14 = load i32, ptr @x.21, align 4
  %15 = load i32, ptr @y.22, align 4
  %16 = sub i32 %14, 1
  %17 = mul i32 %14, %16
  %18 = urem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  %20 = icmp slt i32 %15, 10
  %21 = or i1 %19, %20
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  br i1 %21, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEntry

loopEntry:                                        ; preds = %originalBBpart2, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 1970311159, label %first
    i32 811566239, label %23
    i32 1411039497, label %41
    i32 294934482, label %63
    i32 -641552663, label %81
    i32 347274914, label %83
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %22 = select i1 %.reload, i32 1411039497, i32 811566239
  store i32 %22, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

23:                                               ; preds = %loopEntry.split
  %24 = load i32, ptr @x.21, align 4
  %25 = load i32, ptr @y.22, align 4
  %26 = sub i32 %24, 1
  %27 = mul i32 %24, %26
  %28 = urem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br label %.split14

.split14:                                         ; preds = %23
  %30 = icmp slt i32 %25, 10
  %31 = or i1 %29, %30
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  br i1 %31, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split14.split, %originalBB2alteredBB.split.split
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  store i32 0, ptr %10, align 4
  store i32 347274914, ptr %switchVar, align 4
  %33 = load i32, ptr @x.21, align 4
  %34 = load i32, ptr @y.22, align 4
  %35 = sub i32 %33, 1
  %36 = mul i32 %33, %35
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %37 = urem i32 %36, 2
  %38 = icmp eq i32 %37, 0
  %39 = icmp slt i32 %34, 10
  %40 = or i1 %38, %39
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %40, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

41:                                               ; preds = %loopEntry.split
  %42 = load i32, ptr @x.21, align 4
  %43 = load i32, ptr @y.22, align 4
  %44 = sub i32 %42, 1
  %45 = mul i32 %42, %44
  %46 = urem i32 %45, 2
  %47 = icmp eq i32 %46, 0
  br label %.split15

.split15:                                         ; preds = %41
  %48 = icmp slt i32 %43, 10
  br label %.split15.split

.split15.split:                                   ; preds = %.split15
  %49 = or i1 %47, %48
  br i1 %49, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split15.split, %originalBB6alteredBB.split.split
  %50 = load ptr, ptr %11, align 8
  %51 = load ptr, ptr @LICENSE_KEY, align 8
  %52 = call i32 @strcmp(ptr noundef %50, ptr noundef %51) #7
  %53 = icmp eq i32 %52, 0
  %54 = select i1 %53, i32 294934482, i32 -641552663
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  store i32 %54, ptr %switchVar, align 4
  %55 = load i32, ptr @x.21, align 4
  %56 = load i32, ptr @y.22, align 4
  %57 = sub i32 %55, 1
  %58 = mul i32 %55, %57
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %59 = urem i32 %58, 2
  %60 = icmp eq i32 %59, 0
  %61 = icmp slt i32 %56, 10
  %62 = or i1 %60, %61
  br i1 %62, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

63:                                               ; preds = %loopEntry.split
  %64 = load i32, ptr @x.21, align 4
  %65 = load i32, ptr @y.22, align 4
  %66 = sub i32 %64, 1
  %67 = mul i32 %64, %66
  %68 = urem i32 %67, 2
  br label %.split16

.split16:                                         ; preds = %63
  %69 = icmp eq i32 %68, 0
  br label %.split16.split

.split16.split:                                   ; preds = %.split16
  %70 = icmp slt i32 %65, 10
  %71 = or i1 %69, %70
  br i1 %71, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split16.split, %originalBB10alteredBB.split.split
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  store i32 1, ptr %10, align 4
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  store i32 347274914, ptr %switchVar, align 4
  %73 = load i32, ptr @x.21, align 4
  %74 = load i32, ptr @y.22, align 4
  %75 = sub i32 %73, 1
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %76 = mul i32 %73, %75
  %77 = urem i32 %76, 2
  %78 = icmp eq i32 %77, 0
  %79 = icmp slt i32 %74, 10
  %80 = or i1 %78, %79
  br i1 %80, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

81:                                               ; preds = %loopEntry.split
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  br label %.split17

.split17:                                         ; preds = %81
  store i32 0, ptr %10, align 4
  br label %.split17.split

.split17.split:                                   ; preds = %.split17
  store i32 347274914, ptr %switchVar, align 4
  br label %loopEnd

83:                                               ; preds = %loopEntry.split
  %84 = load i32, ptr %10, align 4
  br label %.split18

.split18:                                         ; preds = %83
  ret i32 %84

loopEnd:                                          ; preds = %.split17.split, %originalBBpart212, %originalBBpart28, %originalBBpart24, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %.reg2memalteredBB = alloca i1, align 1
  %85 = alloca i32, align 4
  %86 = alloca ptr, align 8
  store ptr %0, ptr %86, align 8
  %87 = load ptr, ptr %86, align 8
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %88 = icmp ne ptr %87, null
  store i1 %88, ptr %.reg2memalteredBB, align 1
  %switchVaralteredBB = alloca i32, align 4
  store i32 1970311159, ptr %switchVaralteredBB, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split14.split
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  store i32 0, ptr %10, align 4
  store i32 347274914, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split.split

originalBB2alteredBB.split.split:                 ; preds = %originalBB2alteredBB.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split15.split
  %90 = load ptr, ptr %11, align 8
  %91 = load ptr, ptr @LICENSE_KEY, align 8
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %92 = call i32 @strcmp(ptr noundef %90, ptr noundef %91) #7
  %93 = icmp eq i32 %92, 0
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  %94 = select i1 %93, i32 294934482, i32 -641552663
  store i32 %94, ptr %switchVar, align 4
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split16.split
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  store i32 1, ptr %10, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  store i32 347274914, ptr %switchVar, align 4
  br label %originalBB10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f_799bf1b7712b(ptr noundef %0) #0 {
  %2 = load i32, ptr @x.23, align 4
  %3 = load i32, ptr @y.24, align 4
  %4 = sub i32 %2, 1
  %5 = mul i32 %2, %4
  %6 = urem i32 %5, 2
  %7 = icmp eq i32 %6, 0
  br label %.split

.split:                                           ; preds = %1
  %8 = icmp slt i32 %3, 10
  br label %.split.split

.split.split:                                     ; preds = %.split
  %9 = or i1 %7, %8
  br i1 %9, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %.reg2mem = alloca i1, align 1
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %11, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  store i1 %13, ptr %.reg2mem, align 1
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %switchVar = alloca i32, align 4
  store i32 1790304900, ptr %switchVar, align 4
  %14 = load i32, ptr @x.23, align 4
  %15 = load i32, ptr @y.24, align 4
  %16 = sub i32 %14, 1
  %17 = mul i32 %14, %16
  %18 = urem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %20 = icmp slt i32 %15, 10
  %21 = or i1 %19, %20
  br i1 %21, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEntry

loopEntry:                                        ; preds = %originalBBpart2, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 1790304900, label %first
    i32 1777900323, label %23
    i32 308584518, label %24
    i32 460919456, label %30
    i32 1570857758, label %33
    i32 -866473999, label %35
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %22 = select i1 %.reload, i32 308584518, i32 1777900323
  br label %first.split

first.split:                                      ; preds = %first
  store i32 %22, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

23:                                               ; preds = %loopEntry.split
  store i32 0, ptr %10, align 4
  br label %.split6

.split6:                                          ; preds = %23
  store i32 -866473999, ptr %switchVar, align 4
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  br label %loopEnd

24:                                               ; preds = %loopEntry.split
  %25 = load ptr, ptr %11, align 8
  %26 = load ptr, ptr @BACKUP_ADMIN_PASSWORD, align 8
  br label %.split7

.split7:                                          ; preds = %24
  %27 = call i32 @strcmp(ptr noundef %25, ptr noundef %26) #7
  %28 = icmp eq i32 %27, 0
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  %29 = select i1 %28, i32 460919456, i32 1570857758
  store i32 %29, ptr %switchVar, align 4
  br label %loopEnd

30:                                               ; preds = %loopEntry.split
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %32 = call ptr @__strcpy_chk(ptr noundef @current_session, ptr noundef @.str.34, i64 noundef 64) #7
  br label %.split8

.split8:                                          ; preds = %30
  store i32 1, ptr getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 3), align 8
  br label %.split8.split

.split8.split:                                    ; preds = %.split8
  store i32 1, ptr %10, align 4
  store i32 -866473999, ptr %switchVar, align 4
  br label %loopEnd

33:                                               ; preds = %loopEntry.split
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  br label %.split9

.split9:                                          ; preds = %33
  store i32 0, ptr %10, align 4
  store i32 -866473999, ptr %switchVar, align 4
  br label %.split9.split

.split9.split:                                    ; preds = %.split9
  br label %loopEnd

35:                                               ; preds = %loopEntry.split
  %36 = load i32, ptr @x.23, align 4
  %37 = load i32, ptr @y.24, align 4
  %38 = sub i32 %36, 1
  %39 = mul i32 %36, %38
  %40 = urem i32 %39, 2
  br label %.split10

.split10:                                         ; preds = %35
  %41 = icmp eq i32 %40, 0
  %42 = icmp slt i32 %37, 10
  %43 = or i1 %41, %42
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  br i1 %43, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split10.split, %originalBB2alteredBB.split
  %44 = load i32, ptr %10, align 4
  %45 = load i32, ptr @x.23, align 4
  %46 = load i32, ptr @y.24, align 4
  %47 = sub i32 %45, 1
  %48 = mul i32 %45, %47
  %49 = urem i32 %48, 2
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %50 = icmp eq i32 %49, 0
  %51 = icmp slt i32 %46, 10
  %52 = or i1 %50, %51
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  br i1 %52, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  ret i32 %44

loopEnd:                                          ; preds = %.split9.split, %.split8.split, %.split7.split, %.split6.split, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %.reg2memalteredBB = alloca i1, align 1
  %53 = alloca i32, align 4
  %54 = alloca ptr, align 8
  store ptr %0, ptr %54, align 8
  %55 = load ptr, ptr %54, align 8
  %56 = icmp ne ptr %55, null
  store i1 %56, ptr %.reg2memalteredBB, align 1
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %switchVaralteredBB = alloca i32, align 4
  store i32 1790304900, ptr %switchVaralteredBB, align 4
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split10.split
  %57 = load i32, ptr %10, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  br label %originalBB2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = load i32, ptr @x.25, align 4
  br label %.split

.split:                                           ; preds = %2
  %4 = load i32, ptr @y.26, align 4
  %5 = sub i32 %3, 1
  %6 = mul i32 %3, %5
  br label %.split.split

.split.split:                                     ; preds = %.split
  %7 = urem i32 %6, 2
  %8 = icmp eq i32 %7, 0
  %9 = icmp slt i32 %4, 10
  %10 = or i1 %8, %9
  br i1 %10, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %.split.split, %originalBBalteredBB.split.split
  %.reg2mem = alloca i1, align 1
  %11 = alloca i32, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca [128 x i8], align 1
  %17 = alloca i32, align 4
  store i32 0, ptr %11, align 4
  store i32 %0, ptr %12, align 4
  store ptr %1, ptr %13, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @f_0c7992b3d2d2()
  %22 = load i32, ptr %12, align 4
  %23 = icmp slt i32 %22, 3
  store i1 %23, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 488698995, ptr %switchVar, align 4
  %24 = load i32, ptr @x.25, align 4
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
  br label %loopEntry

loopEntry:                                        ; preds = %originalBBpart2, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 488698995, label %first
    i32 -82234381, label %49
    i32 -1047569329, label %58
    i32 -2059129655, label %86
    i32 1633373670, label %88
    i32 85824646, label %111
    i32 -1703989879, label %116
    i32 190424474, label %141
    i32 -294996602, label %150
    i32 -918146732, label %167
    i32 -1806151833, label %176
    i32 834619360, label %185
    i32 706221663, label %201
    i32 -1316094860, label %226
    i32 2127829020, label %251
    i32 880964610, label %283
    i32 -443446920, label %284
    i32 -2027886873, label %285
    i32 -984373453, label %302
    i32 1283722234, label %308
    i32 -1028664831, label %329
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %32 = load i32, ptr @x.25, align 4
  %33 = load i32, ptr @y.26, align 4
  %34 = sub i32 %32, 1
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %35 = mul i32 %32, %34
  %36 = urem i32 %35, 2
  %37 = icmp eq i32 %36, 0
  %38 = icmp slt i32 %33, 10
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  %39 = or i1 %37, %38
  br i1 %39, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %switchDefault.split.split, %originalBB2alteredBB
  %40 = load i32, ptr @x.25, align 4
  %41 = load i32, ptr @y.26, align 4
  %42 = sub i32 %40, 1
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %43 = mul i32 %40, %42
  %44 = urem i32 %43, 2
  %45 = icmp eq i32 %44, 0
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %46 = icmp slt i32 %41, 10
  %47 = or i1 %45, %46
  br i1 %47, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %48 = select i1 %.reload, i32 -82234381, i32 -1047569329
  store i32 %48, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

49:                                               ; preds = %loopEntry.split
  %50 = load ptr, ptr %13, align 8
  br label %.split108

.split108:                                        ; preds = %49
  %51 = getelementptr inbounds ptr, ptr %50, i64 0
  %52 = load ptr, ptr %51, align 8
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.40, ptr noundef %52)
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.42)
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  store i32 1, ptr %11, align 4
  br label %.split108.split

.split108.split:                                  ; preds = %.split108
  store i32 -1028664831, ptr %switchVar, align 4
  br label %loopEnd

58:                                               ; preds = %loopEntry.split
  %59 = load i32, ptr @x.25, align 4
  %60 = load i32, ptr @y.26, align 4
  %61 = sub i32 %59, 1
  %62 = mul i32 %59, %61
  br label %.split109

.split109:                                        ; preds = %58
  %63 = urem i32 %62, 2
  %64 = icmp eq i32 %63, 0
  %65 = icmp slt i32 %60, 10
  br label %.split109.split

.split109.split:                                  ; preds = %.split109
  %66 = or i1 %64, %65
  br i1 %66, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split109.split, %originalBB6alteredBB.split.split
  %67 = load ptr, ptr %13, align 8
  %68 = getelementptr inbounds ptr, ptr %67, i64 1
  %69 = load ptr, ptr %68, align 8
  store ptr %69, ptr %14, align 8
  %70 = load ptr, ptr %13, align 8
  %71 = getelementptr inbounds ptr, ptr %70, i64 2
  %72 = load ptr, ptr %71, align 8
  store ptr %72, ptr %15, align 8
  %73 = load ptr, ptr %14, align 8
  %74 = load ptr, ptr %15, align 8
  %75 = call i32 @f_0a9fc93cc940(ptr noundef %73, ptr noundef %74)
  %76 = icmp ne i32 %75, 0
  %77 = select i1 %76, i32 1633373670, i32 -2059129655
  store i32 %77, ptr %switchVar, align 4
  %78 = load i32, ptr @x.25, align 4
  %79 = load i32, ptr @y.26, align 4
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %80 = sub i32 %78, 1
  %81 = mul i32 %78, %80
  %82 = urem i32 %81, 2
  %83 = icmp eq i32 %82, 0
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  %84 = icmp slt i32 %79, 10
  %85 = or i1 %83, %84
  br i1 %85, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  br label %loopEnd

86:                                               ; preds = %loopEntry.split
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.45)
  store i32 1, ptr %11, align 4
  br label %.split110

.split110:                                        ; preds = %86
  store i32 -1028664831, ptr %switchVar, align 4
  br label %.split110.split

.split110.split:                                  ; preds = %.split110
  br label %loopEnd

88:                                               ; preds = %loopEntry.split
  %89 = load i32, ptr @x.25, align 4
  br label %.split111

.split111:                                        ; preds = %88
  %90 = load i32, ptr @y.26, align 4
  br label %.split111.split

.split111.split:                                  ; preds = %.split111
  %91 = sub i32 %89, 1
  %92 = mul i32 %89, %91
  %93 = urem i32 %92, 2
  %94 = icmp eq i32 %93, 0
  %95 = icmp slt i32 %90, 10
  %96 = or i1 %94, %95
  br i1 %96, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %.split111.split, %originalBB10alteredBB.split.split
  %97 = getelementptr inbounds [128 x i8], ptr %16, i64 0, i64 0
  %98 = load ptr, ptr %14, align 8
  call void @f_12f52c0c0856(ptr noundef %97, ptr noundef %98)
  %99 = getelementptr inbounds [128 x i8], ptr %16, i64 0, i64 0
  %100 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1), ptr noundef %99, i64 noundef 128) #7
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %101 = load ptr, ptr %14, align 8
  %102 = call i32 @f_34ede220d91a(ptr noundef %101, i32 noundef 3)
  call void @f_420e96d771d4()
  store i32 3, ptr %17, align 4
  store i32 85824646, ptr %switchVar, align 4
  %103 = load i32, ptr @x.25, align 4
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %104 = load i32, ptr @y.26, align 4
  %105 = sub i32 %103, 1
  %106 = mul i32 %103, %105
  %107 = urem i32 %106, 2
  %108 = icmp eq i32 %107, 0
  %109 = icmp slt i32 %104, 10
  %110 = or i1 %108, %109
  br i1 %110, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEnd

111:                                              ; preds = %loopEntry.split
  %112 = load i32, ptr %17, align 4
  br label %.split112

.split112:                                        ; preds = %111
  %113 = load i32, ptr %12, align 4
  %114 = icmp slt i32 %112, %113
  %115 = select i1 %114, i32 -1703989879, i32 1283722234
  store i32 %115, ptr %switchVar, align 4
  br label %.split112.split

.split112.split:                                  ; preds = %.split112
  br label %loopEnd

116:                                              ; preds = %loopEntry.split
  %117 = load i32, ptr @x.25, align 4
  br label %.split113

.split113:                                        ; preds = %116
  %118 = load i32, ptr @y.26, align 4
  %119 = sub i32 %117, 1
  %120 = mul i32 %117, %119
  %121 = urem i32 %120, 2
  %122 = icmp eq i32 %121, 0
  br label %.split113.split

.split113.split:                                  ; preds = %.split113
  %123 = icmp slt i32 %118, 10
  %124 = or i1 %122, %123
  br i1 %124, label %originalBB14, label %originalBB14alteredBB

originalBB14:                                     ; preds = %.split113.split, %originalBB14alteredBB.split.split
  %125 = load ptr, ptr %13, align 8
  %126 = load i32, ptr %17, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds ptr, ptr %125, i64 %127
  %129 = load ptr, ptr %128, align 8
  %130 = call i32 @strcmp(ptr noundef %129, ptr noundef @.str.46) #7
  %131 = icmp eq i32 %130, 0
  br label %originalBB14.split

originalBB14.split:                               ; preds = %originalBB14
  %132 = select i1 %131, i32 190424474, i32 -918146732
  store i32 %132, ptr %switchVar, align 4
  br label %originalBB14.split.split

originalBB14.split.split:                         ; preds = %originalBB14.split
  %133 = load i32, ptr @x.25, align 4
  %134 = load i32, ptr @y.26, align 4
  %135 = sub i32 %133, 1
  %136 = mul i32 %133, %135
  %137 = urem i32 %136, 2
  %138 = icmp eq i32 %137, 0
  %139 = icmp slt i32 %134, 10
  %140 = or i1 %138, %139
  br i1 %140, label %originalBBpart216, label %originalBB14alteredBB

originalBBpart216:                                ; preds = %originalBB14.split.split
  br label %loopEnd

141:                                              ; preds = %loopEntry.split
  %142 = load i32, ptr %17, align 4
  %143 = add i32 %142, 1872588444
  %144 = add i32 %143, 1
  %145 = sub i32 %144, 1872588444
  br label %.split114

.split114:                                        ; preds = %141
  %146 = add nsw i32 %142, 1
  %147 = load i32, ptr %12, align 4
  %148 = icmp slt i32 %145, %147
  %149 = select i1 %148, i32 -294996602, i32 -918146732
  store i32 %149, ptr %switchVar, align 4
  br label %.split114.split

.split114.split:                                  ; preds = %.split114
  br label %loopEnd

150:                                              ; preds = %loopEntry.split
  %151 = load ptr, ptr %13, align 8
  %152 = load i32, ptr %17, align 4
  %153 = sub i32 0, %152
  %154 = sub i32 0, 1
  %155 = add i32 %153, %154
  %156 = sub i32 0, %155
  %157 = add nsw i32 %152, 1
  %158 = sext i32 %156 to i64
  %159 = getelementptr inbounds ptr, ptr %151, i64 %158
  %160 = load ptr, ptr %159, align 8
  %161 = call i32 @f_3ff16c1a3ff2(ptr noundef %160)
  br label %.split115

.split115:                                        ; preds = %150
  %162 = load i32, ptr %17, align 4
  %163 = add i32 %162, 993021989
  %164 = add i32 %163, 1
  %165 = sub i32 %164, 993021989
  %166 = add nsw i32 %162, 1
  store i32 %165, ptr %17, align 4
  br label %.split115.split

.split115.split:                                  ; preds = %.split115
  store i32 -2027886873, ptr %switchVar, align 4
  br label %loopEnd

167:                                              ; preds = %loopEntry.split
  %168 = load ptr, ptr %13, align 8
  br label %.split116

.split116:                                        ; preds = %167
  %169 = load i32, ptr %17, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds ptr, ptr %168, i64 %170
  %172 = load ptr, ptr %171, align 8
  %173 = call i32 @strcmp(ptr noundef %172, ptr noundef @.str.47) #7
  br label %.split116.split

.split116.split:                                  ; preds = %.split116
  %174 = icmp eq i32 %173, 0
  %175 = select i1 %174, i32 -1806151833, i32 706221663
  store i32 %175, ptr %switchVar, align 4
  br label %loopEnd

176:                                              ; preds = %loopEntry.split
  %177 = load i32, ptr %17, align 4
  %178 = sub i32 %177, -1043696251
  %179 = add i32 %178, 1
  %180 = add i32 %179, -1043696251
  %181 = add nsw i32 %177, 1
  %182 = load i32, ptr %12, align 4
  %183 = icmp slt i32 %180, %182
  br label %.split117

.split117:                                        ; preds = %176
  %184 = select i1 %183, i32 834619360, i32 706221663
  store i32 %184, ptr %switchVar, align 4
  br label %.split117.split

.split117.split:                                  ; preds = %.split117
  br label %loopEnd

185:                                              ; preds = %loopEntry.split
  %186 = load ptr, ptr %13, align 8
  %187 = load i32, ptr %17, align 4
  %188 = add i32 %187, 1780092875
  %189 = add i32 %188, 1
  %190 = sub i32 %189, 1780092875
  %191 = add nsw i32 %187, 1
  %192 = sext i32 %190 to i64
  %193 = getelementptr inbounds ptr, ptr %186, i64 %192
  %194 = load ptr, ptr %193, align 8
  br label %.split118

.split118:                                        ; preds = %185
  %195 = call i32 @f_fcae2dd27871(ptr noundef %194)
  %196 = load i32, ptr %17, align 4
  br label %.split118.split

.split118.split:                                  ; preds = %.split118
  %197 = sub i32 %196, 1699773673
  %198 = add i32 %197, 1
  %199 = add i32 %198, 1699773673
  %200 = add nsw i32 %196, 1
  store i32 %199, ptr %17, align 4
  store i32 -443446920, ptr %switchVar, align 4
  br label %loopEnd

201:                                              ; preds = %loopEntry.split
  %202 = load i32, ptr @x.25, align 4
  %203 = load i32, ptr @y.26, align 4
  %204 = sub i32 %202, 1
  %205 = mul i32 %202, %204
  %206 = urem i32 %205, 2
  %207 = icmp eq i32 %206, 0
  br label %.split119

.split119:                                        ; preds = %201
  %208 = icmp slt i32 %203, 10
  br label %.split119.split

.split119.split:                                  ; preds = %.split119
  %209 = or i1 %207, %208
  br i1 %209, label %originalBB18, label %originalBB18alteredBB

originalBB18:                                     ; preds = %.split119.split, %originalBB18alteredBB.split.split
  %210 = load ptr, ptr %13, align 8
  %211 = load i32, ptr %17, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds ptr, ptr %210, i64 %212
  %214 = load ptr, ptr %213, align 8
  %215 = call i32 @strcmp(ptr noundef %214, ptr noundef @.str.48) #7
  %216 = icmp eq i32 %215, 0
  %217 = select i1 %216, i32 -1316094860, i32 880964610
  br label %originalBB18.split

originalBB18.split:                               ; preds = %originalBB18
  store i32 %217, ptr %switchVar, align 4
  %218 = load i32, ptr @x.25, align 4
  %219 = load i32, ptr @y.26, align 4
  %220 = sub i32 %218, 1
  %221 = mul i32 %218, %220
  br label %originalBB18.split.split

originalBB18.split.split:                         ; preds = %originalBB18.split
  %222 = urem i32 %221, 2
  %223 = icmp eq i32 %222, 0
  %224 = icmp slt i32 %219, 10
  %225 = or i1 %223, %224
  br i1 %225, label %originalBBpart220, label %originalBB18alteredBB

originalBBpart220:                                ; preds = %originalBB18.split.split
  br label %loopEnd

226:                                              ; preds = %loopEntry.split
  %227 = load i32, ptr @x.25, align 4
  %228 = load i32, ptr @y.26, align 4
  %229 = sub i32 %227, 1
  %230 = mul i32 %227, %229
  %231 = urem i32 %230, 2
  br label %.split120

.split120:                                        ; preds = %226
  %232 = icmp eq i32 %231, 0
  %233 = icmp slt i32 %228, 10
  br label %.split120.split

.split120.split:                                  ; preds = %.split120
  %234 = or i1 %232, %233
  br i1 %234, label %originalBB22, label %originalBB22alteredBB

originalBB22:                                     ; preds = %.split120.split, %originalBB22alteredBB.split.split
  %235 = load i32, ptr %17, align 4
  %236 = sub i32 %235, 1136491059
  %237 = add i32 %236, 1
  %238 = add i32 %237, 1136491059
  %239 = add nsw i32 %235, 1
  %240 = load i32, ptr %12, align 4
  %241 = icmp slt i32 %238, %240
  %242 = select i1 %241, i32 2127829020, i32 880964610
  store i32 %242, ptr %switchVar, align 4
  br label %originalBB22.split

originalBB22.split:                               ; preds = %originalBB22
  %243 = load i32, ptr @x.25, align 4
  %244 = load i32, ptr @y.26, align 4
  br label %originalBB22.split.split

originalBB22.split.split:                         ; preds = %originalBB22.split
  %245 = sub i32 %243, 1
  %246 = mul i32 %243, %245
  %247 = urem i32 %246, 2
  %248 = icmp eq i32 %247, 0
  %249 = icmp slt i32 %244, 10
  %250 = or i1 %248, %249
  br i1 %250, label %originalBBpart247, label %originalBB22alteredBB

originalBBpart247:                                ; preds = %originalBB22.split.split
  br label %loopEnd

251:                                              ; preds = %loopEntry.split
  %252 = load i32, ptr @x.25, align 4
  br label %.split121

.split121:                                        ; preds = %251
  %253 = load i32, ptr @y.26, align 4
  %254 = sub i32 %252, 1
  %255 = mul i32 %252, %254
  %256 = urem i32 %255, 2
  %257 = icmp eq i32 %256, 0
  %258 = icmp slt i32 %253, 10
  br label %.split121.split

.split121.split:                                  ; preds = %.split121
  %259 = or i1 %257, %258
  br i1 %259, label %originalBB49, label %originalBB49alteredBB

originalBB49:                                     ; preds = %.split121.split, %originalBB49alteredBB.split.split
  %260 = load ptr, ptr %13, align 8
  %261 = load i32, ptr %17, align 4
  %262 = sub i32 0, 1
  %263 = sub i32 %261, %262
  br label %originalBB49.split

originalBB49.split:                               ; preds = %originalBB49
  %264 = add nsw i32 %261, 1
  %265 = sext i32 %263 to i64
  %266 = getelementptr inbounds ptr, ptr %260, i64 %265
  %267 = load ptr, ptr %266, align 8
  %268 = call i32 @f_799bf1b7712b(ptr noundef %267)
  br label %originalBB49.split.split

originalBB49.split.split:                         ; preds = %originalBB49.split
  %269 = load i32, ptr %17, align 4
  %270 = sub i32 0, %269
  %271 = sub i32 0, 1
  %272 = add i32 %270, %271
  %273 = sub i32 0, %272
  %274 = add nsw i32 %269, 1
  store i32 %273, ptr %17, align 4
  store i32 880964610, ptr %switchVar, align 4
  %275 = load i32, ptr @x.25, align 4
  %276 = load i32, ptr @y.26, align 4
  %277 = sub i32 %275, 1
  %278 = mul i32 %275, %277
  %279 = urem i32 %278, 2
  %280 = icmp eq i32 %279, 0
  %281 = icmp slt i32 %276, 10
  %282 = or i1 %280, %281
  br i1 %282, label %originalBBpart298, label %originalBB49alteredBB

originalBBpart298:                                ; preds = %originalBB49.split.split
  br label %loopEnd

283:                                              ; preds = %loopEntry.split
  store i32 -443446920, ptr %switchVar, align 4
  br label %.split122

.split122:                                        ; preds = %283
  br label %loopEnd

284:                                              ; preds = %loopEntry.split
  store i32 -2027886873, ptr %switchVar, align 4
  br label %.split123

.split123:                                        ; preds = %284
  br label %loopEnd

285:                                              ; preds = %loopEntry.split
  %286 = load i32, ptr @x.25, align 4
  br label %.split124

.split124:                                        ; preds = %285
  %287 = load i32, ptr @y.26, align 4
  %288 = sub i32 %286, 1
  %289 = mul i32 %286, %288
  %290 = urem i32 %289, 2
  %291 = icmp eq i32 %290, 0
  %292 = icmp slt i32 %287, 10
  br label %.split124.split

.split124.split:                                  ; preds = %.split124
  %293 = or i1 %291, %292
  br i1 %293, label %originalBB100, label %originalBB100alteredBB

originalBB100:                                    ; preds = %.split124.split, %originalBB100alteredBB.split
  store i32 -984373453, ptr %switchVar, align 4
  br label %originalBB100.split

originalBB100.split:                              ; preds = %originalBB100
  %294 = load i32, ptr @x.25, align 4
  %295 = load i32, ptr @y.26, align 4
  %296 = sub i32 %294, 1
  %297 = mul i32 %294, %296
  br label %originalBB100.split.split

originalBB100.split.split:                        ; preds = %originalBB100.split
  %298 = urem i32 %297, 2
  %299 = icmp eq i32 %298, 0
  %300 = icmp slt i32 %295, 10
  %301 = or i1 %299, %300
  br i1 %301, label %originalBBpart2102, label %originalBB100alteredBB

originalBBpart2102:                               ; preds = %originalBB100.split.split
  br label %loopEnd

302:                                              ; preds = %loopEntry.split
  %303 = load i32, ptr %17, align 4
  %304 = sub i32 %303, -1613231837
  %305 = add i32 %304, 1
  br label %.split125

.split125:                                        ; preds = %302
  %306 = add i32 %305, -1613231837
  %307 = add nsw i32 %303, 1
  store i32 %306, ptr %17, align 4
  br label %.split125.split

.split125.split:                                  ; preds = %.split125
  store i32 85824646, ptr %switchVar, align 4
  br label %loopEnd

308:                                              ; preds = %loopEntry.split
  %309 = load i32, ptr @x.25, align 4
  %310 = load i32, ptr @y.26, align 4
  %311 = sub i32 %309, 1
  %312 = mul i32 %309, %311
  %313 = urem i32 %312, 2
  br label %.split126

.split126:                                        ; preds = %308
  %314 = icmp eq i32 %313, 0
  %315 = icmp slt i32 %310, 10
  %316 = or i1 %314, %315
  br label %.split126.split

.split126.split:                                  ; preds = %.split126
  br i1 %316, label %originalBB104, label %originalBB104alteredBB

originalBB104:                                    ; preds = %.split126.split, %originalBB104alteredBB.split.split
  %317 = call i32 (ptr, ...) @printf(ptr noundef @.str.49)
  %318 = call i32 (ptr, ...) @printf(ptr noundef @.str.50)
  %319 = call i32 (ptr, ...) @printf(ptr noundef @.str.51, ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1))
  br label %originalBB104.split

originalBB104.split:                              ; preds = %originalBB104
  %320 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  store i32 0, ptr %11, align 4
  store i32 -1028664831, ptr %switchVar, align 4
  %321 = load i32, ptr @x.25, align 4
  %322 = load i32, ptr @y.26, align 4
  %323 = sub i32 %321, 1
  %324 = mul i32 %321, %323
  %325 = urem i32 %324, 2
  %326 = icmp eq i32 %325, 0
  %327 = icmp slt i32 %322, 10
  br label %originalBB104.split.split

originalBB104.split.split:                        ; preds = %originalBB104.split
  %328 = or i1 %326, %327
  br i1 %328, label %originalBBpart2106, label %originalBB104alteredBB

originalBBpart2106:                               ; preds = %originalBB104.split.split
  br label %loopEnd

329:                                              ; preds = %loopEntry.split
  %330 = load i32, ptr %11, align 4
  br label %.split127

.split127:                                        ; preds = %329
  ret i32 %330

loopEnd:                                          ; preds = %originalBBpart2106, %.split125.split, %originalBBpart2102, %.split123, %.split122, %originalBBpart298, %originalBBpart247, %originalBBpart220, %.split118.split, %.split117.split, %.split116.split, %.split115.split, %.split114.split, %originalBBpart216, %.split112.split, %originalBBpart212, %.split110.split, %originalBBpart28, %.split108.split, %first.split.split, %originalBBpart24
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %.split.split
  %.reg2memalteredBB = alloca i1, align 1
  %331 = alloca i32, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %332 = alloca i32, align 4
  %333 = alloca ptr, align 8
  %334 = alloca ptr, align 8
  %335 = alloca ptr, align 8
  %336 = alloca [128 x i8], align 1
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  %337 = alloca i32, align 4
  store i32 0, ptr %331, align 4
  store i32 %0, ptr %332, align 4
  store ptr %1, ptr %333, align 8
  %338 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %339 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  %340 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %341 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @f_0c7992b3d2d2()
  %342 = load i32, ptr %332, align 4
  %343 = icmp slt i32 %342, 3
  store i1 %343, ptr %.reg2memalteredBB, align 1
  %switchVaralteredBB = alloca i32, align 4
  store i32 488698995, ptr %switchVaralteredBB, align 4
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %switchDefault.split.split
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split109.split
  %344 = load ptr, ptr %13, align 8
  %345 = getelementptr inbounds ptr, ptr %344, i64 1
  br label %originalBB6alteredBB.split

originalBB6alteredBB.split:                       ; preds = %originalBB6alteredBB
  %346 = load ptr, ptr %345, align 8
  store ptr %346, ptr %14, align 8
  %347 = load ptr, ptr %13, align 8
  %348 = getelementptr inbounds ptr, ptr %347, i64 2
  %349 = load ptr, ptr %348, align 8
  store ptr %349, ptr %15, align 8
  %350 = load ptr, ptr %14, align 8
  br label %originalBB6alteredBB.split.split

originalBB6alteredBB.split.split:                 ; preds = %originalBB6alteredBB.split
  %351 = load ptr, ptr %15, align 8
  %352 = call i32 @f_0a9fc93cc940(ptr noundef %350, ptr noundef %351)
  %353 = icmp ne i32 %352, 0
  %354 = select i1 %353, i32 1633373670, i32 -2059129655
  store i32 %354, ptr %switchVar, align 4
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %.split111.split
  %355 = getelementptr inbounds [128 x i8], ptr %16, i64 0, i64 0
  %356 = load ptr, ptr %14, align 8
  call void @f_12f52c0c0856(ptr noundef %355, ptr noundef %356)
  %357 = getelementptr inbounds [128 x i8], ptr %16, i64 0, i64 0
  %358 = call ptr @__strcpy_chk(ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1), ptr noundef %357, i64 noundef 128) #7
  %359 = load ptr, ptr %14, align 8
  br label %originalBB10alteredBB.split

originalBB10alteredBB.split:                      ; preds = %originalBB10alteredBB
  %360 = call i32 @f_34ede220d91a(ptr noundef %359, i32 noundef 3)
  call void @f_420e96d771d4()
  store i32 3, ptr %17, align 4
  br label %originalBB10alteredBB.split.split

originalBB10alteredBB.split.split:                ; preds = %originalBB10alteredBB.split
  store i32 85824646, ptr %switchVar, align 4
  br label %originalBB10

originalBB14alteredBB:                            ; preds = %originalBB14.split.split, %.split113.split
  %361 = load ptr, ptr %13, align 8
  %362 = load i32, ptr %17, align 4
  br label %originalBB14alteredBB.split

originalBB14alteredBB.split:                      ; preds = %originalBB14alteredBB
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds ptr, ptr %361, i64 %363
  %365 = load ptr, ptr %364, align 8
  br label %originalBB14alteredBB.split.split

originalBB14alteredBB.split.split:                ; preds = %originalBB14alteredBB.split
  %366 = call i32 @strcmp(ptr noundef %365, ptr noundef @.str.46) #7
  %367 = icmp eq i32 %366, 0
  %368 = select i1 %367, i32 190424474, i32 -918146732
  store i32 %368, ptr %switchVar, align 4
  br label %originalBB14

originalBB18alteredBB:                            ; preds = %originalBB18.split.split, %.split119.split
  %369 = load ptr, ptr %13, align 8
  %370 = load i32, ptr %17, align 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds ptr, ptr %369, i64 %371
  %373 = load ptr, ptr %372, align 8
  %374 = call i32 @strcmp(ptr noundef %373, ptr noundef @.str.48) #7
  br label %originalBB18alteredBB.split

originalBB18alteredBB.split:                      ; preds = %originalBB18alteredBB
  %375 = icmp eq i32 %374, 0
  br label %originalBB18alteredBB.split.split

originalBB18alteredBB.split.split:                ; preds = %originalBB18alteredBB.split
  %376 = select i1 %375, i32 -1316094860, i32 880964610
  store i32 %376, ptr %switchVar, align 4
  br label %originalBB18

originalBB22alteredBB:                            ; preds = %originalBB22.split.split, %.split120.split
  %377 = load i32, ptr %17, align 4
  %_ = shl i32 %377, 1136491059
  %_23 = sub i32 0, %377
  %gen = add i32 %_23, 1136491059
  %_24 = sub i32 %377, 1136491059
  %gen25 = mul i32 %_24, 1136491059
  %_26 = sub i32 0, %377
  %gen27 = add i32 %_26, 1136491059
  %_28 = sub i32 0, %377
  %gen29 = add i32 %_28, 1136491059
  br label %originalBB22alteredBB.split

originalBB22alteredBB.split:                      ; preds = %originalBB22alteredBB
  %_30 = shl i32 %377, 1136491059
  %_31 = sub i32 %377, 1136491059
  %gen32 = mul i32 %_31, 1136491059
  %_33 = sub i32 %377, 1136491059
  %gen34 = mul i32 %_33, 1136491059
  %_35 = sub i32 0, %377
  %gen36 = add i32 %_35, 1136491059
  br label %originalBB22alteredBB.split.split

originalBB22alteredBB.split.split:                ; preds = %originalBB22alteredBB.split
  %378 = sub i32 %377, 1136491059
  %_37 = sub i32 %378, 1
  %gen38 = mul i32 %_37, 1
  %_39 = sub i32 %378, 1
  %gen40 = mul i32 %_39, 1
  %379 = add i32 %378, 1
  %_41 = sub i32 %379, 1136491059
  %gen42 = mul i32 %_41, 1136491059
  %380 = add i32 %379, 1136491059
  %_43 = sub i32 %377, 1
  %gen44 = mul i32 %_43, 1
  %_45 = shl i32 %377, 1
  %381 = add nsw i32 %377, 1
  %382 = load i32, ptr %12, align 4
  %383 = icmp slt i32 %380, %382
  %384 = select i1 %383, i32 2127829020, i32 880964610
  store i32 %384, ptr %switchVar, align 4
  br label %originalBB22

originalBB49alteredBB:                            ; preds = %originalBB49.split.split, %.split121.split
  %385 = load ptr, ptr %13, align 8
  %386 = load i32, ptr %17, align 4
  %_50 = shl i32 0, 1
  %_51 = sub i32 0, 1
  %gen52 = mul i32 %_51, 1
  %_53 = sub i32 0, 0
  %gen54 = add i32 %_53, 1
  %387 = sub i32 0, 1
  %_55 = sub i32 %386, %387
  %gen56 = mul i32 %_55, %387
  %_57 = shl i32 %386, %387
  %_58 = sub i32 %386, %387
  %gen59 = mul i32 %_58, %387
  br label %originalBB49alteredBB.split

originalBB49alteredBB.split:                      ; preds = %originalBB49alteredBB
  %388 = sub i32 %386, %387
  %_60 = shl i32 %386, 1
  %_61 = sub i32 %386, 1
  %gen62 = mul i32 %_61, 1
  %_63 = sub i32 %386, 1
  %gen64 = mul i32 %_63, 1
  %_65 = sub i32 %386, 1
  %gen66 = mul i32 %_65, 1
  %_67 = sub i32 %386, 1
  %gen68 = mul i32 %_67, 1
  %_69 = shl i32 %386, 1
  %_70 = shl i32 %386, 1
  %_71 = sub i32 %386, 1
  %gen72 = mul i32 %_71, 1
  %389 = add nsw i32 %386, 1
  %390 = sext i32 %388 to i64
  %391 = getelementptr inbounds ptr, ptr %385, i64 %390
  %392 = load ptr, ptr %391, align 8
  %393 = call i32 @f_799bf1b7712b(ptr noundef %392)
  %394 = load i32, ptr %17, align 4
  %_73 = sub i32 0, 0
  %gen74 = add i32 %_73, %394
  %_75 = shl i32 0, %394
  %_76 = shl i32 0, %394
  %_77 = sub i32 0, %394
  %gen78 = mul i32 %_77, %394
  %_79 = sub i32 0, 0
  %gen80 = add i32 %_79, %394
  %_81 = sub i32 0, %394
  %gen82 = mul i32 %_81, %394
  %_83 = shl i32 0, %394
  %395 = sub i32 0, %394
  %_84 = sub i32 0, 1
  %gen85 = mul i32 %_84, 1
  %396 = sub i32 0, 1
  %_86 = shl i32 %395, %396
  %397 = add i32 %395, %396
  %_87 = sub i32 0, %397
  %gen88 = mul i32 %_87, %397
  %_89 = sub i32 0, 0
  %gen90 = add i32 %_89, %397
  %_91 = sub i32 0, %397
  %gen92 = mul i32 %_91, %397
  br label %originalBB49alteredBB.split.split

originalBB49alteredBB.split.split:                ; preds = %originalBB49alteredBB.split
  %398 = sub i32 0, %397
  %_93 = sub i32 0, %394
  %gen94 = add i32 %_93, 1
  %_95 = sub i32 %394, 1
  %gen96 = mul i32 %_95, 1
  %399 = add nsw i32 %394, 1
  store i32 %398, ptr %17, align 4
  store i32 880964610, ptr %switchVar, align 4
  br label %originalBB49

originalBB100alteredBB:                           ; preds = %originalBB100.split.split, %.split124.split
  store i32 -984373453, ptr %switchVar, align 4
  br label %originalBB100alteredBB.split

originalBB100alteredBB.split:                     ; preds = %originalBB100alteredBB
  br label %originalBB100

originalBB104alteredBB:                           ; preds = %originalBB104.split.split, %.split126.split
  %400 = call i32 (ptr, ...) @printf(ptr noundef @.str.49)
  %401 = call i32 (ptr, ...) @printf(ptr noundef @.str.50)
  %402 = call i32 (ptr, ...) @printf(ptr noundef @.str.51, ptr noundef getelementptr inbounds (%struct.Session, ptr @current_session, i32 0, i32 1))
  %403 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  br label %originalBB104alteredBB.split

originalBB104alteredBB.split:                     ; preds = %originalBB104alteredBB
  store i32 0, ptr %11, align 4
  br label %originalBB104alteredBB.split.split

originalBB104alteredBB.split.split:               ; preds = %originalBB104alteredBB.split
  store i32 -1028664831, ptr %switchVar, align 4
  br label %originalBB104
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
