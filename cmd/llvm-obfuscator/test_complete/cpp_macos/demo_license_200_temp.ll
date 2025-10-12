; ModuleID = '/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/test_complete/cpp_macos/demo_license_200_string_encrypted.cpp'
source_filename = "/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/test_complete/cpp_macos/demo_license_200_string_encrypted.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"union.std::__1::basic_string<char>::__rep" }
%"union.std::__1::basic_string<char>::__rep" = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { ptr, i64, i64 }
%"class.std::__1::basic_ostream" = type { ptr, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", ptr, %"struct.std::__1::_SentinelValueFill" }>
%"class.std::__1::ios_base" = type { ptr, i32, i64, i64, i32, i32, ptr, ptr, ptr, ptr, i64, i64, ptr, i64, i64, ptr, i64, i64 }
%"struct.std::__1::_SentinelValueFill" = type { i32 }
%"struct.std::__1::piecewise_construct_t" = type { i8 }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%class.LicenseManager = type { %"class.std::__1::map", %class.SecureContainer, %"class.std::__1::basic_string" }
%"class.std::__1::map" = type { %"class.std::__1::__tree" }
%"class.std::__1::__tree" = type { ptr, %"class.std::__1::__compressed_pair.1", %"class.std::__1::__compressed_pair.7" }
%"class.std::__1::__compressed_pair.1" = type { %"struct.std::__1::__compressed_pair_elem.2" }
%"struct.std::__1::__compressed_pair_elem.2" = type { %"class.std::__1::__tree_end_node" }
%"class.std::__1::__tree_end_node" = type { ptr }
%"class.std::__1::__compressed_pair.7" = type { %"struct.std::__1::__compressed_pair_elem.8" }
%"struct.std::__1::__compressed_pair_elem.8" = type { i64 }
%class.SecureContainer = type { %"class.std::__1::vector", %"class.std::__1::basic_string" }
%"class.std::__1::vector" = type { ptr, ptr, %"class.std::__1::__compressed_pair.10" }
%"class.std::__1::__compressed_pair.10" = type { %"struct.std::__1::__compressed_pair_elem.11" }
%"struct.std::__1::__compressed_pair_elem.11" = type { ptr }
%"class.std::__1::__map_iterator" = type { %"class.std::__1::__tree_iterator" }
%"class.std::__1::__tree_iterator" = type { ptr }
%"struct.std::__1::pair" = type { %"class.std::__1::basic_string", ptr }
%class.License = type <{ ptr, %"class.std::__1::basic_string", %"class.std::__1::basic_string", i64, i32, i8, [3 x i8] }>
%class.EnterpriseLicense = type { %class.License.base, i32, %"class.std::__1::vector", %"class.std::__1::basic_string" }
%class.License.base = type <{ ptr, %"class.std::__1::basic_string", %"class.std::__1::basic_string", i64, i32, i8 }>
%"class.std::__1::allocator" = type { i8 }
%"class.std::__1::__map_value_compare" = type { i8 }
%"struct.std::__1::less" = type { i8 }
%"struct.std::__1::__value_init_tag" = type { i8 }
%"struct.std::__1::__default_init_tag" = type { i8 }
%"class.std::__1::vector<std::__1::string>::__destroy_vector" = type { ptr }
%"class.std::__1::__tree_node_base" = type <{ %"class.std::__1::__tree_end_node", ptr, ptr, i8, [7 x i8] }>
%"class.std::__1::__tree_node" = type { %"class.std::__1::__tree_node_base.base", %"struct.std::__1::__value_type" }
%"class.std::__1::__tree_node_base.base" = type <{ %"class.std::__1::__tree_end_node", ptr, ptr, i8 }>
%"struct.std::__1::__value_type" = type { %"struct.std::__1::pair" }
%"class.std::initializer_list" = type { ptr, i64 }
%"class.std::__1::__wrap_iter" = type { ptr }
%"struct.std::__1::basic_string<char>::__short" = type { [23 x i8], [0 x i8], i8 }
%"struct.std::__1::pair.16" = type { ptr, ptr }
%"struct.std::__1::random_access_iterator_tag" = type { i8 }
%"struct.std::__1::vector<std::__1::string>::_ConstructTransaction" = type { ptr, ptr, ptr }
%"struct.std::__1::__allocation_result" = type { ptr, i64 }
%"struct.std::__1::pair.17" = type { ptr, ptr }
%"struct.std::__1::__exception_guard_exceptions" = type <{ %"class.std::__1::_AllocatorDestroyRangeReverse", i8, [7 x i8] }>
%"class.std::__1::_AllocatorDestroyRangeReverse" = type { ptr, ptr, ptr }
%"class.std::__1::reverse_iterator" = type { ptr, ptr }
%"struct.std::__1::__copy_impl" = type { i8 }
%"struct.std::__1::__less" = type { i8 }
%"struct.std::__1::pair.18" = type <{ %"class.std::__1::__tree_iterator", i8, [7 x i8] }>
%"class.std::__1::tuple" = type { %"struct.std::__1::__tuple_impl" }
%"struct.std::__1::__tuple_impl" = type { %"class.std::__1::__tuple_leaf" }
%"class.std::__1::__tuple_leaf" = type { ptr }
%"class.std::__1::tuple.19" = type { i8 }
%"class.std::__1::unique_ptr" = type { %"class.std::__1::__compressed_pair.20" }
%"class.std::__1::__compressed_pair.20" = type { %"struct.std::__1::__compressed_pair_elem.21", %"struct.std::__1::__compressed_pair_elem.22" }
%"struct.std::__1::__compressed_pair_elem.21" = type { ptr }
%"struct.std::__1::__compressed_pair_elem.22" = type { %"class.std::__1::__tree_node_destructor" }
%"class.std::__1::__tree_node_destructor" = type <{ ptr, i8, [7 x i8] }>
%"class.std::__1::basic_string_view" = type { ptr, i64 }
%"struct.std::__1::__tuple_indices" = type { i8 }
%"struct.std::__1::__tuple_indices.23" = type { i8 }
%"struct.std::__1::__tuple_types" = type { i8 }
%"struct.std::__1::__tuple_types.24" = type { i8 }
%"struct.std::__1::__split_buffer" = type { ptr, ptr, ptr, %"class.std::__1::__compressed_pair.25" }
%"class.std::__1::__compressed_pair.25" = type { %"struct.std::__1::__compressed_pair_elem.11", %"struct.std::__1::__compressed_pair_elem.26" }
%"struct.std::__1::__compressed_pair_elem.26" = type { ptr }
%"struct.std::__1::integral_constant" = type { i8 }
%class.anon = type { i8 }
%"class.std::__1::basic_ostream<char>::sentry" = type { i8, ptr }
%"class.std::__1::ostreambuf_iterator" = type { ptr }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", ptr, %"struct.std::__1::_SentinelValueFill", [4 x i8] }>
%"class.std::__1::locale" = type { ptr }

@MASTER_LICENSE_KEY = global %"class.std::__1::basic_string" zeroinitializer, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__dso_handle = external hidden global i8
@RSA_PRIVATE_KEY = global %"class.std::__1::basic_string" zeroinitializer, align 8
@AES_ENCRYPTION_KEY = global %"class.std::__1::basic_string" zeroinitializer, align 8
@ACTIVATION_SECRET = global %"class.std::__1::basic_string" zeroinitializer, align 8
@CLOUD_API_TOKEN = global %"class.std::__1::basic_string" zeroinitializer, align 8
@BACKUP_LICENSE = global %"class.std::__1::basic_string" zeroinitializer, align 8
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8
@.str.6 = private unnamed_addr constant [42 x i8] c"========================================\0A\00", align 1
@.str.7 = private unnamed_addr constant [37 x i8] c"  Enterprise License Validator v2.0\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"  C++ Obfuscation Demo\0A\00", align 1
@.str.9 = private unnamed_addr constant [43 x i8] c"========================================\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"Usage: \00", align 1
@.str.11 = private unnamed_addr constant [34 x i8] c" <license_key> [activation_code]\0A\00", align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"\0ADemo Mode: Using hardcoded keys\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [45 x i8] c"\0A[FEATURES] Enabling enterprise features...\0A\00", align 1
@.str.14 = private unnamed_addr constant [30 x i8] c"\0A[CRYPTO] License signature: \00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"...\0A\00", align 1
@.str.16 = private unnamed_addr constant [27 x i8] c"[CRYPTO] Signature valid: \00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.19 = private unnamed_addr constant [20 x i8] c"sensitive_user_data\00", align 1
@.str.20 = private unnamed_addr constant [26 x i8] c"[CRYPTO] Encrypted data: \00", align 1
@.str.21 = private unnamed_addr constant [43 x i8] c"\0A========================================\0A\00", align 1
@.str.22 = private unnamed_addr constant [10 x i8] c"[RESULT] \00", align 1
@.str.23 = private unnamed_addr constant [39 x i8] c"[MANAGER] License Manager initialized\0A\00", align 1
@.str.24 = private unnamed_addr constant [33 x i8] c"[MANAGER] Using encryption key: \00", align 1
@.str.25 = private unnamed_addr constant [48 x i8] c"[SECURE] Container initialized with encryption\0A\00", align 1
@_ZTV17EnterpriseLicense = linkonce_odr unnamed_addr constant { [7 x ptr] } { [7 x ptr] [ptr null, ptr @_ZTI17EnterpriseLicense, ptr @_ZN17EnterpriseLicenseD1Ev, ptr @_ZN17EnterpriseLicenseD0Ev, ptr @_ZNK17EnterpriseLicense8validateEv, ptr @_ZN7License14f_200c7e622003ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE, ptr @_ZNK17EnterpriseLicense12display_infoEv] }, align 8
@constinit = private constant [18 x i8] c"\86\A3\B1\A6\A9\A4\A2\A3\E7\86\A9\A6\AB\BE\B3\AE\A4\B4", align 1
@constinit.26 = private constant [17 x i8] c"\15:9#2v\1F8\2231$7\22?98", align 1
@constinit.27 = private constant [17 x i8] c"\9E\A5\A7\A2\A6\A2\BF\AE\AF\EB\98\BF\A4\B9\AA\AC\AE", align 1
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTS17EnterpriseLicense = linkonce_odr hidden constant [20 x i8] c"17EnterpriseLicense\00", align 1
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTS7License = linkonce_odr hidden constant [9 x i8] c"7License\00", align 1
@_ZTI7License = linkonce_odr hidden constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTS7License to i64), i64 -9223372036854775808) to ptr) }, align 8
@_ZTI17EnterpriseLicense = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTS17EnterpriseLicense to i64), i64 -9223372036854775808) to ptr), ptr @_ZTI7License }, align 8
@_ZTV7License = linkonce_odr unnamed_addr constant { [7 x ptr] } { [7 x ptr] [ptr null, ptr @_ZTI7License, ptr @_ZN7LicenseD1Ev, ptr @_ZN7LicenseD0Ev, ptr @_ZNK7License8validateEv, ptr @_ZN7License14f_200c7e622003ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE, ptr @_ZNK7License12display_infoEv] }, align 8
@.str.28 = private unnamed_addr constant [35 x i8] c"[LICENSE] Validating license key: \00", align 1
@.str.29 = private unnamed_addr constant [54 x i8] c"[LICENSE] Master license detected - unlimited access\0A\00", align 1
@.str.30 = private unnamed_addr constant [36 x i8] c"[LICENSE] Backup license validated\0A\00", align 1
@.str.31 = private unnamed_addr constant [27 x i8] c"[LICENSE] License expired\0A\00", align 1
@.str.32 = private unnamed_addr constant [16 x i8] c"License Owner: \00", align 1
@.str.33 = private unnamed_addr constant [15 x i8] c"License Type: \00", align 1
@.str.34 = private unnamed_addr constant [9 x i8] c"Status: \00", align 1
@.str.35 = private unnamed_addr constant [7 x i8] c"vector\00", align 1
@_ZTISt12length_error = external constant ptr
@_ZTVSt12length_error = external unnamed_addr constant { [5 x ptr] }, align 8
@_ZTISt20bad_array_new_length = external constant ptr
@.str.36 = private unnamed_addr constant [44 x i8] c"[ENTERPRISE] Validating enterprise license\0A\00", align 1
@.str.37 = private unnamed_addr constant [27 x i8] c"[ENTERPRISE] Cloud token: \00", align 1
@.str.38 = private unnamed_addr constant [25 x i8] c"[ENTERPRISE] Max users: \00", align 1
@.str.39 = private unnamed_addr constant [41 x i8] c"[LICENSE] Activating license with code: \00", align 1
@.str.40 = private unnamed_addr constant [33 x i8] c"[LICENSE] Activation successful\0A\00", align 1
@.str.41 = private unnamed_addr constant [35 x i8] c"[LICENSE] Invalid activation code\0A\00", align 1
@.str.42 = private unnamed_addr constant [12 x i8] c"Max Users: \00", align 1
@.str.43 = private unnamed_addr constant [11 x i8] c"Features: \00", align 1
@.str.44 = private unnamed_addr constant [4 x i8] c" | \00", align 1
@.str.45 = private unnamed_addr constant [43 x i8] c"[MANAGER] License added to secure storage\0A\00", align 1
@_ZNSt3__1L19piecewise_constructE = internal constant %"struct.std::__1::piecewise_construct_t" zeroinitializer, align 1
@.str.46 = private unnamed_addr constant [38 x i8] c"[MANAGER] Validating all licenses...\0A\00", align 1
@.str.47 = private unnamed_addr constant [21 x i8] c"[SECURE] Encrypting \00", align 1
@.str.48 = private unnamed_addr constant [18 x i8] c" items with key: \00", align 1
@.str.49 = private unnamed_addr constant [19 x i8] c"  License Summary\0A\00", align 1
@.str.50 = private unnamed_addr constant [14 x i8] c"\0ALicense ID: \00", align 1
@.str.51 = private unnamed_addr constant [41 x i8] c"[CLOUD] Syncing with cloud using token: \00", align 1
@.str.52 = private unnamed_addr constant [25 x i8] c"[CLOUD] Sync successful\0A\00", align 1
@.str.53 = private unnamed_addr constant [47 x i8] c"[CRYPTO] Signing license with RSA private key\0A\00", align 1
@.str.54 = private unnamed_addr constant [15 x i8] c"[CRYPTO] Key: \00", align 1
@.str.55 = private unnamed_addr constant [11 x i8] c"SIGNATURE:\00", align 1
@.str.56 = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.57 = private unnamed_addr constant [30 x i8] c"[CRYPTO] Verifying signature\0A\00", align 1
@.str.58 = private unnamed_addr constant [39 x i8] c"[CRYPTO] Encrypting data with AES-256\0A\00", align 1
@.str.59 = private unnamed_addr constant [11 x i8] c"ENCRYPTED[\00", align 1
@.str.60 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_demo_license_200_string_encrypted.cpp, ptr null }]

; Function Attrs: noinline ssp uwtable(sync)
define internal void @__cxx_global_var_init() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef @MASTER_LICENSE_KEY, ptr noundef @.str)
  %2 = call i32 @__cxa_atexit(ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev, ptr @MASTER_LICENSE_KEY, ptr @__dso_handle) #3
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef returned %0, ptr noundef %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne190102ILi0EEEPKc(ptr noundef %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: nounwind
declare ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef returned) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) #3

; Function Attrs: noinline ssp uwtable(sync)
define internal void @__cxx_global_var_init.1() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef @RSA_PRIVATE_KEY, ptr noundef @.str)
  %2 = call i32 @__cxa_atexit(ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev, ptr @RSA_PRIVATE_KEY, ptr @__dso_handle) #3
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define internal void @__cxx_global_var_init.2() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef @AES_ENCRYPTION_KEY, ptr noundef @.str)
  %2 = call i32 @__cxa_atexit(ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev, ptr @AES_ENCRYPTION_KEY, ptr @__dso_handle) #3
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define internal void @__cxx_global_var_init.3() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef @ACTIVATION_SECRET, ptr noundef @.str)
  %2 = call i32 @__cxa_atexit(ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev, ptr @ACTIVATION_SECRET, ptr @__dso_handle) #3
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define internal void @__cxx_global_var_init.4() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef @CLOUD_API_TOKEN, ptr noundef @.str)
  %2 = call i32 @__cxa_atexit(ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev, ptr @CLOUD_API_TOKEN, ptr @__dso_handle) #3
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define internal void @__cxx_global_var_init.5() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef @BACKUP_LICENSE, ptr noundef @.str)
  %2 = call i32 @__cxa_atexit(ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev, ptr @BACKUP_LICENSE, ptr @__dso_handle) #3
  ret void
}

; Function Attrs: mustprogress noinline norecurse optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #4 personality ptr @__gxx_personality_v0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %class.LicenseManager, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %"class.std::__1::basic_string", align 8
  %11 = alloca ptr, align 8
  %12 = alloca %"class.std::__1::basic_string", align 8
  %13 = alloca [16 x i8], align 1
  %14 = alloca i1, align 1
  %15 = alloca i8, align 1
  %16 = alloca %"class.std::__1::basic_string", align 8
  %17 = alloca %"class.std::__1::basic_string", align 8
  %18 = alloca i8, align 1
  %19 = alloca [3 x i8], align 1
  %20 = alloca %"class.std::__1::basic_string", align 8
  %21 = alloca %"class.std::__1::basic_string", align 8
  %22 = alloca [13 x i8], align 1
  %23 = alloca [15 x i8], align 1
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %24 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.6)
  %25 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.7)
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.8)
  %27 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.9)
  %28 = load i32, ptr %4, align 4
  %29 = icmp slt i32 %28, 2
  br i1 %29, label %30, label %38

30:                                               ; preds = %2
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.10)
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds ptr, ptr %32, i64 0
  %34 = load ptr, ptr %33, align 8
  %35 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %31, ptr noundef %34)
  %36 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %35, ptr noundef @.str.11)
  %37 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.12)
  br label %38

38:                                               ; preds = %30, %2
  %39 = call ptr @_ZN14LicenseManagerC1Ev(ptr noundef %6)
  %40 = load i32, ptr %4, align 4
  %41 = icmp sge i32 %40, 2
  br i1 %41, label %42, label %48

42:                                               ; preds = %38
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds ptr, ptr %43, i64 1
  %45 = load ptr, ptr %44, align 8
  %46 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %7, ptr noundef %45)
          to label %47 unwind label %152

47:                                               ; preds = %42
  br label %51

48:                                               ; preds = %38
  %49 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(24) @MASTER_LICENSE_KEY)
          to label %50 unwind label %152

50:                                               ; preds = %48
  br label %51

51:                                               ; preds = %50, %47
  %52 = load i32, ptr %4, align 4
  %53 = icmp sge i32 %52, 3
  br i1 %53, label %54, label %60

54:                                               ; preds = %51
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds ptr, ptr %55, i64 2
  %57 = load ptr, ptr %56, align 8
  %58 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %10, ptr noundef %57)
          to label %59 unwind label %156

59:                                               ; preds = %54
  br label %63

60:                                               ; preds = %51
  %61 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %10, ptr noundef nonnull align 8 dereferenceable(24) @ACTIVATION_SECRET)
          to label %62 unwind label %156

62:                                               ; preds = %60
  br label %63

63:                                               ; preds = %62, %59
  %64 = invoke noalias nonnull ptr @_Znwm(i64 noundef 128) #14
          to label %65 unwind label %160

65:                                               ; preds = %63
  store i1 true, ptr %14, align 1
  store i8 28, ptr %13, align 1
  %66 = getelementptr inbounds i8, ptr %13, i64 1
  store i8 62, ptr %66, align 1
  %67 = getelementptr inbounds i8, ptr %13, i64 2
  store i8 48, ptr %67, align 1
  %68 = getelementptr inbounds i8, ptr %13, i64 3
  store i8 56, ptr %68, align 1
  %69 = getelementptr inbounds i8, ptr %13, i64 4
  store i8 125, ptr %69, align 1
  %70 = getelementptr inbounds i8, ptr %13, i64 5
  store i8 30, ptr %70, align 1
  %71 = getelementptr inbounds i8, ptr %13, i64 6
  store i8 50, ptr %71, align 1
  %72 = getelementptr inbounds i8, ptr %13, i64 7
  store i8 47, ptr %72, align 1
  %73 = getelementptr inbounds i8, ptr %13, i64 8
  store i8 45, ptr %73, align 1
  %74 = getelementptr inbounds i8, ptr %13, i64 9
  store i8 50, ptr %74, align 1
  %75 = getelementptr inbounds i8, ptr %13, i64 10
  store i8 47, ptr %75, align 1
  %76 = getelementptr inbounds i8, ptr %13, i64 11
  store i8 60, ptr %76, align 1
  %77 = getelementptr inbounds i8, ptr %13, i64 12
  store i8 41, ptr %77, align 1
  %78 = getelementptr inbounds i8, ptr %13, i64 13
  store i8 52, ptr %78, align 1
  %79 = getelementptr inbounds i8, ptr %13, i64 14
  store i8 50, ptr %79, align 1
  %80 = getelementptr inbounds i8, ptr %13, i64 15
  store i8 51, ptr %80, align 1
  %81 = getelementptr inbounds [16 x i8], ptr %13, i64 0, i64 0
  %82 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %81, i32 noundef 16, i8 noundef zeroext 93)
          to label %83 unwind label %164

83:                                               ; preds = %65
  %84 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %12, ptr noundef %82)
          to label %85 unwind label %164

85:                                               ; preds = %83
  %86 = invoke ptr @_ZN17EnterpriseLicenseC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_i(ptr noundef %64, ptr noundef nonnull align 8 dereferenceable(24) %7, ptr noundef nonnull align 8 dereferenceable(24) %12, i32 noundef 100)
          to label %87 unwind label %168

87:                                               ; preds = %85
  store i1 false, ptr %14, align 1
  %88 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %12) #3
  store ptr %64, ptr %11, align 8
  %89 = load ptr, ptr %11, align 8
  invoke void @_ZN14LicenseManager14f_13b221bf5b83EP7License(ptr noundef %6, ptr noundef %89)
          to label %90 unwind label %160

90:                                               ; preds = %87
  %91 = load ptr, ptr %11, align 8
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds ptr, ptr %92, i64 3
  %94 = load ptr, ptr %93, align 8
  invoke void %94(ptr noundef %91, ptr noundef nonnull align 8 dereferenceable(24) %10)
          to label %95 unwind label %160

95:                                               ; preds = %90
  %96 = invoke zeroext i1 @_ZN14LicenseManager14f_1c453e6237e9Ev(ptr noundef %6)
          to label %97 unwind label %160

97:                                               ; preds = %95
  %98 = zext i1 %96 to i8
  store i8 %98, ptr %15, align 1
  invoke void @_ZN14LicenseManager14f_3df4dddaeb27Ev(ptr noundef %6)
          to label %99 unwind label %160

99:                                               ; preds = %97
  %100 = load i8, ptr %15, align 1
  %101 = trunc i8 %100 to i1
  br i1 %101, label %102, label %198

102:                                              ; preds = %99
  %103 = load ptr, ptr %11, align 8
  %104 = invoke zeroext i1 @_ZNK7License12is_activatedEv(ptr noundef %103)
          to label %105 unwind label %160

105:                                              ; preds = %102
  br i1 %104, label %106, label %198

106:                                              ; preds = %105
  %107 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.13)
          to label %108 unwind label %160

108:                                              ; preds = %106
  %109 = load ptr, ptr %11, align 8
  invoke void @_ZN17EnterpriseLicense14f_8df5b6ad2515Ev(ptr noundef %109)
          to label %110 unwind label %160

110:                                              ; preds = %108
  invoke void @_ZN12CryptoHelper14f_03bc551e3634ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %16, ptr noundef nonnull align 8 dereferenceable(24) %7)
          to label %111 unwind label %160

111:                                              ; preds = %110
  %112 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.14)
          to label %113 unwind label %177

113:                                              ; preds = %111
  invoke void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6substrB8ne190102Emm(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %17, ptr noundef %16, i64 noundef 0, i64 noundef 50)
          to label %114 unwind label %177

114:                                              ; preds = %113
  %115 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %112, ptr noundef nonnull align 8 dereferenceable(24) %17)
          to label %116 unwind label %181

116:                                              ; preds = %114
  %117 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %115, ptr noundef @.str.15)
          to label %118 unwind label %181

118:                                              ; preds = %116
  %119 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %17) #3
  %120 = invoke zeroext i1 @_ZN12CryptoHelper14f_4948265903ccERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %16)
          to label %121 unwind label %177

121:                                              ; preds = %118
  %122 = zext i1 %120 to i8
  store i8 %122, ptr %18, align 1
  %123 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.16)
          to label %124 unwind label %177

124:                                              ; preds = %121
  %125 = load i8, ptr %18, align 1
  %126 = trunc i8 %125 to i1
  br i1 %126, label %127, label %133

127:                                              ; preds = %124
  store i8 -75, ptr %19, align 1
  %128 = getelementptr inbounds i8, ptr %19, i64 1
  store i8 -119, ptr %128, align 1
  %129 = getelementptr inbounds i8, ptr %19, i64 2
  store i8 -97, ptr %129, align 1
  %130 = getelementptr inbounds [3 x i8], ptr %19, i64 0, i64 0
  %131 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %130, i32 noundef 3, i8 noundef zeroext -20)
          to label %132 unwind label %177

132:                                              ; preds = %127
  br label %134

133:                                              ; preds = %124
  br label %134

134:                                              ; preds = %133, %132
  %135 = phi ptr [ %131, %132 ], [ @.str.17, %133 ]
  %136 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %123, ptr noundef %135)
          to label %137 unwind label %177

137:                                              ; preds = %134
  %138 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %136, ptr noundef @.str.18)
          to label %139 unwind label %177

139:                                              ; preds = %137
  %140 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %21, ptr noundef @.str.19)
          to label %141 unwind label %177

141:                                              ; preds = %139
  invoke void @_ZN12CryptoHelper14f_f707f7349698ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %20, ptr noundef nonnull align 8 dereferenceable(24) %21)
          to label %142 unwind label %186

142:                                              ; preds = %141
  %143 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %21) #3
  %144 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.20)
          to label %145 unwind label %191

145:                                              ; preds = %142
  %146 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %144, ptr noundef nonnull align 8 dereferenceable(24) %20)
          to label %147 unwind label %191

147:                                              ; preds = %145
  %148 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %146, ptr noundef @.str.18)
          to label %149 unwind label %191

149:                                              ; preds = %147
  %150 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %20) #3
  %151 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %16) #3
  br label %198

152:                                              ; preds = %48, %42
  %153 = landingpad { ptr, i32 }
          cleanup
  %154 = extractvalue { ptr, i32 } %153, 0
  store ptr %154, ptr %8, align 8
  %155 = extractvalue { ptr, i32 } %153, 1
  store i32 %155, ptr %9, align 4
  br label %259

156:                                              ; preds = %60, %54
  %157 = landingpad { ptr, i32 }
          cleanup
  %158 = extractvalue { ptr, i32 } %157, 0
  store ptr %158, ptr %8, align 8
  %159 = extractvalue { ptr, i32 } %157, 1
  store i32 %159, ptr %9, align 4
  br label %257

160:                                              ; preds = %244, %242, %239, %221, %205, %200, %198, %110, %108, %106, %102, %97, %95, %90, %87, %63
  %161 = landingpad { ptr, i32 }
          cleanup
  %162 = extractvalue { ptr, i32 } %161, 0
  store ptr %162, ptr %8, align 8
  %163 = extractvalue { ptr, i32 } %161, 1
  store i32 %163, ptr %9, align 4
  br label %255

164:                                              ; preds = %83, %65
  %165 = landingpad { ptr, i32 }
          cleanup
  %166 = extractvalue { ptr, i32 } %165, 0
  store ptr %166, ptr %8, align 8
  %167 = extractvalue { ptr, i32 } %165, 1
  store i32 %167, ptr %9, align 4
  br label %173

168:                                              ; preds = %85
  %169 = landingpad { ptr, i32 }
          cleanup
  %170 = extractvalue { ptr, i32 } %169, 0
  store ptr %170, ptr %8, align 8
  %171 = extractvalue { ptr, i32 } %169, 1
  store i32 %171, ptr %9, align 4
  %172 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %12) #3
  br label %173

173:                                              ; preds = %168, %164
  %174 = load i1, ptr %14, align 1
  br i1 %174, label %175, label %176

175:                                              ; preds = %173
  call void @_ZdlPv(ptr noundef %64) #15
  br label %176

176:                                              ; preds = %175, %173
  br label %255

177:                                              ; preds = %139, %137, %134, %127, %121, %118, %113, %111
  %178 = landingpad { ptr, i32 }
          cleanup
  %179 = extractvalue { ptr, i32 } %178, 0
  store ptr %179, ptr %8, align 8
  %180 = extractvalue { ptr, i32 } %178, 1
  store i32 %180, ptr %9, align 4
  br label %196

181:                                              ; preds = %116, %114
  %182 = landingpad { ptr, i32 }
          cleanup
  %183 = extractvalue { ptr, i32 } %182, 0
  store ptr %183, ptr %8, align 8
  %184 = extractvalue { ptr, i32 } %182, 1
  store i32 %184, ptr %9, align 4
  %185 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %17) #3
  br label %196

186:                                              ; preds = %141
  %187 = landingpad { ptr, i32 }
          cleanup
  %188 = extractvalue { ptr, i32 } %187, 0
  store ptr %188, ptr %8, align 8
  %189 = extractvalue { ptr, i32 } %187, 1
  store i32 %189, ptr %9, align 4
  %190 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %21) #3
  br label %196

