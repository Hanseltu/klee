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
  br label %for.cond1, !llvm.loop !10

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
  %call = call noalias i8* @malloc(i64 %mul) #7
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
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %array.addr, align 8
  %11 = bitcast i32* %10 to i8*
  %12 = load i32*, i32** %temp, align 8
  %13 = bitcast i32* %12 to i8*
  %14 = load i32, i32* %nelem.addr, align 4
  %conv2 = zext i32 %14 to i64
  %mul3 = mul i64 4, %conv2
  %15 = call i8* @memcpy(i8* %11, i8* %13, i64 %mul3)
  %16 = load i32*, i32** %temp, align 8
  %17 = bitcast i32* %16 to i8*
  call void @free(i8* %17) #7
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
  %14 = call i8* @memmove(i8* %8, i8* %11, i64 %mul)
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %i, align 4
  %inc = add i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !13

for.end:                                          ; preds = %if.then, %for.cond
  %16 = load i32, i32* %item.addr, align 4
  %17 = load i32*, i32** %array.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom6 = zext i32 %18 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %17, i64 %idxprom6
  store i32 %16, i32* %arrayidx7, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

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
  %call = call noalias i8* @malloc(i64 %mul) #7
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %temp1, align 8
  %2 = load i32, i32* %nelem.addr, align 4
  %conv1 = zext i32 %2 to i64
  %mul2 = mul i64 4, %conv1
  %call3 = call noalias i8* @malloc(i64 %mul2) #7
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
  %16 = call i8* @memcpy(i8* %13, i8* %15, i64 16)
  %17 = load i32*, i32** %temp2, align 8
  %18 = bitcast i32* %17 to i8*
  %19 = load i32*, i32** %array.addr, align 8
  %20 = bitcast i32* %19 to i8*
  %21 = call i8* @memcpy(i8* %18, i8* %20, i64 16)
  %22 = load i32*, i32** %temp1, align 8
  call void @insertion_sort(i32* %22, i32 4)
  %23 = load i32*, i32** %temp2, align 8
  call void @bubble_sort(i32* %23, i32 4)
  %24 = load i32*, i32** %temp1, align 8
  %arrayidx8 = getelementptr inbounds i32, i32* %24, i64 0
  %25 = load i32, i32* %arrayidx8, align 4
  %26 = load i32*, i32** %temp1, align 8
  %arrayidx9 = getelementptr inbounds i32, i32* %26, i64 1
  %27 = load i32, i32* %arrayidx9, align 4
  %28 = load i32*, i32** %temp1, align 8
  %arrayidx10 = getelementptr inbounds i32, i32* %28, i64 2
  %29 = load i32, i32* %arrayidx10, align 4
  %30 = load i32*, i32** %temp1, align 8
  %arrayidx11 = getelementptr inbounds i32, i32* %30, i64 3
  %31 = load i32, i32* %arrayidx11, align 4
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i32 %25, i32 %27, i32 %29, i32 %31)
  %32 = load i32*, i32** %temp2, align 8
  %arrayidx13 = getelementptr inbounds i32, i32* %32, i64 0
  %33 = load i32, i32* %arrayidx13, align 4
  %34 = load i32*, i32** %temp2, align 8
  %arrayidx14 = getelementptr inbounds i32, i32* %34, i64 1
  %35 = load i32, i32* %arrayidx14, align 4
  %36 = load i32*, i32** %temp2, align 8
  %arrayidx15 = getelementptr inbounds i32, i32* %36, i64 2
  %37 = load i32, i32* %arrayidx15, align 4
  %38 = load i32*, i32** %temp2, align 8
  %arrayidx16 = getelementptr inbounds i32, i32* %38, i64 3
  %39 = load i32, i32* %arrayidx16, align 4
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i32 %33, i32 %35, i32 %37, i32 %39)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %40 = load i32, i32* %i, align 4
  %41 = load i32, i32* %nelem.addr, align 4
  %cmp = icmp ne i32 %40, %41
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %42 = load i32*, i32** %temp1, align 8
  %43 = load i32, i32* %i, align 4
  %idxprom = zext i32 %43 to i64
  %arrayidx19 = getelementptr inbounds i32, i32* %42, i64 %idxprom
  %44 = load i32, i32* %arrayidx19, align 4
  %45 = load i32*, i32** %temp2, align 8
  %46 = load i32, i32* %i, align 4
  %idxprom20 = zext i32 %46 to i64
  %arrayidx21 = getelementptr inbounds i32, i32* %45, i64 %idxprom20
  %47 = load i32, i32* %arrayidx21, align 4
  %cmp22 = icmp eq i32 %44, %47
  br i1 %cmp22, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  br label %if.end

