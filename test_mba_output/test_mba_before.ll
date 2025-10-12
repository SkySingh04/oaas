; ModuleID = 'src/test_mba.c'
source_filename = "src/test_mba.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [38 x i8] c"=== Linear MBA Obfuscation Test ===\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Testing 32-bit operations:\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"  a = 0x%08X\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"  b = 0x%08X\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"  c = 0x%08X\0A\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"  AND: 0x%08X\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"  OR:  0x%08X\0A\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"  XOR: 0x%08X\0A\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"  Combined: 0x%08X\0A\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"  Hash step: 0x%08X\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"Testing different bit widths:\0A\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c"  8-bit:  0x%02X\0A\00", align 1
@.str.12 = private unnamed_addr constant [18 x i8] c"  16-bit: 0x%04X\0A\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"  64-bit: 0x%016llX\0A\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"\0A=== Test completed successfully! ===\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @test_and(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = and i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @test_or(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = or i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @test_xor(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = xor i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @test_combined(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = and i32 %10, %11
  store i32 %12, ptr %7, align 4
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %6, align 4
  %15 = or i32 %13, %14
  store i32 %15, ptr %8, align 4
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %4, align 4
  %18 = xor i32 %16, %17
  store i32 %18, ptr %9, align 4
  %19 = load i32, ptr %9, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @hash_step(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = xor i32 %6, %5
  store i32 %7, ptr %3, align 4
  %8 = load i32, ptr %3, align 4
  %9 = and i32 %8, -1
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr %4, align 4
  %11 = shl i32 %10, 4
  %12 = load i32, ptr %3, align 4
  %13 = or i32 %12, %11
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i8 @test_8bit(i8 noundef zeroext %0, i8 noundef zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  store i8 %1, ptr %4, align 1
  %5 = load i8, ptr %3, align 1
  %6 = zext i8 %5 to i32
  %7 = and i32 %6, 240
  %8 = load i8, ptr %4, align 1
  %9 = zext i8 %8 to i32
  %10 = and i32 %9, 15
  %11 = or i32 %7, %10
  %12 = trunc i32 %11 to i8
  ret i8 %12
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define zeroext i16 @test_16bit(i16 noundef zeroext %0, i16 noundef zeroext %1) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  store i16 %0, ptr %3, align 2
  store i16 %1, ptr %4, align 2
  %5 = load i16, ptr %3, align 2
  %6 = zext i16 %5 to i32
  %7 = load i16, ptr %4, align 2
  %8 = zext i16 %7 to i32
  %9 = xor i32 %6, %8
  %10 = and i32 %9, 65535
  %11 = trunc i32 %10 to i16
  ret i16 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @test_64bit(i64 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = or i64 %5, %6
  %8 = load i64, ptr %3, align 8
  %9 = load i64, ptr %4, align 8
  %10 = and i64 %8, %9
  %11 = xor i64 %7, %10
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 -559038737, ptr %2, align 4
  store i32 -889275714, ptr %3, align 4
  store i32 305419896, ptr %4, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %18 = load i32, ptr %2, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %18)
  %20 = load i32, ptr %3, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %20)
  %22 = load i32, ptr %4, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %22)
  %24 = load i32, ptr %2, align 4
  %25 = load i32, ptr %3, align 4
  %26 = call i32 @test_and(i32 noundef %24, i32 noundef %25)
  store i32 %26, ptr %5, align 4
  %27 = load i32, ptr %5, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %27)
  %29 = load i32, ptr %2, align 4
  %30 = load i32, ptr %3, align 4
  %31 = call i32 @test_or(i32 noundef %29, i32 noundef %30)
  store i32 %31, ptr %6, align 4
  %32 = load i32, ptr %6, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %32)
  %34 = load i32, ptr %2, align 4
  %35 = load i32, ptr %3, align 4
  %36 = call i32 @test_xor(i32 noundef %34, i32 noundef %35)
  store i32 %36, ptr %7, align 4
  %37 = load i32, ptr %7, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %37)
  %39 = load i32, ptr %2, align 4
  %40 = load i32, ptr %3, align 4
  %41 = load i32, ptr %4, align 4
  %42 = call i32 @test_combined(i32 noundef %39, i32 noundef %40, i32 noundef %41)
  store i32 %42, ptr %8, align 4
  %43 = load i32, ptr %8, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %43)
  %45 = load i32, ptr %2, align 4
  %46 = load i32, ptr %3, align 4
  %47 = call i32 @hash_step(i32 noundef %45, i32 noundef %46)
  store i32 %47, ptr %9, align 4
  %48 = load i32, ptr %9, align 4
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %48)
  store i8 -85, ptr %10, align 1
  store i8 -51, ptr %11, align 1
  store i16 4660, ptr %12, align 2
  store i16 22136, ptr %13, align 2
  store i64 -2401053089206453570, ptr %14, align 8
  store i64 1311768467463790320, ptr %15, align 8
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %51 = load i8, ptr %10, align 1
  %52 = load i8, ptr %11, align 1
  %53 = call zeroext i8 @test_8bit(i8 noundef zeroext %51, i8 noundef zeroext %52)
  %54 = zext i8 %53 to i32
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %54)
  %56 = load i16, ptr %12, align 2
  %57 = load i16, ptr %13, align 2
  %58 = call zeroext i16 @test_16bit(i16 noundef zeroext %56, i16 noundef zeroext %57)
  %59 = zext i16 %58 to i32
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %59)
  %61 = load i64, ptr %14, align 8
  %62 = load i64, ptr %15, align 8
  %63 = call i64 @test_64bit(i64 noundef %61, i64 noundef %62)
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i64 noundef %63)
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

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