191:                                              ; preds = %147, %145, %142
  %192 = landingpad { ptr, i32 }
          cleanup
  %193 = extractvalue { ptr, i32 } %192, 0
  store ptr %193, ptr %8, align 8
  %194 = extractvalue { ptr, i32 } %192, 1
  store i32 %194, ptr %9, align 4
  %195 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %20) #3
  br label %196

196:                                              ; preds = %191, %186, %181, %177
  %197 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %16) #3
  br label %255

198:                                              ; preds = %149, %105, %99
  %199 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.21)
          to label %200 unwind label %160

200:                                              ; preds = %198
  %201 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.22)
          to label %202 unwind label %160

202:                                              ; preds = %200
  %203 = load i8, ptr %15, align 1
  %204 = trunc i8 %203 to i1
  br i1 %204, label %205, label %221

205:                                              ; preds = %202
  store i8 -77, ptr %22, align 1
  %206 = getelementptr inbounds i8, ptr %22, i64 1
  store i8 -106, ptr %206, align 1
  %207 = getelementptr inbounds i8, ptr %22, i64 2
  store i8 -100, ptr %207, align 1
  %208 = getelementptr inbounds i8, ptr %22, i64 3
  store i8 -102, ptr %208, align 1
  %209 = getelementptr inbounds i8, ptr %22, i64 4
  store i8 -111, ptr %209, align 1
  %210 = getelementptr inbounds i8, ptr %22, i64 5
  store i8 -116, ptr %210, align 1
  %211 = getelementptr inbounds i8, ptr %22, i64 6
  store i8 -102, ptr %211, align 1
  %212 = getelementptr inbounds i8, ptr %22, i64 7
  store i8 -33, ptr %212, align 1
  %213 = getelementptr inbounds i8, ptr %22, i64 8
  store i8 -87, ptr %213, align 1
  %214 = getelementptr inbounds i8, ptr %22, i64 9
  store i8 -98, ptr %214, align 1
  %215 = getelementptr inbounds i8, ptr %22, i64 10
  store i8 -109, ptr %215, align 1
  %216 = getelementptr inbounds i8, ptr %22, i64 11
  store i8 -106, ptr %216, align 1
  %217 = getelementptr inbounds i8, ptr %22, i64 12
  store i8 -101, ptr %217, align 1
  %218 = getelementptr inbounds [13 x i8], ptr %22, i64 0, i64 0
  %219 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %218, i32 noundef 13, i8 noundef zeroext -1)
          to label %220 unwind label %160

220:                                              ; preds = %205
  br label %239

221:                                              ; preds = %202
  store i8 3, ptr %23, align 1
  %222 = getelementptr inbounds i8, ptr %23, i64 1
  store i8 38, ptr %222, align 1
  %223 = getelementptr inbounds i8, ptr %23, i64 2
  store i8 44, ptr %223, align 1
  %224 = getelementptr inbounds i8, ptr %23, i64 3
  store i8 42, ptr %224, align 1
  %225 = getelementptr inbounds i8, ptr %23, i64 4
  store i8 33, ptr %225, align 1
  %226 = getelementptr inbounds i8, ptr %23, i64 5
  store i8 60, ptr %226, align 1
  %227 = getelementptr inbounds i8, ptr %23, i64 6
  store i8 42, ptr %227, align 1
  %228 = getelementptr inbounds i8, ptr %23, i64 7
  store i8 111, ptr %228, align 1
  %229 = getelementptr inbounds i8, ptr %23, i64 8
  store i8 6, ptr %229, align 1
  %230 = getelementptr inbounds i8, ptr %23, i64 9
  store i8 33, ptr %230, align 1
  %231 = getelementptr inbounds i8, ptr %23, i64 10
  store i8 57, ptr %231, align 1
  %232 = getelementptr inbounds i8, ptr %23, i64 11
  store i8 46, ptr %232, align 1
  %233 = getelementptr inbounds i8, ptr %23, i64 12
  store i8 35, ptr %233, align 1
  %234 = getelementptr inbounds i8, ptr %23, i64 13
  store i8 38, ptr %234, align 1
  %235 = getelementptr inbounds i8, ptr %23, i64 14
  store i8 43, ptr %235, align 1
  %236 = getelementptr inbounds [15 x i8], ptr %23, i64 0, i64 0
  %237 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %236, i32 noundef 15, i8 noundef zeroext 79)
          to label %238 unwind label %160

238:                                              ; preds = %221
  br label %239

239:                                              ; preds = %238, %220
  %240 = phi ptr [ %219, %220 ], [ %237, %238 ]
  %241 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %201, ptr noundef %240)
          to label %242 unwind label %160

242:                                              ; preds = %239
  %243 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %241, ptr noundef @.str.18)
          to label %244 unwind label %160

244:                                              ; preds = %242
  %245 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.6)
          to label %246 unwind label %160

246:                                              ; preds = %244
  %247 = load i8, ptr %15, align 1
  %248 = trunc i8 %247 to i1
  %249 = zext i1 %248 to i64
  %250 = select i1 %248, i32 0, i32 1
  store i32 %250, ptr %3, align 4
  %251 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %10) #3
  %252 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %7) #3
  %253 = call ptr @_ZN14LicenseManagerD1Ev(ptr noundef %6) #3
  %254 = load i32, ptr %3, align 4
  ret i32 %254

255:                                              ; preds = %196, %176, %160
  %256 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %10) #3
  br label %257

257:                                              ; preds = %255, %156
  %258 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %7) #3
  br label %259

259:                                              ; preds = %257, %152
  %260 = call ptr @_ZN14LicenseManagerD1Ev(ptr noundef %6) #3
  br label %261

261:                                              ; preds = %259
  %262 = load ptr, ptr %8, align 8
  %263 = load i32, ptr %9, align 4
  %264 = insertvalue { ptr, i32 } poison, ptr %262, 0
  %265 = insertvalue { ptr, i32 } %264, i32 %263, 1
  resume { ptr, i32 } %265
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call i64 @_ZNSt3__111char_traitsIcE6lengthB8ne190102EPKc(ptr noundef %7) #3
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne190102IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %6, i64 noundef %8)
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN14LicenseManagerC1Ev(ptr noundef returned %0) unnamed_addr #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZN14LicenseManagerC2Ev(ptr noundef %3)
  ret ptr %3
}

declare i32 @__gxx_personality_v0(...)

declare ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef returned, ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #5

; Function Attrs: nobuiltin allocsize(0)
declare nonnull ptr @_Znwm(i64 noundef) #6

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define internal ptr @_ZL12_xor_decryptPKhih(ptr noundef %0, i32 noundef %1, i8 noundef zeroext %2) #1 {
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
  %13 = call ptr @malloc(i64 noundef %12) #16
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

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN17EnterpriseLicenseC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_i(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2, i32 noundef %3) unnamed_addr #1 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load i32, ptr %8, align 4
  %13 = call ptr @_ZN17EnterpriseLicenseC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_i(ptr noundef %9, ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 8 dereferenceable(24) %11, i32 noundef %12)
  ret ptr %9
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(ptr noundef) #7

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN14LicenseManager14f_13b221bf5b83EP7License(ptr noundef %0, ptr noundef %1) #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 0
  %10 = call i64 @_ZNKSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE4sizeB8ne190102Ev(ptr noundef %9) #3
  call void @_ZNSt3__19to_stringEm(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %5, i64 noundef %10)
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 0
  %13 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEEixERSC_(ptr noundef %12, ptr noundef nonnull align 8 dereferenceable(24) %5)
          to label %14 unwind label %20

14:                                               ; preds = %2
  store ptr %11, ptr %13, align 8
  %15 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 1
  invoke void @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE14f_7e9e5ac30f22ERKS6_(ptr noundef %15, ptr noundef nonnull align 8 dereferenceable(24) %5)
          to label %16 unwind label %20

16:                                               ; preds = %14
  %17 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.45)
          to label %18 unwind label %20

18:                                               ; preds = %16
  %19 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %5) #3
  ret void

20:                                               ; preds = %16, %14, %2
  %21 = landingpad { ptr, i32 }
          cleanup
  %22 = extractvalue { ptr, i32 } %21, 0
  store ptr %22, ptr %6, align 8
  %23 = extractvalue { ptr, i32 } %21, 1
  store i32 %23, ptr %7, align 4
  %24 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %5) #3
  br label %25

25:                                               ; preds = %20
  %26 = load ptr, ptr %6, align 8
  %27 = load i32, ptr %7, align 4
  %28 = insertvalue { ptr, i32 } poison, ptr %26, 0
  %29 = insertvalue { ptr, i32 } %28, i32 %27, 1
  resume { ptr, i32 } %29
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr zeroext i1 @_ZN14LicenseManager14f_1c453e6237e9Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::__1::__map_iterator", align 8
  %6 = alloca %"class.std::__1::__map_iterator", align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.46)
  store i8 1, ptr %3, align 1
  %10 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 0
  store ptr %10, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE5beginB8ne190102Ev(ptr noundef %11) #3
  %13 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %5, i32 0, i32 0
  %14 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %13, i32 0, i32 0
  %15 = inttoptr i64 %12 to ptr
  store ptr %15, ptr %14, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = call i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE3endB8ne190102Ev(ptr noundef %16) #3
  %18 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %6, i32 0, i32 0
  %19 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %18, i32 0, i32 0
  %20 = inttoptr i64 %17 to ptr
  store ptr %20, ptr %19, align 8
  br label %21

21:                                               ; preds = %34, %1
  %22 = call zeroext i1 @_ZNSt3__1neB8ne190102ERKNS_14__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEESJ_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6)
  br i1 %22, label %23, label %36

23:                                               ; preds = %21
  %24 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNKSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEdeB8ne190102Ev(ptr noundef %5)
  store ptr %24, ptr %7, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %"struct.std::__1::pair", ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 2
  %30 = load ptr, ptr %29, align 8
  %31 = call zeroext i1 %30(ptr noundef %27)
  br i1 %31, label %33, label %32

32:                                               ; preds = %23
  store i8 0, ptr %3, align 1
  br label %33

33:                                               ; preds = %32, %23
  br label %34

34:                                               ; preds = %33
  %35 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEppB8ne190102Ev(ptr noundef %5)
  br label %21

36:                                               ; preds = %21
  %37 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 1
  call void @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE14f_9c04c1f30d82Ev(ptr noundef %37)
  %38 = load i8, ptr %3, align 1
  %39 = trunc i8 %38 to i1
  ret i1 %39
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN14LicenseManager14f_3df4dddaeb27Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %"class.std::__1::__map_iterator", align 8
  %5 = alloca %"class.std::__1::__map_iterator", align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.21)
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.49)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.6)
  %11 = getelementptr inbounds %class.LicenseManager, ptr %7, i32 0, i32 0
  store ptr %11, ptr %3, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = call i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE5beginB8ne190102Ev(ptr noundef %12) #3
  %14 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %4, i32 0, i32 0
  %15 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %14, i32 0, i32 0
  %16 = inttoptr i64 %13 to ptr
  store ptr %16, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = call i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE3endB8ne190102Ev(ptr noundef %17) #3
  %19 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %5, i32 0, i32 0
  %20 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %19, i32 0, i32 0
  %21 = inttoptr i64 %18 to ptr
  store ptr %21, ptr %20, align 8
  br label %22

22:                                               ; preds = %37, %1
  %23 = call zeroext i1 @_ZNSt3__1neB8ne190102ERKNS_14__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEESJ_(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %5)
  br i1 %23, label %24, label %39

24:                                               ; preds = %22
  %25 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNKSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEdeB8ne190102Ev(ptr noundef %4)
  store ptr %25, ptr %6, align 8
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.50)
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %"struct.std::__1::pair", ptr %27, i32 0, i32 0
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %26, ptr noundef nonnull align 8 dereferenceable(24) %28)
  %30 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %29, ptr noundef @.str.18)
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds %"struct.std::__1::pair", ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds ptr, ptr %34, i64 4
  %36 = load ptr, ptr %35, align 8
  call void %36(ptr noundef %33)
  br label %37

37:                                               ; preds = %24
  %38 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEppB8ne190102Ev(ptr noundef %4)
  br label %22

39:                                               ; preds = %22
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr zeroext i1 @_ZNK7License12is_activatedEv(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.License, ptr %3, i32 0, i32 5
  %5 = load i8, ptr %4, align 4
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN17EnterpriseLicense14f_8df5b6ad2515Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.51)
  %5 = getelementptr inbounds %class.EnterpriseLicense, ptr %3, i32 0, i32 3
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(24) %5)
  %7 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef @.str.18)
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.52)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN12CryptoHelper14f_03bc551e3634ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr dead_on_unwind noalias writable sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = alloca %"class.std::__1::basic_string", align 8
  %10 = alloca %"class.std::__1::basic_string", align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.53)
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.54)
  call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6substrB8ne190102Emm(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %5, ptr noundef @RSA_PRIVATE_KEY, i64 noundef 0, i64 noundef 50)
  %13 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %12, ptr noundef nonnull align 8 dereferenceable(24) %5)
          to label %14 unwind label %25

14:                                               ; preds = %2
  %15 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %13, ptr noundef @.str.15)
          to label %16 unwind label %25

16:                                               ; preds = %14
  %17 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %5) #3
  %18 = load ptr, ptr %4, align 8
  call void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_RKS9_(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %9, ptr noundef @.str.55, ptr noundef nonnull align 8 dereferenceable(24) %18)
  invoke void @_ZNSt3__1plB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %8, ptr noundef nonnull align 8 dereferenceable(24) %9, ptr noundef @.str.56)
          to label %19 unwind label %30

19:                                               ; preds = %16
  invoke void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6substrB8ne190102Emm(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %10, ptr noundef @RSA_PRIVATE_KEY, i64 noundef 0, i64 noundef 20)
          to label %20 unwind label %34

20:                                               ; preds = %19
  invoke void @_ZNSt3__1plB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef nonnull align 8 dereferenceable(24) %10)
          to label %21 unwind label %38

21:                                               ; preds = %20
  %22 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %10) #3
  %23 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %8) #3
  %24 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %9) #3
  ret void

25:                                               ; preds = %14, %2
  %26 = landingpad { ptr, i32 }
          cleanup
  %27 = extractvalue { ptr, i32 } %26, 0
  store ptr %27, ptr %6, align 8
  %28 = extractvalue { ptr, i32 } %26, 1
  store i32 %28, ptr %7, align 4
  %29 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %5) #3
  br label %47

30:                                               ; preds = %16
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = extractvalue { ptr, i32 } %31, 0
  store ptr %32, ptr %6, align 8
  %33 = extractvalue { ptr, i32 } %31, 1
  store i32 %33, ptr %7, align 4
  br label %45

34:                                               ; preds = %19
  %35 = landingpad { ptr, i32 }
          cleanup
  %36 = extractvalue { ptr, i32 } %35, 0
  store ptr %36, ptr %6, align 8
  %37 = extractvalue { ptr, i32 } %35, 1
  store i32 %37, ptr %7, align 4
  br label %43

38:                                               ; preds = %20
  %39 = landingpad { ptr, i32 }
          cleanup
  %40 = extractvalue { ptr, i32 } %39, 0
  store ptr %40, ptr %6, align 8
  %41 = extractvalue { ptr, i32 } %39, 1
  store i32 %41, ptr %7, align 4
  %42 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %10) #3
  br label %43

43:                                               ; preds = %38, %34
  %44 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %8) #3
  br label %45

45:                                               ; preds = %43, %30
  %46 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %9) #3
  br label %47

47:                                               ; preds = %45, %25
  %48 = load ptr, ptr %6, align 8
  %49 = load i32, ptr %7, align 4
  %50 = insertvalue { ptr, i32 } poison, ptr %48, 0
  %51 = insertvalue { ptr, i32 } %50, i32 %49, 1
  resume { ptr, i32 } %51
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %6) #3
  %8 = load ptr, ptr %4, align 8
  %9 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %8) #3
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne190102IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %7, i64 noundef %9)
  ret ptr %10
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6substrB8ne190102Emm(ptr dead_on_unwind noalias writable sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef %1, i64 noundef %2, i64 noundef %3) #1 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca %"class.std::__1::allocator", align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i64, ptr %7, align 8
  %12 = load i64, ptr %8, align 8
  %13 = call ptr @_ZNSt3__19allocatorIcEC1B8ne190102Ev(ptr noundef %9) #3
  %14 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_mmRKS4_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %10, i64 noundef %11, i64 noundef %12, ptr noundef nonnull align 1 dereferenceable(1) %9)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr zeroext i1 @_ZN12CryptoHelper14f_4948265903ccERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %0) #1 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::basic_string", align 8
  store ptr %0, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.57)
  %5 = load ptr, ptr %2, align 8
  call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6substrB8ne190102Emm(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %3, ptr noundef @RSA_PRIVATE_KEY, i64 noundef 0, i64 noundef 20)
  %6 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findB8ne190102ERKS5_m(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(24) %3, i64 noundef 0) #3
  %7 = icmp ne i64 %6, -1
  %8 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %3) #3
  ret i1 %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN12CryptoHelper14f_f707f7349698ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr dead_on_unwind noalias writable sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.58)
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.54)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef nonnull align 8 dereferenceable(24) @AES_ENCRYPTION_KEY)
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %10, ptr noundef @.str.18)
  %12 = load ptr, ptr %4, align 8
  call void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_RKS9_(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %5, ptr noundef @.str.59, ptr noundef nonnull align 8 dereferenceable(24) %12)
  invoke void @_ZNSt3__1plB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef @.str.60)
          to label %13 unwind label %15

13:                                               ; preds = %2
  %14 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %5) #3
  ret void

15:                                               ; preds = %2
  %16 = landingpad { ptr, i32 }
          cleanup
  %17 = extractvalue { ptr, i32 } %16, 0
  store ptr %17, ptr %6, align 8
  %18 = extractvalue { ptr, i32 } %16, 1
  store i32 %18, ptr %7, align 4
  %19 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %5) #3
  br label %20

20:                                               ; preds = %15
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %7, align 4
  %23 = insertvalue { ptr, i32 } poison, ptr %21, 0
  %24 = insertvalue { ptr, i32 } %23, i32 %22, 1
  resume { ptr, i32 } %24
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN14LicenseManagerD1Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZN14LicenseManagerD2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN14LicenseManagerC2Ev(ptr noundef returned %0) unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %class.LicenseManager, ptr %5, i32 0, i32 0
  %7 = call ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEEC1B8ne190102Ev(ptr noundef %6) #3
  %8 = getelementptr inbounds %class.LicenseManager, ptr %5, i32 0, i32 1
  %9 = invoke ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEEC1ERKS6_(ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(24) @AES_ENCRYPTION_KEY)
          to label %10 unwind label %23

10:                                               ; preds = %1
  %11 = getelementptr inbounds %class.LicenseManager, ptr %5, i32 0, i32 2
  %12 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %11, ptr noundef nonnull align 8 dereferenceable(24) @AES_ENCRYPTION_KEY)
          to label %13 unwind label %27

13:                                               ; preds = %10
  %14 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.23)
          to label %15 unwind label %31

15:                                               ; preds = %13
  %16 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.24)
          to label %17 unwind label %31

17:                                               ; preds = %15
  %18 = getelementptr inbounds %class.LicenseManager, ptr %5, i32 0, i32 2
  %19 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %16, ptr noundef nonnull align 8 dereferenceable(24) %18)
          to label %20 unwind label %31

20:                                               ; preds = %17
  %21 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %19, ptr noundef @.str.18)
          to label %22 unwind label %31

22:                                               ; preds = %20
  ret ptr %5

23:                                               ; preds = %1
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = extractvalue { ptr, i32 } %24, 0
  store ptr %25, ptr %3, align 8
  %26 = extractvalue { ptr, i32 } %24, 1
  store i32 %26, ptr %4, align 4
  br label %38

27:                                               ; preds = %10
  %28 = landingpad { ptr, i32 }
          cleanup
  %29 = extractvalue { ptr, i32 } %28, 0
  store ptr %29, ptr %3, align 8
  %30 = extractvalue { ptr, i32 } %28, 1
  store i32 %30, ptr %4, align 4
  br label %36

31:                                               ; preds = %20, %17, %15, %13
  %32 = landingpad { ptr, i32 }
          cleanup
  %33 = extractvalue { ptr, i32 } %32, 0
  store ptr %33, ptr %3, align 8
  %34 = extractvalue { ptr, i32 } %32, 1
  store i32 %34, ptr %4, align 4
  %35 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %11) #3
  br label %36

36:                                               ; preds = %31, %27
  %37 = call ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEED1Ev(ptr noundef %8) #3
  br label %38

38:                                               ; preds = %36, %23
  %39 = call ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEED1B8ne190102Ev(ptr noundef %6) #3
  br label %40

40:                                               ; preds = %38
  %41 = load ptr, ptr %3, align 8
  %42 = load i32, ptr %4, align 4
  %43 = insertvalue { ptr, i32 } poison, ptr %41, 0
  %44 = insertvalue { ptr, i32 } %43, i32 %42, 1
  resume { ptr, i32 } %44
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEEC1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEEC2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEEC1ERKS6_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEEC2ERKS6_(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(24) %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEED1Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEED2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEED1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEED2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::__map_value_compare", align 1
  %4 = alloca %"struct.std::__1::less", align 1
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %"class.std::__1::map", ptr %5, i32 0, i32 0
  %7 = call ptr @_ZNSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEC1B8ne190102ESC_(ptr noundef %3) #3
  %8 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEEC1ERKSE_(ptr noundef %6, ptr noundef nonnull align 1 dereferenceable(1) %3) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEC1B8ne190102ESC_(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca %"struct.std::__1::less", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call ptr @_ZNSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEC2B8ne190102ESC_(ptr noundef %4) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEEC1ERKSE_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEEC2ERKSE_(ptr noundef %5, ptr noundef nonnull align 1 dereferenceable(1) %6) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEC2B8ne190102ESC_(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca %"struct.std::__1::less", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEEC2ERKSE_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::__tree", ptr %6, i32 0, i32 1
  %8 = invoke ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEEC1B8ne190102ILb1ELi0EEEv(ptr noundef %7)
          to label %9 unwind label %16

9:                                                ; preds = %2
  %10 = getelementptr inbounds %"class.std::__1::__tree", ptr %6, i32 0, i32 2
  store i32 0, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = invoke ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEEC1B8ne190102IiRKSE_EEOT_OT0_(ptr noundef %10, ptr noundef nonnull align 4 dereferenceable(4) %5, ptr noundef nonnull align 1 dereferenceable(1) %11)
          to label %13 unwind label %16

13:                                               ; preds = %9
  %14 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %6) #3
  %15 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__begin_nodeB8ne190102Ev(ptr noundef %6) #3
  store ptr %14, ptr %15, align 8
  ret ptr %6

16:                                               ; preds = %9, %2
  %17 = landingpad { ptr, i32 }
          catch ptr null
  %18 = extractvalue { ptr, i32 } %17, 0
  call void @__clang_call_terminate(ptr %18) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEEC1B8ne190102ILb1ELi0EEEv(ptr noundef returned %0) unnamed_addr #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEEC2B8ne190102ILb1ELi0EEEv(ptr noundef %3)
  ret ptr %3
}

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #9 {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #3
  call void @_ZSt9terminatev() #17
  unreachable
}

declare ptr @__cxa_begin_catch(ptr)

declare void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEEC1B8ne190102IiRKSE_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEEC2B8ne190102IiRKSE_EEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 4 dereferenceable(4) %8, ptr noundef nonnull align 1 dereferenceable(1) %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree", ptr %3, i32 0, i32 1
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEE5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = call ptr @_ZNSt3__114pointer_traitsIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEE10pointer_toB8ne190102ERS6_(ptr noundef nonnull align 8 dereferenceable(8) %5) #3
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__begin_nodeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEEC2B8ne190102ILb1ELi0EEEv(ptr noundef returned %0) unnamed_addr #1 {
  %2 = alloca ptr, align 8
  %3 = alloca %"struct.std::__1::__value_init_tag", align 1
  %4 = alloca %"struct.std::__1::__value_init_tag", align 1
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EEC2B8ne190102ENS_16__value_init_tagE(ptr noundef %5)
  %7 = call ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEELi1ELb1EEC2B8ne190102ENS_16__value_init_tagE(ptr noundef %5)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EEC2B8ne190102ENS_16__value_init_tagE(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca %"struct.std::__1::__value_init_tag", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.2", ptr %4, i32 0, i32 0
  %6 = call ptr @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC1B8ne190102Ev(ptr noundef %5) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEELi1ELb1EEC2B8ne190102ENS_16__value_init_tagE(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca %"struct.std::__1::__value_init_tag", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call ptr @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEEC2B8ne190102Ev(ptr noundef %4) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEC2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEEC2B8ne190102IiRKSE_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call ptr @_ZNSt3__122__compressed_pair_elemImLi0ELb0EEC2B8ne190102IiLi0EEEOT_(ptr noundef %7, ptr noundef nonnull align 4 dereferenceable(4) %8)
  %10 = load ptr, ptr %6, align 8
  %11 = call ptr @_ZNSt3__122__compressed_pair_elemINS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEELi1ELb1EEC2B8ne190102IRKSE_Li0EEEOT_(ptr noundef %7, ptr noundef nonnull align 1 dereferenceable(1) %10)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__122__compressed_pair_elemImLi0ELb0EEC2B8ne190102IiLi0EEEOT_(ptr noundef returned %0, ptr noundef nonnull align 4 dereferenceable(4) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.8", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %8 to i64
  store i64 %9, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__122__compressed_pair_elemINS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEELi1ELb1EEC2B8ne190102IRKSE_Li0EEEOT_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114pointer_traitsIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEE10pointer_toB8ne190102ERS6_(ptr noundef nonnull align 8 dereferenceable(8) %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.2", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEEC2ERKS6_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %class.SecureContainer, ptr %7, i32 0, i32 0
  %9 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B8ne190102Ev(ptr noundef %8) #3
  %10 = getelementptr inbounds %class.SecureContainer, ptr %7, i32 0, i32 1
  %11 = load ptr, ptr %4, align 8
  %12 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %10, ptr noundef nonnull align 8 dereferenceable(24) %11)
          to label %13 unwind label %16

13:                                               ; preds = %2
  %14 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.25)
          to label %15 unwind label %20

15:                                               ; preds = %13
  ret ptr %7

16:                                               ; preds = %2
  %17 = landingpad { ptr, i32 }
          cleanup
  %18 = extractvalue { ptr, i32 } %17, 0
  store ptr %18, ptr %5, align 8
  %19 = extractvalue { ptr, i32 } %17, 1
  store i32 %19, ptr %6, align 4
  br label %25

20:                                               ; preds = %13
  %21 = landingpad { ptr, i32 }
          cleanup
  %22 = extractvalue { ptr, i32 } %21, 0
  store ptr %22, ptr %5, align 8
  %23 = extractvalue { ptr, i32 } %21, 1
  store i32 %23, ptr %6, align 4
  %24 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %10) #3
  br label %25

25:                                               ; preds = %20, %16
  %26 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B8ne190102Ev(ptr noundef %8) #3
  br label %27

27:                                               ; preds = %25
  %28 = load ptr, ptr %5, align 8
  %29 = load i32, ptr %6, align 4
  %30 = insertvalue { ptr, i32 } poison, ptr %28, 0
  %31 = insertvalue { ptr, i32 } %30, i32 %29, 1
  resume { ptr, i32 } %31
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %"struct.std::__1::__default_init_tag", align 1
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %"class.std::__1::vector", ptr %5, i32 0, i32 0
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds %"class.std::__1::vector", ptr %5, i32 0, i32 1
  store ptr null, ptr %7, align 8
  %8 = getelementptr inbounds %"class.std::__1::vector", ptr %5, i32 0, i32 2
  store ptr null, ptr %3, align 8
  %9 = invoke ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B8ne190102IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 1 dereferenceable(1) %4)
          to label %10 unwind label %11

10:                                               ; preds = %1
  ret ptr %5

11:                                               ; preds = %1
  %12 = landingpad { ptr, i32 }
          catch ptr null
  %13 = extractvalue { ptr, i32 } %12, 0
  call void @__clang_call_terminate(ptr %13) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B8ne190102IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B8ne190102IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 1 dereferenceable(1) %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B8ne190102IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"struct.std::__1::__default_init_tag", align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EEC2B8ne190102IDnLi0EEEOT_(ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(8) %9)
  %11 = load ptr, ptr %6, align 8
  %12 = call ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EEC2B8ne190102ENS_18__default_init_tagE(ptr noundef %8)
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EEC2B8ne190102IDnLi0EEEOT_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.11", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr null, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EEC2B8ne190102ENS_18__default_init_tagE(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca %"struct.std::__1::__default_init_tag", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEEC2B8ne190102Ev(ptr noundef %4) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEC2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::vector<std::__1::string>::__destroy_vector", align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = invoke ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC1B8ne190102ERS8_(ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(24) %4)
          to label %6 unwind label %8

6:                                                ; preds = %1
  invoke void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorclB8ne190102Ev(ptr noundef %3)
          to label %7 unwind label %8

7:                                                ; preds = %6
  ret ptr %4