if.else:                                          ; preds = %for.body
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i32 68, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__PRETTY_FUNCTION__.test, i64 0, i64 0)) #8
  unreachable

if.end:                                           ; preds = %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %48 = load i32, i32* %i, align 4
  %inc = add i32 %48, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !14

for.end:                                          ; preds = %for.cond
  %49 = load i32*, i32** %temp1, align 8
  %50 = bitcast i32* %49 to i8*
  call void @free(i8* %50) #7
  %51 = load i32*, i32** %temp2, align 8
  %52 = bitcast i32* %51 to i8*
  call void @free(i8* %52) #7
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
  %1 = call i8* @memcpy(i8* %0, i8* bitcast ([4 x i32]* @__const.main.input to i8*), i64 16)
  %2 = bitcast [4 x i32]* %input to i8*
  call void @klee_make_symbolic(i8* %2, i64 16, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %input, i64 0, i64 0
  call void @test(i32* %arraydecay, i32 4)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #5 !dbg !15 {
entry:
  %destaddr.addr = alloca i8*, align 8
  %srcaddr.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  store i8* %destaddr, i8** %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %destaddr.addr, metadata !25, metadata !DIExpression()), !dbg !26
  store i8* %srcaddr, i8** %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %srcaddr.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !31, metadata !DIExpression()), !dbg !34
  %0 = load i8*, i8** %destaddr.addr, align 8, !dbg !35
  store i8* %0, i8** %dest, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %src, metadata !36, metadata !DIExpression()), !dbg !39
  %1 = load i8*, i8** %srcaddr.addr, align 8, !dbg !40
  store i8* %1, i8** %src, align 8, !dbg !39
  br label %while.cond, !dbg !41

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, i64* %len.addr, align 8, !dbg !42
  %dec = add i64 %2, -1, !dbg !42
  store i64 %dec, i64* %len.addr, align 8, !dbg !42
  %cmp = icmp ugt i64 %2, 0, !dbg !43
  br i1 %cmp, label %while.body, label %while.end, !dbg !41

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %src, align 8, !dbg !44
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !44
  store i8* %incdec.ptr, i8** %src, align 8, !dbg !44
  %4 = load i8, i8* %3, align 1, !dbg !45
  %5 = load i8*, i8** %dest, align 8, !dbg !46
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !46
  store i8* %incdec.ptr1, i8** %dest, align 8, !dbg !46
  store i8 %4, i8* %5, align 1, !dbg !47
  br label %while.cond, !dbg !41, !llvm.loop !48

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %destaddr.addr, align 8, !dbg !49
  ret i8* %6, !dbg !50
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memmove(i8* %dst, i8* %src, i64 %count) #5 !dbg !51 {
entry:
  %retval = alloca i8*, align 8
  %dst.addr = alloca i8*, align 8
  %src.addr = alloca i8*, align 8
  %count.addr = alloca i64, align 8
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8* %src, i8** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i8** %a, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i8*, i8** %dst.addr, align 8, !dbg !61
  store i8* %0, i8** %a, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i8** %b, metadata !62, metadata !DIExpression()), !dbg !63
  %1 = load i8*, i8** %src.addr, align 8, !dbg !64
  store i8* %1, i8** %b, align 8, !dbg !63
  %2 = load i8*, i8** %src.addr, align 8, !dbg !65
  %3 = load i8*, i8** %dst.addr, align 8, !dbg !67
  %cmp = icmp eq i8* %2, %3, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dst.addr, align 8, !dbg !70
  store i8* %4, i8** %retval, align 8, !dbg !71
  br label %return, !dbg !71

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %src.addr, align 8, !dbg !72
  %6 = load i8*, i8** %dst.addr, align 8, !dbg !74
  %cmp1 = icmp ugt i8* %5, %6, !dbg !75
  br i1 %cmp1, label %while.cond, label %if.else, !dbg !76

while.cond:                                       ; preds = %if.end, %while.body
  %7 = load i64, i64* %count.addr, align 8, !dbg !77
  %dec = add i64 %7, -1, !dbg !77
  store i64 %dec, i64* %count.addr, align 8, !dbg !77
  %tobool = icmp ne i64 %7, 0, !dbg !79
  br i1 %tobool, label %while.body, label %if.end13, !dbg !79

while.body:                                       ; preds = %while.cond
  %8 = load i8*, i8** %b, align 8, !dbg !80
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1, !dbg !80
  store i8* %incdec.ptr, i8** %b, align 8, !dbg !80
  %9 = load i8, i8* %8, align 1, !dbg !81
  %10 = load i8*, i8** %a, align 8, !dbg !82
  %incdec.ptr3 = getelementptr inbounds i8, i8* %10, i32 1, !dbg !82
  store i8* %incdec.ptr3, i8** %a, align 8, !dbg !82
  store i8 %9, i8* %10, align 1, !dbg !83
  br label %while.cond, !dbg !79, !llvm.loop !84

