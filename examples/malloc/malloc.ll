; ModuleID = 'malloc.bc'
source_filename = "malloc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.str = type { i32, i32*, i32 }

@.str = private unnamed_addr constant [22 x i8] c"please give an input\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"input is %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"the value of p_str.a is %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"the value of p_str.c is %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%p\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 8
  %10 = alloca %struct.str*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %11, 2
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 1) #4
  unreachable

15:                                               ; preds = %2
  %16 = load i8**, i8*** %5, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 1
  %18 = load i8*, i8** %17, align 8
  %19 = ptrtoint i8* %18 to i32
  store i32 %19, i32* %8, align 4
  %20 = load i32, i32* %8, align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 %20)
  %22 = load i32, i32* %6, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %15
  store i32 999, i32* %7, align 4
  br label %26

25:                                               ; preds = %15
  store i32 777, i32* %7, align 4
  br label %26

26:                                               ; preds = %25, %24
  %27 = call noalias i8* @malloc(i64 800) #5
  %28 = bitcast i8* %27 to i32*
  store i32* %28, i32** %9, align 8
  %29 = call noalias i8* @malloc(i64 800) #5
  %30 = bitcast i8* %29 to %struct.str*
  store %struct.str* %30, %struct.str** %10, align 8
  %31 = load %struct.str*, %struct.str** %10, align 8
  %32 = getelementptr inbounds %struct.str, %struct.str* %31, i32 0, i32 0
  store i32 100, i32* %32, align 8
  %33 = load %struct.str*, %struct.str** %10, align 8
  %34 = getelementptr inbounds %struct.str, %struct.str* %33, i32 0, i32 2
  store i32 200, i32* %34, align 8
  %35 = load %struct.str*, %struct.str** %10, align 8
  %36 = icmp ugt %struct.str* %35, inttoptr (i64 16 to %struct.str*)
  br i1 %36, label %37, label %38

37:                                               ; preds = %26
  br label %39

38:                                               ; preds = %26
  br label %39

39:                                               ; preds = %38, %37
  %40 = load %struct.str*, %struct.str** %10, align 8
  %41 = getelementptr inbounds %struct.str, %struct.str* %40, i32 0, i32 0
  %42 = load i32, i32* %41, align 8
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i32 %42)
  %44 = load %struct.str*, %struct.str** %10, align 8
  %45 = getelementptr inbounds %struct.str, %struct.str* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 8
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0), i32 %46)
  %48 = load %struct.str*, %struct.str** %10, align 8
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), %struct.str* %48)
  %50 = load i32*, i32** %9, align 8
  %51 = bitcast i32* %50 to i8*
  call void @free(i8* %51) #5
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
