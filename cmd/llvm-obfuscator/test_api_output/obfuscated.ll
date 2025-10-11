; ModuleID = 'test_api_output/factorial_recursive_obfuscated.bc'
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

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @validate_input(i32 noundef %0) #0 {
  %.reg2mem = alloca i1, align 1
  br label %.split

.split:                                           ; preds = %1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %5, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 0, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 0, label %first
    i32 1, label %7
    i32 2, label %9
    i32 3, label %13
    i32 4, label %15
    i32 5, label %16
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %6 = select i1 %.reload, i32 1, i32 2
  br label %first.split

first.split:                                      ; preds = %first
  store i32 %6, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

7:                                                ; preds = %loopEntry.split
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %2, align 4
  br label %.split2

.split2:                                          ; preds = %7
  store i32 5, ptr %switchVar, align 4
  br label %.split2.split

.split2.split:                                    ; preds = %.split2
  br label %loopEnd

9:                                                ; preds = %loopEntry.split
  %10 = load i32, ptr %3, align 4
  br label %.split3

.split3:                                          ; preds = %9
  %11 = icmp sgt i32 %10, 20
  %12 = select i1 %11, i32 3, i32 4
  store i32 %12, ptr %switchVar, align 4
  br label %.split3.split

.split3.split:                                    ; preds = %.split3
  br label %loopEnd

13:                                               ; preds = %loopEntry.split
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %.split4

.split4:                                          ; preds = %13
  store i32 0, ptr %2, align 4
  store i32 5, ptr %switchVar, align 4
  br label %.split4.split

.split4.split:                                    ; preds = %.split4
  br label %loopEnd

15:                                               ; preds = %loopEntry.split
  store i32 1, ptr %2, align 4
  br label %.split5

.split5:                                          ; preds = %15
  store i32 5, ptr %switchVar, align 4
  br label %.split5.split

.split5.split:                                    ; preds = %.split5
  br label %loopEnd

16:                                               ; preds = %loopEntry.split
  %17 = load i32, ptr %2, align 4
  br label %.split6

.split6:                                          ; preds = %16
  ret i32 %17

loopEnd:                                          ; preds = %.split5.split, %.split4.split, %.split3.split, %.split2.split, %first.split.split, %switchDefault
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
  br label %.split

.split:                                           ; preds = %1
  %5 = icmp eq i32 %4, 0
  store i1 %5, ptr %.reg2mem, align 1
  br label %.split.split

.split.split:                                     ; preds = %.split
  %switchVar = alloca i32, align 4
  store i32 -2088248668, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %6 = load i32, ptr @x.1, align 4
  %7 = load i32, ptr @y.2, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  %8 = sub i32 %6, 1
  %9 = mul i32 %6, %8
  %10 = urem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  br label %loopEntry.split.split

loopEntry.split.split:                            ; preds = %loopEntry.split
  %12 = icmp slt i32 %7, 10
  %13 = or i1 %11, %12
  br i1 %13, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %loopEntry.split.split, %originalBBalteredBB.split
  %switchVar1 = load i32, ptr %switchVar, align 4
  %14 = load i32, ptr @x.1, align 4
  %15 = load i32, ptr @y.2, align 4
  %16 = sub i32 %14, 1
  %17 = mul i32 %14, %16
  %18 = urem i32 %17, 2
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %19 = icmp eq i32 %18, 0
  %20 = icmp slt i32 %15, 10
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %21 = or i1 %19, %20
  br i1 %21, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  switch i32 %switchVar1, label %switchDefault [
    i32 -2088248668, label %first
    i32 1066106727, label %23
    i32 -1968052623, label %27
    i32 -417948702, label %28
    i32 1051815756, label %38
  ]

switchDefault:                                    ; preds = %originalBBpart2
  br label %loopEnd

first:                                            ; preds = %originalBBpart2
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %22 = select i1 %.reload, i32 -1968052623, i32 1066106727
  store i32 %22, ptr %switchVar, align 4
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  br label %loopEnd

23:                                               ; preds = %originalBBpart2
  %24 = load i32, ptr %3, align 4
  %25 = icmp eq i32 %24, 1
  br label %.split6

.split6:                                          ; preds = %23
  %26 = select i1 %25, i32 -1968052623, i32 -417948702
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  store i32 %26, ptr %switchVar, align 4
  br label %loopEnd

