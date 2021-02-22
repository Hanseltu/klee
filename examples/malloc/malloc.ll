; ModuleID = 'malloc.bc'
source_filename = "malloc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"klee_is_symbolic(p1)\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"malloc.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"klee_is_symbolic(p2)\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"klee_is_symbolic(p3)\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"klee_is_symbolic(p4)\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"klee_is_symbolic(p5)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca double*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %11 = bitcast i64* %2 to i8*
  call void @klee_make_symbolic(i8* %11, i64 8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %12 = load i64, i64* %2, align 8
  %13 = icmp sgt i64 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %0
  store i64 999, i64* %3, align 8
  br label %21

15:                                               ; preds = %0
  %16 = load i64, i64* %2, align 8
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store i64 888, i64* %2, align 8
  br label %20

19:                                               ; preds = %15
  store i64 777, i64* %3, align 8
  br label %20

20:                                               ; preds = %19, %18
  br label %21

21:                                               ; preds = %20, %14
  %22 = call noalias i8* @malloc(i64 800) #4
  %23 = bitcast i8* %22 to i32*
  store i32* %23, i32** %4, align 8
  %24 = call noalias i8* @malloc(i64 800) #4
  %25 = bitcast i8* %24 to i64*
  store i64* %25, i64** %5, align 8
  %26 = call noalias i8* @malloc(i64 800) #4
  store i8* %26, i8** %6, align 8
  %27 = call noalias i8* @malloc(i64 800) #4
  %28 = bitcast i8* %27 to double*
  store double* %28, double** %7, align 8
  %29 = call noalias i8* @malloc(i64 800) #4
  %30 = bitcast i8* %29 to i64*
  store i64* %30, i64** %8, align 8
  %31 = load i32*, i32** %4, align 8
  %32 = ptrtoint i32* %31 to i64
  %33 = call i32 @klee_is_symbolic(i64 %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %21
  br label %37

36:                                               ; preds = %21
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 26, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #5
  unreachable

37:                                               ; preds = %35
  %38 = load i64*, i64** %5, align 8
  %39 = ptrtoint i64* %38 to i64
  %40 = call i32 @klee_is_symbolic(i64 %39)
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %37
  br label %44

43:                                               ; preds = %37
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 27, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #5
  unreachable

44:                                               ; preds = %42
  %45 = load i8*, i8** %6, align 8
  %46 = ptrtoint i8* %45 to i64
  %47 = call i32 @klee_is_symbolic(i64 %46)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %44
  br label %51

50:                                               ; preds = %44
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 28, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #5
  unreachable

51:                                               ; preds = %49
  %52 = load double*, double** %7, align 8
  %53 = ptrtoint double* %52 to i64
  %54 = call i32 @klee_is_symbolic(i64 %53)
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %51
  br label %58

57:                                               ; preds = %51
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 29, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #5
  unreachable

58:                                               ; preds = %56
  %59 = load i64*, i64** %8, align 8
  %60 = ptrtoint i64* %59 to i64
  %61 = call i32 @klee_is_symbolic(i64 %60)
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %64

63:                                               ; preds = %58
  br label %65

64:                                               ; preds = %58
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 30, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #5
  unreachable

65:                                               ; preds = %63
  store i32 0, i32* %9, align 4
  store i32 10, i32* %10, align 4
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @klee_is_symbolic(i64) #1

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
