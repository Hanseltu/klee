; ModuleID = 'sort.bc'
source_filename = "sort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"input: [%d, %d, %d, %d]\0A\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"insertion_sort: [%d, %d, %d, %d]\0A\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"bubble_sort   : [%d, %d, %d, %d]\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"temp1[i] == temp2[i]\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"sort.c\00", align 1
@__PRETTY_FUNCTION__.test = private unnamed_addr constant [31 x i8] c"void test(int *, unsigned int)\00", align 1
@__const.main.input = private unnamed_addr constant [4 x i32] [i32 4, i32 3, i32 2, i32 1], align 16
@.str.5 = private unnamed_addr constant [6 x i8] c"input\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bubble_sort(i32* %array, i32 %nelem) #0 {
entry:
  %array.addr = alloca i32*, align 8
  %nelem.addr = alloca i32, align 4
  %done = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %nelem, i32* %nelem.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %entry
  store i32 1, i32* %done, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.cond
  %0 = load i32, i32* %i, align 4
  %add = add i32 %0, 1
  %1 = load i32, i32* %nelem.addr, align 4
  %cmp = icmp ult i32 %add, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond1
  %2 = load i32*, i32** %array.addr, align 8
  %3 = load i32, i32* %i, align 4
  %add2 = add i32 %3, 1
  %idxprom = zext i32 %add2 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32*, i32** %array.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom3 = zext i32 %6 to i64
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 %idxprom3
  %7 = load i32, i32* %arrayidx4, align 4
  %cmp5 = icmp slt i32 %4, %7
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load i32*, i32** %array.addr, align 8
  %9 = load i32, i32* %i, align 4
  %add6 = add i32 %9, 1
  %idxprom7 = zext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 %idxprom7
  %10 = load i32, i32* %arrayidx8, align 4
  store i32 %10, i32* %t, align 4
  %11 = load i32*, i32** %array.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom9 = zext i32 %12 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9
  %13 = load i32, i32* %arrayidx10, align 4
  %14 = load i32*, i32** %array.addr, align 8
  %15 = load i32, i32* %i, align 4
  %add11 = add i32 %15, 1
  %idxprom12 = zext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %14, i64 %idxprom12
  store i32 %13, i32* %arrayidx13, align 4
  %16 = load i32, i32* %t, align 4
  %17 = load i32*, i32** %array.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom14 = zext i32 %18 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %17, i64 %idxprom14
  store i32 %16, i32* %arrayidx15, align 4
  store i32 0, i32* %done, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %19 = load i32, i32* %i, align 4
  %inc = add i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1, !llvm.loop !2

for.end:                                          ; preds = %for.cond1
  br label %for.end16

for.end16:                                        ; preds = %for.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @insertion_sort(i32* %array, i32 %nelem) #0 {
entry:
  %array.addr = alloca i32*, align 8
  %nelem.addr = alloca i32, align 4
  %temp = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %nelem, i32* %nelem.addr, align 4
  %0 = load i32, i32* %nelem.addr, align 4
  %conv = zext i32 %0 to i64
  %mul = mul i64 4, %conv
  %call = call noalias i8* @malloc(i64 %mul) #5
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %temp, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %nelem.addr, align 4
  %cmp = icmp ne i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %temp, align 8
  %5 = load i32, i32* %i, align 4
  %6 = load i32*, i32** %array.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = zext i32 %7 to i64
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom
  %8 = load i32, i32* %arrayidx, align 4
  call void @insert_ordered(i32* %4, i32 %5, i32 %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %array.addr, align 8
  %11 = bitcast i32* %10 to i8*
  %12 = load i32*, i32** %temp, align 8
  %13 = bitcast i32* %12 to i8*
  %14 = load i32, i32* %nelem.addr, align 4
  %conv2 = zext i32 %14 to i64
  %mul3 = mul i64 4, %conv2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 %13, i64 %mul3, i1 false)
  %15 = load i32*, i32** %temp, align 8
  %16 = bitcast i32* %15 to i8*
  call void @free(i8* %16) #5
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @insert_ordered(i32* %array, i32 %nelem, i32 %item) #0 {
entry:
  %array.addr = alloca i32*, align 8
  %nelem.addr = alloca i32, align 4
  %item.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %nelem, i32* %nelem.addr, align 4
  store i32 %item, i32* %item.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %nelem.addr, align 4
  %cmp = icmp ne i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %item.addr, align 4
  %3 = load i32*, i32** %array.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = zext i32 %4 to i64
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom
  %5 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %2, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i32*, i32** %array.addr, align 8
  %7 = load i32, i32* %i, align 4
  %add = add i32 %7, 1
  %idxprom2 = zext i32 %add to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %idxprom2
  %8 = bitcast i32* %arrayidx3 to i8*
  %9 = load i32*, i32** %array.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom4 = zext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %idxprom4
  %11 = bitcast i32* %arrayidx5 to i8*
  %12 = load i32, i32* %nelem.addr, align 4
  %13 = load i32, i32* %i, align 4
  %sub = sub i32 %12, %13
  %conv = zext i32 %sub to i64
  %mul = mul i64 4, %conv
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 4 %11, i64 %mul, i1 false)
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %i, align 4
  %inc = add i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !5

