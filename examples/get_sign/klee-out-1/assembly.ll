; ModuleID = 'get_sign.ll'
source_filename = "get_sign.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"f\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"g\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"test\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @get_sign(i32 %x) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4
  %cmp1 = icmp slt i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then2, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @add(i32 %a, i32 %b) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %cmp1 = icmp slt i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %b.addr, align 4
  %cmp3 = icmp sgt i32 %2, 0
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then2
  store i32 2, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then2
  store i32 3, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.else, %if.then4, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @compare(i32 %a, i32 %b) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4
  %3 = load i32, i32* %b.addr, align 4
  %cmp1 = icmp eq i32 %2, %3
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 2, i32* %retval, align 4
  br label %return

if.else3:                                         ; preds = %if.else
  store i32 3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @func(i32 %a, i32 %b) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %ret1 = alloca i32, align 4
  %ret2 = alloca i32, align 4
  %ret3 = alloca i32, align 4
  %ret4 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %0 = bitcast i32* %a to i8*
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  %1 = bitcast i32* %b to i8*
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  %2 = bitcast i32* %c to i8*
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  %3 = bitcast i32* %d to i8*
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  %4 = bitcast i32* %e to i8*
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  %5 = bitcast i32* %f to i8*
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  %6 = bitcast i32* %g to i8*
  call void @klee_make_symbolic(i8* %6, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0))
  %7 = load i32, i32* %a, align 4
  %call = call i32 @get_sign(i32 %7)
  store i32 %call, i32* %ret1, align 4
  %8 = load i32, i32* %b, align 4
  %9 = load i32, i32* %c, align 4
  %call1 = call i32 @add(i32 %8, i32 %9)
  store i32 %call1, i32* %ret2, align 4
  %10 = load i32, i32* %d, align 4
  %11 = load i32, i32* %e, align 4
  %call2 = call i32 @compare(i32 %10, i32 %11)
  store i32 %call2, i32* %ret3, align 4
  %12 = load i32, i32* %f, align 4
  %13 = load i32, i32* %g, align 4
  %call3 = call i32 @func(i32 %12, i32 %13)
  store i32 %call3, i32* %ret4, align 4
  %14 = load i32, i32* %a, align 4
  call void (i8*, ...) @klee_print_expr(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i32 %14)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

declare dso_local void @klee_print_expr(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project 22f00f61dd5483a9fdaed3b7592d392c23b3646a)"}