8:                                                ; preds = %6, %1
  %9 = landingpad { ptr, i32 }
          catch ptr null
  %10 = extractvalue { ptr, i32 } %9, 0
  call void @__clang_call_terminate(ptr %10) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC1B8ne190102ERS8_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC2B8ne190102ERS8_(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(24) %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorclB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector<std::__1::string>::__destroy_vector", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::__1::vector", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %24

9:                                                ; preds = %1
  %10 = getelementptr inbounds %"class.std::__1::vector<std::__1::string>::__destroy_vector", ptr %3, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__clearB8ne190102Ev(ptr noundef %11) #3
  %12 = getelementptr inbounds %"class.std::__1::vector<std::__1::string>::__destroy_vector", ptr %3, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_deleteB8ne190102Ev(ptr noundef %13) #3
  %14 = getelementptr inbounds %"class.std::__1::vector<std::__1::string>::__destroy_vector", ptr %3, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %15) #3
  %17 = getelementptr inbounds %"class.std::__1::vector<std::__1::string>::__destroy_vector", ptr %3, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %"class.std::__1::vector", ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %"class.std::__1::vector<std::__1::string>::__destroy_vector", ptr %3, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB8ne190102Ev(ptr noundef %22) #3
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE10deallocateB8ne190102ERS7_PS6_m(ptr noundef nonnull align 1 dereferenceable(1) %16, ptr noundef %20, i64 noundef %23) #3
  br label %24

24:                                               ; preds = %9, %1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC2B8ne190102ERS8_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::vector<std::__1::string>::__destroy_vector", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__clearB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__base_destruct_at_endB8ne190102EPS6_(ptr noundef %3, ptr noundef %5) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_deleteB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE10deallocateB8ne190102ERS7_PS6_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE10deallocateB8ne190102EPS5_m(ptr noundef %7, ptr noundef %8, i64 noundef %9) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %3) #3
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 24
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__base_destruct_at_endB8ne190102EPS6_(ptr noundef %0, ptr noundef %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  br label %9

9:                                                ; preds = %18, %2
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %10, %11
  br i1 %12, label %13, label %19

13:                                               ; preds = %9
  %14 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %6) #3
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %"class.std::__1::basic_string", ptr %15, i32 -1
  store ptr %16, ptr %5, align 8
  %17 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %16) #3
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB8ne190102IS6_Li0EEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %14, ptr noundef %17)
          to label %18 unwind label %22

18:                                               ; preds = %13
  br label %9, !llvm.loop !8

19:                                               ; preds = %9
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  store ptr %20, ptr %21, align 8
  ret void

22:                                               ; preds = %13
  %23 = landingpad { ptr, i32 }
          catch ptr null
  %24 = extractvalue { ptr, i32 } %23, 0
  call void @__clang_call_terminate(ptr %24) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB8ne190102IS6_Li0EEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE7destroyB8ne190102EPS5_(ptr noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE7destroyB8ne190102EPS5_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %6) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE10deallocateB8ne190102EPS5_m(ptr noundef %0, ptr noundef %1, i64 noundef %2) #8 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = mul i64 %9, 24
  invoke void @_ZNSt3__119__libcpp_deallocateB8ne190102EPvmm(ptr noundef %8, i64 noundef %10, i64 noundef 8)
          to label %11 unwind label %12

11:                                               ; preds = %3
  ret void

12:                                               ; preds = %3
  %13 = landingpad { ptr, i32 }
          catch ptr null
  %14 = extractvalue { ptr, i32 } %13, 0
  call void @__clang_call_terminate(ptr %14) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__libcpp_deallocateB8ne190102EPvmm(ptr noundef %0, i64 noundef %1, i64 noundef %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  call void @_ZNSt3__127__do_deallocate_handle_sizeB8ne190102IJEEEvPvmDpT_(ptr noundef %7, i64 noundef %8)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__127__do_deallocate_handle_sizeB8ne190102IJEEEvPvmDpT_(ptr noundef %0, i64 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  call void @_ZNSt3__124__libcpp_operator_deleteB8ne190102IJPvEEEvDpT_(ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__124__libcpp_operator_deleteB8ne190102IJPvEEEvDpT_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZdlPv(ptr noundef %3) #15
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.11", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEED2Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.SecureContainer, ptr %3, i32 0, i32 1
  %5 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %class.SecureContainer, ptr %3, i32 0, i32 0
  %7 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B8ne190102Ev(ptr noundef %6) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEED2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::map", ptr %3, i32 0, i32 0
  %5 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEED1Ev(ptr noundef %4) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEED1Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEED2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEED2Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE6__rootB8ne190102Ev(ptr noundef %3) #3
  call void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE7destroyEPNS_11__tree_nodeISA_PvEE(ptr noundef %3, ptr noundef %4) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE7destroyEPNS_11__tree_nodeISA_PvEE(ptr noundef %0, ptr noundef %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %25

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  call void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE7destroyEPNS_11__tree_nodeISA_PvEE(ptr noundef %6, ptr noundef %12) #3
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  call void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE7destroyEPNS_11__tree_nodeISA_PvEE(ptr noundef %6, ptr noundef %15) #3
  %16 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__node_allocB8ne190102Ev(ptr noundef %6) #3
  store ptr %16, ptr %5, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %"class.std::__1::__tree_node", ptr %18, i32 0, i32 1
  %20 = invoke ptr @_ZNSt3__122__tree_key_value_typesINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEE9__get_ptrB8ne190102ERSA_(ptr noundef nonnull align 8 dereferenceable(32) %19)
          to label %21 unwind label %26

21:                                               ; preds = %9
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE7destroyB8ne190102INS_4pairIKS8_SA_EEvLi0EEEvRSE_PT_(ptr noundef nonnull align 1 dereferenceable(1) %17, ptr noundef %20)
          to label %22 unwind label %26

22:                                               ; preds = %21
  %23 = load ptr, ptr %5, align 8
  %24 = load ptr, ptr %4, align 8
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE10deallocateB8ne190102ERSE_PSD_m(ptr noundef nonnull align 1 dereferenceable(1) %23, ptr noundef %24, i64 noundef 1) #3
  br label %25

25:                                               ; preds = %22, %2
  ret void

26:                                               ; preds = %21, %9
  %27 = landingpad { ptr, i32 }
          catch ptr null
  %28 = extractvalue { ptr, i32 } %27, 0
  call void @__clang_call_terminate(ptr %28) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE6__rootB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %3) #3
  %5 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__node_allocB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree", ptr %3, i32 0, i32 1
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEE6secondB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE7destroyB8ne190102INS_4pairIKS8_SA_EEvLi0EEEvRSE_PT_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  call void @_ZNSt3__112__destroy_atB8ne190102INS_4pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEELi0EEEvPT_(ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__tree_key_value_typesINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEE9__get_ptrB8ne190102ERSA_(ptr noundef nonnull align 8 dereferenceable(32) %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt3__112__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseE11__get_valueB8ne190102Ev(ptr noundef %3)
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE10deallocateB8ne190102ERSE_PSD_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE10deallocateB8ne190102EPSC_m(ptr noundef %7, ptr noundef %8, i64 noundef %9) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEE6secondB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112__destroy_atB8ne190102INS_4pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEELi0EEEvPT_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseED1Ev(ptr noundef %3) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseED1Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseED2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseED2Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::pair", ptr %3, i32 0, i32 0
  %5 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %4) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt3__112__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseE11__get_valueB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__value_type", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE10deallocateB8ne190102EPSC_m(ptr noundef %0, ptr noundef %1, i64 noundef %2) #8 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = mul i64 %9, 64
  invoke void @_ZNSt3__119__libcpp_deallocateB8ne190102EPvmm(ptr noundef %8, i64 noundef %10, i64 noundef 8)
          to label %11 unwind label %12

11:                                               ; preds = %3
  ret void

12:                                               ; preds = %3
  %13 = landingpad { ptr, i32 }
          catch ptr null
  %14 = extractvalue { ptr, i32 } %13, 0
  call void @__clang_call_terminate(ptr %14) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree", ptr %3, i32 0, i32 1
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEE5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = call ptr @_ZNSt3__114pointer_traitsIPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEEE10pointer_toB8ne190102ERS6_(ptr noundef nonnull align 8 dereferenceable(8) %5) #3
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEP7LicenseEES3_EEEEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.2", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #10

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN17EnterpriseLicenseC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_i(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2, i32 noundef %3) unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca %"class.std::initializer_list", align 8
  %13 = alloca [6 x %"class.std::__1::basic_string"], align 8
  %14 = alloca ptr, align 8
  %15 = alloca [18 x i8], align 1
  %16 = alloca [16 x i8], align 1
  %17 = alloca [17 x i8], align 1
  %18 = alloca [15 x i8], align 1
  %19 = alloca [10 x i8], align 1
  %20 = alloca [17 x i8], align 1
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %21 = load ptr, ptr %6, align 8
  store ptr %21, ptr %5, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = call ptr @_ZN7LicenseC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_11LicenseType(ptr noundef %21, ptr noundef nonnull align 8 dereferenceable(24) %22, ptr noundef nonnull align 8 dereferenceable(24) %23, i32 noundef 3)
  store ptr getelementptr inbounds inrange(-16, 40) ({ [7 x ptr] }, ptr @_ZTV17EnterpriseLicense, i32 0, i32 0, i32 2), ptr %21, align 8
  %25 = getelementptr inbounds %class.EnterpriseLicense, ptr %21, i32 0, i32 1
  %26 = load i32, ptr %9, align 4
  store i32 %26, ptr %25, align 8
  %27 = getelementptr inbounds %class.EnterpriseLicense, ptr %21, i32 0, i32 2
  %28 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B8ne190102Ev(ptr noundef %27) #3
  %29 = getelementptr inbounds %class.EnterpriseLicense, ptr %21, i32 0, i32 3
  %30 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %29, ptr noundef nonnull align 8 dereferenceable(24) @CLOUD_API_TOKEN)
          to label %31 unwind label %120

31:                                               ; preds = %4
  store ptr %13, ptr %14, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %15, ptr align 1 @constinit, i64 18, i1 false)
  %32 = getelementptr inbounds [18 x i8], ptr %15, i64 0, i64 0
  %33 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %32, i32 noundef 18, i8 noundef zeroext -57)
          to label %34 unwind label %124

34:                                               ; preds = %31
  %35 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %13, ptr noundef %33)
          to label %36 unwind label %124

36:                                               ; preds = %34
  %37 = getelementptr inbounds %"class.std::__1::basic_string", ptr %13, i64 1
  store ptr %37, ptr %14, align 8
  store i8 -124, ptr %16, align 1
  %38 = getelementptr inbounds i8, ptr %16, i64 1
  store i8 -90, ptr %38, align 1
  %39 = getelementptr inbounds i8, ptr %16, i64 2
  store i8 -67, ptr %39, align 1
  %40 = getelementptr inbounds i8, ptr %16, i64 3
  store i8 -69, ptr %40, align 1
  %41 = getelementptr inbounds i8, ptr %16, i64 4
  store i8 -90, ptr %41, align 1
  %42 = getelementptr inbounds i8, ptr %16, i64 5
  store i8 -67, ptr %42, align 1
  %43 = getelementptr inbounds i8, ptr %16, i64 6
  store i8 -96, ptr %43, align 1
  %44 = getelementptr inbounds i8, ptr %16, i64 7
  store i8 -83, ptr %44, align 1
  %45 = getelementptr inbounds i8, ptr %16, i64 8
  store i8 -12, ptr %45, align 1
  %46 = getelementptr inbounds i8, ptr %16, i64 9
  store i8 -121, ptr %46, align 1
  %47 = getelementptr inbounds i8, ptr %16, i64 10
  store i8 -95, ptr %47, align 1
  %48 = getelementptr inbounds i8, ptr %16, i64 11
  store i8 -92, ptr %48, align 1
  %49 = getelementptr inbounds i8, ptr %16, i64 12
  store i8 -92, ptr %49, align 1
  %50 = getelementptr inbounds i8, ptr %16, i64 13
  store i8 -69, ptr %50, align 1
  %51 = getelementptr inbounds i8, ptr %16, i64 14
  store i8 -90, ptr %51, align 1
  %52 = getelementptr inbounds i8, ptr %16, i64 15
  store i8 -96, ptr %52, align 1
  %53 = getelementptr inbounds [16 x i8], ptr %16, i64 0, i64 0
  %54 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %53, i32 noundef 16, i8 noundef zeroext -44)
          to label %55 unwind label %124

55:                                               ; preds = %36
  %56 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %37, ptr noundef %54)
          to label %57 unwind label %124

57:                                               ; preds = %55
  %58 = getelementptr inbounds %"class.std::__1::basic_string", ptr %13, i64 2
  store ptr %58, ptr %14, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %17, ptr align 1 @constinit.26, i64 17, i1 false)
  %59 = getelementptr inbounds [17 x i8], ptr %17, i64 0, i64 0
  %60 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %59, i32 noundef 17, i8 noundef zeroext 86)
          to label %61 unwind label %124

61:                                               ; preds = %57
  %62 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %58, ptr noundef %60)
          to label %63 unwind label %124

63:                                               ; preds = %61
  %64 = getelementptr inbounds %"class.std::__1::basic_string", ptr %13, i64 3
  store ptr %64, ptr %14, align 8
  store i8 32, ptr %18, align 1
  %65 = getelementptr inbounds i8, ptr %18, i64 1
  store i8 22, ptr %65, align 1
  %66 = getelementptr inbounds i8, ptr %18, i64 2
  store i8 16, ptr %66, align 1
  %67 = getelementptr inbounds i8, ptr %18, i64 3
  store i8 23, ptr %67, align 1
  %68 = getelementptr inbounds i8, ptr %18, i64 4
  store i8 12, ptr %68, align 1
  %69 = getelementptr inbounds i8, ptr %18, i64 5
  store i8 14, ptr %69, align 1
  %70 = getelementptr inbounds i8, ptr %18, i64 6
  store i8 67, ptr %70, align 1
  %71 = getelementptr inbounds i8, ptr %18, i64 7
  store i8 33, ptr %71, align 1
  %72 = getelementptr inbounds i8, ptr %18, i64 8
  store i8 17, ptr %72, align 1
  %73 = getelementptr inbounds i8, ptr %18, i64 9
  store i8 2, ptr %73, align 1
  %74 = getelementptr inbounds i8, ptr %18, i64 10
  store i8 13, ptr %74, align 1
  %75 = getelementptr inbounds i8, ptr %18, i64 11
  store i8 7, ptr %75, align 1
  %76 = getelementptr inbounds i8, ptr %18, i64 12
  store i8 10, ptr %76, align 1
  %77 = getelementptr inbounds i8, ptr %18, i64 13
  store i8 13, ptr %77, align 1
  %78 = getelementptr inbounds i8, ptr %18, i64 14
  store i8 4, ptr %78, align 1
  %79 = getelementptr inbounds [15 x i8], ptr %18, i64 0, i64 0
  %80 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %79, i32 noundef 15, i8 noundef zeroext 99)
          to label %81 unwind label %124

81:                                               ; preds = %63
  %82 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %64, ptr noundef %80)
          to label %83 unwind label %124

83:                                               ; preds = %81
  %84 = getelementptr inbounds %"class.std::__1::basic_string", ptr %13, i64 4
  store ptr %84, ptr %14, align 8
  store i8 -30, ptr %19, align 1
  %85 = getelementptr inbounds i8, ptr %19, i64 1
  store i8 -13, ptr %85, align 1
  %86 = getelementptr inbounds i8, ptr %19, i64 2
  store i8 -22, ptr %86, align 1
  %87 = getelementptr inbounds i8, ptr %19, i64 3
  store i8 -125, ptr %87, align 1
  %88 = getelementptr inbounds i8, ptr %19, i64 4
  store i8 -30, ptr %88, align 1
  %89 = getelementptr inbounds i8, ptr %19, i64 5
  store i8 -64, ptr %89, align 1
  %90 = getelementptr inbounds i8, ptr %19, i64 6
  store i8 -64, ptr %90, align 1
  %91 = getelementptr inbounds i8, ptr %19, i64 7
  store i8 -58, ptr %91, align 1
  %92 = getelementptr inbounds i8, ptr %19, i64 8
  store i8 -48, ptr %92, align 1
  %93 = getelementptr inbounds i8, ptr %19, i64 9
  store i8 -48, ptr %93, align 1
  %94 = getelementptr inbounds [10 x i8], ptr %19, i64 0, i64 0
  %95 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %94, i32 noundef 10, i8 noundef zeroext -93)
          to label %96 unwind label %124

96:                                               ; preds = %83
  %97 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %84, ptr noundef %95)
          to label %98 unwind label %124

98:                                               ; preds = %96
  %99 = getelementptr inbounds %"class.std::__1::basic_string", ptr %13, i64 5
  store ptr %99, ptr %14, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %20, ptr align 1 @constinit.27, i64 17, i1 false)
  %100 = getelementptr inbounds [17 x i8], ptr %20, i64 0, i64 0
  %101 = invoke ptr @_ZL12_xor_decryptPKhih(ptr noundef %100, i32 noundef 17, i8 noundef zeroext -53)
          to label %102 unwind label %124

102:                                              ; preds = %98
  %103 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102ILi0EEEPKc(ptr noundef %99, ptr noundef %101)
          to label %104 unwind label %124

104:                                              ; preds = %102
  %105 = getelementptr inbounds %"class.std::initializer_list", ptr %12, i32 0, i32 0
  store ptr %13, ptr %105, align 8
  %106 = getelementptr inbounds %"class.std::initializer_list", ptr %12, i32 0, i32 1
  store i64 6, ptr %106, align 8
  %107 = getelementptr inbounds %class.EnterpriseLicense, ptr %21, i32 0, i32 2
  %108 = load [2 x i64], ptr %12, align 8
  %109 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEaSB8ne190102ESt16initializer_listIS6_E(ptr noundef %107, [2 x i64] %108)
          to label %110 unwind label %136

110:                                              ; preds = %104
  %111 = getelementptr inbounds [6 x %"class.std::__1::basic_string"], ptr %13, i32 0, i32 0
  %112 = getelementptr inbounds %"class.std::__1::basic_string", ptr %111, i64 6
  br label %113

113:                                              ; preds = %113, %110
  %114 = phi ptr [ %112, %110 ], [ %115, %113 ]
  %115 = getelementptr inbounds %"class.std::__1::basic_string", ptr %114, i64 -1
  %116 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %115) #3
  %117 = icmp eq ptr %115, %111
  br i1 %117, label %118, label %113

118:                                              ; preds = %113
  %119 = load ptr, ptr %5, align 8
  ret ptr %119

120:                                              ; preds = %4
  %121 = landingpad { ptr, i32 }
          cleanup
  %122 = extractvalue { ptr, i32 } %121, 0
  store ptr %122, ptr %10, align 8
  %123 = extractvalue { ptr, i32 } %121, 1
  store i32 %123, ptr %11, align 4
  br label %150

124:                                              ; preds = %102, %98, %96, %83, %81, %63, %61, %57, %55, %36, %34, %31
  %125 = landingpad { ptr, i32 }
          cleanup
  %126 = extractvalue { ptr, i32 } %125, 0
  store ptr %126, ptr %10, align 8
  %127 = extractvalue { ptr, i32 } %125, 1
  store i32 %127, ptr %11, align 4
  %128 = load ptr, ptr %14, align 8
  %129 = icmp eq ptr %13, %128
  br i1 %129, label %135, label %130

130:                                              ; preds = %130, %124
  %131 = phi ptr [ %128, %124 ], [ %132, %130 ]
  %132 = getelementptr inbounds %"class.std::__1::basic_string", ptr %131, i64 -1
  %133 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %132) #3
  %134 = icmp eq ptr %132, %13
  br i1 %134, label %135, label %130

135:                                              ; preds = %130, %124
  br label %148

136:                                              ; preds = %104
  %137 = landingpad { ptr, i32 }
          cleanup
  %138 = extractvalue { ptr, i32 } %137, 0
  store ptr %138, ptr %10, align 8
  %139 = extractvalue { ptr, i32 } %137, 1
  store i32 %139, ptr %11, align 4
  %140 = getelementptr inbounds [6 x %"class.std::__1::basic_string"], ptr %13, i32 0, i32 0
  %141 = getelementptr inbounds %"class.std::__1::basic_string", ptr %140, i64 6
  br label %142

142:                                              ; preds = %142, %136
  %143 = phi ptr [ %141, %136 ], [ %144, %142 ]
  %144 = getelementptr inbounds %"class.std::__1::basic_string", ptr %143, i64 -1
  %145 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %144) #3
  %146 = icmp eq ptr %144, %140
  br i1 %146, label %147, label %142

147:                                              ; preds = %142
  br label %148

148:                                              ; preds = %147, %135
  %149 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %29) #3
  br label %150

150:                                              ; preds = %148, %120
  %151 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B8ne190102Ev(ptr noundef %27) #3
  %152 = call ptr @_ZN7LicenseD2Ev(ptr noundef %21) #3
  br label %153

153:                                              ; preds = %150
  %154 = load ptr, ptr %10, align 8
  %155 = load i32, ptr %11, align 4
  %156 = insertvalue { ptr, i32 } poison, ptr %154, 0
  %157 = insertvalue { ptr, i32 } %156, i32 %155, 1
  resume { ptr, i32 } %157
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN7LicenseC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_11LicenseType(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2, i32 noundef %3) unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %11 = load ptr, ptr %5, align 8
  store ptr getelementptr inbounds inrange(-16, 40) ({ [7 x ptr] }, ptr @_ZTV7License, i32 0, i32 0, i32 2), ptr %11, align 8
  %12 = getelementptr inbounds %class.License, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %6, align 8
  %14 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %12, ptr noundef nonnull align 8 dereferenceable(24) %13)
  %15 = getelementptr inbounds %class.License, ptr %11, i32 0, i32 2
  %16 = load ptr, ptr %7, align 8
  %17 = invoke ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %15, ptr noundef nonnull align 8 dereferenceable(24) %16)
          to label %18 unwind label %26

18:                                               ; preds = %4
  %19 = getelementptr inbounds %class.License, ptr %11, i32 0, i32 4
  %20 = load i32, ptr %8, align 4
  store i32 %20, ptr %19, align 8
  %21 = getelementptr inbounds %class.License, ptr %11, i32 0, i32 5
  store i8 0, ptr %21, align 4
  %22 = invoke i64 @time(ptr noundef null)
          to label %23 unwind label %30

23:                                               ; preds = %18
  %24 = add nsw i64 %22, 31536000
  %25 = getelementptr inbounds %class.License, ptr %11, i32 0, i32 3
  store i64 %24, ptr %25, align 8
  ret ptr %11

26:                                               ; preds = %4
  %27 = landingpad { ptr, i32 }
          cleanup
  %28 = extractvalue { ptr, i32 } %27, 0
  store ptr %28, ptr %9, align 8
  %29 = extractvalue { ptr, i32 } %27, 1
  store i32 %29, ptr %10, align 4
  br label %35

30:                                               ; preds = %18
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = extractvalue { ptr, i32 } %31, 0
  store ptr %32, ptr %9, align 8
  %33 = extractvalue { ptr, i32 } %31, 1
  store i32 %33, ptr %10, align 4
  %34 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %15) #3
  br label %35

35:                                               ; preds = %30, %26
  %36 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %12) #3
  br label %37

37:                                               ; preds = %35
  %38 = load ptr, ptr %9, align 8
  %39 = load i32, ptr %10, align 4
  %40 = insertvalue { ptr, i32 } poison, ptr %38, 0
  %41 = insertvalue { ptr, i32 } %40, i32 %39, 1
  resume { ptr, i32 } %41
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #11

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEaSB8ne190102ESt16initializer_listIS6_E(ptr noundef %0, [2 x i64] %1) #1 {
  %3 = alloca %"class.std::initializer_list", align 8
  %4 = alloca ptr, align 8
  store [2 x i64] %1, ptr %3, align 8
  store ptr %0, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = call ptr @_ZNKSt16initializer_listINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE5beginB8ne190102Ev(ptr noundef %3) #3
  %7 = call ptr @_ZNKSt16initializer_listINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE3endB8ne190102Ev(ptr noundef %3) #3
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6assignIPKS6_Li0EEEvT_SC_(ptr noundef %5, ptr noundef %6, ptr noundef %7)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN7LicenseD2Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds inrange(-16, 40) ({ [7 x ptr] }, ptr @_ZTV7License, i32 0, i32 0, i32 2), ptr %3, align 8
  %4 = getelementptr inbounds %class.License, ptr %3, i32 0, i32 2
  %5 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %class.License, ptr %3, i32 0, i32 1
  %7 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %6) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN17EnterpriseLicenseD1Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZN17EnterpriseLicenseD2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN17EnterpriseLicenseD0Ev(ptr noundef %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZN17EnterpriseLicenseD1Ev(ptr noundef %3) #3
  call void @_ZdlPv(ptr noundef %3) #15
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr zeroext i1 @_ZNK17EnterpriseLicense8validateEv(ptr noundef %0) unnamed_addr #1 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.36)
  %6 = call zeroext i1 @_ZNK7License8validateEv(ptr noundef %4)
  br i1 %6, label %8, label %7

7:                                                ; preds = %1
  store i1 false, ptr %2, align 1
  br label %18

8:                                                ; preds = %1
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.37)
  %10 = getelementptr inbounds %class.EnterpriseLicense, ptr %4, i32 0, i32 3
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef nonnull align 8 dereferenceable(24) %10)
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef @.str.18)
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.38)
  %14 = getelementptr inbounds %class.EnterpriseLicense, ptr %4, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef %13, i32 noundef %15)
  %17 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %16, ptr noundef @.str.18)
  store i1 true, ptr %2, align 1
  br label %18

18:                                               ; preds = %8, %7
  %19 = load i1, ptr %2, align 1
  ret i1 %19
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7License14f_200c7e622003ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.39)
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(24) %7)
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef @.str.18)
  %10 = load ptr, ptr %4, align 8
  %11 = call zeroext i1 @_ZNSt3__1eqB8ne190102INS_9allocatorIcEEEEbRKNS_12basic_stringIcNS_11char_traitsIcEET_EES9_(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 8 dereferenceable(24) @ACTIVATION_SECRET) #3
  br i1 %11, label %12, label %15

12:                                               ; preds = %2
  %13 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 5
  store i8 1, ptr %13, align 4
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.40)
  br label %17

15:                                               ; preds = %2
  %16 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.41)
  br label %17

17:                                               ; preds = %15, %12
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK17EnterpriseLicense12display_infoEv(ptr noundef %0) unnamed_addr #1 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %"class.std::__1::__wrap_iter", align 8
  %5 = alloca %"class.std::__1::__wrap_iter", align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  call void @_ZNK7License12display_infoEv(ptr noundef %7)
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.42)
  %9 = getelementptr inbounds %class.EnterpriseLicense, ptr %7, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef %8, i32 noundef %10)
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef @.str.18)
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.43)
  %14 = getelementptr inbounds %class.EnterpriseLicense, ptr %7, i32 0, i32 2
  store ptr %14, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5beginB8ne190102Ev(ptr noundef %15) #3
  %17 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %4, i32 0, i32 0
  %18 = inttoptr i64 %16 to ptr
  store ptr %18, ptr %17, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE3endB8ne190102Ev(ptr noundef %19) #3
  %21 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %5, i32 0, i32 0
  %22 = inttoptr i64 %20 to ptr
  store ptr %22, ptr %21, align 8
  br label %23

23:                                               ; preds = %30, %1
  %24 = call zeroext i1 @_ZNSt3__1neB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESD_(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %5) #3
  br i1 %24, label %25, label %32

25:                                               ; preds = %23
  %26 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB8ne190102Ev(ptr noundef %4) #3
  store ptr %26, ptr %6, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef nonnull align 8 dereferenceable(24) %27)
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %28, ptr noundef @.str.44)
  br label %30

30:                                               ; preds = %25
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEppB8ne190102Ev(ptr noundef %4) #3
  br label %23

32:                                               ; preds = %23
  %33 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.18)
  ret void
}

declare i64 @time(ptr noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN7LicenseD1Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZN7LicenseD2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7LicenseD0Ev(ptr noundef %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZN7LicenseD1Ev(ptr noundef %3) #3
  call void @_ZdlPv(ptr noundef %3) #15
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr zeroext i1 @_ZNK7License8validateEv(ptr noundef %0) unnamed_addr #1 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.28)
  %7 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 1
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(24) %7)
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef @.str.18)
  %10 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 1
  %11 = call zeroext i1 @_ZNSt3__1eqB8ne190102INS_9allocatorIcEEEEbRKNS_12basic_stringIcNS_11char_traitsIcEET_EES9_(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 8 dereferenceable(24) @MASTER_LICENSE_KEY) #3
  br i1 %11, label %12, label %14

12:                                               ; preds = %1
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.29)
  store i1 true, ptr %2, align 1
  br label %31

14:                                               ; preds = %1
  %15 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 1
  %16 = call zeroext i1 @_ZNSt3__1eqB8ne190102INS_9allocatorIcEEEEbRKNS_12basic_stringIcNS_11char_traitsIcEET_EES9_(ptr noundef nonnull align 8 dereferenceable(24) %15, ptr noundef nonnull align 8 dereferenceable(24) @BACKUP_LICENSE) #3
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.30)
  store i1 true, ptr %2, align 1
  br label %31

19:                                               ; preds = %14
  %20 = call i64 @time(ptr noundef null)
  store i64 %20, ptr %4, align 8
  %21 = load i64, ptr %4, align 8
  %22 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 3
  %23 = load i64, ptr %22, align 8
  %24 = icmp sgt i64 %21, %23
  br i1 %24, label %25, label %27

25:                                               ; preds = %19
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.31)
  store i1 false, ptr %2, align 1
  br label %31

27:                                               ; preds = %19
  %28 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 5
  %29 = load i8, ptr %28, align 4
  %30 = trunc i8 %29 to i1
  store i1 %30, ptr %2, align 1
  br label %31

