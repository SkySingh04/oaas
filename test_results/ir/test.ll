; ModuleID = '/Users/akashsingh/Desktop/llvm/src/simple_auth.c'
source_filename = "/Users/akashsingh/Desktop/llvm/src/simple_auth.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [15 x i8] c"AdminPass2024!\00", align 1
@MASTER_PASSWORD = global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"sk_live_secret_12345\00", align 1
@API_SECRET = global ptr @.str.1, align 8
@.str.2 = private unnamed_addr constant [18 x i8] c"db.production.com\00", align 1
@DB_HOST = global ptr @.str.2, align 8
@.str.3 = private unnamed_addr constant [6 x i8] c"admin\00", align 1
@DB_USER = global ptr @.str.3, align 8
@.str.4 = private unnamed_addr constant [13 x i8] c"DBSecret2024\00", align 1
@DB_PASS = global ptr @.str.4, align 8
@failed_attempts = internal global i32 0, align 4
@.str.5 = private unnamed_addr constant [32 x i8] c"=== Authentication System ===\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Usage: %s <password> [api_token]\0A\00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c"ERROR: Account locked!\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"Validating password...\0A\00", align 1
@.str.9 = private unnamed_addr constant [25 x i8] c"FAIL: Invalid password!\0A\00", align 1
@.str.10 = private unnamed_addr constant [24 x i8] c"Remaining attempts: %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"SUCCESS: Password validated!\0A\00", align 1
@.str.12 = private unnamed_addr constant [26 x i8] c"\0AValidating API token...\0A\00", align 1
@.str.13 = private unnamed_addr constant [27 x i8] c"SUCCESS: API token valid!\0A\00", align 1
@.str.14 = private unnamed_addr constant [23 x i8] c"\0ADatabase Connection:\0A\00", align 1
@.str.15 = private unnamed_addr constant [12 x i8] c"  Host: %s\0A\00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"  User: %s\0A\00", align 1
@.str.17 = private unnamed_addr constant [12 x i8] c"  Pass: %s\0A\00", align 1
@.str.18 = private unnamed_addr constant [26 x i8] c"FAIL: Invalid API token!\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @validate_password(ptr noundef %0) #0 {
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
  %9 = load ptr, ptr @MASTER_PASSWORD, align 8
  %10 = call i32 @strcmp(ptr noundef %8, ptr noundef %9) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %7
  store i32 0, ptr @failed_attempts, align 4
  store i32 1, ptr %2, align 4
  br label %16

13:                                               ; preds = %7
  %14 = load i32, ptr @failed_attempts, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr @failed_attempts, align 4
  store i32 0, ptr %2, align 4
  br label %16

16:                                               ; preds = %13, %12, %6
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: nounwind
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @is_locked() #0 {
  %1 = load i32, ptr @failed_attempts, align 4
  %2 = icmp sge i32 %1, 3
  %3 = zext i1 %2 to i32
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @check_api_token(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %13

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr @API_SECRET, align 8
  %10 = call i32 @strcmp(ptr noundef %8, ptr noundef %9) #4
  %11 = icmp eq i32 %10, 0
  %12 = zext i1 %11 to i32
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %7, %6
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @get_db_credentials(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr @DB_HOST, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i64 @llvm.objectsize.i64.p0(ptr %9, i1 false, i1 true, i1 false)
  %11 = call ptr @__strcpy_chk(ptr noundef %7, ptr noundef %8, i64 noundef %10) #4
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr @DB_USER, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = call i64 @llvm.objectsize.i64.p0(ptr %14, i1 false, i1 true, i1 false)
  %16 = call ptr @__strcpy_chk(ptr noundef %12, ptr noundef %13, i64 noundef %15) #4
  %17 = load ptr, ptr %6, align 8
  %18 = load ptr, ptr @DB_PASS, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = call i64 @llvm.objectsize.i64.p0(ptr %19, i1 false, i1 true, i1 false)
  %21 = call ptr @__strcpy_chk(ptr noundef %17, ptr noundef %18, i64 noundef %20) #4
  ret void
}

; Function Attrs: nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @reset_attempts() #0 {
  store i32 0, ptr @failed_attempts, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @get_remaining() #0 {
  %1 = load i32, ptr @failed_attempts, align 4
  %2 = sub nsw i32 3, %1
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca [256 x i8], align 1
  %9 = alloca [256 x i8], align 1
  %10 = alloca [256 x i8], align 1
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %12, 2
  br i1 %13, label %14, label %19

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %17)
  store i32 1, ptr %3, align 4
  br label %64

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 1
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %6, align 8
  %23 = call i32 @is_locked()
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %19
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 1, ptr %3, align 4
  br label %64

27:                                               ; preds = %19
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %29 = load ptr, ptr %6, align 8
  %30 = call i32 @validate_password(ptr noundef %29)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %36, label %32

32:                                               ; preds = %27
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %34 = call i32 @get_remaining()
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %34)
  store i32 1, ptr %3, align 4
  br label %64

36:                                               ; preds = %27
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %38 = load i32, ptr %4, align 4
  %39 = icmp sge i32 %38, 3
  br i1 %39, label %40, label %63

40:                                               ; preds = %36
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds ptr, ptr %41, i64 2
  %43 = load ptr, ptr %42, align 8
  store ptr %43, ptr %7, align 8
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %45 = load ptr, ptr %7, align 8
  %46 = call i32 @check_api_token(ptr noundef %45)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %60

48:                                               ; preds = %40
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %50 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %51 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  %52 = getelementptr inbounds [256 x i8], ptr %10, i64 0, i64 0
  call void @get_db_credentials(ptr noundef %50, ptr noundef %51, ptr noundef %52)
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %54 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %54)
  %56 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, ptr noundef %56)
  %58 = getelementptr inbounds [256 x i8], ptr %10, i64 0, i64 0
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, ptr noundef %58)
  br label %62

60:                                               ; preds = %40
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %62

62:                                               ; preds = %60, %48
  br label %63

63:                                               ; preds = %62, %36
  store i32 0, ptr %3, align 4
  br label %64

64:                                               ; preds = %63, %32, %25, %14
  %65 = load i32, ptr %3, align 4
  ret i32 %65
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 17.0.0 (clang-1700.0.13.3)"}