for.end:                                          ; preds = %if.then, %for.cond
  %15 = load i32, i32* %item.addr, align 4
  %16 = load i32*, i32** %array.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom6 = zext i32 %17 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %16, i64 %idxprom6
  store i32 %15, i32* %arrayidx7, align 4
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test(i32* %array, i32 %nelem) #0 {
entry:
  %array.addr = alloca i32*, align 8
  %nelem.addr = alloca i32, align 4
  %temp1 = alloca i32*, align 8
  %temp2 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %nelem, i32* %nelem.addr, align 4
  %0 = load i32, i32* %nelem.addr, align 4
  %conv = zext i32 %0 to i64
  %mul = mul i64 4, %conv
  %call = call noalias i8* @malloc(i64 %mul) #5
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %temp1, align 8
  %2 = load i32, i32* %nelem.addr, align 4
  %conv1 = zext i32 %2 to i64
  %mul2 = mul i64 4, %conv1
  %call3 = call noalias i8* @malloc(i64 %mul2) #5
  %3 = bitcast i8* %call3 to i32*
  store i32* %3, i32** %temp2, align 8
  %4 = load i32*, i32** %array.addr, align 8
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0
  %5 = load i32, i32* %arrayidx, align 4
  %6 = load i32*, i32** %array.addr, align 8
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 1
  %7 = load i32, i32* %arrayidx4, align 4
  %8 = load i32*, i32** %array.addr, align 8
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 2
  %9 = load i32, i32* %arrayidx5, align 4
  %10 = load i32*, i32** %array.addr, align 8
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 3
  %11 = load i32, i32* %arrayidx6, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i32 %5, i32 %7, i32 %9, i32 %11)
  %12 = load i32*, i32** %temp1, align 8
  %13 = bitcast i32* %12 to i8*
  %14 = load i32*, i32** %array.addr, align 8
  %15 = bitcast i32* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 4 %15, i64 16, i1 false)
  %16 = load i32*, i32** %temp2, align 8
  %17 = bitcast i32* %16 to i8*
  %18 = load i32*, i32** %array.addr, align 8
  %19 = bitcast i32* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %17, i8* align 4 %19, i64 16, i1 false)
  %20 = load i32*, i32** %temp1, align 8
  call void @insertion_sort(i32* %20, i32 4)
  %21 = load i32*, i32** %temp2, align 8
  call void @bubble_sort(i32* %21, i32 4)
  %22 = load i32*, i32** %temp1, align 8
  %arrayidx8 = getelementptr inbounds i32, i32* %22, i64 0
  %23 = load i32, i32* %arrayidx8, align 4
  %24 = load i32*, i32** %temp1, align 8
  %arrayidx9 = getelementptr inbounds i32, i32* %24, i64 1
  %25 = load i32, i32* %arrayidx9, align 4
  %26 = load i32*, i32** %temp1, align 8
  %arrayidx10 = getelementptr inbounds i32, i32* %26, i64 2
  %27 = load i32, i32* %arrayidx10, align 4
  %28 = load i32*, i32** %temp1, align 8
  %arrayidx11 = getelementptr inbounds i32, i32* %28, i64 3
  %29 = load i32, i32* %arrayidx11, align 4
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i32 %23, i32 %25, i32 %27, i32 %29)
  %30 = load i32*, i32** %temp2, align 8
  %arrayidx13 = getelementptr inbounds i32, i32* %30, i64 0
  %31 = load i32, i32* %arrayidx13, align 4
  %32 = load i32*, i32** %temp2, align 8
  %arrayidx14 = getelementptr inbounds i32, i32* %32, i64 1
  %33 = load i32, i32* %arrayidx14, align 4
  %34 = load i32*, i32** %temp2, align 8
  %arrayidx15 = getelementptr inbounds i32, i32* %34, i64 2
  %35 = load i32, i32* %arrayidx15, align 4
  %36 = load i32*, i32** %temp2, align 8
  %arrayidx16 = getelementptr inbounds i32, i32* %36, i64 3
  %37 = load i32, i32* %arrayidx16, align 4
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i32 %31, i32 %33, i32 %35, i32 %37)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %38 = load i32, i32* %i, align 4
  %39 = load i32, i32* %nelem.addr, align 4
  %cmp = icmp ne i32 %38, %39
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %40 = load i32*, i32** %temp1, align 8
  %41 = load i32, i32* %i, align 4
  %idxprom = zext i32 %41 to i64
  %arrayidx19 = getelementptr inbounds i32, i32* %40, i64 %idxprom
  %42 = load i32, i32* %arrayidx19, align 4
  %43 = load i32*, i32** %temp2, align 8
  %44 = load i32, i32* %i, align 4
  %idxprom20 = zext i32 %44 to i64
  %arrayidx21 = getelementptr inbounds i32, i32* %43, i64 %idxprom20
  %45 = load i32, i32* %arrayidx21, align 4
  %cmp22 = icmp eq i32 %42, %45
  br i1 %cmp22, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  br label %if.end

if.else:                                          ; preds = %for.body
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i32 68, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__PRETTY_FUNCTION__.test, i64 0, i64 0)) #6
  unreachable

if.end:                                           ; preds = %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %46 = load i32, i32* %i, align 4
  %inc = add i32 %46, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %47 = load i32*, i32** %temp1, align 8
  %48 = bitcast i32* %47 to i8*
  call void @free(i8* %48) #5
  %49 = load i32*, i32** %temp2, align 8
  %50 = bitcast i32* %49 to i8*
  call void @free(i8* %50) #5
  ret void
}

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %input = alloca [4 x i32], align 16
  store i32 0, i32* %retval, align 4
  %0 = bitcast [4 x i32]* %input to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([4 x i32]* @__const.main.input to i8*), i64 16, i1 false)
  %1 = bitcast [4 x i32]* %input to i8*
  call void @klee_make_symbolic(i8* %1, i64 16, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %input, i64 0, i64 0
  call void @test(i32* %arraydecay, i32 4)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project 22f00f61dd5483a9fdaed3b7592d392c23b3646a)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
!4 = distinct !{!4, !3}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
