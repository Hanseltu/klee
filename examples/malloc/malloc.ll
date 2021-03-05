; ModuleID = 'malloc.bc'
source_filename = "malloc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"sym_address\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"aa = %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %6 = bitcast i64* %2 to i8*
  call void @klee_make_symbolic(i8* %6, i64 8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %7 = load i64, i64* %2, align 8
  %8 = add nsw i64 %7, 100
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %3, align 4
  call void @klee_make_malloc_symbolic(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0))
  %10 = call noalias i8* @malloc(i64 800) #3
  %11 = bitcast i8* %10 to i32*
  store i32* %11, i32** %4, align 8
  %12 = load i32*, i32** %4, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 1
  store i32 999, i32* %13, align 4
  %14 = load i32*, i32** %4, align 8
  %15 = getelementptr inbounds i32, i32* %14, i64 1
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %5, align 4
  %17 = load i32, i32* %5, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 %17)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

declare dso_local void @klee_make_malloc_symbolic(i8*) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