31:                                               ; preds = %27, %25, %17, %12
  %32 = load i1, ptr %2, align 1
  ret i1 %32
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK7License12display_infoEv(ptr noundef %0) unnamed_addr #1 {
  %2 = alloca ptr, align 8
  %3 = alloca [6 x i8], align 1
  %4 = alloca [8 x i8], align 1
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.32)
  %7 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 2
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(24) %7)
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef @.str.18)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.33)
  %11 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 4
  %12 = load i32, ptr %11, align 8
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef %10, i32 noundef %12)
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %13, ptr noundef @.str.18)
  %15 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.34)
  %16 = getelementptr inbounds %class.License, ptr %5, i32 0, i32 5
  %17 = load i8, ptr %16, align 4
  %18 = trunc i8 %17 to i1
  br i1 %18, label %19, label %27

19:                                               ; preds = %1
  store i8 -3, ptr %3, align 1
  %20 = getelementptr inbounds i8, ptr %3, i64 1
  store i8 -33, ptr %20, align 1
  %21 = getelementptr inbounds i8, ptr %3, i64 2
  store i8 -56, ptr %21, align 1
  %22 = getelementptr inbounds i8, ptr %3, i64 3
  store i8 -43, ptr %22, align 1
  %23 = getelementptr inbounds i8, ptr %3, i64 4
  store i8 -54, ptr %23, align 1
  %24 = getelementptr inbounds i8, ptr %3, i64 5
  store i8 -39, ptr %24, align 1
  %25 = getelementptr inbounds [6 x i8], ptr %3, i64 0, i64 0
  %26 = call ptr @_ZL12_xor_decryptPKhih(ptr noundef %25, i32 noundef 6, i8 noundef zeroext -68)
  br label %37

27:                                               ; preds = %1
  store i8 98, ptr %4, align 1
  %28 = getelementptr inbounds i8, ptr %4, i64 1
  store i8 69, ptr %28, align 1
  %29 = getelementptr inbounds i8, ptr %4, i64 2
  store i8 74, ptr %29, align 1
  %30 = getelementptr inbounds i8, ptr %4, i64 3
  store i8 72, ptr %30, align 1
  %31 = getelementptr inbounds i8, ptr %4, i64 4
  store i8 95, ptr %31, align 1
  %32 = getelementptr inbounds i8, ptr %4, i64 5
  store i8 66, ptr %32, align 1
  %33 = getelementptr inbounds i8, ptr %4, i64 6
  store i8 93, ptr %33, align 1
  %34 = getelementptr inbounds i8, ptr %4, i64 7
  store i8 78, ptr %34, align 1
  %35 = getelementptr inbounds [8 x i8], ptr %4, i64 0, i64 0
  %36 = call ptr @_ZL12_xor_decryptPKhih(ptr noundef %35, i32 noundef 8, i8 noundef zeroext 43)
  br label %37

37:                                               ; preds = %27, %19
  %38 = phi ptr [ %26, %19 ], [ %36, %27 ]
  %39 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %15, ptr noundef %38)
  %40 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %39, ptr noundef @.str.18)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1eqB8ne190102INS_9allocatorIcEEEEbRKNS_12basic_stringIcNS_11char_traitsIcEET_EES9_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #8 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %7) #3
  store i64 %8, ptr %6, align 8
  %9 = load i64, ptr %6, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %10) #3
  %12 = icmp ne i64 %9, %11
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store i1 false, ptr %3, align 1
  br label %22

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %15) #3
  %17 = load ptr, ptr %5, align 8
  %18 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %17) #3
  %19 = load i64, ptr %6, align 8
  %20 = call i32 @_ZNSt3__111char_traitsIcE7compareB8ne190102EPKcS3_m(ptr noundef %16, ptr noundef %18, i64 noundef %19) #3
  %21 = icmp eq i32 %20, 0
  store i1 %21, ptr %3, align 1
  br label %22

22:                                               ; preds = %14, %13
  %23 = load i1, ptr %3, align 1
  ret i1 %23
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne190102Ev(ptr noundef %3) #3
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne190102Ev(ptr noundef %3) #3
  br label %9

7:                                                ; preds = %1
  %8 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne190102Ev(ptr noundef %3) #3
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi i64 [ %6, %5 ], [ %8, %7 ]
  ret i64 %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i32 @_ZNSt3__111char_traitsIcE7compareB8ne190102EPKcS3_m(ptr noundef %0, ptr noundef %1, i64 noundef %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call i32 @memcmp(ptr noundef %7, ptr noundef %8, i64 noundef %9) #3
  ret i32 %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne190102Ev(ptr noundef %3) #3
  %5 = call ptr @_ZNSt3__112__to_addressB8ne190102IKcEEPT_S3_(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %5, i32 0, i32 2
  %7 = load i8, ptr %6, align 1
  %8 = lshr i8 %7, 7
  %9 = icmp ne i8 %8, 0
  ret i1 %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %5, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  ret i64 %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %5, i32 0, i32 2
  %7 = load i8, ptr %6, align 1
  %8 = and i8 %7, 127
  %9 = zext i8 %8 to i64
  ret i64 %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: nounwind
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112__to_addressB8ne190102IKcEEPT_S3_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne190102Ev(ptr noundef %3) #3
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne190102Ev(ptr noundef %3) #3
  br label %9

7:                                                ; preds = %1
  %8 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne190102Ev(ptr noundef %3) #3
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi ptr [ %6, %5 ], [ %8, %7 ]
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds [23 x i8], ptr %6, i64 0, i64 0
  %8 = call ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne190102ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %7) #3
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne190102ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef, i32 noundef) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6assignIPKS6_Li0EEEvT_SC_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = call i64 @_ZNSt3__18distanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_15iterator_traitsIT_E15difference_typeESA_SA_(ptr noundef %10, ptr noundef %11)
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE18__assign_with_sizeB8ne190102IPKS6_SB_EEvT_T0_l(ptr noundef %7, ptr noundef %8, ptr noundef %9, i64 noundef %12)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt16initializer_listINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE5beginB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::initializer_list", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt16initializer_listINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE3endB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::initializer_list", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::initializer_list", ptr %3, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds %"class.std::__1::basic_string", ptr %5, i64 %7
  ret ptr %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE18__assign_with_sizeB8ne190102IPKS6_SB_EEvT_T0_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, i64 noundef %3) #1 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca %"struct.std::__1::pair.16", align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = load i64, ptr %8, align 8
  store i64 %14, ptr %9, align 8
  %15 = load i64, ptr %9, align 8
  %16 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB8ne190102Ev(ptr noundef %13) #3
  %17 = icmp ule i64 %15, %16
  br i1 %17, label %18, label %46

18:                                               ; preds = %4
  %19 = load i64, ptr %9, align 8
  %20 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %13) #3
  %21 = icmp ugt i64 %19, %20
  br i1 %21, label %22, label %36

22:                                               ; preds = %18
  %23 = load ptr, ptr %6, align 8
  %24 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %13) #3
  %25 = call ptr @_ZNSt3__14nextB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0EEET_S9_NS_15iterator_traitsIS9_E15difference_typeE(ptr noundef %23, i64 noundef %24)
  store ptr %25, ptr %10, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = load ptr, ptr %10, align 8
  %28 = getelementptr inbounds %"class.std::__1::vector", ptr %13, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = call ptr @_ZNSt3__14copyB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EET0_T_SB_SA_(ptr noundef %26, ptr noundef %27, ptr noundef %29)
  %31 = load ptr, ptr %10, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = load i64, ptr %9, align 8
  %34 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %13) #3
  %35 = sub i64 %33, %34
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE18__construct_at_endIPKS6_SB_EEvT_T0_m(ptr noundef %13, ptr noundef %31, ptr noundef %32, i64 noundef %35)
  br label %45

36:                                               ; preds = %18
  %37 = load ptr, ptr %6, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds %"class.std::__1::vector", ptr %13, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = call [2 x i64] @_ZNSt3__16__copyB8ne190102INS_17_ClassicAlgPolicyEPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES9_PS7_EENS_4pairIT0_T2_EESC_T1_SD_(ptr noundef %37, ptr noundef %38, ptr noundef %40)
  store [2 x i64] %41, ptr %12, align 8
  %42 = getelementptr inbounds %"struct.std::__1::pair.16", ptr %12, i32 0, i32 1
  %43 = load ptr, ptr %42, align 8
  store ptr %43, ptr %11, align 8
  %44 = load ptr, ptr %11, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__destruct_at_endB8ne190102EPS6_(ptr noundef %13, ptr noundef %44) #3
  br label %45

45:                                               ; preds = %36, %22
  br label %52

46:                                               ; preds = %4
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE13__vdeallocateEv(ptr noundef %13) #3
  %47 = load i64, ptr %9, align 8
  %48 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__recommendB8ne190102Em(ptr noundef %13, i64 noundef %47)
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__vallocateB8ne190102Em(ptr noundef %13, i64 noundef %48)
  %49 = load ptr, ptr %6, align 8
  %50 = load ptr, ptr %7, align 8
  %51 = load i64, ptr %9, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE18__construct_at_endIPKS6_SB_EEvT_T0_m(ptr noundef %13, ptr noundef %49, ptr noundef %50, i64 noundef %51)
  br label %52

52:                                               ; preds = %46, %45
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__18distanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_15iterator_traitsIT_E15difference_typeESA_SA_(ptr noundef %0, ptr noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::random_access_iterator_tag", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call i64 @_ZNSt3__110__distanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_15iterator_traitsIT_E15difference_typeESA_SA_NS_26random_access_iterator_tagE(ptr noundef %6, ptr noundef %7)
  ret i64 %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 24
  ret i64 %11
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__14nextB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0EEET_S9_NS_15iterator_traitsIS9_E15difference_typeE(ptr noundef %0, i64 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %4, align 8
  call void @_ZNSt3__17advanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEllLi0EEEvRT_T0_(ptr noundef nonnull align 8 dereferenceable(8) %3, i64 noundef %5)
  %6 = load ptr, ptr %3, align 8
  ret ptr %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__14copyB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EET0_T_SB_SA_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"struct.std::__1::pair.16", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = call [2 x i64] @_ZNSt3__16__copyB8ne190102INS_17_ClassicAlgPolicyEPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES9_PS7_EENS_4pairIT0_T2_EESC_T1_SD_(ptr noundef %8, ptr noundef %9, ptr noundef %10)
  store [2 x i64] %11, ptr %7, align 8
  %12 = getelementptr inbounds %"struct.std::__1::pair.16", ptr %7, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  ret ptr %13
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE18__construct_at_endIPKS6_SB_EEvT_T0_m(ptr noundef %0, ptr noundef %1, ptr noundef %2, i64 noundef %3) #1 personality ptr @__gxx_personality_v0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load i64, ptr %8, align 8
  %14 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC1B8ne190102ERS8_m(ptr noundef %9, ptr noundef nonnull align 8 dereferenceable(24) %12, i64 noundef %13)
  %15 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %12) #3
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %9, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = invoke ptr @_ZNSt3__130__uninitialized_allocator_copyB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPKS6_S9_PS6_EET2_RT_T0_T1_SB_(ptr noundef nonnull align 1 dereferenceable(1) %15, ptr noundef %16, ptr noundef %17, ptr noundef %19)
          to label %21 unwind label %24

21:                                               ; preds = %4
  %22 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %9, i32 0, i32 1
  store ptr %20, ptr %22, align 8
  %23 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B8ne190102Ev(ptr noundef %9) #3
  ret void

24:                                               ; preds = %4
  %25 = landingpad { ptr, i32 }
          cleanup
  %26 = extractvalue { ptr, i32 } %25, 0
  store ptr %26, ptr %10, align 8
  %27 = extractvalue { ptr, i32 } %25, 1
  store i32 %27, ptr %11, align 4
  %28 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B8ne190102Ev(ptr noundef %9) #3
  br label %29

29:                                               ; preds = %24
  %30 = load ptr, ptr %10, align 8
  %31 = load i32, ptr %11, align 4
  %32 = insertvalue { ptr, i32 } poison, ptr %30, 0
  %33 = insertvalue { ptr, i32 } %32, i32 %31, 1
  resume { ptr, i32 } %33
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__16__copyB8ne190102INS_17_ClassicAlgPolicyEPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES9_PS7_EENS_4pairIT0_T2_EESC_T1_SD_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #1 {
  %4 = alloca %"struct.std::__1::pair.16", align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = call [2 x i64] @_ZNSt3__124__copy_move_unwrap_itersB8ne190102INS_11__copy_implINS_17_ClassicAlgPolicyEEEPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEESB_PS9_Li0EEENS_4pairIT0_T2_EESE_T1_SF_(ptr noundef %8, ptr noundef %9, ptr noundef %10)
  store [2 x i64] %11, ptr %4, align 8
  %12 = load [2 x i64], ptr %4, align 8
  ret [2 x i64] %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__destruct_at_endB8ne190102EPS6_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %6) #3
  store i64 %7, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__base_destruct_at_endB8ne190102EPS6_(ptr noundef %6, ptr noundef %8) #3
  %9 = load i64, ptr %5, align 8
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_shrinkB8ne190102Em(ptr noundef %6, i64 noundef %9) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE13__vdeallocateEv(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %15

7:                                                ; preds = %1
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5clearB8ne190102Ev(ptr noundef %3) #3
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_deleteB8ne190102Ev(ptr noundef %3) #3
  %8 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %3) #3
  %9 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB8ne190102Ev(ptr noundef %3) #3
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE10deallocateB8ne190102ERS7_PS6_m(ptr noundef nonnull align 1 dereferenceable(1) %8, ptr noundef %10, i64 noundef %11) #3
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %3) #3
  store ptr null, ptr %12, align 8
  %13 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 1
  store ptr null, ptr %13, align 8
  %14 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 0
  store ptr null, ptr %14, align 8
  br label %15

15:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__vallocateB8ne190102Em(ptr noundef %0, i64 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca %"struct.std::__1::__allocation_result", align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load i64, ptr %4, align 8
  %8 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8max_sizeEv(ptr noundef %6) #3
  %9 = icmp ugt i64 %7, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_length_errorB8ne190102Ev(ptr noundef %6) #18
  unreachable

11:                                               ; preds = %2
  %12 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %6) #3
  %13 = load i64, ptr %4, align 8
  %14 = call [2 x i64] @_ZNSt3__119__allocate_at_leastB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERSA_m(ptr noundef nonnull align 1 dereferenceable(1) %12, i64 noundef %13)
  store [2 x i64] %14, ptr %5, align 8
  %15 = getelementptr inbounds %"struct.std::__1::__allocation_result", ptr %5, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 0
  store ptr %16, ptr %17, align 8
  %18 = getelementptr inbounds %"struct.std::__1::__allocation_result", ptr %5, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  store ptr %19, ptr %20, align 8
  %21 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %"struct.std::__1::__allocation_result", ptr %5, i32 0, i32 1
  %24 = load i64, ptr %23, align 8
  %25 = getelementptr inbounds %"class.std::__1::basic_string", ptr %22, i64 %24
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %6) #3
  store ptr %25, ptr %26, align 8
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE14__annotate_newB8ne190102Em(ptr noundef %6, i64 noundef 0) #3
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__recommendB8ne190102Em(ptr noundef %0, i64 noundef %1) #1 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8max_sizeEv(ptr noundef %9) #3
  store i64 %10, ptr %6, align 8
  %11 = load i64, ptr %5, align 8
  %12 = load i64, ptr %6, align 8
  %13 = icmp ugt i64 %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_length_errorB8ne190102Ev(ptr noundef %9) #18
  unreachable

15:                                               ; preds = %2
  %16 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB8ne190102Ev(ptr noundef %9) #3
  store i64 %16, ptr %7, align 8
  %17 = load i64, ptr %7, align 8
  %18 = load i64, ptr %6, align 8
  %19 = udiv i64 %18, 2
  %20 = icmp uge i64 %17, %19
  br i1 %20, label %21, label %23

21:                                               ; preds = %15
  %22 = load i64, ptr %6, align 8
  store i64 %22, ptr %3, align 8
  br label %28

23:                                               ; preds = %15
  %24 = load i64, ptr %7, align 8
  %25 = mul i64 2, %24
  store i64 %25, ptr %8, align 8
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne190102ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %5)
  %27 = load i64, ptr %26, align 8
  store i64 %27, ptr %3, align 8
  br label %28

28:                                               ; preds = %23, %21
  %29 = load i64, ptr %3, align 8
  ret i64 %29
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__17advanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEllLi0EEEvRT_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, i64 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca %"struct.std::__1::random_access_iterator_tag", align 1
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %7 = load i64, ptr %4, align 8
  %8 = call i64 @_ZNSt3__121__convert_to_integralB8ne190102El(i64 noundef %7)
  store i64 %8, ptr %5, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load i64, ptr %5, align 8
  call void @_ZNSt3__19__advanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvRT_NS_15iterator_traitsIS9_E15difference_typeENS_26random_access_iterator_tagE(ptr noundef nonnull align 8 dereferenceable(8) %9, i64 noundef %10)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__121__convert_to_integralB8ne190102El(i64 noundef %0) #8 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  ret i64 %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19__advanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvRT_NS_15iterator_traitsIS9_E15difference_typeENS_26random_access_iterator_tagE(ptr noundef nonnull align 8 dereferenceable(8) %0, i64 noundef %1) #8 {
  %3 = alloca %"struct.std::__1::random_access_iterator_tag", align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %6 = load i64, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %"class.std::__1::basic_string", ptr %8, i64 %6
  store ptr %9, ptr %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC1B8ne190102ERS8_m(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC2B8ne190102ERS8_m(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__130__uninitialized_allocator_copyB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPKS6_S9_PS6_EET2_RT_T0_T1_SB_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #1 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %"struct.std::__1::pair.17", align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = call [2 x i64] @_ZNSt3__114__unwrap_rangeB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EENS_4pairIT0_SA_EET_SC_(ptr noundef %11, ptr noundef %12)
  store [2 x i64] %13, ptr %9, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %"struct.std::__1::pair.17", ptr %9, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %"struct.std::__1::pair.17", ptr %9, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = call ptr @_ZNSt3__113__unwrap_iterB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_18__unwrap_iter_implIS7_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEESB_(ptr noundef %19) #3
  %21 = call ptr @_ZNSt3__135__uninitialized_allocator_copy_implB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPKS6_S9_PS6_EET2_RT_T0_T1_SB_(ptr noundef nonnull align 1 dereferenceable(1) %14, ptr noundef %16, ptr noundef %18, ptr noundef %20)
  store ptr %21, ptr %10, align 8
  %22 = load ptr, ptr %8, align 8
  %23 = load ptr, ptr %10, align 8
  %24 = call ptr @_ZNSt3__113__rewrap_iterB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_NS_18__unwrap_iter_implIS7_Lb1EEEEET_SA_T0_(ptr noundef %22, ptr noundef %23) #3
  ret ptr %24
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC2B8ne190102ERS8_m(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %8, align 8
  %10 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %7, i32 0, i32 1
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %"class.std::__1::vector", ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %10, align 8
  %14 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %7, i32 0, i32 2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %"class.std::__1::vector", ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %6, align 8
  %19 = getelementptr inbounds %"class.std::__1::basic_string", ptr %17, i64 %18
  store ptr %19, ptr %14, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__114__unwrap_rangeB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EENS_4pairIT0_SA_EET_SC_(ptr noundef %0, ptr noundef %1) #1 {
  %3 = alloca %"struct.std::__1::pair.17", align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = call ptr @_ZNSt3__113__unwrap_iterB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_18__unwrap_iter_implIS8_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEESC_(ptr noundef %8) #3
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = call ptr @_ZNSt3__113__unwrap_iterB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_18__unwrap_iter_implIS8_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEESC_(ptr noundef %10) #3
  store ptr %11, ptr %7, align 8
  %12 = call [2 x i64] @_ZNSt3__19make_pairB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENSA_IT0_E4typeEEEOSB_OSE_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  store [2 x i64] %12, ptr %3, align 8
  %13 = load [2 x i64], ptr %3, align 8
  ret [2 x i64] %13
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__135__uninitialized_allocator_copy_implB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPKS6_S9_PS6_EET2_RT_T0_T1_SB_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #1 personality ptr @__gxx_personality_v0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %"struct.std::__1::__exception_guard_exceptions", align 8
  %11 = alloca %"class.std::__1::_AllocatorDestroyRangeReverse", align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %14 = load ptr, ptr %8, align 8
  store ptr %14, ptr %9, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = call ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPS6_EC1B8ne190102ERS7_RS8_SB_(ptr noundef %11, ptr noundef nonnull align 1 dereferenceable(1) %15, ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef nonnull align 8 dereferenceable(8) %8)
  call void @_ZNSt3__122__make_exception_guardB8ne190102INS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEEENS_28__exception_guard_exceptionsIT_EESC_(ptr dead_on_unwind writable sret(%"struct.std::__1::__exception_guard_exceptions") align 8 %10, ptr noundef %11)
  br label %17

17:                                               ; preds = %26, %4
  %18 = load ptr, ptr %6, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = icmp ne ptr %18, %19
  br i1 %20, label %21, label %36

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %23) #3
  %25 = load ptr, ptr %6, align 8
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB8ne190102IS6_JRKS6_ELi0EEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %22, ptr noundef %24, ptr noundef nonnull align 8 dereferenceable(24) %25)
          to label %26 unwind label %31

26:                                               ; preds = %21
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %"class.std::__1::basic_string", ptr %27, i32 1
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds %"class.std::__1::basic_string", ptr %29, i32 1
  store ptr %30, ptr %8, align 8
  br label %17, !llvm.loop !9

31:                                               ; preds = %21
  %32 = landingpad { ptr, i32 }
          cleanup
  %33 = extractvalue { ptr, i32 } %32, 0
  store ptr %33, ptr %12, align 8
  %34 = extractvalue { ptr, i32 } %32, 1
  store i32 %34, ptr %13, align 4
  %35 = call ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEED1B8ne190102Ev(ptr noundef %10) #3
  br label %39

36:                                               ; preds = %17
  call void @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEE10__completeB8ne190102Ev(ptr noundef %10) #3
  %37 = load ptr, ptr %8, align 8
  %38 = call ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEED1B8ne190102Ev(ptr noundef %10) #3
  ret ptr %37

39:                                               ; preds = %31
  %40 = load ptr, ptr %12, align 8
  %41 = load i32, ptr %13, align 4
  %42 = insertvalue { ptr, i32 } poison, ptr %40, 0
  %43 = insertvalue { ptr, i32 } %42, i32 %41, 1
  resume { ptr, i32 } %43
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__113__unwrap_iterB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_18__unwrap_iter_implIS7_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEESB_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__118__unwrap_iter_implIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__unwrapB8ne190102ES7_(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__113__rewrap_iterB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_NS_18__unwrap_iter_implIS7_Lb1EEEEET_SA_T0_(ptr noundef %0, ptr noundef %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = invoke ptr @_ZNSt3__118__unwrap_iter_implIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__rewrapB8ne190102ES7_S7_(ptr noundef %5, ptr noundef %6)
          to label %8 unwind label %9

8:                                                ; preds = %2
  ret ptr %7

9:                                                ; preds = %2
  %10 = landingpad { ptr, i32 }
          catch ptr null
  %11 = extractvalue { ptr, i32 } %10, 0
  call void @__clang_call_terminate(ptr %11) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__19make_pairB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENSA_IT0_E4typeEEEOSB_OSE_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #8 {
  %3 = alloca %"struct.std::__1::pair.17", align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = call ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EC1B8ne190102IS8_S8_Li0EEEOT_OT0_(ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7) #3
  %9 = load [2 x i64], ptr %3, align 8
  ret [2 x i64] %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__113__unwrap_iterB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_18__unwrap_iter_implIS8_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEESC_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__118__unwrap_iter_implIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__unwrapB8ne190102ES8_(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EC1B8ne190102IS8_S8_Li0EEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EC2B8ne190102IS8_S8_Li0EEEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %9) #3
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EC2B8ne190102IS8_S8_Li0EEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"struct.std::__1::pair.17", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %8, align 8
  %11 = getelementptr inbounds %"struct.std::__1::pair.17", ptr %7, i32 0, i32 1
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %11, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__118__unwrap_iter_implIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__unwrapB8ne190102ES8_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__112__to_addressB8ne190102IKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S9_(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112__to_addressB8ne190102IKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S9_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__122__make_exception_guardB8ne190102INS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEEENS_28__exception_guard_exceptionsIT_EESC_(ptr dead_on_unwind noalias writable sret(%"struct.std::__1::__exception_guard_exceptions") align 8 %0, ptr noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::__1::_AllocatorDestroyRangeReverse", align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %1, i64 24, i1 false)
  %6 = call ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEEC1B8ne190102ESA_(ptr noundef %0, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPS6_EC1B8ne190102ERS7_RS8_SB_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(8) %3) unnamed_addr #1 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPS6_EC2B8ne190102ERS7_RS8_SB_(ptr noundef %9, ptr noundef nonnull align 1 dereferenceable(1) %10, ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef nonnull align 8 dereferenceable(8) %12)
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB8ne190102IS6_JRKS6_ELi0EEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  call void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE9constructB8ne190102IS5_JRKS5_EEEvPT_DpOT0_(ptr noundef %7, ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(24) %9)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEE10__completeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %3, i32 0, i32 1
  store i8 1, ptr %4, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEED1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEED2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEEC1B8ne190102ESA_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEEC2B8ne190102ESA_(ptr noundef %5, ptr noundef %1)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEEC2B8ne190102ESA_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %5, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %1, i64 24, i1 false)
  %7 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %5, i32 0, i32 1
  store i8 0, ptr %7, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPS6_EC2B8ne190102ERS7_RS8_SB_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(8) %3) unnamed_addr #8 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %6, align 8
  store ptr %11, ptr %10, align 8
  %12 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %9, i32 0, i32 1
  %13 = load ptr, ptr %7, align 8
  store ptr %13, ptr %12, align 8
  %14 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %9, i32 0, i32 2
  %15 = load ptr, ptr %8, align 8
  store ptr %15, ptr %14, align 8
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE9constructB8ne190102IS5_JRKS5_EEEvPT_DpOT0_(ptr noundef %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(24) %9)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEEPS7_EEED2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %4, i32 0, i32 1
  %6 = load i8, ptr %5, align 8
  %7 = trunc i8 %6 to i1
  br i1 %7, label %11, label %8

8:                                                ; preds = %1
  %9 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %4, i32 0, i32 0
  invoke void @_ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPS6_EclB8ne190102Ev(ptr noundef %9)
          to label %10 unwind label %13

10:                                               ; preds = %8
  br label %11

11:                                               ; preds = %10, %1
  %12 = load ptr, ptr %2, align 8
  ret ptr %12

13:                                               ; preds = %8
  %14 = landingpad { ptr, i32 }
          catch ptr null
  %15 = extractvalue { ptr, i32 } %14, 0
  call void @__clang_call_terminate(ptr %15) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEPS6_EclB8ne190102Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::reverse_iterator", align 8
  %4 = alloca %"class.std::__1::reverse_iterator", align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %5, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %9, align 8
  %11 = call ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B8ne190102ES7_(ptr noundef %3, ptr noundef %10)
  %12 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %5, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %13, align 8
  %15 = call ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B8ne190102ES7_(ptr noundef %4, ptr noundef %14)
  %16 = load [2 x i64], ptr %3, align 8
  %17 = load [2 x i64], ptr %4, align 8
  call void @_ZNSt3__119__allocator_destroyB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EESA_EEvRT_T0_T1_(ptr noundef nonnull align 1 dereferenceable(1) %7, [2 x i64] %16, [2 x i64] %17)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__allocator_destroyB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EESA_EEvRT_T0_T1_(ptr noundef nonnull align 1 dereferenceable(1) %0, [2 x i64] %1, [2 x i64] %2) #1 {
  %4 = alloca %"class.std::__1::reverse_iterator", align 8
  %5 = alloca %"class.std::__1::reverse_iterator", align 8
  %6 = alloca ptr, align 8
  store [2 x i64] %1, ptr %4, align 8
  store [2 x i64] %2, ptr %5, align 8
  store ptr %0, ptr %6, align 8
  br label %7

7:                                                ; preds = %12, %3
  %8 = call zeroext i1 @_ZNSt3__1neB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EEbRKNS_16reverse_iteratorIT_EERKNS8_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef nonnull align 8 dereferenceable(16) %5)
  br i1 %8, label %9, label %14

9:                                                ; preds = %7
  %10 = load ptr, ptr %6, align 8
  %11 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEELi0EEEu7__decayIDTclsr19__to_address_helperIT_EE6__callclsr3stdE7declvalIRKSA_EEEEESC_(ptr noundef nonnull align 8 dereferenceable(16) %4) #3
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB8ne190102IS6_Li0EEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %10, ptr noundef %11)
  br label %12

12:                                               ; preds = %9
  %13 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEppB8ne190102Ev(ptr noundef %4)
  br label %7, !llvm.loop !10

14:                                               ; preds = %7
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B8ne190102ES7_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B8ne190102ES7_(ptr noundef %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1neB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EEbRKNS_16reverse_iteratorIT_EERKNS8_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB8ne190102Ev(ptr noundef %5)
  %7 = load ptr, ptr %4, align 8
  %8 = call ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB8ne190102Ev(ptr noundef %7)
  %9 = icmp ne ptr %6, %8
  ret i1 %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112__to_addressB8ne190102INS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEELi0EEEu7__decayIDTclsr19__to_address_helperIT_EE6__callclsr3stdE7declvalIRKSA_EEEEESC_(ptr noundef nonnull align 8 dereferenceable(16) %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__119__to_address_helperINS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvE6__callB8ne190102ERKS9_(ptr noundef nonnull align 8 dereferenceable(16) %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEppB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::__1::basic_string", ptr %5, i32 -1
  store ptr %6, ptr %4, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__119__to_address_helperINS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvE6__callB8ne190102ERKS9_(ptr noundef nonnull align 8 dereferenceable(16) %0) #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = invoke ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEptB8ne190102Ev(ptr noundef %3)
          to label %5 unwind label %7

5:                                                ; preds = %1
  %6 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %4) #3
  ret ptr %6

7:                                                ; preds = %1
  %8 = landingpad { ptr, i32 }
          catch ptr null
  %9 = extractvalue { ptr, i32 } %8, 0
  call void @__clang_call_terminate(ptr %9) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEptB8ne190102Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB8ne190102Ev(ptr noundef %3)
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %4, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %"class.std::__1::basic_string", ptr %7, i32 -1
  store ptr %8, ptr %3, align 8
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B8ne190102ES7_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  %8 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %5, i32 0, i32 1
  %9 = load ptr, ptr %4, align 8
  store ptr %9, ptr %8, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__118__unwrap_iter_implIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__unwrapB8ne190102ES7_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__118__unwrap_iter_implIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__rewrapB8ne190102ES7_S7_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %7) #3
  %9 = ptrtoint ptr %6 to i64
  %10 = ptrtoint ptr %8 to i64
  %11 = sub i64 %9, %10
  %12 = sdiv exact i64 %11, 24
  %13 = getelementptr inbounds %"class.std::__1::basic_string", ptr %5, i64 %12
  ret ptr %13
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %"class.std::__1::vector", ptr %7, i32 0, i32 1
  store ptr %5, ptr %8, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__124__copy_move_unwrap_itersB8ne190102INS_11__copy_implINS_17_ClassicAlgPolicyEEEPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEESB_PS9_Li0EEENS_4pairIT0_T2_EESE_T1_SF_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #1 {
  %4 = alloca %"struct.std::__1::pair.16", align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %"struct.std::__1::pair.17", align 8
  %9 = alloca %"struct.std::__1::pair.16", align 8
  %10 = alloca %"struct.std::__1::__copy_impl", align 1
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = call [2 x i64] @_ZNSt3__114__unwrap_rangeB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EENS_4pairIT0_SA_EET_SC_(ptr noundef %13, ptr noundef %14)
  store [2 x i64] %15, ptr %8, align 8
  %16 = getelementptr inbounds %"struct.std::__1::pair.17", ptr %8, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %"struct.std::__1::pair.17", ptr %8, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %7, align 8
  %21 = call ptr @_ZNSt3__113__unwrap_iterB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_18__unwrap_iter_implIS7_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEESB_(ptr noundef %20) #3
  %22 = call [2 x i64] @_ZNKSt3__111__copy_implINS_17_ClassicAlgPolicyEEclB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEESB_PS9_EENS_4pairIT_T1_EESE_T0_SF_(ptr noundef %10, ptr noundef %17, ptr noundef %19, ptr noundef %21)
  store [2 x i64] %22, ptr %9, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %"struct.std::__1::pair.16", ptr %9, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = call ptr @_ZNSt3__114__rewrap_rangeB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EET_S9_T0_(ptr noundef %23, ptr noundef %25)
  store ptr %26, ptr %11, align 8
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %"struct.std::__1::pair.16", ptr %9, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = call ptr @_ZNSt3__113__rewrap_iterB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_NS_18__unwrap_iter_implIS7_Lb1EEEEET_SA_T0_(ptr noundef %27, ptr noundef %29) #3
  store ptr %30, ptr %12, align 8
  %31 = call [2 x i64] @_ZNSt3__19make_pairB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENSB_IT0_E4typeEEEOSC_OSF_(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef nonnull align 8 dereferenceable(8) %12)
  store [2 x i64] %31, ptr %4, align 8
  %32 = load [2 x i64], ptr %4, align 8
  ret [2 x i64] %32
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr [2 x i64] @_ZNKSt3__111__copy_implINS_17_ClassicAlgPolicyEEclB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEESB_PS9_EENS_4pairIT_T1_EESE_T0_SF_(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #1 {
  %5 = alloca %"struct.std::__1::pair.16", align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %10 = load ptr, ptr %6, align 8
  br label %11

11:                                               ; preds = %15, %4
  %12 = load ptr, ptr %7, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = icmp ne ptr %12, %13
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = load ptr, ptr %7, align 8
  %17 = load ptr, ptr %9, align 8
  %18 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_(ptr noundef %17, ptr noundef nonnull align 8 dereferenceable(24) %16)
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds %"class.std::__1::basic_string", ptr %19, i32 1
  store ptr %20, ptr %7, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %"class.std::__1::basic_string", ptr %21, i32 1
  store ptr %22, ptr %9, align 8
  br label %11, !llvm.loop !11

23:                                               ; preds = %11
  %24 = call [2 x i64] @_ZNSt3__19make_pairB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENSB_IT0_E4typeEEEOSC_OSF_(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull align 8 dereferenceable(8) %9)
  store [2 x i64] %24, ptr %5, align 8
  %25 = load [2 x i64], ptr %5, align 8
  ret [2 x i64] %25
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__19make_pairB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENSB_IT0_E4typeEEEOSC_OSF_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #8 {
  %3 = alloca %"struct.std::__1::pair.16", align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = call ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EC1B8ne190102IS8_S9_Li0EEEOT_OT0_(ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7) #3
  %9 = load [2 x i64], ptr %3, align 8
  ret [2 x i64] %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114__rewrap_rangeB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_EET_S9_T0_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__113__rewrap_iterB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_NS_18__unwrap_iter_implIS8_Lb1EEEEET_SB_T0_(ptr noundef %5, ptr noundef %6) #3
  ret ptr %7
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_(ptr noundef, ptr noundef nonnull align 8 dereferenceable(24)) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EC1B8ne190102IS8_S9_Li0EEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EC2B8ne190102IS8_S9_Li0EEEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %9) #3
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPS6_EC2B8ne190102IS8_S9_Li0EEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"struct.std::__1::pair.16", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %8, align 8
  %11 = getelementptr inbounds %"struct.std::__1::pair.16", ptr %7, i32 0, i32 1
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %11, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__113__rewrap_iterB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES8_NS_18__unwrap_iter_implIS8_Lb1EEEEET_SB_T0_(ptr noundef %0, ptr noundef %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = invoke ptr @_ZNSt3__118__unwrap_iter_implIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__rewrapB8ne190102ES8_S8_(ptr noundef %5, ptr noundef %6)
          to label %8 unwind label %9

8:                                                ; preds = %2
  ret ptr %7

9:                                                ; preds = %2
  %10 = landingpad { ptr, i32 }
          catch ptr null
  %11 = extractvalue { ptr, i32 } %10, 0
  call void @__clang_call_terminate(ptr %11) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__118__unwrap_iter_implIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb1EE8__rewrapB8ne190102ES8_S8_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call ptr @_ZNSt3__112__to_addressB8ne190102IKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S9_(ptr noundef %7) #3
  %9 = ptrtoint ptr %6 to i64
  %10 = ptrtoint ptr %8 to i64
  %11 = sub i64 %9, %10
  %12 = sdiv exact i64 %11, 24
  %13 = getelementptr inbounds %"class.std::__1::basic_string", ptr %5, i64 %12
  ret ptr %13
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_shrinkB8ne190102Em(ptr noundef %0, i64 noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5clearB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %4) #3
  store i64 %5, ptr %3, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__clearB8ne190102Ev(ptr noundef %4) #3
  %6 = load i64, ptr %3, align 8
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_shrinkB8ne190102Em(ptr noundef %4, i64 noundef %6) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.11", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8max_sizeEv(ptr noundef %0) #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %5) #3
  %7 = call i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE8max_sizeB8ne190102IS7_Li0EEEmRKS7_(ptr noundef nonnull align 1 dereferenceable(1) %6) #3
  store i64 %7, ptr %3, align 8
  %8 = call i64 @_ZNSt3__114numeric_limitsIlE3maxB8ne190102Ev() #3
  store i64 %8, ptr %4, align 8
  %9 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne190102ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4)
          to label %10 unwind label %12

10:                                               ; preds = %1
  %11 = load i64, ptr %9, align 8
  ret i64 %11

12:                                               ; preds = %1
  %13 = landingpad { ptr, i32 }
          catch ptr null
  %14 = extractvalue { ptr, i32 } %13, 0
  call void @__clang_call_terminate(ptr %14) #17
  unreachable
}

; Function Attrs: mustprogress noinline noreturn optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_length_errorB8ne190102Ev(ptr noundef %0) #12 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__120__throw_length_errorB8ne190102EPKc(ptr noundef @.str.35) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__119__allocate_at_leastB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERSA_m(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) #1 {
  %3 = alloca %"struct.std::__1::__allocation_result", align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__allocation_result", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8allocateB8ne190102Em(ptr noundef %7, i64 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = getelementptr inbounds %"struct.std::__1::__allocation_result", ptr %3, i32 0, i32 1
  %11 = load i64, ptr %5, align 8
  store i64 %11, ptr %10, align 8
  %12 = load [2 x i64], ptr %3, align 8
  ret [2 x i64] %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE14__annotate_newB8ne190102Em(ptr noundef %0, i64 noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne190102ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne190102ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE8max_sizeB8ne190102IS7_Li0EEEmRKS7_(ptr noundef nonnull align 1 dereferenceable(1) %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i64 @_ZNKSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8max_sizeB8ne190102Ev(ptr noundef %3) #3
  ret i64 %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__114numeric_limitsIlE3maxB8ne190102Ev() #8 {
  %1 = call i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne190102Ev() #3
  ret i64 %1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne190102ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #1 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne190102ImmEEbRKT_RKT0_(ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  br label %13

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  br label %13

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ]
  ret ptr %14
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne190102ImmEEbRKT_RKT0_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i64, ptr %10, align 8
  %12 = icmp ult i64 %9, %11
  ret i1 %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8max_sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret i64 768614336404564650
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne190102Ev() #8 {
  ret i64 9223372036854775807
}

; Function Attrs: mustprogress noinline noreturn optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorB8ne190102EPKc(ptr noundef %0) #12 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = call ptr @__cxa_allocate_exception(i64 16) #3
  %6 = load ptr, ptr %2, align 8
  %7 = invoke ptr @_ZNSt12length_errorC1B8ne190102EPKc(ptr noundef %5, ptr noundef %6)
          to label %8 unwind label %9

8:                                                ; preds = %1
  call void @__cxa_throw(ptr %5, ptr @_ZTISt12length_error, ptr @_ZNSt12length_errorD1Ev) #18
  unreachable

9:                                                ; preds = %1
  %10 = landingpad { ptr, i32 }
          cleanup
  %11 = extractvalue { ptr, i32 } %10, 0
  store ptr %11, ptr %3, align 8
  %12 = extractvalue { ptr, i32 } %10, 1
  store i32 %12, ptr %4, align 4
  call void @__cxa_free_exception(ptr %5) #3
  br label %13

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = insertvalue { ptr, i32 } poison, ptr %14, 0
  %17 = insertvalue { ptr, i32 } %16, i32 %15, 1
  resume { ptr, i32 } %17
}