if.else:                                          ; preds = %if.end
  %11 = load i64, i64* %count.addr, align 8, !dbg !85
  %sub = sub i64 %11, 1, !dbg !87
  %12 = load i8*, i8** %a, align 8, !dbg !88
  %add.ptr = getelementptr inbounds i8, i8* %12, i64 %sub, !dbg !88
  store i8* %add.ptr, i8** %a, align 8, !dbg !88
  %13 = load i64, i64* %count.addr, align 8, !dbg !89
  %sub4 = sub i64 %13, 1, !dbg !90
  %14 = load i8*, i8** %b, align 8, !dbg !91
  %add.ptr5 = getelementptr inbounds i8, i8* %14, i64 %sub4, !dbg !91
  store i8* %add.ptr5, i8** %b, align 8, !dbg !91
  br label %while.cond6, !dbg !92

while.cond6:                                      ; preds = %while.body9, %if.else
  %15 = load i64, i64* %count.addr, align 8, !dbg !93
  %dec7 = add i64 %15, -1, !dbg !93
  store i64 %dec7, i64* %count.addr, align 8, !dbg !93
  %tobool8 = icmp ne i64 %15, 0, !dbg !92
  br i1 %tobool8, label %while.body9, label %if.end13, !dbg !92

while.body9:                                      ; preds = %while.cond6
  %16 = load i8*, i8** %b, align 8, !dbg !94
  %incdec.ptr10 = getelementptr inbounds i8, i8* %16, i32 -1, !dbg !94
  store i8* %incdec.ptr10, i8** %b, align 8, !dbg !94
  %17 = load i8, i8* %16, align 1, !dbg !95
  %18 = load i8*, i8** %a, align 8, !dbg !96
  %incdec.ptr11 = getelementptr inbounds i8, i8* %18, i32 -1, !dbg !96
  store i8* %incdec.ptr11, i8** %a, align 8, !dbg !96
  store i8 %17, i8* %18, align 1, !dbg !97
  br label %while.cond6, !dbg !92, !llvm.loop !98

if.end13:                                         ; preds = %while.cond6, %while.cond
  %19 = load i8*, i8** %dst.addr, align 8, !dbg !99
  store i8* %19, i8** %retval, align 8, !dbg !100
  br label %return, !dbg !100