27:                                               ; preds = %originalBBpart2
  store i64 1, ptr %2, align 8
  br label %.split7

.split7:                                          ; preds = %27
  store i32 1051815756, ptr %switchVar, align 4
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  br label %loopEnd

28:                                               ; preds = %originalBBpart2
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32, ptr %3, align 4
  %32 = add i32 %31, 789142084
  %33 = sub i32 %32, 1
  %34 = sub i32 %33, 789142084
  %35 = sub nsw i32 %31, 1
  br label %.split8

.split8:                                          ; preds = %28
  %36 = call i64 @factorial_recursive(i32 noundef %34)
  br label %.split8.split

.split8.split:                                    ; preds = %.split8
  %37 = mul i64 %30, %36
  store i64 %37, ptr %2, align 8
  store i32 1051815756, ptr %switchVar, align 4
  br label %loopEnd

38:                                               ; preds = %originalBBpart2
  %39 = load i32, ptr @x.1, align 4
  %40 = load i32, ptr @y.2, align 4
  %41 = sub i32 %39, 1
  %42 = mul i32 %39, %41
  br label %.split9

.split9:                                          ; preds = %38
  %43 = urem i32 %42, 2
  %44 = icmp eq i32 %43, 0
  %45 = icmp slt i32 %40, 10
  %46 = or i1 %44, %45
  br label %.split9.split

.split9.split:                                    ; preds = %.split9
  br i1 %46, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split9.split, %originalBB2alteredBB.split
  %47 = load i64, ptr %2, align 8
  %48 = load i32, ptr @x.1, align 4
  %49 = load i32, ptr @y.2, align 4
  %50 = sub i32 %48, 1
  %51 = mul i32 %48, %50
  %52 = urem i32 %51, 2
  %53 = icmp eq i32 %52, 0
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %54 = icmp slt i32 %49, 10
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %55 = or i1 %53, %54
  br i1 %55, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  ret i64 %47

loopEnd:                                          ; preds = %.split8.split, %.split7.split, %.split6.split, %first.split.split, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %loopEntry.split.split
  %switchVar1alteredBB = load i32, ptr %switchVar, align 4
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split9.split
  %56 = load i64, ptr %2, align 8
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  br label %originalBB2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @display_result(i32 noundef %0, i64 noundef %1) #0 {
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
  store i64 %1, ptr %4, align 8
  br label %.split

.split:                                           ; preds = %2
  %5 = load i32, ptr %3, align 4
  br label %.split.split

.split.split:                                     ; preds = %.split
  %6 = icmp slt i32 %5, 5
  store i1 %6, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 -1912886220, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %originalBBpart212
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 -1912886220, label %first
    i32 -663264546, label %24
    i32 1908447254, label %28
    i32 -605553435, label %32
    i32 1299939570, label %36
    i32 -1554909044, label %40
    i32 -948887141, label %57
  ]

switchDefault:                                    ; preds = %loopEntry.split
  %7 = load i32, ptr @x.3, align 4
  br label %switchDefault.split

switchDefault.split:                              ; preds = %switchDefault
  %8 = load i32, ptr @y.4, align 4
  %9 = sub i32 %7, 1
  %10 = mul i32 %7, %9
  %11 = urem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  %13 = icmp slt i32 %8, 10
  %14 = or i1 %12, %13
  br label %switchDefault.split.split

switchDefault.split.split:                        ; preds = %switchDefault.split
  br i1 %14, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %switchDefault.split.split, %originalBBalteredBB
  %15 = load i32, ptr @x.3, align 4
  %16 = load i32, ptr @y.4, align 4
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %17 = sub i32 %15, 1
  %18 = mul i32 %15, %17
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %19 = urem i32 %18, 2
  %20 = icmp eq i32 %19, 0
  %21 = icmp slt i32 %16, 10
  %22 = or i1 %20, %21
  br i1 %22, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %.reload = load i1, ptr %.reg2mem, align 1
  br label %first.split

first.split:                                      ; preds = %first
  %23 = select i1 %.reload, i32 -663264546, i32 1908447254
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  store i32 %23, ptr %switchVar, align 4
  br label %loopEnd

24:                                               ; preds = %loopEntry.split
  %25 = load i32, ptr %3, align 4
  br label %.split14

.split14:                                         ; preds = %24
  %26 = load i64, ptr %4, align 8
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %25, i64 noundef %26)
  store i32 -948887141, ptr %switchVar, align 4
  br label %.split14.split