declare ptr @__cxa_allocate_exception(i64)

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt12length_errorC1B8ne190102EPKc(ptr noundef returned %0, ptr noundef %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt12length_errorC2B8ne190102EPKc(ptr noundef %5, ptr noundef %6)
  ret ptr %5
}

declare void @__cxa_free_exception(ptr)

; Function Attrs: nounwind
declare ptr @_ZNSt12length_errorD1Ev(ptr noundef returned) unnamed_addr #2

declare void @__cxa_throw(ptr, ptr, ptr)

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt12length_errorC2B8ne190102EPKc(ptr noundef returned %0, ptr noundef %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt11logic_errorC2EPKc(ptr noundef %5, ptr noundef %6)
  store ptr getelementptr inbounds inrange(-16, 24) ({ [5 x ptr] }, ptr @_ZTVSt12length_error, i32 0, i32 0, i32 2), ptr %5, align 8
  ret ptr %5
}

declare ptr @_ZNSt11logic_errorC2EPKc(ptr noundef returned, ptr noundef) unnamed_addr #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8allocateB8ne190102Em(ptr noundef %0, i64 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE8max_sizeB8ne190102IS7_Li0EEEmRKS7_(ptr noundef nonnull align 1 dereferenceable(1) %5) #3
  %8 = icmp ugt i64 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @_ZSt28__throw_bad_array_new_lengthB8ne190102v() #18
  unreachable

10:                                               ; preds = %2
  %11 = load i64, ptr %4, align 8
  %12 = mul i64 %11, 24
  %13 = call ptr @_ZNSt3__117__libcpp_allocateB8ne190102Emm(i64 noundef %12, i64 noundef 8)
  ret ptr %13
}

; Function Attrs: mustprogress noinline noreturn optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZSt28__throw_bad_array_new_lengthB8ne190102v() #12 {
  %1 = call ptr @__cxa_allocate_exception(i64 8) #3
  %2 = call ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef %1) #3
  call void @__cxa_throw(ptr %1, ptr @_ZTISt20bad_array_new_length, ptr @_ZNSt20bad_array_new_lengthD1Ev) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__117__libcpp_allocateB8ne190102Emm(i64 noundef %0, i64 noundef %1) #1 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %3, align 8
  %6 = call ptr @_ZNSt3__121__libcpp_operator_newB8ne190102IJmEEEPvDpT_(i64 noundef %5)
  ret ptr %6
}

; Function Attrs: nounwind
declare ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef returned) unnamed_addr #2

; Function Attrs: nounwind
declare ptr @_ZNSt20bad_array_new_lengthD1Ev(ptr noundef returned) unnamed_addr #2

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__121__libcpp_operator_newB8ne190102IJmEEEPvDpT_(i64 noundef %0) #1 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = call noalias nonnull ptr @_Znwm(i64 noundef %3) #14
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne190102ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne190102ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne190102ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #8 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = call zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne190102ImmEEbRKT_RKT0_(ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  br label %13

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  br label %13

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ]
  ret ptr %14
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__110__distanceB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_15iterator_traitsIT_E15difference_typeESA_SA_NS_26random_access_iterator_tagE(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca %"struct.std::__1::random_access_iterator_tag", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = ptrtoint ptr %6 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 24
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN17EnterpriseLicenseD2Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds inrange(-16, 40) ({ [7 x ptr] }, ptr @_ZTV17EnterpriseLicense, i32 0, i32 0, i32 2), ptr %3, align 8
  %4 = getelementptr inbounds %class.EnterpriseLicense, ptr %3, i32 0, i32 3
  %5 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %4) #3
  %6 = getelementptr inbounds %class.EnterpriseLicense, ptr %3, i32 0, i32 2
  %7 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B8ne190102Ev(ptr noundef %6) #3
  %8 = call ptr @_ZN7LicenseD2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5beginB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca %"class.std::__1::__wrap_iter", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"class.std::__1::vector", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__make_iterB8ne190102EPKS6_(ptr noundef %4, ptr noundef %6) #3
  %8 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %2, i32 0, i32 0
  %9 = inttoptr i64 %7 to ptr
  store ptr %9, ptr %8, align 8
  %10 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %2, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = ptrtoint ptr %11 to i64
  ret i64 %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE3endB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca %"class.std::__1::__wrap_iter", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"class.std::__1::vector", ptr %4, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__make_iterB8ne190102EPKS6_(ptr noundef %4, ptr noundef %6) #3
  %8 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %2, i32 0, i32 0
  %9 = inttoptr i64 %7 to ptr
  store ptr %9, ptr %8, align 8
  %10 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %2, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = ptrtoint ptr %11 to i64
  ret i64 %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1neB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESD_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call zeroext i1 @_ZNSt3__1eqB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESD_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6) #3
  %8 = xor i1 %7, true
  ret i1 %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEppB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::__1::basic_string", ptr %5, i32 1
  store ptr %6, ptr %4, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__make_iterB8ne190102EPKS6_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca %"class.std::__1::__wrap_iter", align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = call ptr @_ZNSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B8ne190102ES8_(ptr noundef %3, ptr noundef %7) #3
  %9 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %3, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = ptrtoint ptr %10 to i64
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B8ne190102ES8_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B8ne190102ES8_(ptr noundef %5, ptr noundef %6) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B8ne190102ES8_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1eqB8ne190102IPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESD_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call ptr @_ZNKSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB8ne190102Ev(ptr noundef %5) #3
  %7 = load ptr, ptr %4, align 8
  %8 = call ptr @_ZNKSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB8ne190102Ev(ptr noundef %7) #3
  %9 = icmp eq ptr %6, %8
  ret i1 %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__111__wrap_iterIPKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__wrap_iter", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

declare void @_ZNSt3__19to_stringEm(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8, i64 noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE4sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::map", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE4sizeB8ne190102Ev(ptr noundef %4) #3
  %6 = load i64, ptr %5, align 8
  ret i64 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEEixERSC_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::pair.18", align 8
  %6 = alloca %"class.std::__1::tuple", align 8
  %7 = alloca %"class.std::__1::tuple.19", align 1
  %8 = alloca %"class.std::__1::tuple.19", align 1
  %9 = alloca [2 x i64], align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %"class.std::__1::map", ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = call i64 @_ZNSt3__116forward_as_tupleB8ne190102IJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEENS_5tupleIJDpOT_EEESC_(ptr noundef nonnull align 8 dereferenceable(24) %13) #3
  %15 = getelementptr inbounds %"class.std::__1::tuple", ptr %6, i32 0, i32 0
  %16 = getelementptr inbounds %"struct.std::__1::__tuple_impl", ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds %"class.std::__1::__tuple_leaf", ptr %16, i32 0, i32 0
  %18 = inttoptr i64 %14 to ptr
  store ptr %18, ptr %17, align 8
  call void @_ZNSt3__116forward_as_tupleB8ne190102IJEEENS_5tupleIJDpOT_EEES4_() #3
  %19 = call [2 x i64] @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE25__emplace_unique_key_argsIS7_JRKNS_21piecewise_construct_tENS_5tupleIJRKS7_EEENSL_IJEEEEEENS_4pairINS_15__tree_iteratorISA_PNS_11__tree_nodeISA_PvEElEEbEERKT_DpOT0_(ptr noundef %11, ptr noundef nonnull align 8 dereferenceable(24) %12, ptr noundef nonnull align 1 dereferenceable(1) @_ZNSt3__1L19piecewise_constructE, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 1 dereferenceable(1) %7)
  store [2 x i64] %19, ptr %9, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %9, i64 9, i1 false)
  %20 = getelementptr inbounds %"struct.std::__1::pair.18", ptr %5, i32 0, i32 0
  %21 = call ptr @_ZNKSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEptB8ne190102Ev(ptr noundef %20)
  %22 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt3__112__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseE11__get_valueB8ne190102Ev(ptr noundef %21)
  %23 = getelementptr inbounds %"struct.std::__1::pair", ptr %22, i32 0, i32 1
  ret ptr %23
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE14f_7e9e5ac30f22ERKS6_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.SecureContainer, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9push_backB8ne190102ERKS6_(ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(24) %7)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE4sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree", ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEE5firstB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemImLi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemImLi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.8", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr [2 x i64] @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE25__emplace_unique_key_argsIS7_JRKNS_21piecewise_construct_tENS_5tupleIJRKS7_EEENSL_IJEEEEEENS_4pairINS_15__tree_iteratorISA_PNS_11__tree_nodeISA_PvEElEEbEERKT_DpOT0_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 1 dereferenceable(1) %2, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 1 dereferenceable(1) %4) #1 {
  %6 = alloca %"struct.std::__1::pair.18", align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i8, align 1
  %16 = alloca %"class.std::__1::unique_ptr", align 8
  %17 = alloca %"class.std::__1::__tree_iterator", align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__find_equalIS7_EERPNS_16__tree_node_baseIPvEERPNS_15__tree_end_nodeISL_EERKT_(ptr noundef %18, ptr noundef nonnull align 8 dereferenceable(8) %12, ptr noundef nonnull align 8 dereferenceable(24) %19)
  store ptr %20, ptr %13, align 8
  %21 = load ptr, ptr %13, align 8
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %14, align 8
  store i8 0, ptr %15, align 1
  %23 = load ptr, ptr %13, align 8
  %24 = load ptr, ptr %23, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %35

26:                                               ; preds = %5
  %27 = load ptr, ptr %9, align 8
  %28 = load ptr, ptr %10, align 8
  %29 = load ptr, ptr %11, align 8
  call void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE16__construct_nodeIJRKNS_21piecewise_construct_tENS_5tupleIJRKS7_EEENSL_IJEEEEEENS_10unique_ptrINS_11__tree_nodeISA_PvEENS_22__tree_node_destructorINS5_IST_EEEEEEDpOT_(ptr dead_on_unwind writable sret(%"class.std::__1::unique_ptr") align 8 %16, ptr noundef %18, ptr noundef nonnull align 1 dereferenceable(1) %27, ptr noundef nonnull align 8 dereferenceable(8) %28, ptr noundef nonnull align 1 dereferenceable(1) %29)
  %30 = load ptr, ptr %12, align 8
  %31 = load ptr, ptr %13, align 8
  %32 = call ptr @_ZNKSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE3getB8ne190102Ev(ptr noundef %16) #3
  call void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE16__insert_node_atEPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEERSL_SL_(ptr noundef %18, ptr noundef %30, ptr noundef nonnull align 8 dereferenceable(8) %31, ptr noundef %32) #3
  %33 = call ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE7releaseB8ne190102Ev(ptr noundef %16) #3
  store ptr %33, ptr %14, align 8
  store i8 1, ptr %15, align 1
  %34 = call ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEED1B8ne190102Ev(ptr noundef %16) #3
  br label %35

35:                                               ; preds = %26, %5
  %36 = load ptr, ptr %14, align 8
  %37 = call ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC1B8ne190102ESE_(ptr noundef %17, ptr noundef %36) #3
  %38 = call ptr @_ZNSt3__14pairINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEbEC1B8ne190102ISG_RbLi0EEEOT_OT0_(ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(8) %17, ptr noundef nonnull align 1 dereferenceable(1) %15) #3
  %39 = load [2 x i64], ptr %6, align 8
  ret [2 x i64] %39
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__116forward_as_tupleB8ne190102IJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEENS_5tupleIJDpOT_EEESC_(ptr noundef nonnull align 8 dereferenceable(24) %0) #8 {
  %2 = alloca %"class.std::__1::tuple", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call ptr @_ZNSt3__15tupleIJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC1B8ne190102INS_4_AndELi0EEES8_(ptr noundef %2, ptr noundef nonnull align 8 dereferenceable(24) %4) #3
  %6 = getelementptr inbounds %"class.std::__1::tuple", ptr %2, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.std::__1::__tuple_impl", ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds %"class.std::__1::__tuple_leaf", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = ptrtoint ptr %9 to i64
  ret i64 %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__116forward_as_tupleB8ne190102IJEEENS_5tupleIJDpOT_EEES4_() #8 {
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEptB8ne190102Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElE8__get_npB8ne190102Ev(ptr noundef %3)
  %5 = getelementptr inbounds %"class.std::__1::__tree_node", ptr %4, i32 0, i32 1
  %6 = call ptr @_ZNSt3__114pointer_traitsIPNS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEE10pointer_toB8ne190102ERSA_(ptr noundef nonnull align 8 dereferenceable(32) %5) #3
  ret ptr %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__find_equalIS7_EERPNS_16__tree_node_baseIPvEERPNS_15__tree_end_nodeISL_EERKT_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = call ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE6__rootB8ne190102Ev(ptr noundef %10) #3
  store ptr %11, ptr %8, align 8
  %12 = call ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__root_ptrB8ne190102Ev(ptr noundef %10) #3
  store ptr %12, ptr %9, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %69

15:                                               ; preds = %3
  br label %16

16:                                               ; preds = %15, %68
  %17 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10value_compB8ne190102Ev(ptr noundef %10) #3
  %18 = load ptr, ptr %7, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds %"class.std::__1::__tree_node", ptr %19, i32 0, i32 1
  %21 = call zeroext i1 @_ZNKSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEclB8ne190102ERKS6_RKSA_(ptr noundef %17, ptr noundef nonnull align 8 dereferenceable(24) %18, ptr noundef nonnull align 8 dereferenceable(32) %20)
  br i1 %21, label %22, label %40

22:                                               ; preds = %16
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %33

27:                                               ; preds = %22
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %28, i32 0, i32 0
  store ptr %29, ptr %9, align 8
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %8, align 8
  br label %39

33:                                               ; preds = %22
  %34 = load ptr, ptr %8, align 8
  %35 = load ptr, ptr %6, align 8
  store ptr %34, ptr %35, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %37, i32 0, i32 0
  store ptr %38, ptr %4, align 8
  br label %75

39:                                               ; preds = %27
  br label %68

40:                                               ; preds = %16
  %41 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10value_compB8ne190102Ev(ptr noundef %10) #3
  %42 = load ptr, ptr %8, align 8
  %43 = getelementptr inbounds %"class.std::__1::__tree_node", ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %7, align 8
  %45 = call zeroext i1 @_ZNKSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEclB8ne190102ERKSA_RKS6_(ptr noundef %41, ptr noundef nonnull align 8 dereferenceable(32) %43, ptr noundef nonnull align 8 dereferenceable(24) %44)
  br i1 %45, label %46, label %63

46:                                               ; preds = %40
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = icmp ne ptr %49, null
  br i1 %50, label %51, label %57

51:                                               ; preds = %46
  %52 = load ptr, ptr %8, align 8
  %53 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %52, i32 0, i32 1
  store ptr %53, ptr %9, align 8
  %54 = load ptr, ptr %8, align 8
  %55 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %54, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %8, align 8
  br label %62

57:                                               ; preds = %46
  %58 = load ptr, ptr %8, align 8
  %59 = load ptr, ptr %6, align 8
  store ptr %58, ptr %59, align 8
  %60 = load ptr, ptr %8, align 8
  %61 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %60, i32 0, i32 1
  store ptr %61, ptr %4, align 8
  br label %75

62:                                               ; preds = %51
  br label %67

63:                                               ; preds = %40
  %64 = load ptr, ptr %8, align 8
  %65 = load ptr, ptr %6, align 8
  store ptr %64, ptr %65, align 8
  %66 = load ptr, ptr %9, align 8
  store ptr %66, ptr %4, align 8
  br label %75

67:                                               ; preds = %62
  br label %68

68:                                               ; preds = %67, %39
  br label %16, !llvm.loop !12

69:                                               ; preds = %3
  %70 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %10) #3
  %71 = load ptr, ptr %6, align 8
  store ptr %70, ptr %71, align 8
  %72 = load ptr, ptr %6, align 8
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %73, i32 0, i32 0
  store ptr %74, ptr %4, align 8
  br label %75

75:                                               ; preds = %69, %63, %57, %33
  %76 = load ptr, ptr %4, align 8
  ret ptr %76
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE16__construct_nodeIJRKNS_21piecewise_construct_tENS_5tupleIJRKS7_EEENSL_IJEEEEEENS_10unique_ptrINS_11__tree_nodeISA_PvEENS_22__tree_node_destructorINS5_IST_EEEEEEDpOT_(ptr dead_on_unwind noalias writable sret(%"class.std::__1::unique_ptr") align 8 %0, ptr noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 1 dereferenceable(1) %4) #1 personality ptr @__gxx_personality_v0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i1, align 1
  %13 = alloca %"class.std::__1::__tree_node_destructor", align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__node_allocB8ne190102Ev(ptr noundef %16) #3
  store ptr %17, ptr %11, align 8
  store i1 false, ptr %12, align 1
  %18 = load ptr, ptr %11, align 8
  %19 = call ptr @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE8allocateB8ne190102ERSE_m(ptr noundef nonnull align 1 dereferenceable(1) %18, i64 noundef 1)
  %20 = load ptr, ptr %11, align 8
  %21 = call ptr @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEC1B8ne190102ERSE_b(ptr noundef %13, ptr noundef nonnull align 1 dereferenceable(1) %20, i1 noundef zeroext false) #3
  %22 = call ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC1B8ne190102ILb1EvEEPSD_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeISG_EEXT_EE20__good_rval_ref_typeE(ptr noundef %0, ptr noundef %19, ptr noundef nonnull align 8 dereferenceable(9) %13) #3
  %23 = load ptr, ptr %11, align 8
  %24 = call ptr @_ZNKSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEptB8ne190102Ev(ptr noundef %0) #3
  %25 = getelementptr inbounds %"class.std::__1::__tree_node", ptr %24, i32 0, i32 1
  %26 = invoke ptr @_ZNSt3__122__tree_key_value_typesINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEE9__get_ptrB8ne190102ERSA_(ptr noundef nonnull align 8 dereferenceable(32) %25)
          to label %27 unwind label %35

27:                                               ; preds = %5
  %28 = load ptr, ptr %8, align 8
  %29 = load ptr, ptr %9, align 8
  %30 = load ptr, ptr %10, align 8
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE9constructB8ne190102INS_4pairIKS8_SA_EEJRKNS_21piecewise_construct_tENS_5tupleIJRSI_EEENSN_IJEEEELi0EEEvRSE_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %23, ptr noundef %26, ptr noundef nonnull align 1 dereferenceable(1) %28, ptr noundef nonnull align 8 dereferenceable(8) %29, ptr noundef nonnull align 1 dereferenceable(1) %30)
          to label %31 unwind label %35

31:                                               ; preds = %27
  %32 = call noundef nonnull align 8 dereferenceable(9) ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE11get_deleterB8ne190102Ev(ptr noundef %0) #3
  %33 = getelementptr inbounds %"class.std::__1::__tree_node_destructor", ptr %32, i32 0, i32 1
  store i8 1, ptr %33, align 8
  store i1 true, ptr %12, align 1
  %34 = load i1, ptr %12, align 1
  br i1 %34, label %42, label %40

