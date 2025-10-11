; ModuleID = '/Users/akashsingh/Desktop/llvm/test_results/ir/07b_after_flatten.ll'
source_filename = "/Users/akashsingh/Desktop/llvm/src/simple_auth.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [15 x i8] c"AdminPass2024!\00", align 1
@MASTER_PASSWORD = local_unnamed_addr global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"sk_live_secret_12345\00", align 1
@API_SECRET = local_unnamed_addr global ptr @.str.1, align 8
@.str.2 = private unnamed_addr constant [18 x i8] c"db.production.com\00", align 1
@DB_HOST = local_unnamed_addr global ptr @.str.2, align 8
@.str.3 = private unnamed_addr constant [6 x i8] c"admin\00", align 1
@DB_USER = local_unnamed_addr global ptr @.str.3, align 8
@.str.4 = private unnamed_addr constant [13 x i8] c"DBSecret2024\00", align 1
@DB_PASS = local_unnamed_addr global ptr @.str.4, align 8
@failed_attempts = internal unnamed_addr global i32 0, align 4
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
define i32 @validate_password(ptr noundef %0) local_unnamed_addr #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %loopEnd, %1
  %switchVar1 = load i32, ptr %switchVar, align 4
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %7
    i32 2, label %8
    i32 3, label %14
    i32 4, label %15
    i32 5, label %18
  ]

switchDefault:                                    ; preds = %loopEntry
  br label %loopEnd

first:                                            ; preds = %loopEntry
  %.reload = load i1, ptr %.reg2mem, align 1
  %6 = select i1 %.reload, i32 2, i32 1
  store i32 %6, ptr %switchVar, align 4
  br label %loopEnd

7:                                                ; preds = %loopEntry
  store i32 0, ptr %2, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

8:                                                ; preds = %loopEntry
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr @MASTER_PASSWORD, align 8
  %11 = call i32 @strcmp(ptr noundef %9, ptr noundef %10) #4
  %12 = icmp eq i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %switchVar, align 4
  br label %loopEnd

14:                                               ; preds = %loopEntry
  store i32 0, ptr @failed_attempts, align 4
  store i32 1, ptr %2, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

15:                                               ; preds = %loopEntry
  %16 = load i32, ptr @failed_attempts, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr @failed_attempts, align 4
  store i32 0, ptr %2, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

18:                                               ; preds = %loopEntry
  %19 = load i32, ptr %2, align 4
  ret i32 %19

loopEnd:                                          ; preds = %15, %14, %8, %7, %first, %switchDefault
  br label %loopEntry
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: read)
declare i32 @strcmp(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define range(i32 0, 2) i32 @is_locked() local_unnamed_addr #0 {
  %1 = load i32, ptr @failed_attempts, align 4
  %2 = icmp sge i32 %1, 3
  %3 = zext i1 %2 to i32
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @check_api_token(ptr noundef %0) local_unnamed_addr #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %loopEnd, %1
  %switchVar1 = load i32, ptr %switchVar, align 4
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %7
    i32 2, label %8
    i32 3, label %14
  ]

switchDefault:                                    ; preds = %loopEntry
  br label %loopEnd

first:                                            ; preds = %loopEntry
  %.reload = load i1, ptr %.reg2mem, align 1
  %6 = select i1 %.reload, i32 2, i32 1
  store i32 %6, ptr %switchVar, align 4
  br label %loopEnd

7:                                                ; preds = %loopEntry
  store i32 0, ptr %2, align 4
  store i32 3, ptr %switchVar, align 4
  br label %loopEnd

8:                                                ; preds = %loopEntry
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr @API_SECRET, align 8
  %11 = call i32 @strcmp(ptr noundef %9, ptr noundef %10) #4
  %12 = icmp eq i32 %11, 0
  %13 = zext i1 %12 to i32
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %switchVar, align 4
  br label %loopEnd

14:                                               ; preds = %loopEntry
  %15 = load i32, ptr %2, align 4
  ret i32 %15

loopEnd:                                          ; preds = %8, %7, %first, %switchDefault
  br label %loopEntry
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @get_db_credentials(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #0 {
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

; Function Attrs: nofree nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @reset_attempts() local_unnamed_addr #0 {
  store i32 0, ptr @failed_attempts, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define range(i32 -2147483644, -2147483648) i32 @get_remaining() local_unnamed_addr #0 {
  %1 = load i32, ptr @failed_attempts, align 4
  %2 = sub nsw i32 3, %1
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %.reg2mem = alloca i1, align 1
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
  store i1 %13, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %loopEnd, %2
  %switchVar1 = load i32, ptr %switchVar, align 4
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %15
    i32 2, label %20
    i32 3, label %27
    i32 4, label %29
    i32 5, label %35
    i32 6, label %39
    i32 7, label %44
    i32 8, label %53
    i32 9, label %65
    i32 10, label %67
    i32 11, label %68
    i32 12, label %69
  ]