return:                                           ; preds = %if.end13, %if.then
  %20 = load i8*, i8** %retval, align 8, !dbg !101
  ret i8* %20, !dbg !101
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone speculatable }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3, !4, !4}
!llvm.dbg.cu = !{!5, !8}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project 22f00f61dd5483a9fdaed3b7592d392c23b3646a)"}
!4 = !{!"clang version 9.0.0 (tags/RELEASE_900/final)"}
!5 = distinct !DICompileUnit(language: DW_LANG_C89, file: !6, producer: "clang version 9.0.0 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, nameTableKind: None)
!6 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memcpy.c", directory: "/media/haoxin/SeagateData/haoxin-data/smu-research/klee/smu-build/runtime/FreeStanding")
!7 = !{}
!8 = distinct !DICompileUnit(language: DW_LANG_C89, file: !9, producer: "clang version 9.0.0 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !7, nameTableKind: None)
!9 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memmove.c", directory: "/media/haoxin/SeagateData/haoxin-data/smu-research/klee/smu-build/runtime/FreeStanding")
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !DISubprogram(name: "memcpy", scope: !16, file: !16, line: 12, type: !17, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !7)
!16 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memcpy.c", directory: "")
!17 = !DISubroutineType(types: !18)
!18 = !{!19, !19, !20, !22}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 46, baseType: !24)
!23 = !DIFile(filename: "dut-research/compilers/llvm-9.0/llvm-src/build/lib/clang/9.0.0/include/stddef.h", directory: "/media/haoxin/SeagateData/haoxin-data")
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocalVariable(name: "destaddr", arg: 1, scope: !15, file: !16, line: 12, type: !19)
!26 = !DILocation(line: 12, column: 20, scope: !15)
!27 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !15, file: !16, line: 12, type: !20)
!28 = !DILocation(line: 12, column: 42, scope: !15)
!29 = !DILocalVariable(name: "len", arg: 3, scope: !15, file: !16, line: 12, type: !22)
!30 = !DILocation(line: 12, column: 58, scope: !15)
!31 = !DILocalVariable(name: "dest", scope: !15, file: !16, line: 13, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !DILocation(line: 13, column: 9, scope: !15)
!35 = !DILocation(line: 13, column: 16, scope: !15)
!36 = !DILocalVariable(name: "src", scope: !15, file: !16, line: 14, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!39 = !DILocation(line: 14, column: 15, scope: !15)
!40 = !DILocation(line: 14, column: 21, scope: !15)
!41 = !DILocation(line: 16, column: 3, scope: !15)
!42 = !DILocation(line: 16, column: 13, scope: !15)
!43 = !DILocation(line: 16, column: 16, scope: !15)
!44 = !DILocation(line: 17, column: 19, scope: !15)
!45 = !DILocation(line: 17, column: 15, scope: !15)
!46 = !DILocation(line: 17, column: 10, scope: !15)
!47 = !DILocation(line: 17, column: 13, scope: !15)
!48 = distinct !{!48, !41, !44}
!49 = !DILocation(line: 18, column: 10, scope: !15)
!50 = !DILocation(line: 18, column: 3, scope: !15)
!51 = distinct !DISubprogram(name: "memmove", scope: !52, file: !52, line: 12, type: !17, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !7)
!52 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memmove.c", directory: "")
!53 = !DILocalVariable(name: "dst", arg: 1, scope: !51, file: !52, line: 12, type: !19)
!54 = !DILocation(line: 12, column: 21, scope: !51)
!55 = !DILocalVariable(name: "src", arg: 2, scope: !51, file: !52, line: 12, type: !20)
!56 = !DILocation(line: 12, column: 38, scope: !51)
!57 = !DILocalVariable(name: "count", arg: 3, scope: !51, file: !52, line: 12, type: !22)
!58 = !DILocation(line: 12, column: 50, scope: !51)
!59 = !DILocalVariable(name: "a", scope: !51, file: !52, line: 13, type: !32)
!60 = !DILocation(line: 13, column: 9, scope: !51)
!61 = !DILocation(line: 13, column: 13, scope: !51)
!62 = !DILocalVariable(name: "b", scope: !51, file: !52, line: 14, type: !37)
!63 = !DILocation(line: 14, column: 15, scope: !51)
!64 = !DILocation(line: 14, column: 19, scope: !51)
!65 = !DILocation(line: 16, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !51, file: !52, line: 16, column: 7)
!67 = !DILocation(line: 16, column: 14, scope: !66)
!68 = !DILocation(line: 16, column: 11, scope: !66)
!69 = !DILocation(line: 16, column: 7, scope: !51)
!70 = !DILocation(line: 17, column: 12, scope: !66)
!71 = !DILocation(line: 17, column: 5, scope: !66)
!72 = !DILocation(line: 19, column: 7, scope: !73)
!73 = distinct !DILexicalBlock(scope: !51, file: !52, line: 19, column: 7)
!74 = !DILocation(line: 19, column: 13, scope: !73)
!75 = !DILocation(line: 19, column: 11, scope: !73)
!76 = !DILocation(line: 19, column: 7, scope: !51)
!77 = !DILocation(line: 20, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !52, line: 19, column: 18)
!79 = !DILocation(line: 20, column: 5, scope: !78)
!80 = !DILocation(line: 21, column: 16, scope: !78)
!81 = !DILocation(line: 21, column: 14, scope: !78)
!82 = !DILocation(line: 21, column: 9, scope: !78)
!83 = !DILocation(line: 21, column: 12, scope: !78)
!84 = distinct !{!84, !79, !80}
!85 = !DILocation(line: 23, column: 10, scope: !86)
!86 = distinct !DILexicalBlock(scope: !73, file: !52, line: 22, column: 10)
!87 = !DILocation(line: 23, column: 16, scope: !86)
!88 = !DILocation(line: 23, column: 7, scope: !86)
!89 = !DILocation(line: 24, column: 10, scope: !86)
!90 = !DILocation(line: 24, column: 16, scope: !86)
!91 = !DILocation(line: 24, column: 7, scope: !86)
!92 = !DILocation(line: 25, column: 5, scope: !86)
!93 = !DILocation(line: 25, column: 17, scope: !86)
!94 = !DILocation(line: 26, column: 16, scope: !86)
!95 = !DILocation(line: 26, column: 14, scope: !86)
!96 = !DILocation(line: 26, column: 9, scope: !86)
!97 = !DILocation(line: 26, column: 12, scope: !86)
!98 = distinct !{!98, !92, !94}
!99 = !DILocation(line: 29, column: 10, scope: !51)
!100 = !DILocation(line: 29, column: 3, scope: !51)
!101 = !DILocation(line: 30, column: 1, scope: !51)