35:                                               ; preds = %27, %5
  %36 = landingpad { ptr, i32 }
          cleanup
  %37 = extractvalue { ptr, i32 } %36, 0
  store ptr %37, ptr %14, align 8
  %38 = extractvalue { ptr, i32 } %36, 1
  store i32 %38, ptr %15, align 4
  %39 = call ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEED1B8ne190102Ev(ptr noundef %0) #3
  br label %43

40:                                               ; preds = %31
  %41 = call ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEED1B8ne190102Ev(ptr noundef %0) #3
  br label %42

42:                                               ; preds = %40, %31
  ret void

43:                                               ; preds = %35
  %44 = load ptr, ptr %14, align 8
  %45 = load i32, ptr %15, align 4
  %46 = insertvalue { ptr, i32 } poison, ptr %44, 0
  %47 = insertvalue { ptr, i32 } %46, i32 %45, 1
  resume { ptr, i32 } %47
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE16__insert_node_atEPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEERSL_SL_(ptr noundef %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef %3) #8 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %8, align 8
  %11 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %10, i32 0, i32 0
  store ptr null, ptr %11, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %12, i32 0, i32 1
  store ptr null, ptr %13, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = load ptr, ptr %8, align 8
  %16 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %15, i32 0, i32 2
  store ptr %14, ptr %16, align 8
  %17 = load ptr, ptr %8, align 8
  %18 = load ptr, ptr %7, align 8
  store ptr %17, ptr %18, align 8
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__begin_nodeB8ne190102Ev(ptr noundef %9) #3
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %30

24:                                               ; preds = %4
  %25 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__begin_nodeB8ne190102Ev(ptr noundef %9) #3
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__begin_nodeB8ne190102Ev(ptr noundef %9) #3
  store ptr %28, ptr %29, align 8
  br label %30

30:                                               ; preds = %24, %4
  %31 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %9) #3
  %32 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %7, align 8
  %35 = load ptr, ptr %34, align 8
  call void @_ZNSt3__127__tree_balance_after_insertB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_S5_(ptr noundef %33, ptr noundef %35) #3
  %36 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE4sizeB8ne190102Ev(ptr noundef %9) #3
  %37 = load i64, ptr %36, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr %36, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE3getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE7releaseB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %4, i32 0, i32 0
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %5) #3
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %4, i32 0, i32 0
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %8) #3
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEED1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEED2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC1B8ne190102ESE_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC2B8ne190102ESE_(ptr noundef %5, ptr noundef %6) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEbEC1B8ne190102ISG_RbLi0EEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__14pairINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEbEC2B8ne190102ISG_RbLi0EEEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 1 dereferenceable(1) %9) #3
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__root_ptrB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %3) #3
  %5 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %4, i32 0, i32 0
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10value_compB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree", ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEE6secondB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEclB8ne190102ERKS6_RKSA_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(32) %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNKSt3__112__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseE11__get_valueB8ne190102Ev(ptr noundef %9)
  %11 = getelementptr inbounds %"struct.std::__1::pair", ptr %10, i32 0, i32 0
  %12 = call zeroext i1 @_ZNKSt3__14lessINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclB8ne190102ERKS6_S9_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef nonnull align 8 dereferenceable(24) %11)
  ret i1 %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__119__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS6_P7LicenseEENS_4lessIS6_EELb1EEclB8ne190102ERKSA_RKS6_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(32) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNKSt3__112__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseE11__get_valueB8ne190102Ev(ptr noundef %8)
  %10 = getelementptr inbounds %"struct.std::__1::pair", ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %6, align 8
  %12 = call zeroext i1 @_ZNKSt3__14lessINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclB8ne190102ERKS6_S9_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 8 dereferenceable(24) %11)
  ret i1 %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEE6secondB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEELi1ELb1EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__14lessINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclB8ne190102ERKS6_S9_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call zeroext i1 @_ZNSt3__1ltB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EESB_(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef nonnull align 8 dereferenceable(24) %9) #3
  ret i1 %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(32) ptr @_ZNKSt3__112__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseE11__get_valueB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__value_type", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1ltB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EESB_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareB8ne190102ERKS5_(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(24) %6) #3
  %8 = icmp slt i32 %7, 0
  ret i1 %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareB8ne190102ERKS5_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::__1::basic_string_view", align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call [2 x i64] @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEcvNS_17basic_string_viewIcS2_EEB8ne190102Ev(ptr noundef %7) #3
  store [2 x i64] %8, ptr %5, align 8
  %9 = call i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareINS_17basic_string_viewIcS2_EELi0EEEiRKT_(ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(16) %5) #3
  ret i32 %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareINS_17basic_string_viewIcS2_EELi0EEEiRKT_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %"class.std::__1::basic_string_view", align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %11, i64 16, i1 false)
  %12 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %10) #3
  store i64 %12, ptr %7, align 8
  %13 = call i64 @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4sizeB8ne190102Ev(ptr noundef %6) #3
  store i64 %13, ptr %8, align 8
  %14 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %10) #3
  %15 = call ptr @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4dataB8ne190102Ev(ptr noundef %6) #3
  %16 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne190102ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull align 8 dereferenceable(8) %8)
          to label %17 unwind label %37

17:                                               ; preds = %2
  %18 = load i64, ptr %16, align 8
  %19 = call i32 @_ZNSt3__111char_traitsIcE7compareB8ne190102EPKcS3_m(ptr noundef %14, ptr noundef %15, i64 noundef %18) #3
  store i32 %19, ptr %9, align 4
  %20 = load i32, ptr %9, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %17
  %23 = load i32, ptr %9, align 4
  store i32 %23, ptr %3, align 4
  br label %35

24:                                               ; preds = %17
  %25 = load i64, ptr %7, align 8
  %26 = load i64, ptr %8, align 8
  %27 = icmp ult i64 %25, %26
  br i1 %27, label %28, label %29

28:                                               ; preds = %24
  store i32 -1, ptr %3, align 4
  br label %35

29:                                               ; preds = %24
  %30 = load i64, ptr %7, align 8
  %31 = load i64, ptr %8, align 8
  %32 = icmp ugt i64 %30, %31
  br i1 %32, label %33, label %34

33:                                               ; preds = %29
  store i32 1, ptr %3, align 4
  br label %35

34:                                               ; preds = %29
  store i32 0, ptr %3, align 4
  br label %35

35:                                               ; preds = %34, %33, %28, %22
  %36 = load i32, ptr %3, align 4
  ret i32 %36

37:                                               ; preds = %2
  %38 = landingpad { ptr, i32 }
          catch ptr null
  %39 = extractvalue { ptr, i32 } %38, 0
  call void @__clang_call_terminate(ptr %39) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEcvNS_17basic_string_viewIcS2_EEB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca %"class.std::__1::basic_string_view", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %4) #3
  %6 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %4) #3
  %7 = call ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B8ne190102EPKcm(ptr noundef %2, ptr noundef %5, i64 noundef %6) #3
  %8 = load [2 x i64], ptr %2, align 8
  ret [2 x i64] %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string_view", ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4dataB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string_view", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B8ne190102EPKcm(ptr noundef returned %0, ptr noundef %1, i64 noundef %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B8ne190102EPKcm(ptr noundef %7, ptr noundef %8, i64 noundef %9) #3
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B8ne190102EPKcm(ptr noundef returned %0, ptr noundef %1, i64 noundef %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"class.std::__1::basic_string_view", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %8, align 8
  %10 = getelementptr inbounds %"class.std::__1::basic_string_view", ptr %7, i32 0, i32 1
  %11 = load i64, ptr %6, align 8
  store i64 %11, ptr %10, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE8allocateB8ne190102ERSE_m(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call ptr @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE8allocateB8ne190102Em(ptr noundef %5, i64 noundef %6)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEC1B8ne190102ERSE_b(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1, i1 noundef zeroext %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = zext i1 %2 to i8
  store i8 %7, ptr %6, align 1
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i8, ptr %6, align 1
  %11 = trunc i8 %10 to i1
  %12 = call ptr @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEC2B8ne190102ERSE_b(ptr noundef %8, ptr noundef nonnull align 1 dereferenceable(1) %9, i1 noundef zeroext %11) #3
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC1B8ne190102ILb1EvEEPSD_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeISG_EEXT_EE20__good_rval_ref_typeE(ptr noundef returned %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(9) %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC2B8ne190102ILb1EvEEPSD_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeISG_EEXT_EE20__good_rval_ref_typeE(ptr noundef %7, ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(9) %9) #3
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE9constructB8ne190102INS_4pairIKS8_SA_EEJRKNS_21piecewise_construct_tENS_5tupleIJRSI_EEENSN_IJEEEELi0EEEvRSE_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 1 dereferenceable(1) %4) #1 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = load ptr, ptr %9, align 8
  %15 = load ptr, ptr %10, align 8
  call void @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE9constructB8ne190102INS_4pairIKS7_S9_EEJRKNS_21piecewise_construct_tENS_5tupleIJRSG_EEENSL_IJEEEEEEvPT_DpOT0_(ptr noundef %11, ptr noundef %12, ptr noundef nonnull align 1 dereferenceable(1) %13, ptr noundef nonnull align 8 dereferenceable(8) %14, ptr noundef nonnull align 1 dereferenceable(1) %15)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEptB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %4) #3
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(9) ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE11get_deleterB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(9) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE6secondB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE8allocateB8ne190102Em(ptr noundef %0, i64 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE8max_sizeB8ne190102ISE_Li0EEEmRKSE_(ptr noundef nonnull align 1 dereferenceable(1) %5) #3
  %8 = icmp ugt i64 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @_ZSt28__throw_bad_array_new_lengthB8ne190102v() #18
  unreachable

10:                                               ; preds = %2
  %11 = load i64, ptr %4, align 8
  %12 = mul i64 %11, 64
  %13 = call ptr @_ZNSt3__117__libcpp_allocateB8ne190102Emm(i64 noundef %12, i64 noundef 8)
  ret ptr %13
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE8max_sizeB8ne190102ISE_Li0EEEmRKSE_(ptr noundef nonnull align 1 dereferenceable(1) %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i64 @_ZNKSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE8max_sizeB8ne190102Ev(ptr noundef %3) #3
  ret i64 %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE8max_sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret i64 288230376151711743
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEC2B8ne190102ERSE_b(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1, i1 noundef zeroext %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = zext i1 %2 to i8
  store i8 %7, ptr %6, align 1
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %"class.std::__1::__tree_node_destructor", ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %5, align 8
  store ptr %10, ptr %9, align 8
  %11 = getelementptr inbounds %"class.std::__1::__tree_node_destructor", ptr %8, i32 0, i32 1
  %12 = load i8, ptr %6, align 1
  %13 = trunc i8 %12 to i1
  %14 = zext i1 %13 to i8
  store i8 %14, ptr %11, align 8
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC2B8ne190102ILb1EvEEPSD_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeISG_EEXT_EE20__good_rval_ref_typeE(ptr noundef returned %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(9) %2) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %6, align 8
  %10 = invoke ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC1B8ne190102IRSE_SH_EEOT_OT0_(ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(9) %9)
          to label %11 unwind label %12

11:                                               ; preds = %3
  ret ptr %7

12:                                               ; preds = %3
  %13 = landingpad { ptr, i32 }
          catch ptr null
  %14 = extractvalue { ptr, i32 } %13, 0
  call void @__clang_call_terminate(ptr %14) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC1B8ne190102IRSE_SH_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(9) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC2B8ne190102IRSE_SH_EEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(9) %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEEC2B8ne190102IRSE_SH_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(9) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call ptr @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEELi0ELb0EEC2B8ne190102IRSE_Li0EEEOT_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8)
  %10 = getelementptr inbounds i8, ptr %7, i64 8
  %11 = load ptr, ptr %6, align 8
  %12 = call ptr @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEP7LicenseEEPvEEEEEELi1ELb0EEC2B8ne190102ISG_Li0EEEOT_(ptr noundef %10, ptr noundef nonnull align 8 dereferenceable(9) %11)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEELi0ELb0EEC2B8ne190102IRSE_Li0EEEOT_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.21", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEP7LicenseEEPvEEEEEELi1ELb0EEC2B8ne190102ISG_Li0EEEOT_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(9) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.22", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %7, i64 16, i1 false)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__19allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEP7LicenseEEPvEEE9constructB8ne190102INS_4pairIKS7_S9_EEJRKNS_21piecewise_construct_tENS_5tupleIJRSG_EEENSL_IJEEEEEEvPT_DpOT0_(ptr noundef %0, ptr noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 1 dereferenceable(1) %4) #1 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca %"struct.std::__1::piecewise_construct_t", align 1
  %12 = alloca %"class.std::__1::tuple", align 8
  %13 = alloca %"class.std::__1::tuple.19", align 1
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = load ptr, ptr %8, align 8
  %17 = load ptr, ptr %9, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %17, i64 8, i1 false)
  %18 = load ptr, ptr %10, align 8
  %19 = getelementptr inbounds %"class.std::__1::tuple", ptr %12, i32 0, i32 0
  %20 = getelementptr inbounds %"struct.std::__1::__tuple_impl", ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds %"class.std::__1::__tuple_leaf", ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = ptrtoint ptr %22 to i64
  %24 = call ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEC1B8ne190102IJRS7_EJEEENS_21piecewise_construct_tENS_5tupleIJDpT_EEENSE_IJDpT0_EEE(ptr noundef %15, i64 %23)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEC1B8ne190102IJRS7_EJEEENS_21piecewise_construct_tENS_5tupleIJDpT_EEENSE_IJDpT0_EEE(ptr noundef returned %0, i64 %1) unnamed_addr #1 {
  %3 = alloca %"struct.std::__1::piecewise_construct_t", align 1
  %4 = alloca %"class.std::__1::tuple", align 8
  %5 = alloca %"class.std::__1::tuple.19", align 1
  %6 = alloca ptr, align 8
  %7 = alloca %"struct.std::__1::piecewise_construct_t", align 1
  %8 = alloca %"struct.std::__1::__tuple_indices", align 1
  %9 = alloca %"struct.std::__1::__tuple_indices.23", align 1
  %10 = getelementptr inbounds %"class.std::__1::tuple", ptr %4, i32 0, i32 0
  %11 = getelementptr inbounds %"struct.std::__1::__tuple_impl", ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds %"class.std::__1::__tuple_leaf", ptr %11, i32 0, i32 0
  %13 = inttoptr i64 %1 to ptr
  store ptr %13, ptr %12, align 8
  store ptr %0, ptr %6, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = call ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEC1B8ne190102IJRS7_EJEJLm0EEJEEENS_21piecewise_construct_tERNS_5tupleIJDpT_EEERNSE_IJDpT0_EEENS_15__tuple_indicesIJXspT1_EEEENSN_IJXspT2_EEEE(ptr noundef %14, ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 1 dereferenceable(1) %5)
  ret ptr %14
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEC1B8ne190102IJRS7_EJEJLm0EEJEEENS_21piecewise_construct_tERNS_5tupleIJDpT_EEERNSE_IJDpT0_EEENS_15__tuple_indicesIJXspT1_EEEENSN_IJXspT2_EEEE(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca %"struct.std::__1::piecewise_construct_t", align 1
  %5 = alloca %"struct.std::__1::__tuple_indices", align 1
  %6 = alloca %"struct.std::__1::__tuple_indices.23", align 1
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = load ptr, ptr %8, align 8
  %12 = load ptr, ptr %9, align 8
  %13 = call ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEC2B8ne190102IJRS7_EJEJLm0EEJEEENS_21piecewise_construct_tERNS_5tupleIJDpT_EEERNSE_IJDpT0_EEENS_15__tuple_indicesIJXspT1_EEEENSN_IJXspT2_EEEE(ptr noundef %10, ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef nonnull align 1 dereferenceable(1) %12)
  ret ptr %10
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairIKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEC2B8ne190102IJRS7_EJEJLm0EEJEEENS_21piecewise_construct_tERNS_5tupleIJDpT_EEERNSE_IJDpT0_EEENS_15__tuple_indicesIJXspT1_EEEENSN_IJXspT2_EEEE(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca %"struct.std::__1::piecewise_construct_t", align 1
  %5 = alloca %"struct.std::__1::__tuple_indices", align 1
  %6 = alloca %"struct.std::__1::__tuple_indices.23", align 1
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %"struct.std::__1::pair", ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %8, align 8
  %13 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__13getB8ne190102ILm0EJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEERNS_13tuple_elementIXT_ENS_5tupleIJDpT0_EEEE4typeERSD_(ptr noundef nonnull align 8 dereferenceable(8) %12) #3
  %14 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef %11, ptr noundef nonnull align 8 dereferenceable(24) %13)
  %15 = getelementptr inbounds %"struct.std::__1::pair", ptr %10, i32 0, i32 1
  store ptr null, ptr %15, align 8
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__13getB8ne190102ILm0EJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEERNS_13tuple_elementIXT_ENS_5tupleIJDpT0_EEEE4typeERSD_(ptr noundef nonnull align 8 dereferenceable(8) %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::tuple", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112__tuple_leafILm0ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb0EE3getB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112__tuple_leafILm0ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb0EE3getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tuple_leaf", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.21", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(9) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE6secondB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  %5 = call noundef nonnull align 8 dereferenceable(9) ptr @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEP7LicenseEEPvEEEEEELi1ELb0EE5__getB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(9) ptr @_ZNSt3__122__compressed_pair_elemINS_22__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEP7LicenseEEPvEEEEEELi1ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.22", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__127__tree_balance_after_insertB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_S5_(ptr noundef %0, ptr noundef %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = icmp eq ptr %7, %8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %10, i32 0, i32 3
  %12 = zext i1 %9 to i8
  store i8 %12, ptr %11, align 8
  br label %13

13:                                               ; preds = %138, %2
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = icmp ne ptr %14, %15
  br i1 %16, label %17, label %25

17:                                               ; preds = %13
  %18 = load ptr, ptr %4, align 8
  %19 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %18)
          to label %20 unwind label %140

20:                                               ; preds = %17
  %21 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %19, i32 0, i32 3
  %22 = load i8, ptr %21, align 8
  %23 = trunc i8 %22 to i1
  %24 = xor i1 %23, true
  br label %25

25:                                               ; preds = %20, %13
  %26 = phi i1 [ false, %13 ], [ %24, %20 ]
  br i1 %26, label %27, label %139

27:                                               ; preds = %25
  %28 = load ptr, ptr %4, align 8
  %29 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %28)
          to label %30 unwind label %140

30:                                               ; preds = %27
  %31 = call zeroext i1 @_ZNSt3__120__tree_is_left_childB8ne190102IPNS_16__tree_node_baseIPvEEEEbT_(ptr noundef %29) #3
  br i1 %31, label %32, label %85

32:                                               ; preds = %30
  %33 = load ptr, ptr %4, align 8
  %34 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %33)
          to label %35 unwind label %140

35:                                               ; preds = %32
  %36 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %34)
          to label %37 unwind label %140

37:                                               ; preds = %35
  %38 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %36, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %5, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %64

42:                                               ; preds = %37
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %43, i32 0, i32 3
  %45 = load i8, ptr %44, align 8
  %46 = trunc i8 %45 to i1
  br i1 %46, label %64, label %47

47:                                               ; preds = %42
  %48 = load ptr, ptr %4, align 8
  %49 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %48)
          to label %50 unwind label %140

50:                                               ; preds = %47
  store ptr %49, ptr %4, align 8
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %51, i32 0, i32 3
  store i8 1, ptr %52, align 8
  %53 = load ptr, ptr %4, align 8
  %54 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %53)
          to label %55 unwind label %140

55:                                               ; preds = %50
  store ptr %54, ptr %4, align 8
  %56 = load ptr, ptr %4, align 8
  %57 = load ptr, ptr %3, align 8
  %58 = icmp eq ptr %56, %57
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %59, i32 0, i32 3
  %61 = zext i1 %58 to i8
  store i8 %61, ptr %60, align 8
  %62 = load ptr, ptr %5, align 8
  %63 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %62, i32 0, i32 3
  store i8 1, ptr %63, align 8
  br label %84

64:                                               ; preds = %42, %37
  %65 = load ptr, ptr %4, align 8
  %66 = call zeroext i1 @_ZNSt3__120__tree_is_left_childB8ne190102IPNS_16__tree_node_baseIPvEEEEbT_(ptr noundef %65) #3
  br i1 %66, label %72, label %67

67:                                               ; preds = %64
  %68 = load ptr, ptr %4, align 8
  %69 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %68)
          to label %70 unwind label %140

70:                                               ; preds = %67
  store ptr %69, ptr %4, align 8
  %71 = load ptr, ptr %4, align 8
  call void @_ZNSt3__118__tree_left_rotateB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_(ptr noundef %71) #3
  br label %72

72:                                               ; preds = %70, %64
  %73 = load ptr, ptr %4, align 8
  %74 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %73)
          to label %75 unwind label %140

75:                                               ; preds = %72
  store ptr %74, ptr %4, align 8
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %76, i32 0, i32 3
  store i8 1, ptr %77, align 8
  %78 = load ptr, ptr %4, align 8
  %79 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %78)
          to label %80 unwind label %140

80:                                               ; preds = %75
  store ptr %79, ptr %4, align 8
  %81 = load ptr, ptr %4, align 8
  %82 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %81, i32 0, i32 3
  store i8 0, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  call void @_ZNSt3__119__tree_right_rotateB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_(ptr noundef %83) #3
  br label %139

84:                                               ; preds = %55
  br label %138

85:                                               ; preds = %30
  %86 = load ptr, ptr %4, align 8
  %87 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %86)
          to label %88 unwind label %140

88:                                               ; preds = %85
  %89 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %87, i32 0, i32 2
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %90, i32 0, i32 0
  %92 = load ptr, ptr %91, align 8
  store ptr %92, ptr %6, align 8
  %93 = load ptr, ptr %6, align 8
  %94 = icmp ne ptr %93, null
  br i1 %94, label %95, label %117

95:                                               ; preds = %88
  %96 = load ptr, ptr %6, align 8
  %97 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %96, i32 0, i32 3
  %98 = load i8, ptr %97, align 8
  %99 = trunc i8 %98 to i1
  br i1 %99, label %117, label %100

100:                                              ; preds = %95
  %101 = load ptr, ptr %4, align 8
  %102 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %101)
          to label %103 unwind label %140

103:                                              ; preds = %100
  store ptr %102, ptr %4, align 8
  %104 = load ptr, ptr %4, align 8
  %105 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %104, i32 0, i32 3
  store i8 1, ptr %105, align 8
  %106 = load ptr, ptr %4, align 8
  %107 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %106)
          to label %108 unwind label %140

108:                                              ; preds = %103
  store ptr %107, ptr %4, align 8
  %109 = load ptr, ptr %4, align 8
  %110 = load ptr, ptr %3, align 8
  %111 = icmp eq ptr %109, %110
  %112 = load ptr, ptr %4, align 8
  %113 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %112, i32 0, i32 3
  %114 = zext i1 %111 to i8
  store i8 %114, ptr %113, align 8
  %115 = load ptr, ptr %6, align 8
  %116 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %115, i32 0, i32 3
  store i8 1, ptr %116, align 8
  br label %137

117:                                              ; preds = %95, %88
  %118 = load ptr, ptr %4, align 8
  %119 = call zeroext i1 @_ZNSt3__120__tree_is_left_childB8ne190102IPNS_16__tree_node_baseIPvEEEEbT_(ptr noundef %118) #3
  br i1 %119, label %120, label %125

120:                                              ; preds = %117
  %121 = load ptr, ptr %4, align 8
  %122 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %121)
          to label %123 unwind label %140

123:                                              ; preds = %120
  store ptr %122, ptr %4, align 8
  %124 = load ptr, ptr %4, align 8
  call void @_ZNSt3__119__tree_right_rotateB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_(ptr noundef %124) #3
  br label %125

125:                                              ; preds = %123, %117
  %126 = load ptr, ptr %4, align 8
  %127 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %126)
          to label %128 unwind label %140

128:                                              ; preds = %125
  store ptr %127, ptr %4, align 8
  %129 = load ptr, ptr %4, align 8
  %130 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %129, i32 0, i32 3
  store i8 1, ptr %130, align 8
  %131 = load ptr, ptr %4, align 8
  %132 = invoke ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %131)
          to label %133 unwind label %140

133:                                              ; preds = %128
  store ptr %132, ptr %4, align 8
  %134 = load ptr, ptr %4, align 8
  %135 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %134, i32 0, i32 3
  store i8 0, ptr %135, align 8
  %136 = load ptr, ptr %4, align 8
  call void @_ZNSt3__118__tree_left_rotateB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_(ptr noundef %136) #3
  br label %139

137:                                              ; preds = %108
  br label %138

138:                                              ; preds = %137, %84
  br label %13, !llvm.loop !13

139:                                              ; preds = %133, %80, %25
  ret void

140:                                              ; preds = %128, %125, %120, %103, %100, %85, %75, %72, %67, %50, %47, %35, %32, %27, %17
  %141 = landingpad { ptr, i32 }
          catch ptr null
  %142 = extractvalue { ptr, i32 } %141, 0
  call void @__clang_call_terminate(ptr %142) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE4sizeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree", ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEE5firstB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__120__tree_is_left_childB8ne190102IPNS_16__tree_node_baseIPvEEEEbT_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %4, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %3, %8
  ret i1 %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__118__tree_left_rotateB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_(ptr noundef %0) #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %4, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %10, i32 0, i32 1
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %22

16:                                               ; preds = %1
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %2, align 8
  invoke void @_ZNSt3__116__tree_node_baseIPvE12__set_parentB8ne190102EPS2_(ptr noundef %19, ptr noundef %20)
          to label %21 unwind label %48

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %1
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %26, i32 0, i32 2
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = call zeroext i1 @_ZNSt3__120__tree_is_left_childB8ne190102IPNS_16__tree_node_baseIPvEEEEbT_(ptr noundef %28) #3
  br i1 %29, label %30, label %36

30:                                               ; preds = %22
  %31 = load ptr, ptr %3, align 8
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %32, i32 0, i32 2
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %34, i32 0, i32 0
  store ptr %31, ptr %35, align 8
  br label %41

36:                                               ; preds = %22
  %37 = load ptr, ptr %3, align 8
  %38 = load ptr, ptr %2, align 8
  %39 = call ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %38)
  %40 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %39, i32 0, i32 1
  store ptr %37, ptr %40, align 8
  br label %41

41:                                               ; preds = %36, %30
  %42 = load ptr, ptr %2, align 8
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %43, i32 0, i32 0
  store ptr %42, ptr %44, align 8
  %45 = load ptr, ptr %2, align 8
  %46 = load ptr, ptr %3, align 8
  invoke void @_ZNSt3__116__tree_node_baseIPvE12__set_parentB8ne190102EPS2_(ptr noundef %45, ptr noundef %46)
          to label %47 unwind label %48

47:                                               ; preds = %41
  ret void

48:                                               ; preds = %41, %16
  %49 = landingpad { ptr, i32 }
          catch ptr null
  %50 = extractvalue { ptr, i32 } %49, 0
  call void @__clang_call_terminate(ptr %50) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__tree_right_rotateB8ne190102IPNS_16__tree_node_baseIPvEEEEvT_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %10, i32 0, i32 0
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %21

16:                                               ; preds = %1
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %2, align 8
  call void @_ZNSt3__116__tree_node_baseIPvE12__set_parentB8ne190102EPS2_(ptr noundef %19, ptr noundef %20)
  br label %21

21:                                               ; preds = %16, %1
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %25, i32 0, i32 2
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = call zeroext i1 @_ZNSt3__120__tree_is_left_childB8ne190102IPNS_16__tree_node_baseIPvEEEEbT_(ptr noundef %27) #3
  br i1 %28, label %29, label %35

29:                                               ; preds = %21
  %30 = load ptr, ptr %3, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %31, i32 0, i32 2
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %33, i32 0, i32 0
  store ptr %30, ptr %34, align 8
  br label %40

35:                                               ; preds = %21
  %36 = load ptr, ptr %3, align 8
  %37 = load ptr, ptr %2, align 8
  %38 = call ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %37)
  %39 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %38, i32 0, i32 1
  store ptr %36, ptr %39, align 8
  br label %40

40:                                               ; preds = %35, %29
  %41 = load ptr, ptr %2, align 8
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %42, i32 0, i32 1
  store ptr %41, ptr %43, align 8
  %44 = load ptr, ptr %2, align 8
  %45 = load ptr, ptr %3, align 8
  call void @_ZNSt3__116__tree_node_baseIPvE12__set_parentB8ne190102EPS2_(ptr noundef %44, ptr noundef %45)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__116__tree_node_baseIPvE12__set_parentB8ne190102EPS2_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %5, i32 0, i32 2
  store ptr %6, ptr %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_P7LicenseEENS_4lessIS7_EELb1EEEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemImLi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemImLi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.8", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.21", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEED2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5resetB8ne190102EPSD_(ptr noundef %3, ptr noundef null) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__110unique_ptrINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5resetB8ne190102EPSD_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %6, i32 0, i32 0
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %7) #3
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %6, i32 0, i32 0
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE5firstB8ne190102Ev(ptr noundef %11) #3
  store ptr %10, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %2
  %16 = getelementptr inbounds %"class.std::__1::unique_ptr", ptr %6, i32 0, i32 0
  %17 = call noundef nonnull align 8 dereferenceable(9) ptr @_ZNSt3__117__compressed_pairIPNS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPvEENS_22__tree_node_destructorINS6_ISD_EEEEE6secondB8ne190102Ev(ptr noundef %16) #3
  %18 = load ptr, ptr %5, align 8
  call void @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEclB8ne190102EPSD_(ptr noundef %17, ptr noundef %18) #3
  br label %19

