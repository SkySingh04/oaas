; ModuleID = '/Users/akashsingh/Desktop/llvm/src/factorial_recursive.c'
source_filename = "/Users/akashsingh/Desktop/llvm/src/factorial_recursive.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [41 x i8] c"Factorial Calculator - Recursive Version\00", align 1
@APP_NAME = global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [7 x i8] c"v1.0.0\00", align 1
@VERSION = global ptr @.str.1, align 8
@.str.2 = private unnamed_addr constant [14 x i8] c"Research Team\00", align 1
@AUTHOR = global ptr @.str.2, align 8
@.str.3 = private unnamed_addr constant [39 x i8] c"Error: Negative numbers not supported\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"Warning: Result may overflow for n > 20\0A\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"Small factorial: %d! = %llu\0A\00", align 1
@.str.6 = private unnamed_addr constant [30 x i8] c"Medium factorial: %d! = %llu\0A\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Large factorial: %d! = %llu\0A\00", align 1
@.str.8 = private unnamed_addr constant [34 x i8] c"================================\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"Version: %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Author: %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"================================\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"Usage: %s <number>\0A\00", align 1
@.str.14 = private unnamed_addr constant [38 x i8] c"Calculate factorial for numbers 1-20\0A\00", align 1
@.str.15 = private unnamed_addr constant [38 x i8] c"\0ACalculation completed successfully!\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @validate_input(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %2, align 4
  br label %14

8:                                                ; preds = %1
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 20
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %2, align 4
  br label %14

13:                                               ; preds = %8
  store i32 1, ptr %2, align 4
  br label %14

14:                                               ; preds = %13, %11, %6
  %15 = load i32, ptr %2, align 4
  ret i32 %15
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @factorial_recursive(i32 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %9, label %6

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %9, label %10

9:                                                ; preds = %6, %1
  store i64 1, ptr %2, align 8
  br label %17

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = sext i32 %11 to i64
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 1
  %15 = call i64 @factorial_recursive(i32 noundef %14)
  %16 = mul i64 %12, %15
  store i64 %16, ptr %2, align 8
  br label %17

17:                                               ; preds = %10, %9
  %18 = load i64, ptr %2, align 8
  ret i64 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @display_result(i32 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
  store i64 %1, ptr %4, align 8
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 5
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load i32, ptr %3, align 4
  %9 = load i64, ptr %4, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %8, i64 noundef %9)
  br label %23

11:                                               ; preds = %2
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %12, 10
  br i1 %13, label %14, label %18

14:                                               ; preds = %11
  %15 = load i32, ptr %3, align 4
  %16 = load i64, ptr %4, align 8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %15, i64 noundef %16)
  br label %22

18:                                               ; preds = %11
  %19 = load i32, ptr %3, align 4
  %20 = load i64, ptr %4, align 8
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %19, i64 noundef %20)
  br label %22

22:                                               ; preds = %18, %14
  br label %23

23:                                               ; preds = %22, %7
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @print_header() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %2 = load ptr, ptr @APP_NAME, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %2)
  %4 = load ptr, ptr @VERSION, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %4)
  %6 = load ptr, ptr @AUTHOR, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %6)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  call void @print_header()
  %8 = load i32, ptr %4, align 4
  %9 = icmp ne i32 %8, 2
  br i1 %9, label %10, label %16

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds ptr, ptr %11, i64 0
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  store i32 1, ptr %3, align 4
  br label %31

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 1
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @atoi(ptr noundef %19)
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %6, align 4
  %22 = call i32 @validate_input(i32 noundef %21)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %25, label %24

24:                                               ; preds = %16
  store i32 1, ptr %3, align 4
  br label %31

25:                                               ; preds = %16
  %26 = load i32, ptr %6, align 4
  %27 = call i64 @factorial_recursive(i32 noundef %26)
  store i64 %27, ptr %7, align 8
  %28 = load i32, ptr %6, align 4
  %29 = load i64, ptr %7, align 8
  call void @display_result(i32 noundef %28, i64 noundef %29)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 0, ptr %3, align 4
  br label %31

31:                                               ; preds = %25, %24, %10
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

declare i32 @atoi(ptr noundef) #1

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 17.0.0 (clang-1700.0.13.3)"}
