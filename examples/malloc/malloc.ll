; ModuleID = 'malloc.bc'
source_filename = "malloc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.str = type { i32, i32*, i32 }

@.str = private unnamed_addr constant [28 x i8] c"the value of p_str.a is %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"the value of p_str.c is %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%p\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca %struct.str*, align 8
  store i32 0, i32* %1, align 4
  %6 = call noalias i8* @malloc(i64 800) #3
  %7 = bitcast i8* %6 to i32*
  store i32* %7, i32** %4, align 8
  %8 = call noalias i8* @malloc(i64 800) #3
  %9 = bitcast i8* %8 to %struct.str*
  store %struct.str* %9, %struct.str** %5, align 8
  %10 = load %struct.str*, %struct.str** %5, align 8
  %11 = getelementptr inbounds %struct.str, %struct.str* %10, i32 0, i32 0
  store i32 100, i32* %11, align 8
  %12 = load %struct.str*, %struct.str** %5, align 8
  %13 = getelementptr inbounds %struct.str, %struct.str* %12, i32 0, i32 2
  store i32 200, i32* %13, align 8
  %14 = load %struct.str*, %struct.str** %5, align 8
  %15 = icmp ugt %struct.str* %14, inttoptr (i64 16 to %struct.str*)
  br i1 %15, label %16, label %17

16:                                               ; preds = %0
  br label %18

17:                                               ; preds = %0
  br label %18

18:                                               ; preds = %17, %16
  %19 = load %struct.str*, %struct.str** %5, align 8
  %20 = getelementptr inbounds %struct.str, %struct.str* %19, i32 0, i32 0
  %21 = load i32, i32* %20, align 8
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i32 %21)
  %23 = load %struct.str*, %struct.str** %5, align 8
  %24 = getelementptr inbounds %struct.str, %struct.str* %23, i32 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i32 %25)
  %27 = load %struct.str*, %struct.str** %5, align 8
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), %struct.str* %27)
  %29 = load i32*, i32** %4, align 8
  %30 = bitcast i32* %29 to i8*
  call void @free(i8* %30) #3
  %31 = load i32*, i32** %4, align 8
  %32 = bitcast i32* %31 to i8*
  call void @free(i8* %32) #3
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