19:                                               ; preds = %15, %2
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__122__tree_node_destructorINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEEclB8ne190102EPSD_(ptr noundef %0, ptr noundef %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::__tree_node_destructor", ptr %5, i32 0, i32 1
  %7 = load i8, ptr %6, align 8
  %8 = trunc i8 %7 to i1
  br i1 %8, label %9, label %17

9:                                                ; preds = %2
  %10 = getelementptr inbounds %"class.std::__1::__tree_node_destructor", ptr %5, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %"class.std::__1::__tree_node", ptr %12, i32 0, i32 1
  %14 = invoke ptr @_ZNSt3__122__tree_key_value_typesINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEE9__get_ptrB8ne190102ERSA_(ptr noundef nonnull align 8 dereferenceable(32) %13)
          to label %15 unwind label %25

15:                                               ; preds = %9
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE7destroyB8ne190102INS_4pairIKS8_SA_EEvLi0EEEvRSE_PT_(ptr noundef nonnull align 1 dereferenceable(1) %11, ptr noundef %14)
          to label %16 unwind label %25

16:                                               ; preds = %15
  br label %17

17:                                               ; preds = %16, %2
  %18 = load ptr, ptr %4, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %17
  %21 = getelementptr inbounds %"class.std::__1::__tree_node_destructor", ptr %5, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %4, align 8
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEP7LicenseEEPvEEEEE10deallocateB8ne190102ERSE_PSD_m(ptr noundef nonnull align 1 dereferenceable(1) %22, ptr noundef %23, i64 noundef 1) #3
  br label %24

24:                                               ; preds = %20, %17
  ret void

25:                                               ; preds = %15, %9
  %26 = landingpad { ptr, i32 }
          catch ptr null
  %27 = extractvalue { ptr, i32 } %26, 0
  call void @__clang_call_terminate(ptr %27) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC2B8ne190102ESE_(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__14pairINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEbEC2B8ne190102ISG_RbLi0EEEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"struct.std::__1::pair.18", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %9, i64 8, i1 false)
  %10 = getelementptr inbounds %"struct.std::__1::pair.18", ptr %7, i32 0, i32 1
  %11 = load ptr, ptr %6, align 8
  %12 = load i8, ptr %11, align 1
  %13 = trunc i8 %12 to i1
  %14 = zext i1 %13 to i8
  store i8 %14, ptr %10, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__15tupleIJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC1B8ne190102INS_4_AndELi0EEES8_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__15tupleIJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC2B8ne190102INS_4_AndELi0EEES8_(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(24) %6) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__15tupleIJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC2B8ne190102INS_4_AndELi0EEES8_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__tuple_indices", align 1
  %6 = alloca %"struct.std::__1::__tuple_types", align 1
  %7 = alloca %"struct.std::__1::__tuple_indices.23", align 1
  %8 = alloca %"struct.std::__1::__tuple_types.24", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %"class.std::__1::tuple", ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %4, align 8
  %12 = call ptr @_ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0EEEEJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC1B8ne190102IJLm0EEJSA_EJEJEJSA_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSE_IJDpT2_EEEDpOT3_(ptr noundef %10, ptr noundef nonnull align 8 dereferenceable(24) %11) #3
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0EEEEJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC1B8ne190102IJLm0EEJSA_EJEJEJSA_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSE_IJDpT2_EEEDpOT3_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 {
  %3 = alloca %"struct.std::__1::__tuple_indices", align 1
  %4 = alloca %"struct.std::__1::__tuple_types", align 1
  %5 = alloca %"struct.std::__1::__tuple_indices.23", align 1
  %6 = alloca %"struct.std::__1::__tuple_types.24", align 1
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %8, align 8
  %11 = call ptr @_ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0EEEEJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC2B8ne190102IJLm0EEJSA_EJEJEJSA_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSE_IJDpT2_EEEDpOT3_(ptr noundef %9, ptr noundef nonnull align 8 dereferenceable(24) %10) #3
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0EEEEJRKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEC2B8ne190102IJLm0EEJSA_EJEJEJSA_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSE_IJDpT2_EEEDpOT3_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 {
  %3 = alloca %"struct.std::__1::__tuple_indices", align 1
  %4 = alloca %"struct.std::__1::__tuple_types", align 1
  %5 = alloca %"struct.std::__1::__tuple_indices.23", align 1
  %6 = alloca %"struct.std::__1::__tuple_types.24", align 1
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %8, align 8
  %11 = call ptr @_ZNSt3__112__tuple_leafILm0ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb0EEC2B8ne190102IS8_Li0EEEOT_(ptr noundef %9, ptr noundef nonnull align 8 dereferenceable(24) %10) #3
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__112__tuple_leafILm0ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELb0EEC2B8ne190102IS8_Li0EEEOT_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::__tuple_leaf", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114pointer_traitsIPNS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEE10pointer_toB8ne190102ERSA_(ptr noundef nonnull align 8 dereferenceable(32) %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElE8__get_npB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9push_backB8ne190102ERKS6_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %6) #3
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ult ptr %9, %11
  br i1 %12, label %13, label %17

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__construct_one_at_endB8ne190102IJRKS6_EEEvDpOT_(ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(24) %14)
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %"class.std::__1::basic_string", ptr %15, i32 1
  store ptr %16, ptr %5, align 8
  br label %20

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21__push_back_slow_pathIRKS6_EEPS6_OT_(ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(24) %18)
  store ptr %19, ptr %5, align 8
  br label %20

20:                                               ; preds = %17, %13
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  store ptr %21, ptr %22, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__construct_one_at_endB8ne190102IJRKS6_EEEvDpOT_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC1B8ne190102ERS8_m(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef 1)
  %10 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %8) #3
  %11 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %5, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %12) #3
  %14 = load ptr, ptr %4, align 8
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB8ne190102IS6_JRKS6_ELi0EEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %10, ptr noundef %13, ptr noundef nonnull align 8 dereferenceable(24) %14)
          to label %15 unwind label %20

15:                                               ; preds = %2
  %16 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %5, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %"class.std::__1::basic_string", ptr %17, i32 1
  store ptr %18, ptr %16, align 8
  %19 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B8ne190102Ev(ptr noundef %5) #3
  ret void

20:                                               ; preds = %2
  %21 = landingpad { ptr, i32 }
          cleanup
  %22 = extractvalue { ptr, i32 } %21, 0
  store ptr %22, ptr %6, align 8
  %23 = extractvalue { ptr, i32 } %21, 1
  store i32 %23, ptr %7, align 4
  %24 = call ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B8ne190102Ev(ptr noundef %5) #3
  br label %25

25:                                               ; preds = %20
  %26 = load ptr, ptr %6, align 8
  %27 = load i32, ptr %7, align 4
  %28 = insertvalue { ptr, i32 } poison, ptr %26, 0
  %29 = insertvalue { ptr, i32 } %28, i32 %27, 1
  resume { ptr, i32 } %29
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21__push_back_slow_pathIRKS6_EEPS6_OT_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %"struct.std::__1::__split_buffer", align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %9) #3
  store ptr %10, ptr %5, align 8
  %11 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %9) #3
  %12 = add i64 %11, 1
  %13 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__recommendB8ne190102Em(ptr noundef %9, i64 noundef %12)
  %14 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %9) #3
  %15 = load ptr, ptr %5, align 8
  %16 = call ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1EmmS8_(ptr noundef %6, i64 noundef %13, i64 noundef %14, ptr noundef nonnull align 1 dereferenceable(1) %15)
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %6, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %19) #3
  %21 = load ptr, ptr %4, align 8
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB8ne190102IS6_JRKS6_ELi0EEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %17, ptr noundef %20, ptr noundef nonnull align 8 dereferenceable(24) %21)
          to label %22 unwind label %30

22:                                               ; preds = %2
  %23 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %6, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %"class.std::__1::basic_string", ptr %24, i32 1
  store ptr %25, ptr %23, align 8
  invoke void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS6_RS7_EE(ptr noundef %9, ptr noundef nonnull align 8 dereferenceable(40) %6)
          to label %26 unwind label %30

26:                                               ; preds = %22
  %27 = getelementptr inbounds %"class.std::__1::vector", ptr %9, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = call ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef %6) #3
  ret ptr %28

30:                                               ; preds = %22, %2
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = extractvalue { ptr, i32 } %31, 0
  store ptr %32, ptr %7, align 8
  %33 = extractvalue { ptr, i32 } %31, 1
  store i32 %33, ptr %8, align 4
  %34 = call ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef %6) #3
  br label %35

35:                                               ; preds = %30
  %36 = load ptr, ptr %7, align 8
  %37 = load i32, ptr %8, align 4
  %38 = insertvalue { ptr, i32 } poison, ptr %36, 0
  %39 = insertvalue { ptr, i32 } %38, i32 %37, 1
  resume { ptr, i32 } %39
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1EmmS8_(ptr noundef returned %0, i64 noundef %1, i64 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) unnamed_addr #1 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = load i64, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2EmmS8_(ptr noundef %9, i64 noundef %10, i64 noundef %11, ptr noundef nonnull align 1 dereferenceable(1) %12)
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS6_RS7_EE(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(40) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_deleteB8ne190102Ev(ptr noundef %6) #3
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = ptrtoint ptr %11 to i64
  %15 = ptrtoint ptr %13 to i64
  %16 = sub i64 %14, %15
  %17 = sdiv exact i64 %16, 24
  %18 = sub i64 0, %17
  %19 = getelementptr inbounds %"class.std::__1::basic_string", ptr %9, i64 %18
  store ptr %19, ptr %5, align 8
  %20 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %6) #3
  %21 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %22) #3
  %24 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %25) #3
  %27 = load ptr, ptr %5, align 8
  %28 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %27) #3
  call void @_ZNSt3__134__uninitialized_allocator_relocateB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEES6_EEvRT_PT0_SB_SB_(ptr noundef nonnull align 1 dereferenceable(1) %20, ptr noundef %23, ptr noundef %26, ptr noundef %28)
  %29 = load ptr, ptr %5, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %30, i32 0, i32 1
  store ptr %29, ptr %31, align 8
  %32 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  store ptr %33, ptr %34, align 8
  %35 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 0
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %36, i32 0, i32 1
  call void @_ZNSt3__14swapB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %35, ptr noundef nonnull align 8 dereferenceable(8) %37) #3
  %38 = getelementptr inbounds %"class.std::__1::vector", ptr %6, i32 0, i32 1
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %39, i32 0, i32 2
  call void @_ZNSt3__14swapB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %38, ptr noundef nonnull align 8 dereferenceable(8) %40) #3
  %41 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %6) #3
  %42 = load ptr, ptr %4, align 8
  %43 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %42) #3
  call void @_ZNSt3__14swapB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %41, ptr noundef nonnull align 8 dereferenceable(8) %43) #3
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %44, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %47, i32 0, i32 0
  store ptr %46, ptr %48, align 8
  %49 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %6) #3
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE14__annotate_newB8ne190102Em(ptr noundef %6, i64 noundef %49) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED2Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2EmmS8_(ptr noundef returned %0, i64 noundef %1, i64 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) unnamed_addr #1 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca %"struct.std::__1::__allocation_result", align 8
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %12 = load ptr, ptr %6, align 8
  store ptr %12, ptr %5, align 8
  %13 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %12, i32 0, i32 3
  store ptr null, ptr %10, align 8
  %14 = load ptr, ptr %9, align 8
  %15 = call ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1B8ne190102IDnS9_EEOT_OT0_(ptr noundef %13, ptr noundef nonnull align 8 dereferenceable(8) %10, ptr noundef nonnull align 1 dereferenceable(1) %14)
  %16 = load i64, ptr %7, align 8
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %4
  %19 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %12, i32 0, i32 0
  store ptr null, ptr %19, align 8
  br label %29

20:                                               ; preds = %4
  %21 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %12) #3
  %22 = load i64, ptr %7, align 8
  %23 = call [2 x i64] @_ZNSt3__119__allocate_at_leastB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERSA_m(ptr noundef nonnull align 1 dereferenceable(1) %21, i64 noundef %22)
  store [2 x i64] %23, ptr %11, align 8
  %24 = getelementptr inbounds %"struct.std::__1::__allocation_result", ptr %11, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %12, i32 0, i32 0
  store ptr %25, ptr %26, align 8
  %27 = getelementptr inbounds %"struct.std::__1::__allocation_result", ptr %11, i32 0, i32 1
  %28 = load i64, ptr %27, align 8
  store i64 %28, ptr %7, align 8
  br label %29

29:                                               ; preds = %20, %18
  %30 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %12, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = load i64, ptr %8, align 8
  %33 = getelementptr inbounds %"class.std::__1::basic_string", ptr %31, i64 %32
  %34 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %12, i32 0, i32 2
  store ptr %33, ptr %34, align 8
  %35 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %12, i32 0, i32 1
  store ptr %33, ptr %35, align 8
  %36 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %12, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = load i64, ptr %7, align 8
  %39 = getelementptr inbounds %"class.std::__1::basic_string", ptr %37, i64 %38
  %40 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %12) #3
  store ptr %39, ptr %40, align 8
  %41 = load ptr, ptr %5, align 8
  ret ptr %41
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1B8ne190102IDnS9_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2B8ne190102IDnS9_EEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 1 dereferenceable(1) %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 3
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE6secondB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 3
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2B8ne190102IDnS9_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EEC2B8ne190102IDnLi0EEEOT_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %8)
  %10 = getelementptr inbounds i8, ptr %7, i64 8
  %11 = load ptr, ptr %6, align 8
  %12 = call ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EEC2B8ne190102IS8_Li0EEEOT_(ptr noundef %10, ptr noundef nonnull align 1 dereferenceable(1) %11)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EEC2B8ne190102IS8_Li0EEEOT_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.26", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE6secondB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EE5__getB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.26", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__134__uninitialized_allocator_relocateB8ne190102INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEES6_EEvRT_PT0_SB_SB_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #8 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = ptrtoint ptr %11 to i64
  %14 = ptrtoint ptr %12 to i64
  %15 = sub i64 %13, %14
  %16 = sdiv exact i64 %15, 24
  %17 = mul i64 24, %16
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %10, i64 %17, i1 false)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__14swapB8ne190102IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %4, align 8
  store ptr %11, ptr %12, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED2Ev(ptr noundef returned %0) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5clearB8ne190102Ev(ptr noundef %4) #3
  %5 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %14

8:                                                ; preds = %1
  %9 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %4) #3
  %10 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %4, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = invoke i64 @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE8capacityB8ne190102Ev(ptr noundef %4)
          to label %13 unwind label %16

13:                                               ; preds = %8
  call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE10deallocateB8ne190102ERS7_PS6_m(ptr noundef nonnull align 1 dereferenceable(1) %9, ptr noundef %11, i64 noundef %12) #3
  br label %14

14:                                               ; preds = %13, %1
  %15 = load ptr, ptr %2, align 8
  ret ptr %15

16:                                               ; preds = %8
  %17 = landingpad { ptr, i32 }
          catch ptr null
  %18 = extractvalue { ptr, i32 } %17, 0
  call void @__clang_call_terminate(ptr %18) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5clearB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  call void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB8ne190102EPS6_(ptr noundef %3, ptr noundef %5) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE8capacityB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %3) #3
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 24
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB8ne190102EPS6_(ptr noundef %0, ptr noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::integral_constant", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  call void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB8ne190102EPS6_NS_17integral_constantIbLb0EEE(ptr noundef %6, ptr noundef %7) #3
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB8ne190102EPS6_NS_17integral_constantIbLb0EEE(ptr noundef %0, ptr noundef %1) #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"struct.std::__1::integral_constant", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  br label %7

7:                                                ; preds = %18, %2
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %6, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %8, %10
  br i1 %11, label %12, label %19

12:                                               ; preds = %7
  %13 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB8ne190102Ev(ptr noundef %6) #3
  %14 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %6, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %"class.std::__1::basic_string", ptr %15, i32 -1
  store ptr %16, ptr %14, align 8
  %17 = call ptr @_ZNSt3__112__to_addressB8ne190102INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %16) #3
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB8ne190102IS6_Li0EEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %13, ptr noundef %17)
          to label %18 unwind label %20

18:                                               ; preds = %12
  br label %7, !llvm.loop !14

19:                                               ; preds = %7
  ret void

20:                                               ; preds = %12
  %21 = landingpad { ptr, i32 }
          catch ptr null
  %22 = extractvalue { ptr, i32 } %21, 0
  call void @__clang_call_terminate(ptr %22) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 3
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %4) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE5beginB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca %"class.std::__1::__map_iterator", align 8
  %3 = alloca ptr, align 8
  %4 = alloca %"class.std::__1::__tree_iterator", align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::map", ptr %5, i32 0, i32 0
  %7 = call i64 @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE5beginB8ne190102Ev(ptr noundef %6) #3
  %8 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %4, i32 0, i32 0
  %9 = inttoptr i64 %7 to ptr
  store ptr %9, ptr %8, align 8
  %10 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %4, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = ptrtoint ptr %11 to i64
  %13 = call ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEC1B8ne190102ESG_(ptr noundef %2, i64 %12) #3
  %14 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %2, i32 0, i32 0
  %15 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = ptrtoint ptr %16 to i64
  ret i64 %17
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE3endB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca %"class.std::__1::__map_iterator", align 8
  %3 = alloca ptr, align 8
  %4 = alloca %"class.std::__1::__tree_iterator", align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::map", ptr %5, i32 0, i32 0
  %7 = call i64 @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE3endB8ne190102Ev(ptr noundef %6) #3
  %8 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %4, i32 0, i32 0
  %9 = inttoptr i64 %7 to ptr
  store ptr %9, ptr %8, align 8
  %10 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %4, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = ptrtoint ptr %11 to i64
  %13 = call ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEC1B8ne190102ESG_(ptr noundef %2, i64 %12) #3
  %14 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %2, i32 0, i32 0
  %15 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = ptrtoint ptr %16 to i64
  ret i64 %17
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1neB8ne190102ERKNS_14__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEESJ_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %7, i32 0, i32 0
  %9 = call zeroext i1 @_ZNSt3__1neB8ne190102ERKNS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEESH_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %8)
  ret i1 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(32) ptr @_ZNKSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEdeB8ne190102Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %3, i32 0, i32 0
  %5 = call ptr @_ZNKSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEptB8ne190102Ev(ptr noundef %4)
  %6 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNSt3__112__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseE11__get_valueB8ne190102Ev(ptr noundef %5)
  ret ptr %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEppB8ne190102Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEppB8ne190102Ev(ptr noundef %4)
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEE14f_9c04c1f30d82Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.47)
  %5 = getelementptr inbounds %class.SecureContainer, ptr %3, i32 0, i32 0
  %6 = call i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB8ne190102Ev(ptr noundef %5) #3
  %7 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm(ptr noundef %4, i64 noundef %6)
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef @.str.48)
  %9 = getelementptr inbounds %class.SecureContainer, ptr %3, i32 0, i32 1
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(24) %9)
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne190102INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %10, ptr noundef @.str.18)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE5beginB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca %"class.std::__1::__tree_iterator", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE12__begin_nodeB8ne190102Ev(ptr noundef %4) #3
  %6 = load ptr, ptr %5, align 8
  %7 = call ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC1B8ne190102EPNS_15__tree_end_nodeIPNS_16__tree_node_baseISC_EEEE(ptr noundef %2, ptr noundef %6) #3
  %8 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %2, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = ptrtoint ptr %9 to i64
  ret i64 %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEC1B8ne190102ESG_(ptr noundef returned %0, i64 %1) unnamed_addr #8 {
  %3 = alloca %"class.std::__1::__tree_iterator", align 8
  %4 = alloca ptr, align 8
  %5 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %3, i32 0, i32 0
  %6 = inttoptr i64 %1 to ptr
  store ptr %6, ptr %5, align 8
  store ptr %0, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %3, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = ptrtoint ptr %9 to i64
  %11 = call ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEC2B8ne190102ESG_(ptr noundef %7, i64 %10) #3
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC1B8ne190102EPNS_15__tree_end_nodeIPNS_16__tree_node_baseISC_EEEE(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC2B8ne190102EPNS_15__tree_end_nodeIPNS_16__tree_node_baseISC_EEEE(ptr noundef %5, ptr noundef %6) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC2B8ne190102EPNS_15__tree_end_nodeIPNS_16__tree_node_baseISC_EEEE(ptr noundef returned %0, ptr noundef %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEC2B8ne190102ESG_(ptr noundef returned %0, i64 %1) unnamed_addr #8 {
  %3 = alloca %"class.std::__1::__tree_iterator", align 8
  %4 = alloca ptr, align 8
  %5 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %3, i32 0, i32 0
  %6 = inttoptr i64 %1 to ptr
  store ptr %6, ptr %5, align 8
  store ptr %0, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %7, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %3, i64 8, i1 false)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE3endB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca %"class.std::__1::__tree_iterator", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call ptr @_ZNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEE10__end_nodeB8ne190102Ev(ptr noundef %4) #3
  %6 = call ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEC1B8ne190102EPNS_15__tree_end_nodeIPNS_16__tree_node_baseISC_EEEE(ptr noundef %2, ptr noundef %5) #3
  %7 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %2, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = ptrtoint ptr %8 to i64
  ret i64 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1neB8ne190102ERKNS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEESH_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call zeroext i1 @_ZNSt3__1eqB8ne190102ERKNS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEESH_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6)
  %8 = xor i1 %7, true
  ret i1 %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNSt3__1eqB8ne190102ERKNS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEESH_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = icmp eq ptr %7, %10
  ret i1 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__115__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISA_PvEElEppB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = call ptr @_ZNSt3__116__tree_next_iterB8ne190102IPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEES5_EET_T0_(ptr noundef %5) #3
  %7 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %3, i32 0, i32 0
  store ptr %6, ptr %7, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__116__tree_next_iterB8ne190102IPNS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEES5_EET_T0_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %4, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %13

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = call ptr @_ZNSt3__110__tree_minB8ne190102IPNS_16__tree_node_baseIPvEEEET_S5_(ptr noundef %11) #3
  store ptr %12, ptr %2, align 8
  br label %25

13:                                               ; preds = %1
  br label %14

14:                                               ; preds = %18, %13
  %15 = load ptr, ptr %3, align 8
  %16 = call zeroext i1 @_ZNSt3__120__tree_is_left_childB8ne190102IPNS_16__tree_node_baseIPvEEEEbT_(ptr noundef %15) #3
  %17 = xor i1 %16, true
  br i1 %17, label %18, label %21

18:                                               ; preds = %14
  %19 = load ptr, ptr %3, align 8
  %20 = call ptr @_ZNKSt3__116__tree_node_baseIPvE15__parent_unsafeB8ne190102Ev(ptr noundef %19)
  store ptr %20, ptr %3, align 8
  br label %14, !llvm.loop !15

21:                                               ; preds = %14
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %"class.std::__1::__tree_node_base", ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %2, align 8
  br label %25

25:                                               ; preds = %21, %8
  %26 = load ptr, ptr %2, align 8
  ret ptr %26
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__110__tree_minB8ne190102IPNS_16__tree_node_baseIPvEEEET_S5_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %8, %1
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %12

8:                                                ; preds = %3
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %"class.std::__1::__tree_end_node", ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %2, align 8
  br label %3, !llvm.loop !16

12:                                               ; preds = %3
  %13 = load ptr, ptr %2, align 8
  ret ptr %13
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm(ptr noundef, i64 noundef) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__1plB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr dead_on_unwind noalias writable sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB8ne190102ERKS5_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(24) %8)
  %10 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102EOS5_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %9) #3
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__1plB8ne190102IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr dead_on_unwind noalias writable sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(ptr noundef %7, ptr noundef %8)
  %10 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102EOS5_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %9) #3
  ret void
}

declare void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_RKS9_(ptr dead_on_unwind writable sret(%"class.std::__1::basic_string") align 8, ptr noundef, ptr noundef nonnull align 8 dereferenceable(24)) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB8ne190102ERKS5_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %6) #3
  %8 = load ptr, ptr %4, align 8
  %9 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %8) #3
  %10 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(ptr noundef %5, ptr noundef %7, i64 noundef %9)
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102EOS5_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne190102EOS5_(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(24) %6) #3
  ret ptr %5
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne190102EOS5_(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %class.anon, align 1
  %7 = alloca %"union.std::__1::basic_string<char>::__rep", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  store ptr %8, ptr %3, align 8
  %9 = getelementptr inbounds %"class.std::__1::basic_string", ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %5, align 8
  %11 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102EOS5_ENKUlRS5_E_clES7_(ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(24) %10)
          to label %12 unwind label %22

12:                                               ; preds = %2
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %11, i64 24, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %7, i8 0, i64 24, i1 false)
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %"class.std::__1::basic_string", ptr %13, i32 0, i32 0
  %15 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %14) #3
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %7, i64 24, i1 false)
  %16 = load ptr, ptr %5, align 8
  call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__annotate_newB8ne190102Em(ptr noundef %16, i64 noundef 0) #3
  %17 = call zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne190102Ev(ptr noundef %8) #3
  br i1 %17, label %20, label %18

18:                                               ; preds = %12
  %19 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %8) #3
  call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__annotate_newB8ne190102Em(ptr noundef %8, i64 noundef %19) #3
  br label %20

20:                                               ; preds = %18, %12
  %21 = load ptr, ptr %3, align 8
  ret ptr %21

22:                                               ; preds = %2
  %23 = landingpad { ptr, i32 }
          catch ptr null
  %24 = extractvalue { ptr, i32 } %23, 0
  call void @__clang_call_terminate(ptr %24) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102EOS5_ENKUlRS5_E_clES7_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne190102Ev(ptr noundef %6) #3
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__annotate_deleteB8ne190102Ev(ptr noundef %9) #3
  br label %10

10:                                               ; preds = %8, %2
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %"class.std::__1::basic_string", ptr %11, i32 0, i32 0
  ret ptr %12
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #13

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne190102Ev(ptr noundef %3) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__annotate_newB8ne190102Em(ptr noundef %0, i64 noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__annotate_deleteB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", ptr %3, i32 0, i32 0
  ret ptr %4
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(ptr noundef, ptr noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findB8ne190102ERKS5_m(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %7) #3
  %9 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %7) #3
  %10 = load ptr, ptr %5, align 8
  %11 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %10) #3
  %12 = load i64, ptr %6, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = call i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne190102Ev(ptr noundef %13) #3
  %15 = call i64 @_ZNSt3__110__str_findB8ne190102IcmNS_11char_traitsIcEELm18446744073709551615EEET0_PKT_S3_S6_S3_S3_(ptr noundef %8, i64 noundef %9, ptr noundef %11, i64 noundef %12, i64 noundef %14) #3
  ret i64 %15
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__110__str_findB8ne190102IcmNS_11char_traitsIcEELm18446744073709551615EEET0_PKT_S3_S6_S3_S3_(ptr noundef %0, i64 noundef %1, ptr noundef %2, i64 noundef %3, i64 noundef %4) #8 {
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store i64 %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store i64 %3, ptr %10, align 8
  store i64 %4, ptr %11, align 8
  %13 = load i64, ptr %10, align 8
  %14 = load i64, ptr %8, align 8
  %15 = icmp ugt i64 %13, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %5
  store i64 -1, ptr %6, align 8
  br label %46

17:                                               ; preds = %5
  %18 = load i64, ptr %11, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = load i64, ptr %10, align 8
  store i64 %21, ptr %6, align 8
  br label %46

22:                                               ; preds = %17
  %23 = load ptr, ptr %7, align 8
  %24 = load i64, ptr %10, align 8
  %25 = getelementptr inbounds i8, ptr %23, i64 %24
  %26 = load ptr, ptr %7, align 8
  %27 = load i64, ptr %8, align 8
  %28 = getelementptr inbounds i8, ptr %26, i64 %27
  %29 = load ptr, ptr %9, align 8
  %30 = load ptr, ptr %9, align 8
  %31 = load i64, ptr %11, align 8
  %32 = getelementptr inbounds i8, ptr %30, i64 %31
  %33 = call ptr @_ZNSt3__118__search_substringB8ne190102IcNS_11char_traitsIcEEEEPKT_S5_S5_S5_S5_(ptr noundef %25, ptr noundef %28, ptr noundef %29, ptr noundef %32) #3
  store ptr %33, ptr %12, align 8
  %34 = load ptr, ptr %12, align 8
  %35 = load ptr, ptr %7, align 8
  %36 = load i64, ptr %8, align 8
  %37 = getelementptr inbounds i8, ptr %35, i64 %36
  %38 = icmp eq ptr %34, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %22
  store i64 -1, ptr %6, align 8
  br label %46

40:                                               ; preds = %22
  %41 = load ptr, ptr %12, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = ptrtoint ptr %41 to i64
  %44 = ptrtoint ptr %42 to i64
  %45 = sub i64 %43, %44
  store i64 %45, ptr %6, align 8
  br label %46

