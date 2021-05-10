; ModuleID = 'malloc.bc'
source_filename = "malloc.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.str = type { i32, i32*, i32 }

@.str = private unnamed_addr constant [5 x i8] c"111\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"222\0A\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"the value of p_str.a is %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"the value of p_str.c is %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%p\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %p1 = alloca i32*, align 8
  %p2 = alloca i32*, align 8
  %p3 = alloca i32*, align 8
  %p_str = alloca %struct.str*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %a, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 999, i32* %b, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 777, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call = call noalias i8* @malloc(i64 800) #3
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %p1, align 8
  %call1 = call noalias i8* @malloc(i64 800) #3
  %2 = bitcast i8* %call1 to i32*
  store i32* %2, i32** %p2, align 8
  %call2 = call noalias i8* @malloc(i64 800) #3
  %3 = bitcast i8* %call2 to i32*
  store i32* %3, i32** %p3, align 8
  %call3 = call noalias i8* @malloc(i64 800) #3
  %4 = bitcast i8* %call3 to %struct.str*
  store %struct.str* %4, %struct.str** %p_str, align 8
  %5 = load %struct.str*, %struct.str** %p_str, align 8
  %a4 = getelementptr inbounds %struct.str, %struct.str* %5, i32 0, i32 0
  store i32 100, i32* %a4, align 8
  %6 = load %struct.str*, %struct.str** %p_str, align 8
  %c = getelementptr inbounds %struct.str, %struct.str* %6, i32 0, i32 2
  store i32 200, i32* %c, align 8
  %7 = load i32*, i32** %p1, align 8
  %cmp5 = icmp ugt i32* %7, inttoptr (i64 16 to i32*)
  br i1 %cmp5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.end
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0))
  br label %if.end10

if.else8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  br label %if.end10

if.end10:                                         ; preds = %if.else8, %if.then6
  %8 = load %struct.str*, %struct.str** %p_str, align 8
  %a11 = getelementptr inbounds %struct.str, %struct.str* %8, i32 0, i32 0
  %9 = load i32, i32* %a11, align 8
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i32 %9)
  %10 = load %struct.str*, %struct.str** %p_str, align 8
  %c13 = getelementptr inbounds %struct.str, %struct.str* %10, i32 0, i32 2
  %11 = load i32, i32* %c13, align 8
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i64 0, i64 0), i32 %11)
  %12 = load %struct.str*, %struct.str** %p_str, align 8
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), %struct.str* %12)
  %13 = load i32*, i32** %p1, align 8
  %14 = bitcast i32* %13 to i8*
  call void @free(i8* %14) #3
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
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final)"}