.split14.split:                                   ; preds = %.split14
  br label %loopEnd

28:                                               ; preds = %loopEntry.split
  %29 = load i32, ptr %3, align 4
  %30 = icmp slt i32 %29, 10
  br label %.split15

.split15:                                         ; preds = %28
  %31 = select i1 %30, i32 -605553435, i32 1299939570
  store i32 %31, ptr %switchVar, align 4
  br label %.split15.split

.split15.split:                                   ; preds = %.split15
  br label %loopEnd

32:                                               ; preds = %loopEntry.split
  %33 = load i32, ptr %3, align 4
  %34 = load i64, ptr %4, align 8
  br label %.split16

.split16:                                         ; preds = %32
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %33, i64 noundef %34)
  br label %.split16.split

.split16.split:                                   ; preds = %.split16
  store i32 -1554909044, ptr %switchVar, align 4
  br label %loopEnd

36:                                               ; preds = %loopEntry.split
  %37 = load i32, ptr %3, align 4
  br label %.split17

.split17:                                         ; preds = %36
  %38 = load i64, ptr %4, align 8
  br label %.split17.split

.split17.split:                                   ; preds = %.split17
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %37, i64 noundef %38)
  store i32 -1554909044, ptr %switchVar, align 4
  br label %loopEnd

40:                                               ; preds = %loopEntry.split
  %41 = load i32, ptr @x.3, align 4
  %42 = load i32, ptr @y.4, align 4
  br label %.split18

.split18:                                         ; preds = %40
  %43 = sub i32 %41, 1
  %44 = mul i32 %41, %43
  %45 = urem i32 %44, 2
  %46 = icmp eq i32 %45, 0
  %47 = icmp slt i32 %42, 10
  br label %.split18.split

.split18.split:                                   ; preds = %.split18
  %48 = or i1 %46, %47
  br i1 %48, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split18.split, %originalBB2alteredBB.split
  store i32 -948887141, ptr %switchVar, align 4
  %49 = load i32, ptr @x.3, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %50 = load i32, ptr @y.4, align 4
  %51 = sub i32 %49, 1
  %52 = mul i32 %49, %51
  %53 = urem i32 %52, 2
  %54 = icmp eq i32 %53, 0
  %55 = icmp slt i32 %50, 10
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %56 = or i1 %54, %55
  br i1 %56, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  br label %loopEnd

57:                                               ; preds = %loopEntry.split
  %58 = load i32, ptr @x.3, align 4
  %59 = load i32, ptr @y.4, align 4
  %60 = sub i32 %58, 1
  %61 = mul i32 %58, %60
  %62 = urem i32 %61, 2
  br label %.split19

.split19:                                         ; preds = %57
  %63 = icmp eq i32 %62, 0
  %64 = icmp slt i32 %59, 10
  br label %.split19.split

.split19.split:                                   ; preds = %.split19
  %65 = or i1 %63, %64
  br i1 %65, label %originalBB6, label %originalBB6alteredBB

originalBB6:                                      ; preds = %.split19.split, %originalBB6alteredBB
  %66 = load i32, ptr @x.3, align 4
  %67 = load i32, ptr @y.4, align 4
  %68 = sub i32 %66, 1
  br label %originalBB6.split

originalBB6.split:                                ; preds = %originalBB6
  %69 = mul i32 %66, %68
  %70 = urem i32 %69, 2
  %71 = icmp eq i32 %70, 0
  %72 = icmp slt i32 %67, 10
  %73 = or i1 %71, %72
  br label %originalBB6.split.split

originalBB6.split.split:                          ; preds = %originalBB6.split
  br i1 %73, label %originalBBpart28, label %originalBB6alteredBB

originalBBpart28:                                 ; preds = %originalBB6.split.split
  ret void

loopEnd:                                          ; preds = %originalBBpart24, %.split17.split, %.split16.split, %.split15.split, %.split14.split, %first.split.split, %originalBBpart2
  %74 = load i32, ptr @x.3, align 4
  br label %loopEnd.split

loopEnd.split:                                    ; preds = %loopEnd
  %75 = load i32, ptr @y.4, align 4
  %76 = sub i32 %74, 1
  %77 = mul i32 %74, %76
  %78 = urem i32 %77, 2
  br label %loopEnd.split.split