46:                                               ; preds = %40, %39, %20, %16
  %47 = load i64, ptr %6, align 8
  ret i64 %47
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__118__search_substringB8ne190102IcNS_11char_traitsIcEEEEPKT_S5_S5_S5_S5_(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #8 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i8, align 1
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %13 = load ptr, ptr %9, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = ptrtoint ptr %13 to i64
  %16 = ptrtoint ptr %14 to i64
  %17 = sub i64 %15, %16
  store i64 %17, ptr %10, align 8
  %18 = load i64, ptr %10, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %4
  %21 = load ptr, ptr %6, align 8
  store ptr %21, ptr %5, align 8
  br label %70

22:                                               ; preds = %4
  %23 = load ptr, ptr %7, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = ptrtoint ptr %23 to i64
  %26 = ptrtoint ptr %24 to i64
  %27 = sub i64 %25, %26
  store i64 %27, ptr %11, align 8
  %28 = load i64, ptr %11, align 8
  %29 = load i64, ptr %10, align 8
  %30 = icmp slt i64 %28, %29
  br i1 %30, label %31, label %33

31:                                               ; preds = %22
  %32 = load ptr, ptr %7, align 8
  store ptr %32, ptr %5, align 8
  br label %70

33:                                               ; preds = %22
  %34 = load ptr, ptr %8, align 8
  %35 = load i8, ptr %34, align 1
  store i8 %35, ptr %12, align 1
  br label %36

36:                                               ; preds = %67, %33
  br label %37

37:                                               ; preds = %36
  %38 = load ptr, ptr %7, align 8
  %39 = load ptr, ptr %6, align 8
  %40 = ptrtoint ptr %38 to i64
  %41 = ptrtoint ptr %39 to i64
  %42 = sub i64 %40, %41
  store i64 %42, ptr %11, align 8
  %43 = load i64, ptr %11, align 8
  %44 = load i64, ptr %10, align 8
  %45 = icmp slt i64 %43, %44
  br i1 %45, label %46, label %48

46:                                               ; preds = %37
  %47 = load ptr, ptr %7, align 8
  store ptr %47, ptr %5, align 8
  br label %70

48:                                               ; preds = %37
  %49 = load ptr, ptr %6, align 8
  %50 = load i64, ptr %11, align 8
  %51 = load i64, ptr %10, align 8
  %52 = sub nsw i64 %50, %51
  %53 = add nsw i64 %52, 1
  %54 = call ptr @_ZNSt3__111char_traitsIcE4findB8ne190102EPKcmRS2_(ptr noundef %49, i64 noundef %53, ptr noundef nonnull align 1 dereferenceable(1) %12) #3
  store ptr %54, ptr %6, align 8
  %55 = load ptr, ptr %6, align 8
  %56 = icmp eq ptr %55, null
  br i1 %56, label %57, label %59

57:                                               ; preds = %48
  %58 = load ptr, ptr %7, align 8
  store ptr %58, ptr %5, align 8
  br label %70

59:                                               ; preds = %48
  %60 = load ptr, ptr %6, align 8
  %61 = load ptr, ptr %8, align 8
  %62 = load i64, ptr %10, align 8
  %63 = call i32 @_ZNSt3__111char_traitsIcE7compareB8ne190102EPKcS3_m(ptr noundef %60, ptr noundef %61, i64 noundef %62) #3
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %59
  %66 = load ptr, ptr %6, align 8
  store ptr %66, ptr %5, align 8
  br label %70

67:                                               ; preds = %59
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds i8, ptr %68, i32 1
  store ptr %69, ptr %6, align 8
  br label %36, !llvm.loop !17

70:                                               ; preds = %65, %57, %46, %31, %20
  %71 = load ptr, ptr %5, align 8
  ret ptr %71
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__111char_traitsIcE4findB8ne190102EPKcmRS2_(ptr noundef %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) #8 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %8 = load i64, ptr %6, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  store ptr null, ptr %4, align 8
  br label %18

11:                                               ; preds = %3
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load i8, ptr %13, align 1
  %15 = load i64, ptr %6, align 8
  %16 = invoke ptr @_ZNSt3__118__constexpr_memchrB8ne190102IKccEEPT_S3_T0_m(ptr noundef %12, i8 noundef signext %14, i64 noundef %15)
          to label %17 unwind label %20

17:                                               ; preds = %11
  store ptr %16, ptr %4, align 8
  br label %18

18:                                               ; preds = %17, %10
  %19 = load ptr, ptr %4, align 8
  ret ptr %19

20:                                               ; preds = %11
  %21 = landingpad { ptr, i32 }
          catch ptr null
  %22 = extractvalue { ptr, i32 } %21, 0
  call void @__clang_call_terminate(ptr %22) #17
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__118__constexpr_memchrB8ne190102IKccEEPT_S3_T0_m(ptr noundef %0, i8 noundef signext %1, i64 noundef %2) #8 {
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  %6 = alloca i64, align 8
  %7 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store i8 %1, ptr %5, align 1
  store i64 %2, ptr %6, align 8
  store i8 0, ptr %7, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %7, ptr align 1 %5, i64 1, i1 false)
  %8 = load ptr, ptr %4, align 8
  %9 = load i8, ptr %7, align 1
  %10 = sext i8 %9 to i32
  %11 = load i64, ptr %6, align 8
  %12 = call ptr @memchr(ptr noundef %8, i32 noundef %10, i64 noundef %11) #3
  ret ptr %12
}

; Function Attrs: nounwind
declare ptr @memchr(ptr noundef, i32 noundef, i64 noundef) #2

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZN14LicenseManagerD2Ev(ptr noundef returned %0) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::__1::__map_iterator", align 8
  %6 = alloca %"class.std::__1::__map_iterator", align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  store ptr %8, ptr %2, align 8
  %9 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 0
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = call i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE5beginB8ne190102Ev(ptr noundef %10) #3
  %12 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %5, i32 0, i32 0
  %13 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %12, i32 0, i32 0
  %14 = inttoptr i64 %11 to ptr
  store ptr %14, ptr %13, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = call i64 @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEE3endB8ne190102Ev(ptr noundef %15) #3
  %17 = getelementptr inbounds %"class.std::__1::__map_iterator", ptr %6, i32 0, i32 0
  %18 = getelementptr inbounds %"class.std::__1::__tree_iterator", ptr %17, i32 0, i32 0
  %19 = inttoptr i64 %16 to ptr
  store ptr %19, ptr %18, align 8
  br label %20

20:                                               ; preds = %37, %1
  %21 = invoke zeroext i1 @_ZNSt3__1neB8ne190102ERKNS_14__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEESJ_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6)
          to label %22 unwind label %46

22:                                               ; preds = %20
  br i1 %21, label %23, label %38

23:                                               ; preds = %22
  %24 = invoke noundef nonnull align 8 dereferenceable(32) ptr @_ZNKSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEdeB8ne190102Ev(ptr noundef %5)
          to label %25 unwind label %46

25:                                               ; preds = %23
  store ptr %24, ptr %7, align 8
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %"struct.std::__1::pair", ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = icmp eq ptr %28, null
  br i1 %29, label %34, label %30

30:                                               ; preds = %25
  %31 = load ptr, ptr %28, align 8
  %32 = getelementptr inbounds ptr, ptr %31, i64 1
  %33 = load ptr, ptr %32, align 8
  call void %33(ptr noundef %28) #3
  br label %34

34:                                               ; preds = %30, %25
  br label %35

35:                                               ; preds = %34
  %36 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__map_iteratorINS_15__tree_iteratorINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseEEPNS_11__tree_nodeISB_PvEElEEEppB8ne190102Ev(ptr noundef %5)
          to label %37 unwind label %46

37:                                               ; preds = %35
  br label %20

38:                                               ; preds = %22
  %39 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 2
  %40 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %39) #3
  %41 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 1
  %42 = call ptr @_ZN15SecureContainerINSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEED1Ev(ptr noundef %41) #3
  %43 = getelementptr inbounds %class.LicenseManager, ptr %8, i32 0, i32 0
  %44 = call ptr @_ZNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEP7LicenseNS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEED1B8ne190102Ev(ptr noundef %43) #3
  %45 = load ptr, ptr %2, align 8
  ret ptr %45

46:                                               ; preds = %35, %23, %20
  %47 = landingpad { ptr, i32 }
          catch ptr null
  %48 = extractvalue { ptr, i32 } %47, 0
  call void @__clang_call_terminate(ptr %48) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne190102ILi0EEEPKc(ptr noundef returned %0, ptr noundef %1) unnamed_addr #1 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__default_init_tag", align 1
  %6 = alloca %"struct.std::__1::__default_init_tag", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %"class.std::__1::basic_string", ptr %7, i32 0, i32 0
  %9 = call ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B8ne190102INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef %8, ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef nonnull align 1 dereferenceable(1) %6)
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call i64 @_ZNSt3__111char_traitsIcE6lengthB8ne190102EPKc(ptr noundef %11) #3
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef %7, ptr noundef %10, i64 noundef %12)
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B8ne190102INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B8ne190102INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef %7, ptr noundef nonnull align 1 dereferenceable(1) %8, ptr noundef nonnull align 1 dereferenceable(1) %9)
  ret ptr %7
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__111char_traitsIcE6lengthB8ne190102EPKc(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i64 @_ZNSt3__118__constexpr_strlenB8ne190102IcEEmPKT_(ptr noundef %3) #3
  ret i64 %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B8ne190102INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef returned %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"struct.std::__1::__default_init_tag", align 1
  %8 = alloca %"struct.std::__1::__default_init_tag", align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = call ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B8ne190102ENS_18__default_init_tagE(ptr noundef %9)
  %12 = load ptr, ptr %6, align 8
  %13 = call ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B8ne190102ENS_18__default_init_tagE(ptr noundef %9)
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B8ne190102ENS_18__default_init_tagE(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca %"struct.std::__1::__default_init_tag", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", ptr %4, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B8ne190102ENS_18__default_init_tagE(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca %"struct.std::__1::__default_init_tag", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call ptr @_ZNSt3__19allocatorIcEC2B8ne190102Ev(ptr noundef %4) #3
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__19allocatorIcEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__118__constexpr_strlenB8ne190102IcEEmPKT_(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i64 @strlen(ptr noundef %3) #3
  ret i64 %4
}

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #2

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne190102IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1, i64 noundef %2) #1 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %"class.std::__1::basic_ostream<char>::sentry", align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %11 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = invoke ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef %7, ptr noundef nonnull align 8 dereferenceable(8) %12)
          to label %14 unwind label %68

14:                                               ; preds = %3
  %15 = invoke zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne190102Ev(ptr noundef %7)
          to label %16 unwind label %72

16:                                               ; preds = %14
  br i1 %15, label %17, label %89

17:                                               ; preds = %16
  %18 = load ptr, ptr %4, align 8
  %19 = call ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne190102ERNS_13basic_ostreamIcS2_EE(ptr noundef %11, ptr noundef nonnull align 8 dereferenceable(8) %18) #3
  %20 = load ptr, ptr %5, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr i8, ptr %22, i64 -24
  %24 = load i64, ptr %23, align 8
  %25 = getelementptr inbounds i8, ptr %21, i64 %24
  %26 = invoke i32 @_ZNKSt3__18ios_base5flagsB8ne190102Ev(ptr noundef %25)
          to label %27 unwind label %72

27:                                               ; preds = %17
  %28 = and i32 %26, 176
  %29 = icmp eq i32 %28, 32
  br i1 %29, label %30, label %34

30:                                               ; preds = %27
  %31 = load ptr, ptr %5, align 8
  %32 = load i64, ptr %6, align 8
  %33 = getelementptr inbounds i8, ptr %31, i64 %32
  br label %36

34:                                               ; preds = %27
  %35 = load ptr, ptr %5, align 8
  br label %36

36:                                               ; preds = %34, %30
  %37 = phi ptr [ %33, %30 ], [ %35, %34 ]
  %38 = load ptr, ptr %5, align 8
  %39 = load i64, ptr %6, align 8
  %40 = getelementptr inbounds i8, ptr %38, i64 %39
  %41 = load ptr, ptr %4, align 8
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr i8, ptr %42, i64 -24
  %44 = load i64, ptr %43, align 8
  %45 = getelementptr inbounds i8, ptr %41, i64 %44
  %46 = load ptr, ptr %4, align 8
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr i8, ptr %47, i64 -24
  %49 = load i64, ptr %48, align 8
  %50 = getelementptr inbounds i8, ptr %46, i64 %49
  %51 = invoke signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne190102Ev(ptr noundef %50)
          to label %52 unwind label %72

52:                                               ; preds = %36
  %53 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %11, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = ptrtoint ptr %54 to i64
  %56 = invoke i64 @_ZNSt3__116__pad_and_outputB8ne190102IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %55, ptr noundef %20, ptr noundef %37, ptr noundef %40, ptr noundef nonnull align 8 dereferenceable(136) %45, i8 noundef signext %51)
          to label %57 unwind label %72

57:                                               ; preds = %52
  %58 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %10, i32 0, i32 0
  %59 = inttoptr i64 %56 to ptr
  store ptr %59, ptr %58, align 8
  %60 = call zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne190102Ev(ptr noundef %10) #3
  br i1 %60, label %61, label %88

61:                                               ; preds = %57
  %62 = load ptr, ptr %4, align 8
  %63 = load ptr, ptr %62, align 8
  %64 = getelementptr i8, ptr %63, i64 -24
  %65 = load i64, ptr %64, align 8
  %66 = getelementptr inbounds i8, ptr %62, i64 %65
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne190102Ej(ptr noundef %66, i32 noundef 5)
          to label %67 unwind label %72

67:                                               ; preds = %61
  br label %88

68:                                               ; preds = %3
  %69 = landingpad { ptr, i32 }
          catch ptr null
  %70 = extractvalue { ptr, i32 } %69, 0
  store ptr %70, ptr %8, align 8
  %71 = extractvalue { ptr, i32 } %69, 1
  store i32 %71, ptr %9, align 4
  br label %77

72:                                               ; preds = %61, %52, %36, %17, %14
  %73 = landingpad { ptr, i32 }
          catch ptr null
  %74 = extractvalue { ptr, i32 } %73, 0
  store ptr %74, ptr %8, align 8
  %75 = extractvalue { ptr, i32 } %73, 1
  store i32 %75, ptr %9, align 4
  %76 = call ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef %7) #3
  br label %77

77:                                               ; preds = %72, %68
  %78 = load ptr, ptr %8, align 8
  %79 = call ptr @__cxa_begin_catch(ptr %78) #3
  %80 = load ptr, ptr %4, align 8
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr i8, ptr %81, i64 -24
  %83 = load i64, ptr %82, align 8
  %84 = getelementptr inbounds i8, ptr %80, i64 %83
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef %84)
          to label %85 unwind label %91

85:                                               ; preds = %77
  call void @__cxa_end_catch()
  br label %86

86:                                               ; preds = %85, %89
  %87 = load ptr, ptr %4, align 8
  ret ptr %87

88:                                               ; preds = %67, %57
  br label %89

89:                                               ; preds = %88, %16
  %90 = call ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef %7) #3
  br label %86

91:                                               ; preds = %77
  %92 = landingpad { ptr, i32 }
          cleanup
  %93 = extractvalue { ptr, i32 } %92, 0
  store ptr %93, ptr %8, align 8
  %94 = extractvalue { ptr, i32 } %92, 1
  store i32 %94, ptr %9, align 4
  invoke void @__cxa_end_catch()
          to label %95 unwind label %101

95:                                               ; preds = %91
  br label %96

96:                                               ; preds = %95
  %97 = load ptr, ptr %8, align 8
  %98 = load i32, ptr %9, align 4
  %99 = insertvalue { ptr, i32 } poison, ptr %97, 0
  %100 = insertvalue { ptr, i32 } %99, i32 %98, 1
  resume { ptr, i32 } %100

101:                                              ; preds = %91
  %102 = landingpad { ptr, i32 }
          catch ptr null
  %103 = extractvalue { ptr, i32 } %102, 0
  call void @__clang_call_terminate(ptr %103) #17
  unreachable
}

declare ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef returned, ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ostream<char>::sentry", ptr %3, i32 0, i32 0
  %5 = load i8, ptr %4, align 8
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__116__pad_and_outputB8ne190102IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(136) %4, i8 noundef signext %5) #1 personality ptr @__gxx_personality_v0 {
  %7 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %8 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca %"class.std::__1::basic_string", align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %22 = inttoptr i64 %0 to ptr
  store ptr %22, ptr %21, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store i8 %5, ptr %13, align 1
  %23 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %27

26:                                               ; preds = %6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

27:                                               ; preds = %6
  %28 = load ptr, ptr %11, align 8
  %29 = load ptr, ptr %9, align 8
  %30 = ptrtoint ptr %28 to i64
  %31 = ptrtoint ptr %29 to i64
  %32 = sub i64 %30, %31
  store i64 %32, ptr %14, align 8
  %33 = load ptr, ptr %12, align 8
  %34 = call i64 @_ZNKSt3__18ios_base5widthB8ne190102Ev(ptr noundef %33)
  store i64 %34, ptr %15, align 8
  %35 = load i64, ptr %15, align 8
  %36 = load i64, ptr %14, align 8
  %37 = icmp sgt i64 %35, %36
  br i1 %37, label %38, label %42

38:                                               ; preds = %27
  %39 = load i64, ptr %14, align 8
  %40 = load i64, ptr %15, align 8
  %41 = sub nsw i64 %40, %39
  store i64 %41, ptr %15, align 8
  br label %43

42:                                               ; preds = %27
  store i64 0, ptr %15, align 8
  br label %43

43:                                               ; preds = %42, %38
  %44 = load ptr, ptr %10, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = ptrtoint ptr %44 to i64
  %47 = ptrtoint ptr %45 to i64
  %48 = sub i64 %46, %47
  store i64 %48, ptr %16, align 8
  %49 = load i64, ptr %16, align 8
  %50 = icmp sgt i64 %49, 0
  br i1 %50, label %51, label %62

51:                                               ; preds = %43
  %52 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %53 = load ptr, ptr %52, align 8
  %54 = load ptr, ptr %9, align 8
  %55 = load i64, ptr %16, align 8
  %56 = call i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne190102EPKcl(ptr noundef %53, ptr noundef %54, i64 noundef %55)
  %57 = load i64, ptr %16, align 8
  %58 = icmp ne i64 %56, %57
  br i1 %58, label %59, label %61

59:                                               ; preds = %51
  %60 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  store ptr null, ptr %60, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

61:                                               ; preds = %51
  br label %62

62:                                               ; preds = %61, %43
  %63 = load i64, ptr %15, align 8
  %64 = icmp sgt i64 %63, 0
  br i1 %64, label %65, label %89

65:                                               ; preds = %62
  %66 = load i64, ptr %15, align 8
  %67 = load i8, ptr %13, align 1
  %68 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102Emc(ptr noundef %17, i64 noundef %66, i8 noundef signext %67)
  %69 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %70 = load ptr, ptr %69, align 8
  %71 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne190102Ev(ptr noundef %17) #3
  %72 = load i64, ptr %15, align 8
  %73 = invoke i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne190102EPKcl(ptr noundef %70, ptr noundef %71, i64 noundef %72)
          to label %74 unwind label %79

74:                                               ; preds = %65
  %75 = load i64, ptr %15, align 8
  %76 = icmp ne i64 %73, %75
  br i1 %76, label %77, label %84

77:                                               ; preds = %74
  %78 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  store ptr null, ptr %78, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  store i32 1, ptr %20, align 4
  br label %85

79:                                               ; preds = %65
  %80 = landingpad { ptr, i32 }
          cleanup
  %81 = extractvalue { ptr, i32 } %80, 0
  store ptr %81, ptr %18, align 8
  %82 = extractvalue { ptr, i32 } %80, 1
  store i32 %82, ptr %19, align 4
  %83 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %17) #3
  br label %115

84:                                               ; preds = %74
  store i32 0, ptr %20, align 4
  br label %85

85:                                               ; preds = %84, %77
  %86 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef %17) #3
  %87 = load i32, ptr %20, align 4
  switch i32 %87, label %120 [
    i32 0, label %88
    i32 1, label %111
  ]

88:                                               ; preds = %85
  br label %89

89:                                               ; preds = %88, %62
  %90 = load ptr, ptr %11, align 8
  %91 = load ptr, ptr %10, align 8
  %92 = ptrtoint ptr %90 to i64
  %93 = ptrtoint ptr %91 to i64
  %94 = sub i64 %92, %93
  store i64 %94, ptr %16, align 8
  %95 = load i64, ptr %16, align 8
  %96 = icmp sgt i64 %95, 0
  br i1 %96, label %97, label %108

97:                                               ; preds = %89
  %98 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %99 = load ptr, ptr %98, align 8
  %100 = load ptr, ptr %10, align 8
  %101 = load i64, ptr %16, align 8
  %102 = call i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne190102EPKcl(ptr noundef %99, ptr noundef %100, i64 noundef %101)
  %103 = load i64, ptr %16, align 8
  %104 = icmp ne i64 %102, %103
  br i1 %104, label %105, label %107

105:                                              ; preds = %97
  %106 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  store ptr null, ptr %106, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

107:                                              ; preds = %97
  br label %108

108:                                              ; preds = %107, %89
  %109 = load ptr, ptr %12, align 8
  %110 = call i64 @_ZNSt3__18ios_base5widthB8ne190102El(ptr noundef %109, i64 noundef 0)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

111:                                              ; preds = %108, %105, %85, %59, %26
  %112 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %7, i32 0, i32 0
  %113 = load ptr, ptr %112, align 8
  %114 = ptrtoint ptr %113 to i64
  ret i64 %114

115:                                              ; preds = %79
  %116 = load ptr, ptr %18, align 8
  %117 = load i32, ptr %19, align 4
  %118 = insertvalue { ptr, i32 } poison, ptr %116, 0
  %119 = insertvalue { ptr, i32 } %118, i32 %117, 1
  resume { ptr, i32 } %119

120:                                              ; preds = %85
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne190102ERNS_13basic_ostreamIcS2_EE(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #8 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne190102ERNS_13basic_ostreamIcS2_EE(ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(8) %6) #3
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i32 @_ZNKSt3__18ios_base5flagsB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base", ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  ret i32 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne190102Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %5 = call zeroext i1 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne190102Ev(ptr noundef %4)
  br i1 %5, label %11, label %6

6:                                                ; preds = %1
  %7 = call signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne190102Ec(ptr noundef %3, i8 noundef signext 32)
  %8 = sext i8 %7 to i32
  %9 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %10 = call noundef nonnull align 1 dereferenceable(4) ptr @_ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne190102Ei(ptr noundef %9, i32 noundef %8)
  br label %11

11:                                               ; preds = %6, %1
  %12 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %13 = call i32 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne190102Ev(ptr noundef %12)
  %14 = trunc i32 %13 to i8
  ret i8 %14
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  ret i1 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne190102Ej(ptr noundef %0, i32 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  call void @_ZNSt3__18ios_base8setstateB8ne190102Ej(ptr noundef %5, i32 noundef %6)
  ret void
}

; Function Attrs: nounwind
declare ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef returned) unnamed_addr #2

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef) #5

declare void @__cxa_end_catch()

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__18ios_base5widthB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base", ptr %3, i32 0, i32 3
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne190102EPKcl(ptr noundef %0, ptr noundef %1, i64 noundef %2) #1 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 12
  %12 = load ptr, ptr %11, align 8
  %13 = call i64 %12(ptr noundef %7, ptr noundef %8, i64 noundef %9)
  ret i64 %13
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne190102Emc(ptr noundef returned %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i8, ptr %6, align 1
  %10 = call ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne190102Emc(ptr noundef %7, i64 noundef %8, i8 noundef signext %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__18ios_base5widthB8ne190102El(ptr noundef %0, i64 noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::ios_base", ptr %6, i32 0, i32 3
  %8 = load i64, ptr %7, align 8
  store i64 %8, ptr %5, align 8
  %9 = load i64, ptr %4, align 8
  %10 = getelementptr inbounds %"class.std::__1::ios_base", ptr %6, i32 0, i32 3
  store i64 %9, ptr %10, align 8
  %11 = load i64, ptr %5, align 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne190102Emc(ptr noundef returned %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #1 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  %7 = alloca %"struct.std::__1::__default_init_tag", align 1
  %8 = alloca %"struct.std::__1::__default_init_tag", align 1
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %"class.std::__1::basic_string", ptr %9, i32 0, i32 0
  %11 = call ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B8ne190102INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef %10, ptr noundef nonnull align 1 dereferenceable(1) %7, ptr noundef nonnull align 1 dereferenceable(1) %8)
  %12 = load i64, ptr %5, align 8
  %13 = load i8, ptr %6, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef %9, i64 noundef %12, i8 noundef signext %13)
  ret ptr %9
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef, i64 noundef, i8 noundef signext) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne190102ERNS_13basic_ostreamIcS2_EE(ptr noundef returned %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #8 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %7, i64 %10
  %12 = invoke ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne190102Ev(ptr noundef %11)
          to label %13 unwind label %14

13:                                               ; preds = %2
  store ptr %12, ptr %6, align 8
  ret ptr %5

14:                                               ; preds = %2
  %15 = landingpad { ptr, i32 }
          catch ptr null
  %16 = extractvalue { ptr, i32 } %15, 0
  call void @__clang_call_terminate(ptr %16) #17
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne190102Ev(ptr noundef %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__18ios_base5rdbufB8ne190102Ev(ptr noundef %3)
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNKSt3__18ios_base5rdbufB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base", ptr %3, i32 0, i32 6
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden zeroext i1 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::_SentinelValueFill", ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 1
  %6 = call i32 @_ZNSt3__111char_traitsIcE3eofB8ne190102Ev() #3
  %7 = icmp ne i32 %5, %6
  ret i1 %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne190102Ec(ptr noundef %0, i8 noundef signext %1) #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca %"class.std::__1::locale", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %8 = load ptr, ptr %3, align 8
  call void @_ZNKSt3__18ios_base6getlocEv(ptr dead_on_unwind writable sret(%"class.std::__1::locale") align 8 %5, ptr noundef %8)
  %9 = invoke noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB8ne190102INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %5)
          to label %10 unwind label %15

10:                                               ; preds = %2
  %11 = load i8, ptr %4, align 1
  %12 = invoke signext i8 @_ZNKSt3__15ctypeIcE5widenB8ne190102Ec(ptr noundef %9, i8 noundef signext %11)
          to label %13 unwind label %15

13:                                               ; preds = %10
  %14 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef %5) #3
  ret i8 %12

15:                                               ; preds = %10, %2
  %16 = landingpad { ptr, i32 }
          cleanup
  %17 = extractvalue { ptr, i32 } %16, 0
  store ptr %17, ptr %6, align 8
  %18 = extractvalue { ptr, i32 } %16, 1
  store i32 %18, ptr %7, align 4
  %19 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef %5) #3
  br label %20

20:                                               ; preds = %15
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %7, align 4
  %23 = insertvalue { ptr, i32 } poison, ptr %21, 0
  %24 = insertvalue { ptr, i32 } %23, i32 %22, 1
  resume { ptr, i32 } %24
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(4) ptr @_ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne190102Ei(ptr noundef %0, i32 noundef %1) #8 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds %"struct.std::__1::_SentinelValueFill", ptr %5, i32 0, i32 0
  store i32 %6, ptr %7, align 1
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i32 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne190102Ev(ptr noundef %0) #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::_SentinelValueFill", ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 1
  ret i32 %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden i32 @_ZNSt3__111char_traitsIcE3eofB8ne190102Ev() #8 {
  ret i32 -1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB8ne190102INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %0) #1 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
  ret ptr %4
}

declare void @_ZNKSt3__18ios_base6getlocEv(ptr dead_on_unwind writable sret(%"class.std::__1::locale") align 8, ptr noundef) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden signext i8 @_ZNKSt3__15ctypeIcE5widenB8ne190102Ec(ptr noundef %0, i8 noundef signext %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = load i8, ptr %4, align 1
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 7
  %9 = load ptr, ptr %8, align 8
  %10 = call signext i8 %9(ptr noundef %5, i8 noundef signext %6)
  ret i8 %10
}

; Function Attrs: nounwind
declare ptr @_ZNSt3__16localeD1Ev(ptr noundef returned) unnamed_addr #2

declare ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef, ptr noundef nonnull align 8 dereferenceable(12)) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__18ios_base8setstateB8ne190102Ej(ptr noundef %0, i32 noundef %1) #1 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::ios_base", ptr %5, i32 0, i32 4
  %7 = load i32, ptr %6, align 8
  %8 = load i32, ptr %4, align 4
  %9 = or i32 %7, %8
  call void @_ZNSt3__18ios_base5clearEj(ptr noundef %5, i32 noundef %9)
  ret void
}

declare void @_ZNSt3__18ios_base5clearEj(ptr noundef, i32 noundef) #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt3__19allocatorIcEC1B8ne190102Ev(ptr noundef returned %0) unnamed_addr #8 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__19allocatorIcEC2B8ne190102Ev(ptr noundef %3) #3
  ret ptr %3
}

declare ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_mmRKS4_(ptr noundef returned, ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i64 noundef, ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #5

; Function Attrs: noinline ssp uwtable(sync)
define internal void @_GLOBAL__sub_I_demo_license_200_string_encrypted.cpp() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  call void @__cxx_global_var_init()
  call void @__cxx_global_var_init.1()
  call void @__cxx_global_var_init.2()
  call void @__cxx_global_var_init.3()
  call void @__cxx_global_var_init.4()
  call void @__cxx_global_var_init.5()
  ret void
}

attributes #0 = { noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress noinline optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { nounwind }
attributes #4 = { mustprogress noinline norecurse optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { nobuiltin allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #8 = { mustprogress noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #9 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #10 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #12 = { mustprogress noinline noreturn optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+bti,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #13 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #14 = { builtin allocsize(0) }
attributes #15 = { builtin nounwind }
attributes #16 = { allocsize(0) }
attributes #17 = { noreturn nounwind }
attributes #18 = { noreturn }

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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
