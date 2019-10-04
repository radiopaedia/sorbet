; ModuleID = 'foobar.c'
source_filename = "foobar.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.RBasic = type { i64, i64 }
%struct.RString = type { %struct.RBasic, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i64, i8*, %union.anon.0 }
%union.anon.0 = type { i64 }
%struct.RArray = type { %struct.RBasic, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { i64, %union.anon.3, i64* }
%union.anon.3 = type { i64 }

@rb_cInteger = external global i64, align 8
@rb_cFloat = external global i64, align 8
@rb_cTrueClass = external global i64, align 8
@rb_cSymbol = external global i64, align 8
@rb_cNilClass = external global i64, align 8
@rb_cFalseClass = external global i64, align 8

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_rubyTrue() #0 {
  ret i64 20
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_rubyFalse() #0 {
  ret i64 0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_rubyNil() #0 {
  ret i64 8
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_rubyValueToLong(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = ashr i64 %3, 1
  ret i64 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_longToRubyValue(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = shl i64 %3, 1
  %5 = or i64 %4, 1
  ret i64 %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal double @sorbet_rubyValueToDouble(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call double @rb_float_value(i64 %3) #3
  ret double %4
}

; Function Attrs: nounwind readonly
declare double @rb_float_value(i64) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_doubleToRubyValue(double) #0 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  %3 = load double, double* %2, align 8
  %4 = call i64 @rb_float_new(double %3)
  ret i64 %4
}

declare i64 @rb_float_new(double) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_plus_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = add nsw i64 %6, %8
  %10 = call i64 @sorbet_longToRubyValue(i64 %9)
  ret i64 %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_minus_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = sub nsw i64 %6, %8
  %10 = call i64 @sorbet_longToRubyValue(i64 %9)
  ret i64 %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_less_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = icmp slt i64 %6, %8
  %10 = zext i1 %9 to i64
  %11 = select i1 %9, i64 20, i64 0
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_greater_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = icmp sgt i64 %6, %8
  %10 = zext i1 %9 to i64
  %11 = select i1 %9, i64 20, i64 0
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_greatereq_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = icmp sge i64 %6, %8
  %10 = zext i1 %9 to i64
  %11 = select i1 %9, i64 20, i64 0
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_lesseq_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = icmp sle i64 %6, %8
  %10 = zext i1 %9 to i64
  %11 = select i1 %9, i64 20, i64 0
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_eq_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = icmp eq i64 %6, %8
  %10 = zext i1 %9 to i64
  %11 = select i1 %9, i64 20, i64 0
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_Integer_neq_Integer(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = call i64 @sorbet_rubyValueToLong(i64 %5)
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @sorbet_rubyValueToLong(i64 %7)
  %9 = icmp ne i64 %6, %8
  %10 = zext i1 %9 to i64
  %11 = select i1 %9, i64 20, i64 0
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @sorbet_rubyStringToCPtr(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = inttoptr i64 %3 to %struct.RBasic*
  %5 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %4, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 8192
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %15, label %9

; <label>:9:                                      ; preds = %1
  %10 = load i64, i64* %2, align 8
  %11 = inttoptr i64 %10 to %struct.RString*
  %12 = getelementptr inbounds %struct.RString, %struct.RString* %11, i32 0, i32 1
  %13 = bitcast %union.anon* %12 to [24 x i8]*
  %14 = getelementptr inbounds [24 x i8], [24 x i8]* %13, i32 0, i32 0
  br label %22

; <label>:15:                                     ; preds = %1
  %16 = load i64, i64* %2, align 8
  %17 = inttoptr i64 %16 to %struct.RString*
  %18 = getelementptr inbounds %struct.RString, %struct.RString* %17, i32 0, i32 1
  %19 = bitcast %union.anon* %18 to %struct.anon*
  %20 = getelementptr inbounds %struct.anon, %struct.anon* %19, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8
  br label %22

; <label>:22:                                     ; preds = %15, %9
  %23 = phi i8* [ %14, %9 ], [ %21, %15 ]
  ret i8* %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_rubyStringLength(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = inttoptr i64 %3 to %struct.RBasic*
  %5 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %4, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 8192
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %16, label %9

; <label>:9:                                      ; preds = %1
  %10 = load i64, i64* %2, align 8
  %11 = inttoptr i64 %10 to %struct.RBasic*
  %12 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %11, i32 0, i32 0
  %13 = load i64, i64* %12, align 8
  %14 = lshr i64 %13, 14
  %15 = and i64 %14, 31
  br label %23

; <label>:16:                                     ; preds = %1
  %17 = load i64, i64* %2, align 8
  %18 = inttoptr i64 %17 to %struct.RString*
  %19 = getelementptr inbounds %struct.RString, %struct.RString* %18, i32 0, i32 1
  %20 = bitcast %union.anon* %19 to %struct.anon*
  %21 = getelementptr inbounds %struct.anon, %struct.anon* %20, i32 0, i32 0
  %22 = load i64, i64* %21, align 8
  br label %23

; <label>:23:                                     ; preds = %16, %9
  %24 = phi i64 [ %15, %9 ], [ %22, %16 ]
  ret i64 %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_CPtrToRubyString(i8*, i64) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = load i64, i64* %4, align 8
  %8 = call i64 @rb_str_new(i8* %6, i64 %7)
  store i64 %8, i64* %5, align 8
  %9 = load i64, i64* %5, align 8
  ret i64 %9
}

declare i64 @rb_str_new(i8*, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_stringPlus(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_str_plus(i64 %5, i64 %6)
  ret i64 %7
}

declare i64 @rb_str_plus(i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_rubyArrayLen(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i64 @rb_array_len(i64 %3)
  ret i64 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @rb_array_len(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = inttoptr i64 %3 to %struct.RBasic*
  %5 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %4, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 8192
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %1
  %10 = load i64, i64* %2, align 8
  %11 = inttoptr i64 %10 to %struct.RBasic*
  %12 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %11, i32 0, i32 0
  %13 = load i64, i64* %12, align 8
  %14 = lshr i64 %13, 15
  %15 = and i64 %14, 3
  br label %23

; <label>:16:                                     ; preds = %1
  %17 = load i64, i64* %2, align 8
  %18 = inttoptr i64 %17 to %struct.RArray*
  %19 = getelementptr inbounds %struct.RArray, %struct.RArray* %18, i32 0, i32 1
  %20 = bitcast %union.anon.1* %19 to %struct.anon.2*
  %21 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %20, i32 0, i32 0
  %22 = load i64, i64* %21, align 8
  br label %23

; <label>:23:                                     ; preds = %16, %9
  %24 = phi i64 [ %15, %9 ], [ %22, %16 ]
  ret i64 %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_newRubyArray() #0 {
  %1 = call i64 @rb_ary_new()
  ret i64 %1
}

declare i64 @rb_ary_new() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_newRubyArrayWithElems(i64, i64*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64*, align 8
  store i64 %0, i64* %3, align 8
  store i64* %1, i64** %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64*, i64** %4, align 8
  %7 = call i64 @rb_ary_new_from_values(i64 %5, i64* %6)
  ret i64 %7
}

declare i64 @rb_ary_new_from_values(i64, i64*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_arrayPush(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_ary_push(i64 %5, i64 %6)
  ret void
}

declare i64 @rb_ary_push(i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_arrayStore(i64, i64, i64) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load i64, i64* %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = load i64, i64* %6, align 8
  call void @rb_ary_store(i64 %7, i64 %8, i64 %9)
  ret void
}

declare void @rb_ary_store(i64, i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_arrayGet(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_ary_entry(i64 %5, i64 %6)
  ret i64 %7
}

declare i64 @rb_ary_entry(i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_newRubyHash() #0 {
  %1 = call i64 @rb_hash_new()
  ret i64 %1
}

declare i64 @rb_hash_new() #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_hashStore(i64, i64, i64) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load i64, i64* %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = load i64, i64* %6, align 8
  %10 = call i64 @rb_hash_aset(i64 %7, i64 %8, i64 %9)
  ret void
}

declare i64 @rb_hash_aset(i64, i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_hashGet(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_hash_aref(i64 %5, i64 %6)
  ret i64 %7
}

declare i64 @rb_hash_aref(i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_IDIntern(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i64 @rb_intern(i8* %3)
  ret i64 %4
}

declare i64 @rb_intern(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_symToID(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i64 @rb_sym2id(i64 %3)
  ret i64 %4
}

declare i64 @rb_sym2id(i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_IDToSym(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i64 @rb_id2sym(i64 %3)
  ret i64 %4
}

declare i64 @rb_id2sym(i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sobet_getRubyClassOf(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i64 @rb_class_of(i64 %3)
  ret i64 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @rb_class_of(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = and i64 %4, 7
  %6 = icmp ne i64 %5, 0
  br i1 %6, label %7, label %33

; <label>:7:                                      ; preds = %1
  %8 = load i64, i64* %3, align 8
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 1
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load i64, i64* @rb_cInteger, align 8
  store i64 %13, i64* %2, align 8
  br label %54

; <label>:14:                                     ; preds = %7
  %15 = load i64, i64* %3, align 8
  %16 = trunc i64 %15 to i32
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 2
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load i64, i64* @rb_cFloat, align 8
  store i64 %20, i64* %2, align 8
  br label %54

; <label>:21:                                     ; preds = %14
  %22 = load i64, i64* %3, align 8
  %23 = icmp eq i64 %22, 20
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %21
  %25 = load i64, i64* @rb_cTrueClass, align 8
  store i64 %25, i64* %2, align 8
  br label %54

; <label>:26:                                     ; preds = %21
  %27 = load i64, i64* %3, align 8
  %28 = and i64 %27, 255
  %29 = icmp eq i64 %28, 12
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %26
  %31 = load i64, i64* @rb_cSymbol, align 8
  store i64 %31, i64* %2, align 8
  br label %54

; <label>:32:                                     ; preds = %26
  br label %49

; <label>:33:                                     ; preds = %1
  %34 = load i64, i64* %3, align 8
  %35 = and i64 %34, -9
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %37, label %48

; <label>:37:                                     ; preds = %33
  %38 = load i64, i64* %3, align 8
  %39 = icmp eq i64 %38, 8
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %37
  %41 = load i64, i64* @rb_cNilClass, align 8
  store i64 %41, i64* %2, align 8
  br label %54

; <label>:42:                                     ; preds = %37
  %43 = load i64, i64* %3, align 8
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %42
  %46 = load i64, i64* @rb_cFalseClass, align 8
  store i64 %46, i64* %2, align 8
  br label %54

; <label>:47:                                     ; preds = %42
  br label %48

; <label>:48:                                     ; preds = %47, %33
  br label %49

; <label>:49:                                     ; preds = %48, %32
  %50 = load i64, i64* %3, align 8
  %51 = inttoptr i64 %50 to %struct.RBasic*
  %52 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %51, i32 0, i32 1
  %53 = load i64, i64* %52, align 8
  store i64 %53, i64* %2, align 8
  br label %54

; <label>:54:                                     ; preds = %49, %45, %40, %30, %24, %19, %12
  %55 = load i64, i64* %2, align 8
  ret i64 %55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @sorbet_getRubyClassName(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i8* @rb_obj_classname(i64 %3)
  ret i8* %4
}

declare i8* @rb_obj_classname(i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsTruthy(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = and i64 %3, -9
  %5 = icmp eq i64 %4, 0
  %6 = xor i1 %5, true
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsTrue(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp eq i64 %3, 20
  ret i1 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsFalse(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp eq i64 %3, 0
  ret i1 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsNil(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp eq i64 %3, 8
  ret i1 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsUndef(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp eq i64 %3, 52
  ret i1 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsSymbol(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = and i64 %3, 255
  %5 = icmp eq i64 %4, 12
  br i1 %5, label %24, label %6

; <label>:6:                                      ; preds = %1
  %7 = load i64, i64* %2, align 8
  %8 = and i64 %7, 7
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %22, label %10

; <label>:10:                                     ; preds = %6
  %11 = load i64, i64* %2, align 8
  %12 = and i64 %11, -9
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %22, label %14

; <label>:14:                                     ; preds = %10
  %15 = load i64, i64* %2, align 8
  %16 = inttoptr i64 %15 to %struct.RBasic*
  %17 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %16, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = and i64 %18, 31
  %20 = trunc i64 %19 to i32
  %21 = icmp eq i32 %20, 20
  br label %22

; <label>:22:                                     ; preds = %14, %10, %6
  %23 = phi i1 [ false, %10 ], [ false, %6 ], [ %21, %14 ]
  br label %24

; <label>:24:                                     ; preds = %22, %1
  %25 = phi i1 [ true, %1 ], [ %23, %22 ]
  ret i1 %25
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsFloat(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = trunc i64 %3 to i32
  %5 = and i32 %4, 3
  %6 = icmp eq i32 %5, 2
  br i1 %6, label %25, label %7

; <label>:7:                                      ; preds = %1
  %8 = load i64, i64* %2, align 8
  %9 = and i64 %8, 7
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %23, label %11

; <label>:11:                                     ; preds = %7
  %12 = load i64, i64* %2, align 8
  %13 = and i64 %12, -9
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %23, label %15

; <label>:15:                                     ; preds = %11
  %16 = load i64, i64* %2, align 8
  %17 = inttoptr i64 %16 to %struct.RBasic*
  %18 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %17, i32 0, i32 0
  %19 = load i64, i64* %18, align 8
  %20 = and i64 %19, 31
  %21 = trunc i64 %20 to i32
  %22 = icmp eq i32 %21, 4
  br label %23

; <label>:23:                                     ; preds = %15, %11, %7
  %24 = phi i1 [ false, %11 ], [ false, %7 ], [ %22, %15 ]
  br label %25

; <label>:25:                                     ; preds = %23, %1
  %26 = phi i1 [ true, %1 ], [ %24, %23 ]
  ret i1 %26
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsHash(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i32 @rb_type(i64 %3)
  %5 = icmp eq i32 %4, 8
  ret i1 %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @rb_type(i64) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = and i64 %4, 7
  %6 = icmp ne i64 %5, 0
  br i1 %6, label %7, label %33

; <label>:7:                                      ; preds = %1
  %8 = load i64, i64* %3, align 8
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 1
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %7
  store i32 21, i32* %2, align 4
  br label %54

; <label>:13:                                     ; preds = %7
  %14 = load i64, i64* %3, align 8
  %15 = trunc i64 %14 to i32
  %16 = and i32 %15, 3
  %17 = icmp eq i32 %16, 2
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %13
  store i32 4, i32* %2, align 4
  br label %54

; <label>:19:                                     ; preds = %13
  %20 = load i64, i64* %3, align 8
  %21 = icmp eq i64 %20, 20
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %19
  store i32 18, i32* %2, align 4
  br label %54

; <label>:23:                                     ; preds = %19
  %24 = load i64, i64* %3, align 8
  %25 = and i64 %24, 255
  %26 = icmp eq i64 %25, 12
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %23
  store i32 20, i32* %2, align 4
  br label %54

; <label>:28:                                     ; preds = %23
  %29 = load i64, i64* %3, align 8
  %30 = icmp eq i64 %29, 52
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %28
  store i32 22, i32* %2, align 4
  br label %54

; <label>:32:                                     ; preds = %28
  br label %47

; <label>:33:                                     ; preds = %1
  %34 = load i64, i64* %3, align 8
  %35 = and i64 %34, -9
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %37, label %46

; <label>:37:                                     ; preds = %33
  %38 = load i64, i64* %3, align 8
  %39 = icmp eq i64 %38, 8
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %37
  store i32 17, i32* %2, align 4
  br label %54

; <label>:41:                                     ; preds = %37
  %42 = load i64, i64* %3, align 8
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %41
  store i32 19, i32* %2, align 4
  br label %54

; <label>:45:                                     ; preds = %41
  br label %46

; <label>:46:                                     ; preds = %45, %33
  br label %47

; <label>:47:                                     ; preds = %46, %32
  %48 = load i64, i64* %3, align 8
  %49 = inttoptr i64 %48 to %struct.RBasic*
  %50 = getelementptr inbounds %struct.RBasic, %struct.RBasic* %49, i32 0, i32 0
  %51 = load i64, i64* %50, align 8
  %52 = and i64 %51, 31
  %53 = trunc i64 %52 to i32
  store i32 %53, i32* %2, align 4
  br label %54

; <label>:54:                                     ; preds = %47, %44, %40, %31, %27, %22, %18, %12
  %55 = load i32, i32* %2, align 4
  ret i32 %55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsArray(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i32 @rb_type(i64 %3)
  %5 = icmp eq i32 %4, 7
  ret i1 %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @sorbet_testIsString(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i32 @rb_type(i64 %3)
  %5 = icmp eq i32 %4, 5
  ret i1 %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_instanceVariableGet(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_ivar_get(i64 %5, i64 %6)
  ret i64 %7
}

declare i64 @rb_ivar_get(i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_instanceVariableSet(i64, i64, i64) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load i64, i64* %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = load i64, i64* %6, align 8
  %10 = call i64 @rb_ivar_set(i64 %7, i64 %8, i64 %9)
  ret i64 %10
}

declare i64 @rb_ivar_set(i64, i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_classVariableGet(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_cvar_get(i64 %5, i64 %6)
  ret i64 %7
}

declare i64 @rb_cvar_get(i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_classVariableSet(i64, i64, i64) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load i64, i64* %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = load i64, i64* %6, align 8
  call void @rb_cvar_set(i64 %7, i64 %8, i64 %9)
  ret void
}

declare void @rb_cvar_set(i64, i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_defineTopLevelConstant(i8*, i64) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = load i64, i64* %4, align 8
  call void @rb_define_global_const(i8* %5, i64 %6)
  ret void
}

declare void @rb_define_global_const(i8*, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_defineNestedCosntant(i64, i8*, i64) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load i64, i64* %4, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = load i64, i64* %6, align 8
  call void @rb_define_const(i64 %7, i8* %8, i64 %9)
  ret void
}

declare void @rb_define_const(i64, i8*, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_getConstant(i64, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_const_get_at(i64 %5, i64 %6)
  ret i64 %7
}

declare i64 @rb_const_get_at(i64, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_defineTopLevelModule(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i64 @rb_define_module(i8* %3)
  ret i64 %4
}

declare i64 @rb_define_module(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_defineNestedModule(i64, i8*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i64, i64* %3, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = call i64 @rb_define_module_under(i64 %5, i8* %6)
  ret i64 %7
}

declare i64 @rb_define_module_under(i64, i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_defineTopLevelClass(i8*, i64) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call i64 @rb_define_class(i8* %5, i64 %6)
  ret i64 %7
}

declare i64 @rb_define_class(i8*, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_defineNestedClass(i64, i8*, i64) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i8* %1, i8** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = load i64, i64* %4, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = load i64, i64* %6, align 8
  %10 = call i64 @rb_define_class_under(i64 %7, i8* %8, i64 %9)
  ret i64 %10
}

declare i64 @rb_define_class_under(i64, i8*, i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_defineMethod(i64, i8*, i64 (...)*, i32) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64 (...)*, align 8
  %8 = alloca i32, align 4
  store i64 %0, i64* %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 (...)* %2, i64 (...)** %7, align 8
  store i32 %3, i32* %8, align 4
  %9 = load i64, i64* %5, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = load i64 (...)*, i64 (...)** %7, align 8
  %12 = load i32, i32* %8, align 4
  call void @rb_define_method(i64 %9, i8* %10, i64 (...)* %11, i32 %12)
  ret void
}

declare void @rb_define_method(i64, i8*, i64 (...)*, i32) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @sorbet_defineMethodSingleton(i64, i8*, i64 (...)*, i32) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64 (...)*, align 8
  %8 = alloca i32, align 4
  store i64 %0, i64* %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 (...)* %2, i64 (...)** %7, align 8
  store i32 %3, i32* %8, align 4
  %9 = load i64, i64* %5, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = load i64 (...)*, i64 (...)** %7, align 8
  %12 = load i32, i32* %8, align 4
  call void @rb_define_singleton_method(i64 %9, i8* %10, i64 (...)* %11, i32 %12)
  ret void
}

declare void @rb_define_singleton_method(i64, i8*, i64 (...)*, i32) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_callSuper(i32, i64*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64*, align 8
  store i32 %0, i32* %3, align 4
  store i64* %1, i64** %4, align 8
  %5 = load i32, i32* %3, align 4
  %6 = load i64*, i64** %4, align 8
  %7 = call i64 @rb_call_super(i32 %5, i64* %6)
  ret i64 %7
}

declare i64 @rb_call_super(i32, i64*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_callBlock(i64) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i64 @rb_yield_splat(i64 %3)
  ret i64 %4
}

declare i64 @rb_yield_splat(i64) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @sorbet_callFunc(i64, i64, i32, i64*) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64*, align 8
  store i64 %0, i64* %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  store i64* %3, i64** %8, align 8
  %9 = load i64, i64* %5, align 8
  %10 = load i64, i64* %6, align 8
  %11 = load i32, i32* %7, align 4
  %12 = load i64*, i64** %8, align 8
  %13 = call i64 @rb_funcallv(i64 %9, i64 %10, i32 %11, i64* %12)
  ret i64 %13
}

declare i64 @rb_funcallv(i64, i64, i32, i64*) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Apple clang version 11.0.0 (clang-1100.0.33.8)"}