loopEnd.split.split:                              ; preds = %loopEnd.split
  %79 = icmp eq i32 %78, 0
  %80 = icmp slt i32 %75, 10
  %81 = or i1 %79, %80
  br i1 %81, label %originalBB10, label %originalBB10alteredBB

originalBB10:                                     ; preds = %loopEnd.split.split, %originalBB10alteredBB
  %82 = load i32, ptr @x.3, align 4
  br label %originalBB10.split

originalBB10.split:                               ; preds = %originalBB10
  %83 = load i32, ptr @y.4, align 4
  %84 = sub i32 %82, 1
  br label %originalBB10.split.split

originalBB10.split.split:                         ; preds = %originalBB10.split
  %85 = mul i32 %82, %84
  %86 = urem i32 %85, 2
  %87 = icmp eq i32 %86, 0
  %88 = icmp slt i32 %83, 10
  %89 = or i1 %87, %88
  br i1 %89, label %originalBBpart212, label %originalBB10alteredBB

originalBBpart212:                                ; preds = %originalBB10.split.split
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %switchDefault.split.split
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split18.split
  store i32 -948887141, ptr %switchVar, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  br label %originalBB2

originalBB6alteredBB:                             ; preds = %originalBB6.split.split, %.split19.split
  br label %originalBB6

originalBB10alteredBB:                            ; preds = %originalBB10.split.split, %loopEnd.split.split
  br label %originalBB10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @print_header() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %.split

.split:                                           ; preds = %0
  %2 = load ptr, ptr @APP_NAME, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %2)
  %4 = load ptr, ptr @VERSION, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %4)
  br label %.split.split

.split.split:                                     ; preds = %.split
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
  br label %.split

.split:                                           ; preds = %2
  %7 = alloca i64, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  call void @print_header()
  %8 = load i32, ptr %4, align 4
  %9 = icmp ne i32 %8, 2
  br label %.split.split

.split.split:                                     ; preds = %.split
  store i1 %9, ptr %.reg2mem, align 1
  %switchVar = alloca i32, align 4
  store i32 581842719, ptr %switchVar, align 4
  br label %loopEntry

loopEntry:                                        ; preds = %.split.split, %loopEnd
  %switchVar1 = load i32, ptr %switchVar, align 4
  br label %loopEntry.split

loopEntry.split:                                  ; preds = %loopEntry
  switch i32 %switchVar1, label %switchDefault [
    i32 581842719, label %first
    i32 305202159, label %27
    i32 1863796104, label %33
    i32 -636603446, label %42
    i32 -6588957, label %43
    i32 1585768470, label %49
  ]

switchDefault:                                    ; preds = %loopEntry.split
  br label %loopEnd

first:                                            ; preds = %loopEntry.split
  %10 = load i32, ptr @x.7, align 4
  %11 = load i32, ptr @y.8, align 4
  %12 = sub i32 %10, 1
  %13 = mul i32 %10, %12
  br label %first.split

first.split:                                      ; preds = %first
  %14 = urem i32 %13, 2
  %15 = icmp eq i32 %14, 0
  %16 = icmp slt i32 %11, 10
  br label %first.split.split

first.split.split:                                ; preds = %first.split
  %17 = or i1 %15, %16
  br i1 %17, label %originalBB, label %originalBBalteredBB

originalBB:                                       ; preds = %first.split.split, %originalBBalteredBB.split.split
  %.reload = load i1, ptr %.reg2mem, align 1
  %18 = select i1 %.reload, i32 305202159, i32 1863796104
  store i32 %18, ptr %switchVar, align 4
  %19 = load i32, ptr @x.7, align 4
  %20 = load i32, ptr @y.8, align 4
  %21 = sub i32 %19, 1
  %22 = mul i32 %19, %21
  br label %originalBB.split

originalBB.split:                                 ; preds = %originalBB
  %23 = urem i32 %22, 2
  %24 = icmp eq i32 %23, 0
  %25 = icmp slt i32 %20, 10
  br label %originalBB.split.split

originalBB.split.split:                           ; preds = %originalBB.split
  %26 = or i1 %24, %25
  br i1 %26, label %originalBBpart2, label %originalBBalteredBB

originalBBpart2:                                  ; preds = %originalBB.split.split
  br label %loopEnd

27:                                               ; preds = %loopEntry.split
  %28 = load ptr, ptr %5, align 8
  br label %.split6

.split6:                                          ; preds = %27
  %29 = getelementptr inbounds ptr, ptr %28, i64 0
  %30 = load ptr, ptr %29, align 8
  br label %.split6.split