switchDefault:                                    ; preds = %loopEntry
  br label %loopEnd

first:                                            ; preds = %loopEntry
  %.reload = load i1, ptr %.reg2mem, align 1
  %14 = select i1 %.reload, i32 1, i32 2
  store i32 %14, ptr %switchVar, align 4
  br label %loopEnd

15:                                               ; preds = %loopEntry
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw ptr, ptr %16, i64 0
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %18)
  store i32 1, ptr %3, align 4
  store i32 12, ptr %switchVar, align 4
  br label %loopEnd

20:                                               ; preds = %loopEntry
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw ptr, ptr %21, i64 1
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %6, align 8
  %24 = call i32 @is_locked()
  %25 = icmp ne i32 %24, 0
  %26 = select i1 %25, i32 3, i32 4
  store i32 %26, ptr %switchVar, align 4
  br label %loopEnd

27:                                               ; preds = %loopEntry
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 1, ptr %3, align 4
  store i32 12, ptr %switchVar, align 4
  br label %loopEnd

29:                                               ; preds = %loopEntry
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %31 = load ptr, ptr %6, align 8
  %32 = call i32 @validate_password(ptr noundef %31)
  %33 = icmp ne i32 %32, 0
  %34 = select i1 %33, i32 6, i32 5
  store i32 %34, ptr %switchVar, align 4
  br label %loopEnd

35:                                               ; preds = %loopEntry
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %37 = call i32 @get_remaining()
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %37)
  store i32 1, ptr %3, align 4
  store i32 12, ptr %switchVar, align 4
  br label %loopEnd

39:                                               ; preds = %loopEntry
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %41 = load i32, ptr %4, align 4
  %42 = icmp sge i32 %41, 3
  %43 = select i1 %42, i32 7, i32 11
  store i32 %43, ptr %switchVar, align 4
  br label %loopEnd

44:                                               ; preds = %loopEntry
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds nuw ptr, ptr %45, i64 2
  %47 = load ptr, ptr %46, align 8
  store ptr %47, ptr %7, align 8
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %49 = load ptr, ptr %7, align 8
  %50 = call i32 @check_api_token(ptr noundef %49)
  %51 = icmp ne i32 %50, 0
  %52 = select i1 %51, i32 8, i32 9
  store i32 %52, ptr %switchVar, align 4
  br label %loopEnd

53:                                               ; preds = %loopEntry
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %55 = getelementptr inbounds nuw [256 x i8], ptr %8, i64 0, i64 0
  %56 = getelementptr inbounds nuw [256 x i8], ptr %9, i64 0, i64 0
  %57 = getelementptr inbounds nuw [256 x i8], ptr %10, i64 0, i64 0
  call void @get_db_credentials(ptr noundef %55, ptr noundef %56, ptr noundef %57)
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %59 = getelementptr inbounds nuw [256 x i8], ptr %8, i64 0, i64 0
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %59)
  %61 = getelementptr inbounds nuw [256 x i8], ptr %9, i64 0, i64 0
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, ptr noundef %61)
  %63 = getelementptr inbounds nuw [256 x i8], ptr %10, i64 0, i64 0
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, ptr noundef %63)
  store i32 10, ptr %switchVar, align 4
  br label %loopEnd

65:                                               ; preds = %loopEntry
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  store i32 10, ptr %switchVar, align 4
  br label %loopEnd

67:                                               ; preds = %loopEntry
  store i32 11, ptr %switchVar, align 4
  br label %loopEnd

68:                                               ; preds = %loopEntry
  store i32 0, ptr %3, align 4
  store i32 12, ptr %switchVar, align 4
  br label %loopEnd

69:                                               ; preds = %loopEntry
  %70 = load i32, ptr %3, align 4
  ret i32 %70

loopEnd:                                          ; preds = %68, %67, %65, %53, %44, %39, %35, %29, %27, %20, %15, %first, %switchDefault
  br label %loopEntry
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: read) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 17.0.0 (clang-1700.0.13.3)"}
