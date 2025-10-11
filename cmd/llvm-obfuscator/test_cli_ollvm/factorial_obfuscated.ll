; ModuleID = 'test_cli_ollvm/factorial_recursive_obfuscated.bc'
source_filename = "/Users/akashsingh/Desktop/llvm/src/factorial_recursive.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
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
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %1, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %7
    i32 2, label %9
    i32 3, label %13
    i32 4, label %15
    i32 5, label %16
  ]

switchDefault:                                    ; preds = %loopEntry
  br label %loopEnd

first:                                            ; preds = %loopEntry
  %.reload = load i1, ptr %.reg2mem, align 1
  %6 = select i1 %.reload, i32 1, i32 2
  store i32 %6, ptr %switchVar, align 4
  br label %loopEnd

7:                                                ; preds = %loopEntry
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %2, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

9:                                                ; preds = %loopEntry
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 20
  %12 = select i1 %11, i32 3, i32 4
  store i32 %12, ptr %switchVar, align 4
  br label %loopEnd

13:                                               ; preds = %loopEntry
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %2, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

15:                                               ; preds = %loopEntry
  store i32 1, ptr %2, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

16:                                               ; preds = %loopEntry
  %17 = load i32, ptr %2, align 4
  ret i32 %17

loopEnd:                                          ; preds = %15, %13, %9, %7, %first, %switchDefault
  br label %loopEntry
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @factorial_recursive(i32 noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %1, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %7
    i32 2, label %11
    i32 3, label %12
    i32 4, label %19
  ]

switchDefault:                                    ; preds = %loopEntry
  br label %loopEnd

first:                                            ; preds = %loopEntry
  %.reload = load i1, ptr %.reg2mem, align 1
  %6 = select i1 %.reload, i32 2, i32 1
  store i32 %6, ptr %switchVar, align 4
  br label %loopEnd

7:                                                ; preds = %loopEntry
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 1
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %switchVar, align 4
  br label %loopEnd

11:                                               ; preds = %loopEntry
  store i64 1, ptr %2, align 8
  store i32 4, ptr %switchVar, align 4
  br label %loopEnd

12:                                               ; preds = %loopEntry
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32, ptr %3, align 4
  %16 = sub nsw i32 %15, 1
  %17 = call i64 @factorial_recursive(i32 noundef %16)
  %18 = mul i64 %14, %17
  store i64 %18, ptr %2, align 8
  store i32 4, ptr %switchVar, align 4
  br label %loopEnd

19:                                               ; preds = %loopEntry
  %20 = load i64, ptr %2, align 8
  ret i64 %20

loopEnd:                                          ; preds = %12, %11, %7, %first, %switchDefault
  br label %loopEntry
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @display_result(i32 noundef %0, i64 noundef %1) #0 {
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
  store i64 %1, ptr %4, align 8
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 5
  store i1 %6, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %2, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %24
    i32 6, label %25
  ]

switchDefault:                                    ; preds = %loopEntry
  br label %loopEnd

first:                                            ; preds = %loopEntry
  %.reload = load i1, ptr %.reg2mem, align 1
  %7 = select i1 %.reload, i32 1, i32 2
  store i32 %7, ptr %switchVar, align 4
  br label %loopEnd

8:                                                ; preds = %loopEntry
  %9 = load i32, ptr %3, align 4
  %10 = load i64, ptr %4, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i64 noundef %10)
  store i32 6, ptr %switchVar, align 4
  br label %loopEnd

12:                                               ; preds = %loopEntry
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %13, 10
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %switchVar, align 4
  br label %loopEnd

16:                                               ; preds = %loopEntry
  %17 = load i32, ptr %3, align 4
  %18 = load i64, ptr %4, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %17, i64 noundef %18)
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

20:                                               ; preds = %loopEntry
  %21 = load i32, ptr %3, align 4
  %22 = load i64, ptr %4, align 8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %21, i64 noundef %22)
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

24:                                               ; preds = %loopEntry
  store i32 6, ptr %switchVar, align 4
  br label %loopEnd

25:                                               ; preds = %loopEntry
  ret void

loopEnd:                                          ; preds = %24, %20, %16, %12, %8, %first, %switchDefault
  br label %loopEntry
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
  %.reg2mem = alloca i1, align 1
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
  store i1 %9, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %2, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %11
    i32 2, label %17
    i32 3, label %26
    i32 4, label %27
    i32 5, label %33
  ]

switchDefault:                                    ; preds = %loopEntry
  br label %loopEnd

first:                                            ; preds = %loopEntry
  %.reload = load i1, ptr %.reg2mem, align 1
  %10 = select i1 %.reload, i32 1, i32 2
  store i32 %10, ptr %switchVar, align 4
  br label %loopEnd

11:                                               ; preds = %loopEntry
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 0
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %14)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  store i32 1, ptr %3, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

17:                                               ; preds = %loopEntry
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @atoi(ptr noundef %20)
  store i32 %21, ptr %6, align 4
  %22 = load i32, ptr %6, align 4
  %23 = call i32 @validate_input(i32 noundef %22)
  %24 = icmp ne i32 %23, 0
  %25 = select i1 %24, i32 4, i32 3
  store i32 %25, ptr %switchVar, align 4
  br label %loopEnd

26:                                               ; preds = %loopEntry
  store i32 1, ptr %3, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

27:                                               ; preds = %loopEntry
  %28 = load i32, ptr %6, align 4
  %29 = call i64 @factorial_recursive(i32 noundef %28)
  store i64 %29, ptr %7, align 8
  %30 = load i32, ptr %6, align 4
  %31 = load i64, ptr %7, align 8
  call void @display_result(i32 noundef %30, i64 noundef %31)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 0, ptr %3, align 4
  store i32 5, ptr %switchVar, align 4
  br label %loopEnd

33:                                               ; preds = %loopEntry
  %34 = load i32, ptr %3, align 4
  ret i32 %34

loopEnd:                                          ; preds = %27, %26, %17, %11, %first, %switchDefault
  br label %loopEntry
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