.split6.split:                                    ; preds = %.split6
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %30)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  store i32 1, ptr %3, align 4
  store i32 1585768470, ptr %switchVar, align 4
  br label %loopEnd

33:                                               ; preds = %loopEntry.split
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds ptr, ptr %34, i64 1
  %36 = load ptr, ptr %35, align 8
  %37 = call i32 @atoi(ptr noundef %36)
  store i32 %37, ptr %6, align 4
  br label %.split7

.split7:                                          ; preds = %33
  %38 = load i32, ptr %6, align 4
  %39 = call i32 @validate_input(i32 noundef %38)
  %40 = icmp ne i32 %39, 0
  %41 = select i1 %40, i32 -6588957, i32 -636603446
  br label %.split7.split

.split7.split:                                    ; preds = %.split7
  store i32 %41, ptr %switchVar, align 4
  br label %loopEnd

42:                                               ; preds = %loopEntry.split
  store i32 1, ptr %3, align 4
  br label %.split8

.split8:                                          ; preds = %42
  store i32 1585768470, ptr %switchVar, align 4
  br label %.split8.split

.split8.split:                                    ; preds = %.split8
  br label %loopEnd

43:                                               ; preds = %loopEntry.split
  %44 = load i32, ptr %6, align 4
  %45 = call i64 @factorial_recursive(i32 noundef %44)
  store i64 %45, ptr %7, align 8
  %46 = load i32, ptr %6, align 4
  %47 = load i64, ptr %7, align 8
  call void @display_result(i32 noundef %46, i64 noundef %47)
  br label %.split9

.split9:                                          ; preds = %43
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 0, ptr %3, align 4
  store i32 1585768470, ptr %switchVar, align 4
  br label %.split9.split

.split9.split:                                    ; preds = %.split9
  br label %loopEnd

49:                                               ; preds = %loopEntry.split
  %50 = load i32, ptr @x.7, align 4
  br label %.split10

.split10:                                         ; preds = %49
  %51 = load i32, ptr @y.8, align 4
  %52 = sub i32 %50, 1
  %53 = mul i32 %50, %52
  %54 = urem i32 %53, 2
  %55 = icmp eq i32 %54, 0
  %56 = icmp slt i32 %51, 10
  br label %.split10.split

.split10.split:                                   ; preds = %.split10
  %57 = or i1 %55, %56
  br i1 %57, label %originalBB2, label %originalBB2alteredBB

originalBB2:                                      ; preds = %.split10.split, %originalBB2alteredBB.split
  %58 = load i32, ptr %3, align 4
  %59 = load i32, ptr @x.7, align 4
  %60 = load i32, ptr @y.8, align 4
  br label %originalBB2.split

originalBB2.split:                                ; preds = %originalBB2
  %61 = sub i32 %59, 1
  %62 = mul i32 %59, %61
  %63 = urem i32 %62, 2
  %64 = icmp eq i32 %63, 0
  %65 = icmp slt i32 %60, 10
  br label %originalBB2.split.split

originalBB2.split.split:                          ; preds = %originalBB2.split
  %66 = or i1 %64, %65
  br i1 %66, label %originalBBpart24, label %originalBB2alteredBB

originalBBpart24:                                 ; preds = %originalBB2.split.split
  ret i32 %58

loopEnd:                                          ; preds = %.split9.split, %.split8.split, %.split7.split, %.split6.split, %originalBBpart2, %switchDefault
  br label %loopEntry

originalBBalteredBB:                              ; preds = %originalBB.split.split, %first.split.split
  %.reloadalteredBB = load i1, ptr %.reg2mem, align 1
  br label %originalBBalteredBB.split

originalBBalteredBB.split:                        ; preds = %originalBBalteredBB
  %67 = select i1 %.reloadalteredBB, i32 305202159, i32 1863796104
  br label %originalBBalteredBB.split.split

originalBBalteredBB.split.split:                  ; preds = %originalBBalteredBB.split
  store i32 %67, ptr %switchVar, align 4
  br label %originalBB

originalBB2alteredBB:                             ; preds = %originalBB2.split.split, %.split10.split
  %68 = load i32, ptr %3, align 4
  br label %originalBB2alteredBB.split

originalBB2alteredBB.split:                       ; preds = %originalBB2alteredBB
  br label %originalBB2
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
