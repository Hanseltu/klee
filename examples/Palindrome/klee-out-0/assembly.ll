; ModuleID = 'Palindrome.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cgc_prng = type { %struct.cgc_aes_state, [16 x i8], [16 x i8], i8 }
%struct.cgc_aes_state = type { [16 x i8], [16 x i8], [16 x i8] }
%struct.cgc_timeval = type { i32, i32 }
%struct.cgc_fd_set = type { [16 x i64] }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [32 x i8] c"\0AWelcome to Palindrome Finder\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"\09Please enter a possible palindrome: \00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"\09\09Nope, that's not a palindrome\0A\0A\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"\09\09Yes, that's a palindrome!\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"\0A\0AEASTER EGG!\0A\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @cgc_initialize_flag_page, i8* null }]
@cgc_internal_prng = internal global %struct.cgc_prng* null, align 8
@__const.cgc_try_init_prng.prng_seed = private unnamed_addr constant <{ [32 x i8], [16 x i8] }> <{ [32 x i8] c"seedseedseedseed0123456789abcdef", [16 x i8] zeroinitializer }>, align 16
@.str.5 = private unnamed_addr constant [5 x i8] c"seed\00", align 1
@.str.1.6 = private unnamed_addr constant [6 x i8] c"%2hhx\00", align 1
@state = internal global [4 x [4 x i8]]* null, align 8
@Key = internal global i8* null, align 8
@sbox = internal constant [256 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB\E02:\0AI\06$\5C\C2\D3\ACb\91\95\E4y\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8Ap>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16", align 16
@RoundKey = internal global [176 x i8] zeroinitializer, align 16
@Rcon = internal constant [255 x i8] c"\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB", align 16
@rsbox = internal constant [256 x i8] c"R\09j\D506\A58\BF@\A3\9E\81\F3\D7\FB|\E39\82\9B/\FF\874\8ECD\C4\DE\E9\CBT{\942\A6\C2#=\EEL\95\0BB\FA\C3N\08.\A1f(\D9$\B2v[\A2Im\8B\D1%r\F8\F6d\86h\98\16\D4\A4\5C\CC]e\B6\92lpHP\FD\ED\B9\DA^\15FW\A7\8D\9D\84\90\D8\AB\00\8C\BC\D3\0A\F7\E4X\05\B8\B3E\06\D0,\1E\8F\CA?\0F\02\C1\AF\BD\03\01\13\8Ak:\91\11AOg\DC\EA\97\F2\CF\CE\F0\B4\E6s\96\ACt\22\E7\AD5\85\E2\F97\E8\1Cu\DFnG\F1\1Aq\1D)\C5\89o\B7b\0E\AA\18\BE\1B\FCV>K\C6\D2y \9A\DB\C0\FEx\CDZ\F4\1F\DD\A83\88\07\C71\B1\12\10Y'\80\EC_`Q\7F\A9\19\B5J\0D-\E5z\9F\93\C9\9C\EF\A0\E0;M\AE*\F5\B0\C8\EB\BB<\83S\99a\17+\04~\BAw\D6&\E1i\14cU!\0C}", align 16
@Iv = internal global i8* null, align 8
@.str.21 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.22 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.23 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @cgc_transmit_all(i32 %fd, i8* %buf, i64 %size) #0 !dbg !16 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %size.addr = alloca i64, align 8
  %sent = alloca i64, align 8
  %sent_now = alloca i64, align 8
  %ret = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %fd.addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %sent, metadata !34, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %sent, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %sent_now, metadata !36, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %sent_now, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !40
  %tobool = icmp ne i8* %0, null, !dbg !40
  br i1 %tobool, label %if.end, label %if.then, !dbg !42

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !43
  br label %return, !dbg !43

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %size.addr, align 8, !dbg !44
  %tobool1 = icmp ne i64 %1, 0, !dbg !44
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !46

if.then2:                                         ; preds = %if.end
  store i32 2, i32* %retval, align 4, !dbg !47
  br label %return, !dbg !47

if.end3:                                          ; preds = %if.end
  br label %while.cond, !dbg !48

while.cond:                                       ; preds = %if.end9, %if.end3
  %2 = load i64, i64* %sent, align 8, !dbg !49
  %3 = load i64, i64* %size.addr, align 8, !dbg !50
  %cmp = icmp ult i64 %2, %3, !dbg !51
  br i1 %cmp, label %while.body, label %while.end, !dbg !48

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %fd.addr, align 4, !dbg !52
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !54
  %6 = load i64, i64* %sent, align 8, !dbg !55
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !56
  %7 = load i64, i64* %size.addr, align 8, !dbg !57
  %8 = load i64, i64* %sent, align 8, !dbg !58
  %sub = sub i64 %7, %8, !dbg !59
  %call = call i32 @cgc_transmit(i32 %4, i8* %add.ptr, i64 %sub, i64* %sent_now) #11, !dbg !60
  store i32 %call, i32* %ret, align 4, !dbg !61
  %9 = load i64, i64* %sent_now, align 8, !dbg !62
  %cmp4 = icmp eq i64 %9, 0, !dbg !64
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !65

if.then5:                                         ; preds = %while.body
  store i32 3, i32* %retval, align 4, !dbg !66
  br label %return, !dbg !66

if.end6:                                          ; preds = %while.body
  %10 = load i32, i32* %ret, align 4, !dbg !68
  %cmp7 = icmp ne i32 %10, 0, !dbg !70
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !71

if.then8:                                         ; preds = %if.end6
  store i32 3, i32* %retval, align 4, !dbg !72
  br label %return, !dbg !72

if.end9:                                          ; preds = %if.end6
  %11 = load i64, i64* %sent_now, align 8, !dbg !74
  %12 = load i64, i64* %sent, align 8, !dbg !75
  %add = add i64 %12, %11, !dbg !75
  store i64 %add, i64* %sent, align 8, !dbg !75
  br label %while.cond, !dbg !48, !llvm.loop !76

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4, !dbg !78
  br label %return, !dbg !78

return:                                           ; preds = %while.end, %if.then8, %if.then5, %if.then2, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !79
  ret i32 %13, !dbg !79
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @cgc_receive_delim(i32 %fd, i8* %buf, i64 %size, i8 signext %delim) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %size.addr = alloca i64, align 8
  %delim.addr = alloca i8, align 1
  %rx = alloca i64, align 8
  %rx_now = alloca i64, align 8
  %ret = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %fd.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8 %delim, i8* %delim.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %delim.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i64* %rx, metadata !92, metadata !DIExpression()), !dbg !93
  store i64 0, i64* %rx, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i64* %rx_now, metadata !94, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %rx_now, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !98
  %tobool = icmp ne i8* %0, null, !dbg !98
  br i1 %tobool, label %if.end, label %if.then, !dbg !100

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !101
  br label %return, !dbg !101

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %size.addr, align 8, !dbg !102
  %tobool1 = icmp ne i64 %1, 0, !dbg !102
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !104

if.then2:                                         ; preds = %if.end
  store i32 2, i32* %retval, align 4, !dbg !105
  br label %return, !dbg !105

if.end3:                                          ; preds = %if.end
  br label %while.cond, !dbg !106

while.cond:                                       ; preds = %if.end14, %if.end3
  %2 = load i64, i64* %rx, align 8, !dbg !107
  %3 = load i64, i64* %size.addr, align 8, !dbg !108
  %cmp = icmp ult i64 %2, %3, !dbg !109
  br i1 %cmp, label %while.body, label %while.end, !dbg !106

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %fd.addr, align 4, !dbg !110
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !112
  %6 = load i64, i64* %rx, align 8, !dbg !113
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !114
  %call = call i32 @cgc_receive(i32 %4, i8* %add.ptr, i64 1, i64* %rx_now) #11, !dbg !115
  store i32 %call, i32* %ret, align 4, !dbg !116
  %7 = load i64, i64* %rx_now, align 8, !dbg !117
  %cmp4 = icmp eq i64 %7, 0, !dbg !119
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !120

if.then5:                                         ; preds = %while.body
  store i32 3, i32* %retval, align 4, !dbg !121
  br label %return, !dbg !121

if.end6:                                          ; preds = %while.body
  %8 = load i32, i32* %ret, align 4, !dbg !123
  %cmp7 = icmp ne i32 %8, 0, !dbg !125
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !126

if.then8:                                         ; preds = %if.end6
  store i32 3, i32* %retval, align 4, !dbg !127
  br label %return, !dbg !127

if.end9:                                          ; preds = %if.end6
  %9 = load i8*, i8** %buf.addr, align 8, !dbg !129
  %10 = load i64, i64* %rx, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !129
  %11 = load i8, i8* %arrayidx, align 1, !dbg !129
  %conv = sext i8 %11 to i32, !dbg !129
  %12 = load i8, i8* %delim.addr, align 1, !dbg !132
  %conv10 = sext i8 %12 to i32, !dbg !132
  %cmp11 = icmp eq i32 %conv, %conv10, !dbg !133
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !134

if.then13:                                        ; preds = %if.end9
  br label %while.end, !dbg !135

if.end14:                                         ; preds = %if.end9
  %13 = load i64, i64* %rx_now, align 8, !dbg !137
  %14 = load i64, i64* %rx, align 8, !dbg !138
  %add = add i64 %14, %13, !dbg !138
  store i64 %add, i64* %rx, align 8, !dbg !138
  br label %while.cond, !dbg !106, !llvm.loop !139

while.end:                                        ; preds = %if.then13, %while.cond
  store i32 0, i32* %retval, align 4, !dbg !141
  br label %return, !dbg !141

return:                                           ; preds = %while.end, %if.then8, %if.then5, %if.then2, %if.then
  %15 = load i32, i32* %retval, align 4, !dbg !142
  ret i32 %15, !dbg !142
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %cgc_argc, i8** %cgc_argv) #0 !dbg !143 {
entry:
  call void @klee.ctor_stub()
  %retval = alloca i32, align 4
  %cgc_argc.addr = alloca i32, align 4
  %cgc_argv.addr = alloca i8**, align 8
  %r = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %cgc_argc, i32* %cgc_argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cgc_argc.addr, metadata !148, metadata !DIExpression()), !dbg !149
  store i8** %cgc_argv, i8*** %cgc_argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %cgc_argv.addr, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i32* %r, metadata !152, metadata !DIExpression()), !dbg !153
  %call = call i32 @cgc_transmit_all(i32 1, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 31) #11, !dbg !154
  %cmp = icmp ne i32 %call, 0, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @cgc__terminate(i32 0) #12, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  br label %while.body, !dbg !160

while.body:                                       ; preds = %if.end, %if.end20
  %call1 = call i32 @cgc_transmit_all(i32 1, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i64 0, i64 0), i64 37) #11, !dbg !161
  %cmp2 = icmp ne i32 %call1, 0, !dbg !164
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !165

if.then3:                                         ; preds = %while.body
  call void @cgc__terminate(i32 0) #12, !dbg !166
  unreachable, !dbg !166

if.end4:                                          ; preds = %while.body
  %call5 = call i32 @cgc_check() #11, !dbg !168
  store i32 %call5, i32* %r, align 4, !dbg !169
  %0 = load i32, i32* %r, align 4, !dbg !170
  %cmp6 = icmp eq i32 %0, -1, !dbg !172
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !173

if.then7:                                         ; preds = %if.end4
  br label %while.end, !dbg !174

if.else:                                          ; preds = %if.end4
  %1 = load i32, i32* %r, align 4, !dbg !176
  %cmp8 = icmp eq i32 %1, 0, !dbg !178
  br i1 %cmp8, label %if.then9, label %if.else14, !dbg !179

if.then9:                                         ; preds = %if.else
  %call10 = call i32 @cgc_transmit_all(i32 1, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i64 0, i64 0), i64 33) #11, !dbg !180
  %cmp11 = icmp ne i32 %call10, 0, !dbg !183
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !184

if.then12:                                        ; preds = %if.then9
  call void @cgc__terminate(i32 0) #12, !dbg !185
  unreachable, !dbg !185

if.end13:                                         ; preds = %if.then9
  br label %if.end19, !dbg !187

if.else14:                                        ; preds = %if.else
  %call15 = call i32 @cgc_transmit_all(i32 1, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0), i64 29) #11, !dbg !188
  %cmp16 = icmp ne i32 %call15, 0, !dbg !191
  br i1 %cmp16, label %if.then17, label %if.end18, !dbg !192

if.then17:                                        ; preds = %if.else14
  call void @cgc__terminate(i32 0) #12, !dbg !193
  unreachable, !dbg !193

if.end18:                                         ; preds = %if.else14
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end13
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  br label %while.body, !dbg !160, !llvm.loop !195

while.end:                                        ; preds = %if.then7
  ret i32 0, !dbg !197
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @cgc_check() #0 !dbg !198 {
entry:
  %retval = alloca i32, align 4
  %len = alloca i32, align 4
  %i = alloca i32, align 4
  %pal = alloca i32, align 4
  %string = alloca [64 x i8], align 16
  %steps = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %len, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 -1, i32* %len, align 4, !dbg !202
  call void @llvm.dbg.declare(metadata i32* %i, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i32* %pal, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 1, i32* %pal, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata [64 x i8]* %string, metadata !207, metadata !DIExpression()), !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !215
  %conv = sext i32 %0 to i64, !dbg !215
  %cmp = icmp ult i64 %conv, 64, !dbg !217
  br i1 %cmp, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !219
  %idxprom = sext i32 %1 to i64, !dbg !220
  %arrayidx = getelementptr inbounds [64 x i8], [64 x i8]* %string, i64 0, i64 %idxprom, !dbg !220
  store i8 0, i8* %arrayidx, align 1, !dbg !221
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !222
  %inc = add nsw i32 %2, 1, !dbg !222
  store i32 %inc, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %string, i64 0, i64 0, !dbg !226
  %call = call i32 @cgc_receive_delim(i32 0, i8* %arraydecay, i64 128, i8 signext 10) #11, !dbg !228
  %cmp2 = icmp ne i32 %call, 0, !dbg !229
  br i1 %cmp2, label %if.then, label %if.end, !dbg !230

if.then:                                          ; preds = %for.end
  store i32 -1, i32* %retval, align 4, !dbg !231
  br label %return, !dbg !231

if.end:                                           ; preds = %for.end
  store i32 0, i32* %i, align 4, !dbg !232
  br label %for.cond4, !dbg !234

for.cond4:                                        ; preds = %for.inc12, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !235
  %idxprom5 = sext i32 %3 to i64, !dbg !237
  %arrayidx6 = getelementptr inbounds [64 x i8], [64 x i8]* %string, i64 0, i64 %idxprom5, !dbg !237
  %4 = load i8, i8* %arrayidx6, align 1, !dbg !237
  %conv7 = sext i8 %4 to i32, !dbg !237
  %cmp8 = icmp ne i32 %conv7, 0, !dbg !238
  br i1 %cmp8, label %for.body10, label %for.end14, !dbg !239

for.body10:                                       ; preds = %for.cond4
  %5 = load i32, i32* %len, align 4, !dbg !240
  %inc11 = add nsw i32 %5, 1, !dbg !240
  store i32 %inc11, i32* %len, align 4, !dbg !240
  br label %for.inc12, !dbg !242

for.inc12:                                        ; preds = %for.body10
  %6 = load i32, i32* %i, align 4, !dbg !243
  %inc13 = add nsw i32 %6, 1, !dbg !243
  store i32 %inc13, i32* %i, align 4, !dbg !243
  br label %for.cond4, !dbg !244, !llvm.loop !245

for.end14:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %steps, metadata !247, metadata !DIExpression()), !dbg !248
  %7 = load i32, i32* %len, align 4, !dbg !249
  store i32 %7, i32* %steps, align 4, !dbg !248
  %8 = load i32, i32* %len, align 4, !dbg !250
  %rem = srem i32 %8, 2, !dbg !252
  %cmp15 = icmp eq i32 %rem, 1, !dbg !253
  br i1 %cmp15, label %if.then17, label %if.end18, !dbg !254

if.then17:                                        ; preds = %for.end14
  %9 = load i32, i32* %steps, align 4, !dbg !255
  %dec = add nsw i32 %9, -1, !dbg !255
  store i32 %dec, i32* %steps, align 4, !dbg !255
  br label %if.end18, !dbg !257

if.end18:                                         ; preds = %if.then17, %for.end14
  store i32 0, i32* %i, align 4, !dbg !258
  br label %for.cond19, !dbg !260

for.cond19:                                       ; preds = %for.inc34, %if.end18
  %10 = load i32, i32* %i, align 4, !dbg !261
  %11 = load i32, i32* %steps, align 4, !dbg !263
  %div = sdiv i32 %11, 2, !dbg !264
  %cmp20 = icmp sle i32 %10, %div, !dbg !265
  br i1 %cmp20, label %for.body22, label %for.end36, !dbg !266

for.body22:                                       ; preds = %for.cond19
  %12 = load i32, i32* %i, align 4, !dbg !267
  %idxprom23 = sext i32 %12 to i64, !dbg !270
  %arrayidx24 = getelementptr inbounds [64 x i8], [64 x i8]* %string, i64 0, i64 %idxprom23, !dbg !270
  %13 = load i8, i8* %arrayidx24, align 1, !dbg !270
  %conv25 = sext i8 %13 to i32, !dbg !270
  %14 = load i32, i32* %len, align 4, !dbg !271
  %sub = sub nsw i32 %14, 1, !dbg !272
  %15 = load i32, i32* %i, align 4, !dbg !273
  %sub26 = sub nsw i32 %sub, %15, !dbg !274
  %idxprom27 = sext i32 %sub26 to i64, !dbg !275
  %arrayidx28 = getelementptr inbounds [64 x i8], [64 x i8]* %string, i64 0, i64 %idxprom27, !dbg !275
  %16 = load i8, i8* %arrayidx28, align 1, !dbg !275
  %conv29 = sext i8 %16 to i32, !dbg !275
  %cmp30 = icmp ne i32 %conv25, %conv29, !dbg !276
  br i1 %cmp30, label %if.then32, label %if.end33, !dbg !277

if.then32:                                        ; preds = %for.body22
  store i32 0, i32* %pal, align 4, !dbg !278
  br label %if.end33, !dbg !280

if.end33:                                         ; preds = %if.then32, %for.body22
  br label %for.inc34, !dbg !281

for.inc34:                                        ; preds = %if.end33
  %17 = load i32, i32* %i, align 4, !dbg !282
  %inc35 = add nsw i32 %17, 1, !dbg !282
  store i32 %inc35, i32* %i, align 4, !dbg !282
  br label %for.cond19, !dbg !283, !llvm.loop !284

for.end36:                                        ; preds = %for.cond19
  %arrayidx37 = getelementptr inbounds [64 x i8], [64 x i8]* %string, i64 0, i64 0, !dbg !286
  %18 = load i8, i8* %arrayidx37, align 16, !dbg !286
  %conv38 = sext i8 %18 to i32, !dbg !286
  %cmp39 = icmp eq i32 %conv38, 94, !dbg !288
  br i1 %cmp39, label %if.then41, label %if.end47, !dbg !289

if.then41:                                        ; preds = %for.end36
  %call42 = call i32 @cgc_transmit_all(i32 1, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i64 15) #11, !dbg !290
  %cmp43 = icmp ne i32 %call42, 0, !dbg !293
  br i1 %cmp43, label %if.then45, label %if.end46, !dbg !294

if.then45:                                        ; preds = %if.then41
  call void @cgc__terminate(i32 0) #12, !dbg !295
  unreachable, !dbg !295

if.end46:                                         ; preds = %if.then41
  br label %if.end47, !dbg !297

if.end47:                                         ; preds = %if.end46, %for.end36
  %19 = load i32, i32* %pal, align 4, !dbg !298
  store i32 %19, i32* %retval, align 4, !dbg !299
  br label %return, !dbg !299

return:                                           ; preds = %if.end47, %if.then
  %20 = load i32, i32* %retval, align 4, !dbg !300
  ret i32 %20, !dbg !300
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @cgc_initialize_flag_page() #0 {
entry:
  %mmap_addr = alloca i8*, align 8
  %call = call noalias i8* @malloc(i64 4096) #13
  store i8* %call, i8** %mmap_addr, align 8
  call void @cgc_try_init_prng() #11
  %0 = load %struct.cgc_prng*, %struct.cgc_prng** @cgc_internal_prng, align 8
  %1 = load i8*, i8** %mmap_addr, align 8
  call void @cgc_aes_get_bytes(%struct.cgc_prng* %0, i32 4096, i8* %1) #11
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @cgc_try_init_prng() #0 {
entry:
  %prng_seed = alloca [48 x i8], align 16
  %prng_seed_hex = alloca i8*, align 8
  %pos = alloca i8*, align 8
  %i = alloca i32, align 4
  %seed = alloca %struct.cgc_aes_state*, align 8
  %0 = load %struct.cgc_prng*, %struct.cgc_prng** @cgc_internal_prng, align 8
  %cmp = icmp ne %struct.cgc_prng* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = bitcast [48 x i8]* %prng_seed to i8*
  %2 = call i8* @memcpy(i8* %1, i8* getelementptr inbounds (<{ [32 x i8], [16 x i8] }>, <{ [32 x i8], [16 x i8] }>* @__const.cgc_try_init_prng.prng_seed, i32 0, i32 0, i32 0), i64 48)
  %call = call i8* @getenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0)) #13
  store i8* %call, i8** %prng_seed_hex, align 8
  %3 = load i8*, i8** %prng_seed_hex, align 8
  %cmp1 = icmp ne i8* %3, null
  br i1 %cmp1, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %if.end
  %4 = load i8*, i8** %prng_seed_hex, align 8
  %call2 = call i64 @strlen(i8* %4) #14
  %cmp3 = icmp eq i64 %call2, 96
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %land.lhs.true
  %5 = load i8*, i8** %prng_seed_hex, align 8
  store i8* %5, i8** %pos, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then4
  %6 = load i32, i32* %i, align 4
  %cmp5 = icmp slt i32 %6, 48
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %pos, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [48 x i8], [48 x i8]* %prng_seed, i64 0, i64 %idxprom
  %call6 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %7, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1.6, i64 0, i64 0), i8* %arrayidx) #13
  %9 = load i8*, i8** %pos, align 8
  %add.ptr = getelementptr inbounds i8, i8* %9, i64 2
  store i8* %add.ptr, i8** %pos, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end7

if.end7:                                          ; preds = %for.end, %land.lhs.true, %if.end
  %call8 = call noalias i8* @malloc(i64 81) #13
  %11 = bitcast i8* %call8 to %struct.cgc_prng*
  store %struct.cgc_prng* %11, %struct.cgc_prng** @cgc_internal_prng, align 8
  %arraydecay = getelementptr inbounds [48 x i8], [48 x i8]* %prng_seed, i64 0, i64 0
  %12 = bitcast i8* %arraydecay to %struct.cgc_aes_state*
  store %struct.cgc_aes_state* %12, %struct.cgc_aes_state** %seed, align 8
  %13 = load %struct.cgc_prng*, %struct.cgc_prng** @cgc_internal_prng, align 8
  %14 = load %struct.cgc_aes_state*, %struct.cgc_aes_state** %seed, align 8
  call void @cgc_init_prng(%struct.cgc_prng* %13, %struct.cgc_aes_state* %14) #11
  br label %return

return:                                           ; preds = %if.end7, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define void @cgc_aes_get_bytes(%struct.cgc_prng* %prng, i32 %len, i8* %buf) #0 {
entry:
  %prng.addr = alloca %struct.cgc_prng*, align 8
  %len.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %buf_idx = alloca i32, align 4
  store %struct.cgc_prng* %prng, %struct.cgc_prng** %prng.addr, align 8
  store i32 %len, i32* %len.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i32 0, i32* %buf_idx, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32, i32* %buf_idx, align 4
  %1 = load i32, i32* %len.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end15

while.body:                                       ; preds = %while.cond
  %2 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_idx = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %2, i32 0, i32 3
  %3 = load i8, i8* %random_idx, align 1
  %conv = zext i8 %3 to i32
  %cmp1 = icmp sge i32 %conv, 16
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %4 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  call void @cgc_gen_block(%struct.cgc_prng* %4) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond3

while.cond3:                                      ; preds = %while.body10, %if.end
  %5 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_idx4 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %5, i32 0, i32 3
  %6 = load i8, i8* %random_idx4, align 1
  %conv5 = zext i8 %6 to i32
  %cmp6 = icmp slt i32 %conv5, 16
  br i1 %cmp6, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond3
  %7 = load i32, i32* %buf_idx, align 4
  %8 = load i32, i32* %len.addr, align 4
  %cmp8 = icmp ult i32 %7, %8
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %9 = phi i1 [ false, %while.cond3 ], [ %cmp8, %land.rhs ]
  br i1 %9, label %while.body10, label %while.end

while.body10:                                     ; preds = %land.end
  %10 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_data = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %10, i32 0, i32 2
  %11 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_idx11 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %11, i32 0, i32 3
  %12 = load i8, i8* %random_idx11, align 1
  %inc = add i8 %12, 1
  store i8 %inc, i8* %random_idx11, align 1
  %idxprom = zext i8 %12 to i64
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %random_data, i64 0, i64 %idxprom
  %13 = load i8, i8* %arrayidx, align 1
  %14 = load i8*, i8** %buf.addr, align 8
  %15 = load i32, i32* %buf_idx, align 4
  %inc12 = add i32 %15, 1
  store i32 %inc12, i32* %buf_idx, align 4
  %idxprom13 = zext i32 %15 to i64
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i64 %idxprom13
  store i8 %13, i8* %arrayidx14, align 1
  br label %while.cond3

while.end:                                        ; preds = %land.end
  br label %while.cond

while.end15:                                      ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define void @cgc_gen_block(%struct.cgc_prng* %prng) #0 {
entry:
  %prng.addr = alloca %struct.cgc_prng*, align 8
  %tmp = alloca [16 x i8], align 16
  %i = alloca i8, align 1
  store %struct.cgc_prng* %prng, %struct.cgc_prng** %prng.addr, align 8
  %0 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %0, i32 0, i32 0
  %datetime = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state, i32 0, i32 2
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %datetime, i64 0, i64 0
  %1 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state1 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %1, i32 0, i32 0
  %key = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state1, i32 0, i32 1
  %arraydecay2 = getelementptr inbounds [16 x i8], [16 x i8]* %key, i64 0, i64 0
  %2 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %intermediate = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %2, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %intermediate, i64 0, i64 0
  call void @AES128_ECB_encrypt(i8* %arraydecay, i8* %arraydecay2, i8* %arraydecay3) #11
  %3 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %intermediate4 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %3, i32 0, i32 1
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %intermediate4, i64 0, i64 0
  %4 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state6 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %4, i32 0, i32 0
  %vec = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state6, i32 0, i32 0
  %arraydecay7 = getelementptr inbounds [16 x i8], [16 x i8]* %vec, i64 0, i64 0
  %arraydecay8 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp, i64 0, i64 0
  call void @cgc_xor(i8* %arraydecay5, i8* %arraydecay7, i8* %arraydecay8) #11
  %arraydecay9 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp, i64 0, i64 0
  %5 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state10 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %5, i32 0, i32 0
  %key11 = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state10, i32 0, i32 1
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %key11, i64 0, i64 0
  %6 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_data = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %6, i32 0, i32 2
  %arraydecay13 = getelementptr inbounds [16 x i8], [16 x i8]* %random_data, i64 0, i64 0
  call void @AES128_ECB_encrypt(i8* %arraydecay9, i8* %arraydecay12, i8* %arraydecay13) #11
  %7 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_idx = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %7, i32 0, i32 3
  store i8 0, i8* %random_idx, align 1
  %8 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %intermediate14 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %8, i32 0, i32 1
  %arraydecay15 = getelementptr inbounds [16 x i8], [16 x i8]* %intermediate14, i64 0, i64 0
  %9 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_data16 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %9, i32 0, i32 2
  %arraydecay17 = getelementptr inbounds [16 x i8], [16 x i8]* %random_data16, i64 0, i64 0
  %arraydecay18 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp, i64 0, i64 0
  call void @cgc_xor(i8* %arraydecay15, i8* %arraydecay17, i8* %arraydecay18) #11
  %arraydecay19 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp, i64 0, i64 0
  %10 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state20 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %10, i32 0, i32 0
  %key21 = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state20, i32 0, i32 1
  %arraydecay22 = getelementptr inbounds [16 x i8], [16 x i8]* %key21, i64 0, i64 0
  %11 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state23 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %11, i32 0, i32 0
  %vec24 = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state23, i32 0, i32 0
  %arraydecay25 = getelementptr inbounds [16 x i8], [16 x i8]* %vec24, i64 0, i64 0
  call void @AES128_ECB_encrypt(i8* %arraydecay19, i8* %arraydecay22, i8* %arraydecay25) #11
  store i8 15, i8* %i, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %12 = load i8, i8* %i, align 1
  %conv = zext i8 %12 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %13 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state27 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %13, i32 0, i32 0
  %datetime28 = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state27, i32 0, i32 2
  %14 = load i8, i8* %i, align 1
  %idxprom = zext i8 %14 to i64
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %datetime28, i64 0, i64 %idxprom
  %15 = load i8, i8* %arrayidx, align 1
  %inc = add i8 %15, 1
  store i8 %inc, i8* %arrayidx, align 1
  %16 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state29 = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %16, i32 0, i32 0
  %datetime30 = getelementptr inbounds %struct.cgc_aes_state, %struct.cgc_aes_state* %state29, i32 0, i32 2
  %17 = load i8, i8* %i, align 1
  %idxprom31 = zext i8 %17 to i64
  %arrayidx32 = getelementptr inbounds [16 x i8], [16 x i8]* %datetime30, i64 0, i64 %idxprom31
  %18 = load i8, i8* %arrayidx32, align 1
  %conv33 = zext i8 %18 to i32
  %cmp34 = icmp ne i32 %conv33, 0
  br i1 %cmp34, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %19 = load i8, i8* %i, align 1
  %conv36 = zext i8 %19 to i32
  %sub = sub nsw i32 %conv36, 1
  %conv37 = trunc i32 %sub to i8
  store i8 %conv37, i8* %i, align 1
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define void @cgc_xor(i8* %a, i8* %b, i8* %buf) #0 {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %buf.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %a.addr, align 8
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %3 to i32
  %4 = load i8*, i8** %b.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %idxprom1
  %6 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %6 to i32
  %xor = xor i32 %conv, %conv3
  %conv4 = trunc i32 %xor to i8
  %7 = load i8*, i8** %buf.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %idxprom5
  store i8 %conv4, i8* %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @getenv(i8*) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define void @cgc_init_prng(%struct.cgc_prng* %prng, %struct.cgc_aes_state* %seed) #0 {
entry:
  %prng.addr = alloca %struct.cgc_prng*, align 8
  %seed.addr = alloca %struct.cgc_aes_state*, align 8
  store %struct.cgc_prng* %prng, %struct.cgc_prng** %prng.addr, align 8
  store %struct.cgc_aes_state* %seed, %struct.cgc_aes_state** %seed.addr, align 8
  %0 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %1 = bitcast %struct.cgc_prng* %0 to i8*
  %call = call i8* @memset(i8* %1, i32 0, i64 81) #13
  %2 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %state = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %2, i32 0, i32 0
  %3 = bitcast %struct.cgc_aes_state* %state to i8*
  %4 = load %struct.cgc_aes_state*, %struct.cgc_aes_state** %seed.addr, align 8
  %5 = bitcast %struct.cgc_aes_state* %4 to i8*
  %call1 = call i8* @memcpy(i8* %3, i8* %5, i64 48) #13
  %6 = load %struct.cgc_prng*, %struct.cgc_prng** %prng.addr, align 8
  %random_idx = getelementptr inbounds %struct.cgc_prng, %struct.cgc_prng* %6, i32 0, i32 3
  store i8 16, i8* %random_idx, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @cgc_check_timeout(%struct.cgc_timeval* %timeout) #0 {
entry:
  %retval = alloca i32, align 4
  %timeout.addr = alloca %struct.cgc_timeval*, align 8
  store %struct.cgc_timeval* %timeout, %struct.cgc_timeval** %timeout.addr, align 8
  %0 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %tobool = icmp ne %struct.cgc_timeval* %0, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %1 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %tv_sec = getelementptr inbounds %struct.cgc_timeval, %struct.cgc_timeval* %1, i32 0, i32 0
  %2 = load i32, i32* %tv_sec, align 4
  %cmp = icmp sgt i32 0, %2
  br i1 %cmp, label %if.then2, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %3 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %tv_usec = getelementptr inbounds %struct.cgc_timeval, %struct.cgc_timeval* %3, i32 0, i32 1
  %4 = load i32, i32* %tv_usec, align 4
  %cmp1 = icmp sgt i32 0, %4
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %lor.lhs.false, %if.else
  store i32 3, i32* %retval, align 4
  br label %return

if.else3:                                         ; preds = %lor.lhs.false
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define void @cgc__terminate(i32 %status) #5 {
entry:
  %status.addr = alloca i32, align 4
  store i32 %status, i32* %status.addr, align 4
  %0 = load i32, i32* %status.addr, align 4
  call void @exit(i32 %0) #15
  unreachable
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

; Function Attrs: noinline nounwind optnone uwtable
define i32 @cgc_transmit(i32 %fd, i8* %buf, i64 %count, i64* %tx_bytes) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %count.addr = alloca i64, align 8
  %tx_bytes.addr = alloca i64*, align 8
  %ret = alloca i64, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i64 %count, i64* %count.addr, align 8
  store i64* %tx_bytes, i64** %tx_bytes.addr, align 8
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 8
  %2 = load i64, i64* %count.addr, align 8
  %call = call i64 @write(i32 %0, i8* %1, i64 %2) #11
  store i64 %call, i64* %ret, align 8
  %3 = load i64, i64* %ret, align 8
  %cmp = icmp slt i64 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32* @__errno_location() #16
  %4 = load i32, i32* %call1, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %tx_bytes.addr, align 8
  %cmp2 = icmp ne i64* %5, null
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %6 = load i64, i64* %ret, align 8
  %7 = load i64*, i64** %tx_bytes.addr, align 8
  store i64 %6, i64* %7, align 8
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i64 @write(i32, i8*, i64) #7

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #8

; Function Attrs: noinline nounwind optnone uwtable
define i32 @cgc_receive(i32 %fd, i8* %buf, i64 %count, i64* %rx_bytes) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %count.addr = alloca i64, align 8
  %rx_bytes.addr = alloca i64*, align 8
  %ret = alloca i64, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i64 %count, i64* %count.addr, align 8
  store i64* %rx_bytes, i64** %rx_bytes.addr, align 8
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 8
  %2 = load i64, i64* %count.addr, align 8
  %call = call i64 @read(i32 %0, i8* %1, i64 %2) #11
  store i64 %call, i64* %ret, align 8
  %3 = load i64, i64* %ret, align 8
  %cmp = icmp slt i64 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32* @__errno_location() #16
  %4 = load i32, i32* %call1, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %rx_bytes.addr, align 8
  %cmp2 = icmp ne i64* %5, null
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %6 = load i64, i64* %ret, align 8
  %7 = load i64*, i64** %rx_bytes.addr, align 8
  store i64 %6, i64* %7, align 8
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i64 @read(i32, i8*, i64) #7

; Function Attrs: noinline nounwind optnone uwtable
define i32 @cgc_fdwait(i32 %nfds, %struct.cgc_fd_set* %readfds, %struct.cgc_fd_set* %writefds, %struct.cgc_timeval* %timeout, i32* %readyfds) #0 {
entry:
  %retval = alloca i32, align 4
  %nfds.addr = alloca i32, align 4
  %readfds.addr = alloca %struct.cgc_fd_set*, align 8
  %writefds.addr = alloca %struct.cgc_fd_set*, align 8
  %timeout.addr = alloca %struct.cgc_timeval*, align 8
  %readyfds.addr = alloca i32*, align 8
  %ret = alloca i32, align 4
  %actual_num_fds = alloca i32, align 4
  %max_wait_time = alloca %struct.timeval, align 8
  %read_fds = alloca %struct.cgc_fd_set, align 8
  %write_fds = alloca %struct.cgc_fd_set, align 8
  %__d0 = alloca i32, align 4
  %__d1 = alloca i32, align 4
  %__d07 = alloca i32, align 4
  %__d18 = alloca i32, align 4
  %__i = alloca i32, align 4
  %__i46 = alloca i32, align 4
  %num_selected_fds = alloca i32, align 4
  store i32 %nfds, i32* %nfds.addr, align 4
  store %struct.cgc_fd_set* %readfds, %struct.cgc_fd_set** %readfds.addr, align 8
  store %struct.cgc_fd_set* %writefds, %struct.cgc_fd_set** %writefds.addr, align 8
  store %struct.cgc_timeval* %timeout, %struct.cgc_timeval** %timeout.addr, align 8
  store i32* %readyfds, i32** %readyfds.addr, align 8
  %0 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %call = call i32 @cgc_check_timeout(%struct.cgc_timeval* %0) #11
  store i32 %call, i32* %ret, align 4
  store i32 0, i32* %actual_num_fds, align 4
  %1 = bitcast %struct.timeval* %max_wait_time to i8*
  %2 = call i8* @memset(i8* %1, i32 0, i64 16)
  %3 = load i32, i32* %ret, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %ret, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %nfds.addr, align 4
  %cmp = icmp sgt i32 0, %5
  br i1 %cmp, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %6 = load i32, i32* %nfds.addr, align 4
  %conv = sext i32 %6 to i64
  %cmp1 = icmp ult i64 64, %conv
  br i1 %cmp1, label %if.then3, label %if.end

if.then3:                                         ; preds = %lor.lhs.false, %if.else
  store i32 3, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end4

if.end4:                                          ; preds = %if.end
  br label %do.body

do.body:                                          ; preds = %if.end4
  %__fds_bits = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %read_fds, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits, i64 0, i64 0
  %7 = call { i64, i64* } asm sideeffect "cld; rep; stosq", "={cx},={di},{ax},0,1,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 0, i64 16, i64* %arrayidx) #17, !srcloc !301
  %asmresult = extractvalue { i64, i64* } %7, 0
  %asmresult5 = extractvalue { i64, i64* } %7, 1
  %8 = trunc i64 %asmresult to i32
  store i32 %8, i32* %__d0, align 4
  %9 = ptrtoint i64* %asmresult5 to i64
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %__d1, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body6

do.body6:                                         ; preds = %do.end
  %__fds_bits9 = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %write_fds, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits9, i64 0, i64 0
  %11 = call { i64, i64* } asm sideeffect "cld; rep; stosq", "={cx},={di},{ax},0,1,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 0, i64 16, i64* %arrayidx10) #17, !srcloc !302
  %asmresult11 = extractvalue { i64, i64* } %11, 0
  %asmresult12 = extractvalue { i64, i64* } %11, 1
  %12 = trunc i64 %asmresult11 to i32
  store i32 %12, i32* %__d07, align 4
  %13 = ptrtoint i64* %asmresult12 to i64
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %__d18, align 4
  br label %do.end13

do.end13:                                         ; preds = %do.body6
  %15 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %readfds.addr, align 8
  %tobool14 = icmp ne %struct.cgc_fd_set* %15, null
  br i1 %tobool14, label %if.then15, label %if.end21

if.then15:                                        ; preds = %do.end13
  %16 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %readfds.addr, align 8
  %call16 = call i32 @cgc_copy_cgc_fd_set(%struct.cgc_fd_set* %16, %struct.cgc_fd_set* %read_fds, i32* %actual_num_fds) #11
  store i32 %call16, i32* %ret, align 4
  %cmp17 = icmp ne i32 0, %call16
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.then15
  %17 = load i32, i32* %ret, align 4
  store i32 %17, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %if.then15
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %do.end13
  %18 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %writefds.addr, align 8
  %tobool22 = icmp ne %struct.cgc_fd_set* %18, null
  br i1 %tobool22, label %if.then23, label %if.end29

if.then23:                                        ; preds = %if.end21
  %19 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %writefds.addr, align 8
  %call24 = call i32 @cgc_copy_cgc_fd_set(%struct.cgc_fd_set* %19, %struct.cgc_fd_set* %write_fds, i32* %actual_num_fds) #11
  store i32 %call24, i32* %ret, align 4
  %cmp25 = icmp ne i32 0, %call24
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.then23
  %20 = load i32, i32* %ret, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.end28:                                         ; preds = %if.then23
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.end21
  %21 = load i32, i32* %actual_num_fds, align 4
  %22 = load i32, i32* %nfds.addr, align 4
  %cmp30 = icmp ne i32 %21, %22
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end29
  store i32 22, i32* %retval, align 4
  br label %return

if.end33:                                         ; preds = %if.end29
  %23 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %readfds.addr, align 8
  %tobool34 = icmp ne %struct.cgc_fd_set* %23, null
  br i1 %tobool34, label %if.then35, label %if.end42

if.then35:                                        ; preds = %if.end33
  br label %do.body36

do.body36:                                        ; preds = %if.then35
  store i32 0, i32* %__i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body36
  %24 = load i32, i32* %__i, align 4
  %conv37 = sext i32 %24 to i64
  %cmp38 = icmp ult i64 %conv37, 16
  br i1 %cmp38, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %25 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %readfds.addr, align 8
  %_fd_bits = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %25, i32 0, i32 0
  %26 = load i32, i32* %__i, align 4
  %idxprom = sext i32 %26 to i64
  %arrayidx40 = getelementptr inbounds [16 x i64], [16 x i64]* %_fd_bits, i64 0, i64 %idxprom
  store i64 0, i64* %arrayidx40, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = load i32, i32* %__i, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %__i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end41

do.end41:                                         ; preds = %for.end
  br label %if.end42

if.end42:                                         ; preds = %do.end41, %if.end33
  %28 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %writefds.addr, align 8
  %tobool43 = icmp ne %struct.cgc_fd_set* %28, null
  br i1 %tobool43, label %if.then44, label %if.end59

if.then44:                                        ; preds = %if.end42
  br label %do.body45

do.body45:                                        ; preds = %if.then44
  store i32 0, i32* %__i46, align 4
  br label %for.cond47

for.cond47:                                       ; preds = %for.inc55, %do.body45
  %29 = load i32, i32* %__i46, align 4
  %conv48 = sext i32 %29 to i64
  %cmp49 = icmp ult i64 %conv48, 16
  br i1 %cmp49, label %for.body51, label %for.end57

for.body51:                                       ; preds = %for.cond47
  %30 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %writefds.addr, align 8
  %_fd_bits52 = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %30, i32 0, i32 0
  %31 = load i32, i32* %__i46, align 4
  %idxprom53 = sext i32 %31 to i64
  %arrayidx54 = getelementptr inbounds [16 x i64], [16 x i64]* %_fd_bits52, i64 0, i64 %idxprom53
  store i64 0, i64* %arrayidx54, align 8
  br label %for.inc55

for.inc55:                                        ; preds = %for.body51
  %32 = load i32, i32* %__i46, align 4
  %inc56 = add nsw i32 %32, 1
  store i32 %inc56, i32* %__i46, align 4
  br label %for.cond47

for.end57:                                        ; preds = %for.cond47
  br label %do.end58

do.end58:                                         ; preds = %for.end57
  br label %if.end59

if.end59:                                         ; preds = %do.end58, %if.end42
  %33 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %tobool60 = icmp ne %struct.cgc_timeval* %33, null
  br i1 %tobool60, label %if.then61, label %if.end66

if.then61:                                        ; preds = %if.end59
  %34 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %tv_sec = getelementptr inbounds %struct.cgc_timeval, %struct.cgc_timeval* %34, i32 0, i32 0
  %35 = load i32, i32* %tv_sec, align 4
  %conv62 = sext i32 %35 to i64
  %tv_sec63 = getelementptr inbounds %struct.timeval, %struct.timeval* %max_wait_time, i32 0, i32 0
  store i64 %conv62, i64* %tv_sec63, align 8
  %36 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %tv_usec = getelementptr inbounds %struct.cgc_timeval, %struct.cgc_timeval* %36, i32 0, i32 1
  %37 = load i32, i32* %tv_usec, align 4
  %conv64 = sext i32 %37 to i64
  %tv_usec65 = getelementptr inbounds %struct.timeval, %struct.timeval* %max_wait_time, i32 0, i32 1
  store i64 %conv64, i64* %tv_usec65, align 8
  br label %if.end66

if.end66:                                         ; preds = %if.then61, %if.end59
  %38 = load i32, i32* %nfds.addr, align 4
  %39 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %readfds.addr, align 8
  %tobool67 = icmp ne %struct.cgc_fd_set* %39, null
  br i1 %tobool67, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end66
  br label %cond.end

cond.false:                                       ; preds = %if.end66
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.cgc_fd_set* [ %read_fds, %cond.true ], [ null, %cond.false ]
  %40 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %writefds.addr, align 8
  %tobool68 = icmp ne %struct.cgc_fd_set* %40, null
  br i1 %tobool68, label %cond.true69, label %cond.false70

cond.true69:                                      ; preds = %cond.end
  br label %cond.end71

cond.false70:                                     ; preds = %cond.end
  br label %cond.end71

cond.end71:                                       ; preds = %cond.false70, %cond.true69
  %cond72 = phi %struct.cgc_fd_set* [ %write_fds, %cond.true69 ], [ null, %cond.false70 ]
  %41 = load %struct.cgc_timeval*, %struct.cgc_timeval** %timeout.addr, align 8
  %tobool73 = icmp ne %struct.cgc_timeval* %41, null
  br i1 %tobool73, label %cond.true74, label %cond.false75

cond.true74:                                      ; preds = %cond.end71
  br label %cond.end76

cond.false75:                                     ; preds = %cond.end71
  br label %cond.end76

cond.end76:                                       ; preds = %cond.false75, %cond.true74
  %cond77 = phi %struct.timeval* [ %max_wait_time, %cond.true74 ], [ null, %cond.false75 ]
  %call78 = call i32 @select(i32 %38, %struct.cgc_fd_set* %cond, %struct.cgc_fd_set* %cond72, %struct.cgc_fd_set* null, %struct.timeval* %cond77) #11
  store i32 %call78, i32* %num_selected_fds, align 4
  %42 = load i32, i32* %num_selected_fds, align 4
  %cmp79 = icmp slt i32 %42, 0
  br i1 %cmp79, label %if.then81, label %if.end83

if.then81:                                        ; preds = %cond.end76
  %call82 = call i32* @__errno_location() #16
  %43 = load i32, i32* %call82, align 4
  store i32 %43, i32* %retval, align 4
  br label %return

if.end83:                                         ; preds = %cond.end76
  %44 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %readfds.addr, align 8
  %tobool84 = icmp ne %struct.cgc_fd_set* %44, null
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end83
  %45 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %readfds.addr, align 8
  call void @cgc_copy_os_fd_set(%struct.cgc_fd_set* %read_fds, %struct.cgc_fd_set* %45) #11
  br label %if.end86

if.end86:                                         ; preds = %if.then85, %if.end83
  %46 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %writefds.addr, align 8
  %tobool87 = icmp ne %struct.cgc_fd_set* %46, null
  br i1 %tobool87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end86
  %47 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %writefds.addr, align 8
  call void @cgc_copy_os_fd_set(%struct.cgc_fd_set* %write_fds, %struct.cgc_fd_set* %47) #11
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %if.end86
  %48 = load i32*, i32** %readyfds.addr, align 8
  %tobool90 = icmp ne i32* %48, null
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end89
  %49 = load i32, i32* %num_selected_fds, align 4
  %50 = load i32*, i32** %readyfds.addr, align 8
  store i32 %49, i32* %50, align 4
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %if.end89
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end92, %if.then81, %if.then32, %if.then27, %if.then19, %if.then3, %if.then
  %51 = load i32, i32* %retval, align 4
  ret i32 %51
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @cgc_copy_cgc_fd_set(%struct.cgc_fd_set* %cgc_fds, %struct.cgc_fd_set* %os_fds, i32* %num_fds) #0 {
entry:
  %retval = alloca i32, align 4
  %cgc_fds.addr = alloca %struct.cgc_fd_set*, align 8
  %os_fds.addr = alloca %struct.cgc_fd_set*, align 8
  %num_fds.addr = alloca i32*, align 8
  %fd = alloca i32, align 4
  store %struct.cgc_fd_set* %cgc_fds, %struct.cgc_fd_set** %cgc_fds.addr, align 8
  store %struct.cgc_fd_set* %os_fds, %struct.cgc_fd_set** %os_fds.addr, align 8
  store i32* %num_fds, i32** %num_fds.addr, align 8
  store i32 0, i32* %fd, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %fd, align 4
  %conv = zext i32 %0 to i64
  %cmp = icmp ult i64 %conv, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %cgc_fds.addr, align 8
  %_fd_bits = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %1, i32 0, i32 0
  %2 = load i32, i32* %fd, align 4
  %conv2 = zext i32 %2 to i64
  %div = udiv i64 %conv2, 64
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %_fd_bits, i64 0, i64 %div
  %3 = load i64, i64* %arrayidx, align 8
  %4 = load i32, i32* %fd, align 4
  %conv3 = zext i32 %4 to i64
  %and = and i64 %conv3, 63
  %sh_prom = trunc i64 %and to i32
  %int_cast_to_i64 = zext i32 %sh_prom to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %shl = shl i32 1, %sh_prom, !klee.check.shift !303
  %conv4 = sext i32 %shl to i64
  %and5 = and i64 %3, %conv4
  %tobool = icmp ne i64 %and5, 0
  br i1 %tobool, label %if.then, label %if.end17

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %fd, align 4
  %cmp6 = icmp uge i32 %5, 23
  br i1 %cmp6, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.then
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %6 = load i32, i32* %fd, align 4
  %cmp9 = icmp ugt i32 %6, 64
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  br label %for.inc

if.end12:                                         ; preds = %if.end
  %7 = load i32, i32* %fd, align 4
  %rem = urem i32 %7, 64
  %sh_prom13 = zext i32 %rem to i64
  call void @klee_overshift_check(i64 64, i64 %sh_prom13)
  %shl14 = shl i64 1, %sh_prom13, !klee.check.shift !303
  %8 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %os_fds.addr, align 8
  %__fds_bits = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %8, i32 0, i32 0
  %9 = load i32, i32* %fd, align 4
  %div15 = udiv i32 %9, 64
  %idxprom = zext i32 %div15 to i64
  %arrayidx16 = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits, i64 0, i64 %idxprom
  %10 = load i64, i64* %arrayidx16, align 8
  %or = or i64 %10, %shl14
  store i64 %or, i64* %arrayidx16, align 8
  %11 = load i32*, i32** %num_fds.addr, align 8
  %12 = load i32, i32* %11, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %11, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.end12, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end17, %if.then11
  %13 = load i32, i32* %fd, align 4
  %inc18 = add i32 %13, 1
  store i32 %inc18, i32* %fd, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then8
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare i32 @select(i32, %struct.cgc_fd_set*, %struct.cgc_fd_set*, %struct.cgc_fd_set*, %struct.timeval*) #7

; Function Attrs: noinline nounwind optnone uwtable
define internal void @cgc_copy_os_fd_set(%struct.cgc_fd_set* %os_fds, %struct.cgc_fd_set* %cgc_fds) #0 {
entry:
  %os_fds.addr = alloca %struct.cgc_fd_set*, align 8
  %cgc_fds.addr = alloca %struct.cgc_fd_set*, align 8
  %fd = alloca i32, align 4
  store %struct.cgc_fd_set* %os_fds, %struct.cgc_fd_set** %os_fds.addr, align 8
  store %struct.cgc_fd_set* %cgc_fds, %struct.cgc_fd_set** %cgc_fds.addr, align 8
  store i32 0, i32* %fd, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %fd, align 4
  %conv = zext i32 %0 to i64
  %cmp = icmp ult i64 %conv, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %os_fds.addr, align 8
  %__fds_bits = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %1, i32 0, i32 0
  %2 = load i32, i32* %fd, align 4
  %div = udiv i32 %2, 64
  %idxprom = zext i32 %div to i64
  %arrayidx = getelementptr inbounds [16 x i64], [16 x i64]* %__fds_bits, i64 0, i64 %idxprom
  %3 = load i64, i64* %arrayidx, align 8
  %4 = load i32, i32* %fd, align 4
  %rem = urem i32 %4, 64
  %sh_prom = zext i32 %rem to i64
  call void @klee_overshift_check(i64 64, i64 %sh_prom)
  %shl = shl i64 1, %sh_prom, !klee.check.shift !303
  %and = and i64 %3, %shl
  %cmp2 = icmp ne i64 %and, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %fd, align 4
  %conv4 = zext i32 %5 to i64
  %and5 = and i64 %conv4, 63
  %sh_prom6 = trunc i64 %and5 to i32
  %int_cast_to_i64 = zext i32 %sh_prom6 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64)
  %shl7 = shl i32 1, %sh_prom6, !klee.check.shift !303
  %conv8 = sext i32 %shl7 to i64
  %6 = load %struct.cgc_fd_set*, %struct.cgc_fd_set** %cgc_fds.addr, align 8
  %_fd_bits = getelementptr inbounds %struct.cgc_fd_set, %struct.cgc_fd_set* %6, i32 0, i32 0
  %7 = load i32, i32* %fd, align 4
  %conv9 = zext i32 %7 to i64
  %div10 = udiv i64 %conv9, 64
  %arrayidx11 = getelementptr inbounds [16 x i64], [16 x i64]* %_fd_bits, i64 0, i64 %div10
  %8 = load i64, i64* %arrayidx11, align 8
  %or = or i64 %8, %conv8
  store i64 %or, i64* %arrayidx11, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %fd, align 4
  %inc = add i32 %9, 1
  store i32 %inc, i32* %fd, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @cgc_allocate(i64 %length, i32 %is_executable, i8** %addr) #0 {
entry:
  %retval = alloca i32, align 4
  %length.addr = alloca i64, align 8
  %is_executable.addr = alloca i32, align 4
  %addr.addr = alloca i8**, align 8
  %page_perms = alloca i32, align 4
  %return_address = alloca i8*, align 8
  store i64 %length, i64* %length.addr, align 8
  store i32 %is_executable, i32* %is_executable.addr, align 4
  store i8** %addr, i8*** %addr.addr, align 8
  store i32 3, i32* %page_perms, align 4
  %0 = load i32, i32* %is_executable.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %page_perms, align 4
  %or = or i32 %1, 4
  store i32 %or, i32* %page_perms, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i64, i64* %length.addr, align 8
  %call = call noalias i8* @malloc(i64 %2) #13
  store i8* %call, i8** %return_address, align 8
  %3 = load i8*, i8** %return_address, align 8
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %call2 = call i32* @__errno_location() #16
  %4 = load i32, i32* %call2, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %5 = load i8*, i8** %return_address, align 8
  %6 = load i64, i64* %length.addr, align 8
  %7 = load i32, i32* %page_perms, align 4
  %call4 = call i32 @mprotect(i8* %5, i64 %6, i32 %7) #13
  %8 = load i8**, i8*** %addr.addr, align 8
  %tobool5 = icmp ne i8** %8, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  %9 = load i8*, i8** %return_address, align 8
  %10 = load i8**, i8*** %addr.addr, align 8
  store i8* %9, i8** %10, align 8
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end3
  %11 = load i8*, i8** %return_address, align 8
  %12 = load i64, i64* %length.addr, align 8
  %call8 = call i8* @memset(i8* %11, i32 0, i64 %12) #13
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then1
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: nounwind
declare i32 @mprotect(i8*, i64, i32) #2

; Function Attrs: noinline nounwind optnone uwtable
define i32 @cgc_deallocate(i8* %addr, i64 %length) #0 {
entry:
  %retval = alloca i32, align 4
  %addr.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %ret = alloca i32, align 4
  store i8* %addr, i8** %addr.addr, align 8
  store i64 %length, i64* %length.addr, align 8
  %0 = load i8*, i8** %addr.addr, align 8
  %1 = load i64, i64* %length.addr, align 8
  %call = call i32 @munmap(i8* %0, i64 %1) #13
  store i32 %call, i32* %ret, align 4
  %2 = load i32, i32* %ret, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32* @__errno_location() #16
  %3 = load i32, i32* %call1, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: nounwind
declare i32 @munmap(i8*, i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define i32 @cgc_random(i8* %buf, i64 %count, i64* %rnd_bytes) #0 {
entry:
  %buf.addr = alloca i8*, align 8
  %count.addr = alloca i64, align 8
  %rnd_bytes.addr = alloca i64*, align 8
  store i8* %buf, i8** %buf.addr, align 8
  store i64 %count, i64* %count.addr, align 8
  store i64* %rnd_bytes, i64** %rnd_bytes.addr, align 8
  call void @cgc_try_init_prng() #11
  %0 = load %struct.cgc_prng*, %struct.cgc_prng** @cgc_internal_prng, align 8
  %1 = load i64, i64* %count.addr, align 8
  %conv = trunc i64 %1 to i32
  %2 = load i8*, i8** %buf.addr, align 8
  call void @cgc_aes_get_bytes(%struct.cgc_prng* %0, i32 %conv, i8* %2) #11
  %3 = load i64*, i64** %rnd_bytes.addr, align 8
  %tobool = icmp ne i64* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64, i64* %count.addr, align 8
  %5 = load i64*, i64** %rnd_bytes.addr, align 8
  store i64 %4, i64* %5, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #9 !dbg !304 {
entry:
  %destaddr.addr = alloca i8*, align 8
  %srcaddr.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  store i8* %destaddr, i8** %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %destaddr.addr, metadata !313, metadata !DIExpression()), !dbg !314
  store i8* %srcaddr, i8** %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %srcaddr.addr, metadata !315, metadata !DIExpression()), !dbg !316
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !317, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !319, metadata !DIExpression()), !dbg !320
  %0 = load i8*, i8** %destaddr.addr, align 8, !dbg !321
  store i8* %0, i8** %dest, align 8, !dbg !320
  call void @llvm.dbg.declare(metadata i8** %src, metadata !322, metadata !DIExpression()), !dbg !323
  %1 = load i8*, i8** %srcaddr.addr, align 8, !dbg !324
  store i8* %1, i8** %src, align 8, !dbg !323
  br label %while.cond, !dbg !325

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, i64* %len.addr, align 8, !dbg !326
  %dec = add i64 %2, -1, !dbg !326
  store i64 %dec, i64* %len.addr, align 8, !dbg !326
  %cmp = icmp ugt i64 %2, 0, !dbg !327
  br i1 %cmp, label %while.body, label %while.end, !dbg !325

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %src, align 8, !dbg !328
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !328
  store i8* %incdec.ptr, i8** %src, align 8, !dbg !328
  %4 = load i8, i8* %3, align 1, !dbg !329
  %5 = load i8*, i8** %dest, align 8, !dbg !330
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !330
  store i8* %incdec.ptr1, i8** %dest, align 8, !dbg !330
  store i8 %4, i8* %5, align 1, !dbg !331
  br label %while.cond, !dbg !325, !llvm.loop !332

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %destaddr.addr, align 8, !dbg !333
  ret i8* %6, !dbg !334
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memset(i8* %dst, i32 %s, i64 %count) #9 !dbg !335 {
entry:
  %dst.addr = alloca i8*, align 8
  %s.addr = alloca i32, align 4
  %count.addr = alloca i64, align 8
  %a = alloca i8*, align 8
  store i8* %dst, i8** %dst.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dst.addr, metadata !339, metadata !DIExpression()), !dbg !340
  store i32 %s, i32* %s.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %s.addr, metadata !341, metadata !DIExpression()), !dbg !342
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !343, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata i8** %a, metadata !345, metadata !DIExpression()), !dbg !346
  %0 = load i8*, i8** %dst.addr, align 8, !dbg !347
  store i8* %0, i8** %a, align 8, !dbg !346
  br label %while.cond, !dbg !348

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i64, i64* %count.addr, align 8, !dbg !349
  %dec = add i64 %1, -1, !dbg !349
  store i64 %dec, i64* %count.addr, align 8, !dbg !349
  %cmp = icmp ugt i64 %1, 0, !dbg !350
  br i1 %cmp, label %while.body, label %while.end, !dbg !348

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %s.addr, align 4, !dbg !351
  %conv = trunc i32 %2 to i8, !dbg !351
  %3 = load i8*, i8** %a, align 8, !dbg !352
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !352
  store i8* %incdec.ptr, i8** %a, align 8, !dbg !352
  store i8 %conv, i8* %3, align 1, !dbg !353
  br label %while.cond, !dbg !348, !llvm.loop !354

while.end:                                        ; preds = %while.cond
  %4 = load i8*, i8** %dst.addr, align 8, !dbg !355
  ret i8* %4, !dbg !356
}

; Function Attrs: noinline nounwind optnone uwtable
define void @AES128_ECB_encrypt(i8* %input, i8* %key, i8* %output) #0 {
entry:
  %input.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %output.addr = alloca i8*, align 8
  store i8* %input, i8** %input.addr, align 8
  store i8* %key, i8** %key.addr, align 8
  store i8* %output, i8** %output.addr, align 8
  %0 = load i8*, i8** %output.addr, align 8
  %1 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %0, i8* %1) #11
  %2 = load i8*, i8** %output.addr, align 8
  %3 = bitcast i8* %2 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %3, [4 x [4 x i8]]** @state, align 8
  %4 = load i8*, i8** %key.addr, align 8
  store i8* %4, i8** @Key, align 8
  call void @KeyExpansion() #11
  call void @Cipher() #11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @BlockCopy(i8* %output, i8* %input) #0 {
entry:
  %output.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %i = alloca i8, align 1
  store i8* %output, i8** %output.addr, align 8
  store i8* %input, i8** %input.addr, align 8
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8, i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %input.addr, align 8
  %2 = load i8, i8* %i, align 1
  %idxprom = zext i8 %2 to i64
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1
  %4 = load i8*, i8** %output.addr, align 8
  %5 = load i8, i8* %i, align 1
  %idxprom2 = zext i8 %5 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i64 %idxprom2
  store i8 %3, i8* %arrayidx3, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i8, i8* %i, align 1
  %inc = add i8 %6, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @KeyExpansion() #0 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %tempa = alloca [4 x i8], align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** @Key, align 8
  %2 = load i32, i32* %i, align 4
  %mul = mul i32 %2, 4
  %add = add i32 %mul, 0
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1
  %4 = load i32, i32* %i, align 4
  %mul1 = mul i32 %4, 4
  %add2 = add i32 %mul1, 0
  %idxprom3 = zext i32 %add2 to i64
  %arrayidx4 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom3
  store i8 %3, i8* %arrayidx4, align 1
  %5 = load i8*, i8** @Key, align 8
  %6 = load i32, i32* %i, align 4
  %mul5 = mul i32 %6, 4
  %add6 = add i32 %mul5, 1
  %idxprom7 = zext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i64 %idxprom7
  %7 = load i8, i8* %arrayidx8, align 1
  %8 = load i32, i32* %i, align 4
  %mul9 = mul i32 %8, 4
  %add10 = add i32 %mul9, 1
  %idxprom11 = zext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom11
  store i8 %7, i8* %arrayidx12, align 1
  %9 = load i8*, i8** @Key, align 8
  %10 = load i32, i32* %i, align 4
  %mul13 = mul i32 %10, 4
  %add14 = add i32 %mul13, 2
  %idxprom15 = zext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds i8, i8* %9, i64 %idxprom15
  %11 = load i8, i8* %arrayidx16, align 1
  %12 = load i32, i32* %i, align 4
  %mul17 = mul i32 %12, 4
  %add18 = add i32 %mul17, 2
  %idxprom19 = zext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom19
  store i8 %11, i8* %arrayidx20, align 1
  %13 = load i8*, i8** @Key, align 8
  %14 = load i32, i32* %i, align 4
  %mul21 = mul i32 %14, 4
  %add22 = add i32 %mul21, 3
  %idxprom23 = zext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds i8, i8* %13, i64 %idxprom23
  %15 = load i8, i8* %arrayidx24, align 1
  %16 = load i32, i32* %i, align 4
  %mul25 = mul i32 %16, 4
  %add26 = add i32 %mul25, 3
  %idxprom27 = zext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom27
  store i8 %15, i8* %arrayidx28, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %inc = add i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc128, %for.end
  %18 = load i32, i32* %i, align 4
  %cmp30 = icmp ult i32 %18, 44
  br i1 %cmp30, label %for.body31, label %for.end130

for.body31:                                       ; preds = %for.cond29
  store i32 0, i32* %j, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc41, %for.body31
  %19 = load i32, i32* %j, align 4
  %cmp33 = icmp ult i32 %19, 4
  br i1 %cmp33, label %for.body34, label %for.end43

for.body34:                                       ; preds = %for.cond32
  %20 = load i32, i32* %i, align 4
  %sub = sub i32 %20, 1
  %mul35 = mul i32 %sub, 4
  %21 = load i32, i32* %j, align 4
  %add36 = add i32 %mul35, %21
  %idxprom37 = zext i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom37
  %22 = load i8, i8* %arrayidx38, align 1
  %23 = load i32, i32* %j, align 4
  %idxprom39 = zext i32 %23 to i64
  %arrayidx40 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 %idxprom39
  store i8 %22, i8* %arrayidx40, align 1
  br label %for.inc41

for.inc41:                                        ; preds = %for.body34
  %24 = load i32, i32* %j, align 4
  %inc42 = add i32 %24, 1
  store i32 %inc42, i32* %j, align 4
  br label %for.cond32

for.end43:                                        ; preds = %for.cond32
  %25 = load i32, i32* %i, align 4
  %rem = urem i32 %25, 4
  %cmp44 = icmp eq i32 %rem, 0
  br i1 %cmp44, label %if.then, label %if.else

if.then:                                          ; preds = %for.end43
  %arrayidx45 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 0
  %26 = load i8, i8* %arrayidx45, align 1
  %conv = zext i8 %26 to i32
  store i32 %conv, i32* %k, align 4
  %arrayidx46 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 1
  %27 = load i8, i8* %arrayidx46, align 1
  %arrayidx47 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 0
  store i8 %27, i8* %arrayidx47, align 1
  %arrayidx48 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 2
  %28 = load i8, i8* %arrayidx48, align 1
  %arrayidx49 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 1
  store i8 %28, i8* %arrayidx49, align 1
  %arrayidx50 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 3
  %29 = load i8, i8* %arrayidx50, align 1
  %arrayidx51 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 2
  store i8 %29, i8* %arrayidx51, align 1
  %30 = load i32, i32* %k, align 4
  %conv52 = trunc i32 %30 to i8
  %arrayidx53 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 3
  store i8 %conv52, i8* %arrayidx53, align 1
  %arrayidx54 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 0
  %31 = load i8, i8* %arrayidx54, align 1
  %call = call zeroext i8 @getSBoxValue(i8 zeroext %31) #11
  %arrayidx55 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 0
  store i8 %call, i8* %arrayidx55, align 1
  %arrayidx56 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 1
  %32 = load i8, i8* %arrayidx56, align 1
  %call57 = call zeroext i8 @getSBoxValue(i8 zeroext %32) #11
  %arrayidx58 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 1
  store i8 %call57, i8* %arrayidx58, align 1
  %arrayidx59 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 2
  %33 = load i8, i8* %arrayidx59, align 1
  %call60 = call zeroext i8 @getSBoxValue(i8 zeroext %33) #11
  %arrayidx61 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 2
  store i8 %call60, i8* %arrayidx61, align 1
  %arrayidx62 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 3
  %34 = load i8, i8* %arrayidx62, align 1
  %call63 = call zeroext i8 @getSBoxValue(i8 zeroext %34) #11
  %arrayidx64 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 3
  store i8 %call63, i8* %arrayidx64, align 1
  %arrayidx65 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 0
  %35 = load i8, i8* %arrayidx65, align 1
  %conv66 = zext i8 %35 to i32
  %36 = load i32, i32* %i, align 4
  %div = udiv i32 %36, 4
  %idxprom67 = zext i32 %div to i64
  %arrayidx68 = getelementptr inbounds [255 x i8], [255 x i8]* @Rcon, i64 0, i64 %idxprom67
  %37 = load i8, i8* %arrayidx68, align 1
  %conv69 = zext i8 %37 to i32
  %xor = xor i32 %conv66, %conv69
  %conv70 = trunc i32 %xor to i8
  %arrayidx71 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 0
  store i8 %conv70, i8* %arrayidx71, align 1
  br label %if.end

if.else:                                          ; preds = %for.end43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %38 = load i32, i32* %i, align 4
  %sub72 = sub i32 %38, 4
  %mul73 = mul i32 %sub72, 4
  %add74 = add i32 %mul73, 0
  %idxprom75 = zext i32 %add74 to i64
  %arrayidx76 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom75
  %39 = load i8, i8* %arrayidx76, align 1
  %conv77 = zext i8 %39 to i32
  %arrayidx78 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 0
  %40 = load i8, i8* %arrayidx78, align 1
  %conv79 = zext i8 %40 to i32
  %xor80 = xor i32 %conv77, %conv79
  %conv81 = trunc i32 %xor80 to i8
  %41 = load i32, i32* %i, align 4
  %mul82 = mul i32 %41, 4
  %add83 = add i32 %mul82, 0
  %idxprom84 = zext i32 %add83 to i64
  %arrayidx85 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom84
  store i8 %conv81, i8* %arrayidx85, align 1
  %42 = load i32, i32* %i, align 4
  %sub86 = sub i32 %42, 4
  %mul87 = mul i32 %sub86, 4
  %add88 = add i32 %mul87, 1
  %idxprom89 = zext i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom89
  %43 = load i8, i8* %arrayidx90, align 1
  %conv91 = zext i8 %43 to i32
  %arrayidx92 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 1
  %44 = load i8, i8* %arrayidx92, align 1
  %conv93 = zext i8 %44 to i32
  %xor94 = xor i32 %conv91, %conv93
  %conv95 = trunc i32 %xor94 to i8
  %45 = load i32, i32* %i, align 4
  %mul96 = mul i32 %45, 4
  %add97 = add i32 %mul96, 1
  %idxprom98 = zext i32 %add97 to i64
  %arrayidx99 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom98
  store i8 %conv95, i8* %arrayidx99, align 1
  %46 = load i32, i32* %i, align 4
  %sub100 = sub i32 %46, 4
  %mul101 = mul i32 %sub100, 4
  %add102 = add i32 %mul101, 2
  %idxprom103 = zext i32 %add102 to i64
  %arrayidx104 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom103
  %47 = load i8, i8* %arrayidx104, align 1
  %conv105 = zext i8 %47 to i32
  %arrayidx106 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 2
  %48 = load i8, i8* %arrayidx106, align 1
  %conv107 = zext i8 %48 to i32
  %xor108 = xor i32 %conv105, %conv107
  %conv109 = trunc i32 %xor108 to i8
  %49 = load i32, i32* %i, align 4
  %mul110 = mul i32 %49, 4
  %add111 = add i32 %mul110, 2
  %idxprom112 = zext i32 %add111 to i64
  %arrayidx113 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom112
  store i8 %conv109, i8* %arrayidx113, align 1
  %50 = load i32, i32* %i, align 4
  %sub114 = sub i32 %50, 4
  %mul115 = mul i32 %sub114, 4
  %add116 = add i32 %mul115, 3
  %idxprom117 = zext i32 %add116 to i64
  %arrayidx118 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom117
  %51 = load i8, i8* %arrayidx118, align 1
  %conv119 = zext i8 %51 to i32
  %arrayidx120 = getelementptr inbounds [4 x i8], [4 x i8]* %tempa, i64 0, i64 3
  %52 = load i8, i8* %arrayidx120, align 1
  %conv121 = zext i8 %52 to i32
  %xor122 = xor i32 %conv119, %conv121
  %conv123 = trunc i32 %xor122 to i8
  %53 = load i32, i32* %i, align 4
  %mul124 = mul i32 %53, 4
  %add125 = add i32 %mul124, 3
  %idxprom126 = zext i32 %add125 to i64
  %arrayidx127 = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom126
  store i8 %conv123, i8* %arrayidx127, align 1
  br label %for.inc128

for.inc128:                                       ; preds = %if.end
  %54 = load i32, i32* %i, align 4
  %inc129 = add i32 %54, 1
  store i32 %inc129, i32* %i, align 4
  br label %for.cond29

for.end130:                                       ; preds = %for.cond29
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @Cipher() #0 {
entry:
  %round = alloca i8, align 1
  store i8 0, i8* %round, align 1
  call void @AddRoundKey(i8 zeroext 0) #11
  store i8 1, i8* %round, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8, i8* %round, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @SubBytes() #11
  call void @ShiftRows() #11
  call void @MixColumns() #11
  %1 = load i8, i8* %round, align 1
  call void @AddRoundKey(i8 zeroext %1) #11
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i8, i8* %round, align 1
  %inc = add i8 %2, 1
  store i8 %inc, i8* %round, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @SubBytes() #11
  call void @ShiftRows() #11
  call void @AddRoundKey(i8 zeroext 10) #11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @AddRoundKey(i8 zeroext %round) #0 {
entry:
  %round.addr = alloca i8, align 1
  %i = alloca i8, align 1
  %j = alloca i8, align 1
  store i8 %round, i8* %round.addr, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i8, i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end22

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %j, align 1
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i8, i8* %j, align 1
  %conv3 = zext i8 %1 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %2 = load i8, i8* %round.addr, align 1
  %conv7 = zext i8 %2 to i32
  %mul = mul nsw i32 %conv7, 4
  %mul8 = mul nsw i32 %mul, 4
  %3 = load i8, i8* %i, align 1
  %conv9 = zext i8 %3 to i32
  %mul10 = mul nsw i32 %conv9, 4
  %add = add nsw i32 %mul8, %mul10
  %4 = load i8, i8* %j, align 1
  %conv11 = zext i8 %4 to i32
  %add12 = add nsw i32 %add, %conv11
  %idxprom = sext i32 %add12 to i64
  %arrayidx = getelementptr inbounds [176 x i8], [176 x i8]* @RoundKey, i64 0, i64 %idxprom
  %5 = load i8, i8* %arrayidx, align 1
  %conv13 = zext i8 %5 to i32
  %6 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %7 = load i8, i8* %i, align 1
  %idxprom14 = zext i8 %7 to i64
  %arrayidx15 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %6, i64 0, i64 %idxprom14
  %8 = load i8, i8* %j, align 1
  %idxprom16 = zext i8 %8 to i64
  %arrayidx17 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx15, i64 0, i64 %idxprom16
  %9 = load i8, i8* %arrayidx17, align 1
  %conv18 = zext i8 %9 to i32
  %xor = xor i32 %conv18, %conv13
  %conv19 = trunc i32 %xor to i8
  store i8 %conv19, i8* %arrayidx17, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %10 = load i8, i8* %j, align 1
  %inc = add i8 %10, 1
  store i8 %inc, i8* %j, align 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %11 = load i8, i8* %i, align 1
  %inc21 = add i8 %11, 1
  store i8 %inc21, i8* %i, align 1
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @SubBytes() #0 {
entry:
  %i = alloca i8, align 1
  %j = alloca i8, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i8, i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %j, align 1
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i8, i8* %j, align 1
  %conv3 = zext i8 %1 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %2 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %3 = load i8, i8* %j, align 1
  %idxprom = zext i8 %3 to i64
  %arrayidx = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %2, i64 0, i64 %idxprom
  %4 = load i8, i8* %i, align 1
  %idxprom7 = zext i8 %4 to i64
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx, i64 0, i64 %idxprom7
  %5 = load i8, i8* %arrayidx8, align 1
  %call = call zeroext i8 @getSBoxValue(i8 zeroext %5) #11
  %6 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %7 = load i8, i8* %j, align 1
  %idxprom9 = zext i8 %7 to i64
  %arrayidx10 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %6, i64 0, i64 %idxprom9
  %8 = load i8, i8* %i, align 1
  %idxprom11 = zext i8 %8 to i64
  %arrayidx12 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx10, i64 0, i64 %idxprom11
  store i8 %call, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %9 = load i8, i8* %j, align 1
  %inc = add i8 %9, 1
  store i8 %inc, i8* %j, align 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %10 = load i8, i8* %i, align 1
  %inc14 = add i8 %10, 1
  store i8 %inc14, i8* %i, align 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @ShiftRows() #0 {
entry:
  %temp = alloca i8, align 1
  %0 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %0, i64 0, i64 0
  %arrayidx1 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx, i64 0, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  store i8 %1, i8* %temp, align 1
  %2 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx2 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %2, i64 0, i64 1
  %arrayidx3 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx2, i64 0, i64 1
  %3 = load i8, i8* %arrayidx3, align 1
  %4 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx4 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %4, i64 0, i64 0
  %arrayidx5 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx4, i64 0, i64 1
  store i8 %3, i8* %arrayidx5, align 1
  %5 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx6 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %5, i64 0, i64 2
  %arrayidx7 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx6, i64 0, i64 1
  %6 = load i8, i8* %arrayidx7, align 1
  %7 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx8 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %7, i64 0, i64 1
  %arrayidx9 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx8, i64 0, i64 1
  store i8 %6, i8* %arrayidx9, align 1
  %8 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx10 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %8, i64 0, i64 3
  %arrayidx11 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx10, i64 0, i64 1
  %9 = load i8, i8* %arrayidx11, align 1
  %10 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx12 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %10, i64 0, i64 2
  %arrayidx13 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx12, i64 0, i64 1
  store i8 %9, i8* %arrayidx13, align 1
  %11 = load i8, i8* %temp, align 1
  %12 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx14 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %12, i64 0, i64 3
  %arrayidx15 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx14, i64 0, i64 1
  store i8 %11, i8* %arrayidx15, align 1
  %13 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx16 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %13, i64 0, i64 0
  %arrayidx17 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx16, i64 0, i64 2
  %14 = load i8, i8* %arrayidx17, align 1
  store i8 %14, i8* %temp, align 1
  %15 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx18 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %15, i64 0, i64 2
  %arrayidx19 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx18, i64 0, i64 2
  %16 = load i8, i8* %arrayidx19, align 1
  %17 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx20 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %17, i64 0, i64 0
  %arrayidx21 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx20, i64 0, i64 2
  store i8 %16, i8* %arrayidx21, align 1
  %18 = load i8, i8* %temp, align 1
  %19 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx22 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %19, i64 0, i64 2
  %arrayidx23 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx22, i64 0, i64 2
  store i8 %18, i8* %arrayidx23, align 1
  %20 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx24 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %20, i64 0, i64 1
  %arrayidx25 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx24, i64 0, i64 2
  %21 = load i8, i8* %arrayidx25, align 1
  store i8 %21, i8* %temp, align 1
  %22 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx26 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %22, i64 0, i64 3
  %arrayidx27 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx26, i64 0, i64 2
  %23 = load i8, i8* %arrayidx27, align 1
  %24 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx28 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %24, i64 0, i64 1
  %arrayidx29 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx28, i64 0, i64 2
  store i8 %23, i8* %arrayidx29, align 1
  %25 = load i8, i8* %temp, align 1
  %26 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx30 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %26, i64 0, i64 3
  %arrayidx31 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx30, i64 0, i64 2
  store i8 %25, i8* %arrayidx31, align 1
  %27 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx32 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %27, i64 0, i64 0
  %arrayidx33 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx32, i64 0, i64 3
  %28 = load i8, i8* %arrayidx33, align 1
  store i8 %28, i8* %temp, align 1
  %29 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx34 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %29, i64 0, i64 3
  %arrayidx35 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx34, i64 0, i64 3
  %30 = load i8, i8* %arrayidx35, align 1
  %31 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx36 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %31, i64 0, i64 0
  %arrayidx37 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx36, i64 0, i64 3
  store i8 %30, i8* %arrayidx37, align 1
  %32 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx38 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %32, i64 0, i64 2
  %arrayidx39 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx38, i64 0, i64 3
  %33 = load i8, i8* %arrayidx39, align 1
  %34 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx40 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %34, i64 0, i64 3
  %arrayidx41 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx40, i64 0, i64 3
  store i8 %33, i8* %arrayidx41, align 1
  %35 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx42 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %35, i64 0, i64 1
  %arrayidx43 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx42, i64 0, i64 3
  %36 = load i8, i8* %arrayidx43, align 1
  %37 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx44 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %37, i64 0, i64 2
  %arrayidx45 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx44, i64 0, i64 3
  store i8 %36, i8* %arrayidx45, align 1
  %38 = load i8, i8* %temp, align 1
  %39 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx46 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %39, i64 0, i64 1
  %arrayidx47 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx46, i64 0, i64 3
  store i8 %38, i8* %arrayidx47, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @MixColumns() #0 {
entry:
  %i = alloca i8, align 1
  %Tmp = alloca i8, align 1
  %Tm = alloca i8, align 1
  %t = alloca i8, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8, i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %2 = load i8, i8* %i, align 1
  %idxprom = zext i8 %2 to i64
  %arrayidx = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %1, i64 0, i64 %idxprom
  %arrayidx2 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx, i64 0, i64 0
  %3 = load i8, i8* %arrayidx2, align 1
  store i8 %3, i8* %t, align 1
  %4 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %5 = load i8, i8* %i, align 1
  %idxprom3 = zext i8 %5 to i64
  %arrayidx4 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %4, i64 0, i64 %idxprom3
  %arrayidx5 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx4, i64 0, i64 0
  %6 = load i8, i8* %arrayidx5, align 1
  %conv6 = zext i8 %6 to i32
  %7 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %8 = load i8, i8* %i, align 1
  %idxprom7 = zext i8 %8 to i64
  %arrayidx8 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %7, i64 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx8, i64 0, i64 1
  %9 = load i8, i8* %arrayidx9, align 1
  %conv10 = zext i8 %9 to i32
  %xor = xor i32 %conv6, %conv10
  %10 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %11 = load i8, i8* %i, align 1
  %idxprom11 = zext i8 %11 to i64
  %arrayidx12 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %10, i64 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx12, i64 0, i64 2
  %12 = load i8, i8* %arrayidx13, align 1
  %conv14 = zext i8 %12 to i32
  %xor15 = xor i32 %xor, %conv14
  %13 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %14 = load i8, i8* %i, align 1
  %idxprom16 = zext i8 %14 to i64
  %arrayidx17 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %13, i64 0, i64 %idxprom16
  %arrayidx18 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx17, i64 0, i64 3
  %15 = load i8, i8* %arrayidx18, align 1
  %conv19 = zext i8 %15 to i32
  %xor20 = xor i32 %xor15, %conv19
  %conv21 = trunc i32 %xor20 to i8
  store i8 %conv21, i8* %Tmp, align 1
  %16 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %17 = load i8, i8* %i, align 1
  %idxprom22 = zext i8 %17 to i64
  %arrayidx23 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %16, i64 0, i64 %idxprom22
  %arrayidx24 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx23, i64 0, i64 0
  %18 = load i8, i8* %arrayidx24, align 1
  %conv25 = zext i8 %18 to i32
  %19 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %20 = load i8, i8* %i, align 1
  %idxprom26 = zext i8 %20 to i64
  %arrayidx27 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %19, i64 0, i64 %idxprom26
  %arrayidx28 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx27, i64 0, i64 1
  %21 = load i8, i8* %arrayidx28, align 1
  %conv29 = zext i8 %21 to i32
  %xor30 = xor i32 %conv25, %conv29
  %conv31 = trunc i32 %xor30 to i8
  store i8 %conv31, i8* %Tm, align 1
  %22 = load i8, i8* %Tm, align 1
  %call = call zeroext i8 @xtime(i8 zeroext %22) #11
  store i8 %call, i8* %Tm, align 1
  %23 = load i8, i8* %Tm, align 1
  %conv32 = zext i8 %23 to i32
  %24 = load i8, i8* %Tmp, align 1
  %conv33 = zext i8 %24 to i32
  %xor34 = xor i32 %conv32, %conv33
  %25 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %26 = load i8, i8* %i, align 1
  %idxprom35 = zext i8 %26 to i64
  %arrayidx36 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %25, i64 0, i64 %idxprom35
  %arrayidx37 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx36, i64 0, i64 0
  %27 = load i8, i8* %arrayidx37, align 1
  %conv38 = zext i8 %27 to i32
  %xor39 = xor i32 %conv38, %xor34
  %conv40 = trunc i32 %xor39 to i8
  store i8 %conv40, i8* %arrayidx37, align 1
  %28 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %29 = load i8, i8* %i, align 1
  %idxprom41 = zext i8 %29 to i64
  %arrayidx42 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %28, i64 0, i64 %idxprom41
  %arrayidx43 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx42, i64 0, i64 1
  %30 = load i8, i8* %arrayidx43, align 1
  %conv44 = zext i8 %30 to i32
  %31 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %32 = load i8, i8* %i, align 1
  %idxprom45 = zext i8 %32 to i64
  %arrayidx46 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %31, i64 0, i64 %idxprom45
  %arrayidx47 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx46, i64 0, i64 2
  %33 = load i8, i8* %arrayidx47, align 1
  %conv48 = zext i8 %33 to i32
  %xor49 = xor i32 %conv44, %conv48
  %conv50 = trunc i32 %xor49 to i8
  store i8 %conv50, i8* %Tm, align 1
  %34 = load i8, i8* %Tm, align 1
  %call51 = call zeroext i8 @xtime(i8 zeroext %34) #11
  store i8 %call51, i8* %Tm, align 1
  %35 = load i8, i8* %Tm, align 1
  %conv52 = zext i8 %35 to i32
  %36 = load i8, i8* %Tmp, align 1
  %conv53 = zext i8 %36 to i32
  %xor54 = xor i32 %conv52, %conv53
  %37 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %38 = load i8, i8* %i, align 1
  %idxprom55 = zext i8 %38 to i64
  %arrayidx56 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %37, i64 0, i64 %idxprom55
  %arrayidx57 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx56, i64 0, i64 1
  %39 = load i8, i8* %arrayidx57, align 1
  %conv58 = zext i8 %39 to i32
  %xor59 = xor i32 %conv58, %xor54
  %conv60 = trunc i32 %xor59 to i8
  store i8 %conv60, i8* %arrayidx57, align 1
  %40 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %41 = load i8, i8* %i, align 1
  %idxprom61 = zext i8 %41 to i64
  %arrayidx62 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %40, i64 0, i64 %idxprom61
  %arrayidx63 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx62, i64 0, i64 2
  %42 = load i8, i8* %arrayidx63, align 1
  %conv64 = zext i8 %42 to i32
  %43 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %44 = load i8, i8* %i, align 1
  %idxprom65 = zext i8 %44 to i64
  %arrayidx66 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %43, i64 0, i64 %idxprom65
  %arrayidx67 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx66, i64 0, i64 3
  %45 = load i8, i8* %arrayidx67, align 1
  %conv68 = zext i8 %45 to i32
  %xor69 = xor i32 %conv64, %conv68
  %conv70 = trunc i32 %xor69 to i8
  store i8 %conv70, i8* %Tm, align 1
  %46 = load i8, i8* %Tm, align 1
  %call71 = call zeroext i8 @xtime(i8 zeroext %46) #11
  store i8 %call71, i8* %Tm, align 1
  %47 = load i8, i8* %Tm, align 1
  %conv72 = zext i8 %47 to i32
  %48 = load i8, i8* %Tmp, align 1
  %conv73 = zext i8 %48 to i32
  %xor74 = xor i32 %conv72, %conv73
  %49 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %50 = load i8, i8* %i, align 1
  %idxprom75 = zext i8 %50 to i64
  %arrayidx76 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %49, i64 0, i64 %idxprom75
  %arrayidx77 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx76, i64 0, i64 2
  %51 = load i8, i8* %arrayidx77, align 1
  %conv78 = zext i8 %51 to i32
  %xor79 = xor i32 %conv78, %xor74
  %conv80 = trunc i32 %xor79 to i8
  store i8 %conv80, i8* %arrayidx77, align 1
  %52 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %53 = load i8, i8* %i, align 1
  %idxprom81 = zext i8 %53 to i64
  %arrayidx82 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %52, i64 0, i64 %idxprom81
  %arrayidx83 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx82, i64 0, i64 3
  %54 = load i8, i8* %arrayidx83, align 1
  %conv84 = zext i8 %54 to i32
  %55 = load i8, i8* %t, align 1
  %conv85 = zext i8 %55 to i32
  %xor86 = xor i32 %conv84, %conv85
  %conv87 = trunc i32 %xor86 to i8
  store i8 %conv87, i8* %Tm, align 1
  %56 = load i8, i8* %Tm, align 1
  %call88 = call zeroext i8 @xtime(i8 zeroext %56) #11
  store i8 %call88, i8* %Tm, align 1
  %57 = load i8, i8* %Tm, align 1
  %conv89 = zext i8 %57 to i32
  %58 = load i8, i8* %Tmp, align 1
  %conv90 = zext i8 %58 to i32
  %xor91 = xor i32 %conv89, %conv90
  %59 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %60 = load i8, i8* %i, align 1
  %idxprom92 = zext i8 %60 to i64
  %arrayidx93 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %59, i64 0, i64 %idxprom92
  %arrayidx94 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx93, i64 0, i64 3
  %61 = load i8, i8* %arrayidx94, align 1
  %conv95 = zext i8 %61 to i32
  %xor96 = xor i32 %conv95, %xor91
  %conv97 = trunc i32 %xor96 to i8
  store i8 %conv97, i8* %arrayidx94, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %62 = load i8, i8* %i, align 1
  %inc = add i8 %62, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @xtime(i8 zeroext %x) #0 {
entry:
  %x.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  %0 = load i8, i8* %x.addr, align 1
  %conv = zext i8 %0 to i32
  %shl = shl i32 %conv, 1
  %1 = load i8, i8* %x.addr, align 1
  %conv1 = zext i8 %1 to i32
  %shr = ashr i32 %conv1, 7
  %and = and i32 %shr, 1
  %mul = mul nsw i32 %and, 27
  %xor = xor i32 %shl, %mul
  %conv2 = trunc i32 %xor to i8
  ret i8 %conv2
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @getSBoxValue(i8 zeroext %num) #0 {
entry:
  %num.addr = alloca i8, align 1
  store i8 %num, i8* %num.addr, align 1
  %0 = load i8, i8* %num.addr, align 1
  %idxprom = zext i8 %0 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @sbox, i64 0, i64 %idxprom
  %1 = load i8, i8* %arrayidx, align 1
  ret i8 %1
}

; Function Attrs: noinline nounwind optnone uwtable
define void @AES128_ECB_decrypt(i8* %input, i8* %key, i8* %output) #0 {
entry:
  %input.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %output.addr = alloca i8*, align 8
  store i8* %input, i8** %input.addr, align 8
  store i8* %key, i8** %key.addr, align 8
  store i8* %output, i8** %output.addr, align 8
  %0 = load i8*, i8** %output.addr, align 8
  %1 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %0, i8* %1) #11
  %2 = load i8*, i8** %output.addr, align 8
  %3 = bitcast i8* %2 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %3, [4 x [4 x i8]]** @state, align 8
  %4 = load i8*, i8** %key.addr, align 8
  store i8* %4, i8** @Key, align 8
  call void @KeyExpansion() #11
  call void @InvCipher() #11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @InvCipher() #0 {
entry:
  %round = alloca i8, align 1
  store i8 0, i8* %round, align 1
  call void @AddRoundKey(i8 zeroext 10) #11
  store i8 9, i8* %round, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8, i8* %round, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp sgt i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @InvShiftRows() #11
  call void @InvSubBytes() #11
  %1 = load i8, i8* %round, align 1
  call void @AddRoundKey(i8 zeroext %1) #11
  call void @InvMixColumns() #11
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i8, i8* %round, align 1
  %dec = add i8 %2, -1
  store i8 %dec, i8* %round, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @InvShiftRows() #11
  call void @InvSubBytes() #11
  call void @AddRoundKey(i8 zeroext 0) #11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @InvShiftRows() #0 {
entry:
  %temp = alloca i8, align 1
  %0 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %0, i64 0, i64 3
  %arrayidx1 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx, i64 0, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  store i8 %1, i8* %temp, align 1
  %2 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx2 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %2, i64 0, i64 2
  %arrayidx3 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx2, i64 0, i64 1
  %3 = load i8, i8* %arrayidx3, align 1
  %4 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx4 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %4, i64 0, i64 3
  %arrayidx5 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx4, i64 0, i64 1
  store i8 %3, i8* %arrayidx5, align 1
  %5 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx6 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %5, i64 0, i64 1
  %arrayidx7 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx6, i64 0, i64 1
  %6 = load i8, i8* %arrayidx7, align 1
  %7 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx8 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %7, i64 0, i64 2
  %arrayidx9 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx8, i64 0, i64 1
  store i8 %6, i8* %arrayidx9, align 1
  %8 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx10 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %8, i64 0, i64 0
  %arrayidx11 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx10, i64 0, i64 1
  %9 = load i8, i8* %arrayidx11, align 1
  %10 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx12 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %10, i64 0, i64 1
  %arrayidx13 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx12, i64 0, i64 1
  store i8 %9, i8* %arrayidx13, align 1
  %11 = load i8, i8* %temp, align 1
  %12 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx14 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %12, i64 0, i64 0
  %arrayidx15 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx14, i64 0, i64 1
  store i8 %11, i8* %arrayidx15, align 1
  %13 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx16 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %13, i64 0, i64 0
  %arrayidx17 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx16, i64 0, i64 2
  %14 = load i8, i8* %arrayidx17, align 1
  store i8 %14, i8* %temp, align 1
  %15 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx18 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %15, i64 0, i64 2
  %arrayidx19 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx18, i64 0, i64 2
  %16 = load i8, i8* %arrayidx19, align 1
  %17 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx20 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %17, i64 0, i64 0
  %arrayidx21 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx20, i64 0, i64 2
  store i8 %16, i8* %arrayidx21, align 1
  %18 = load i8, i8* %temp, align 1
  %19 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx22 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %19, i64 0, i64 2
  %arrayidx23 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx22, i64 0, i64 2
  store i8 %18, i8* %arrayidx23, align 1
  %20 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx24 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %20, i64 0, i64 1
  %arrayidx25 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx24, i64 0, i64 2
  %21 = load i8, i8* %arrayidx25, align 1
  store i8 %21, i8* %temp, align 1
  %22 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx26 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %22, i64 0, i64 3
  %arrayidx27 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx26, i64 0, i64 2
  %23 = load i8, i8* %arrayidx27, align 1
  %24 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx28 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %24, i64 0, i64 1
  %arrayidx29 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx28, i64 0, i64 2
  store i8 %23, i8* %arrayidx29, align 1
  %25 = load i8, i8* %temp, align 1
  %26 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx30 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %26, i64 0, i64 3
  %arrayidx31 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx30, i64 0, i64 2
  store i8 %25, i8* %arrayidx31, align 1
  %27 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx32 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %27, i64 0, i64 0
  %arrayidx33 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx32, i64 0, i64 3
  %28 = load i8, i8* %arrayidx33, align 1
  store i8 %28, i8* %temp, align 1
  %29 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx34 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %29, i64 0, i64 1
  %arrayidx35 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx34, i64 0, i64 3
  %30 = load i8, i8* %arrayidx35, align 1
  %31 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx36 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %31, i64 0, i64 0
  %arrayidx37 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx36, i64 0, i64 3
  store i8 %30, i8* %arrayidx37, align 1
  %32 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx38 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %32, i64 0, i64 2
  %arrayidx39 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx38, i64 0, i64 3
  %33 = load i8, i8* %arrayidx39, align 1
  %34 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx40 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %34, i64 0, i64 1
  %arrayidx41 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx40, i64 0, i64 3
  store i8 %33, i8* %arrayidx41, align 1
  %35 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx42 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %35, i64 0, i64 3
  %arrayidx43 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx42, i64 0, i64 3
  %36 = load i8, i8* %arrayidx43, align 1
  %37 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx44 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %37, i64 0, i64 2
  %arrayidx45 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx44, i64 0, i64 3
  store i8 %36, i8* %arrayidx45, align 1
  %38 = load i8, i8* %temp, align 1
  %39 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %arrayidx46 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %39, i64 0, i64 3
  %arrayidx47 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx46, i64 0, i64 3
  store i8 %38, i8* %arrayidx47, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @InvSubBytes() #0 {
entry:
  %i = alloca i8, align 1
  %j = alloca i8, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i8, i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %j, align 1
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i8, i8* %j, align 1
  %conv3 = zext i8 %1 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %2 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %3 = load i8, i8* %j, align 1
  %idxprom = zext i8 %3 to i64
  %arrayidx = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %2, i64 0, i64 %idxprom
  %4 = load i8, i8* %i, align 1
  %idxprom7 = zext i8 %4 to i64
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx, i64 0, i64 %idxprom7
  %5 = load i8, i8* %arrayidx8, align 1
  %call = call zeroext i8 @getSBoxInvert(i8 zeroext %5) #11
  %6 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %7 = load i8, i8* %j, align 1
  %idxprom9 = zext i8 %7 to i64
  %arrayidx10 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %6, i64 0, i64 %idxprom9
  %8 = load i8, i8* %i, align 1
  %idxprom11 = zext i8 %8 to i64
  %arrayidx12 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx10, i64 0, i64 %idxprom11
  store i8 %call, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %9 = load i8, i8* %j, align 1
  %inc = add i8 %9, 1
  store i8 %inc, i8* %j, align 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %10 = load i8, i8* %i, align 1
  %inc14 = add i8 %10, 1
  store i8 %inc14, i8* %i, align 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @InvMixColumns() #0 {
entry:
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i8, align 1
  %d = alloca i8, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %1, i64 0, i64 %idxprom
  %arrayidx1 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx, i64 0, i64 0
  %3 = load i8, i8* %arrayidx1, align 1
  store i8 %3, i8* %a, align 1
  %4 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %4, i64 0, i64 %idxprom2
  %arrayidx4 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx3, i64 0, i64 1
  %6 = load i8, i8* %arrayidx4, align 1
  store i8 %6, i8* %b, align 1
  %7 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %7, i64 0, i64 %idxprom5
  %arrayidx7 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx6, i64 0, i64 2
  %9 = load i8, i8* %arrayidx7, align 1
  store i8 %9, i8* %c, align 1
  %10 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %11 to i64
  %arrayidx9 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %10, i64 0, i64 %idxprom8
  %arrayidx10 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx9, i64 0, i64 3
  %12 = load i8, i8* %arrayidx10, align 1
  store i8 %12, i8* %d, align 1
  %13 = load i8, i8* %a, align 1
  %conv = zext i8 %13 to i32
  %mul = mul nsw i32 0, %conv
  %14 = load i8, i8* %a, align 1
  %call = call zeroext i8 @xtime(i8 zeroext %14) #11
  %conv11 = zext i8 %call to i32
  %mul12 = mul nsw i32 1, %conv11
  %xor = xor i32 %mul, %mul12
  %15 = load i8, i8* %a, align 1
  %call13 = call zeroext i8 @xtime(i8 zeroext %15) #11
  %call14 = call zeroext i8 @xtime(i8 zeroext %call13) #11
  %conv15 = zext i8 %call14 to i32
  %mul16 = mul nsw i32 1, %conv15
  %xor17 = xor i32 %xor, %mul16
  %16 = load i8, i8* %a, align 1
  %call18 = call zeroext i8 @xtime(i8 zeroext %16) #11
  %call19 = call zeroext i8 @xtime(i8 zeroext %call18) #11
  %call20 = call zeroext i8 @xtime(i8 zeroext %call19) #11
  %conv21 = zext i8 %call20 to i32
  %mul22 = mul nsw i32 1, %conv21
  %xor23 = xor i32 %xor17, %mul22
  %17 = load i8, i8* %a, align 1
  %call24 = call zeroext i8 @xtime(i8 zeroext %17) #11
  %call25 = call zeroext i8 @xtime(i8 zeroext %call24) #11
  %call26 = call zeroext i8 @xtime(i8 zeroext %call25) #11
  %call27 = call zeroext i8 @xtime(i8 zeroext %call26) #11
  %conv28 = zext i8 %call27 to i32
  %mul29 = mul nsw i32 0, %conv28
  %xor30 = xor i32 %xor23, %mul29
  %18 = load i8, i8* %b, align 1
  %conv31 = zext i8 %18 to i32
  %mul32 = mul nsw i32 1, %conv31
  %19 = load i8, i8* %b, align 1
  %call33 = call zeroext i8 @xtime(i8 zeroext %19) #11
  %conv34 = zext i8 %call33 to i32
  %mul35 = mul nsw i32 1, %conv34
  %xor36 = xor i32 %mul32, %mul35
  %20 = load i8, i8* %b, align 1
  %call37 = call zeroext i8 @xtime(i8 zeroext %20) #11
  %call38 = call zeroext i8 @xtime(i8 zeroext %call37) #11
  %conv39 = zext i8 %call38 to i32
  %mul40 = mul nsw i32 0, %conv39
  %xor41 = xor i32 %xor36, %mul40
  %21 = load i8, i8* %b, align 1
  %call42 = call zeroext i8 @xtime(i8 zeroext %21) #11
  %call43 = call zeroext i8 @xtime(i8 zeroext %call42) #11
  %call44 = call zeroext i8 @xtime(i8 zeroext %call43) #11
  %conv45 = zext i8 %call44 to i32
  %mul46 = mul nsw i32 1, %conv45
  %xor47 = xor i32 %xor41, %mul46
  %22 = load i8, i8* %b, align 1
  %call48 = call zeroext i8 @xtime(i8 zeroext %22) #11
  %call49 = call zeroext i8 @xtime(i8 zeroext %call48) #11
  %call50 = call zeroext i8 @xtime(i8 zeroext %call49) #11
  %call51 = call zeroext i8 @xtime(i8 zeroext %call50) #11
  %conv52 = zext i8 %call51 to i32
  %mul53 = mul nsw i32 0, %conv52
  %xor54 = xor i32 %xor47, %mul53
  %xor55 = xor i32 %xor30, %xor54
  %23 = load i8, i8* %c, align 1
  %conv56 = zext i8 %23 to i32
  %mul57 = mul nsw i32 1, %conv56
  %24 = load i8, i8* %c, align 1
  %call58 = call zeroext i8 @xtime(i8 zeroext %24) #11
  %conv59 = zext i8 %call58 to i32
  %mul60 = mul nsw i32 0, %conv59
  %xor61 = xor i32 %mul57, %mul60
  %25 = load i8, i8* %c, align 1
  %call62 = call zeroext i8 @xtime(i8 zeroext %25) #11
  %call63 = call zeroext i8 @xtime(i8 zeroext %call62) #11
  %conv64 = zext i8 %call63 to i32
  %mul65 = mul nsw i32 1, %conv64
  %xor66 = xor i32 %xor61, %mul65
  %26 = load i8, i8* %c, align 1
  %call67 = call zeroext i8 @xtime(i8 zeroext %26) #11
  %call68 = call zeroext i8 @xtime(i8 zeroext %call67) #11
  %call69 = call zeroext i8 @xtime(i8 zeroext %call68) #11
  %conv70 = zext i8 %call69 to i32
  %mul71 = mul nsw i32 1, %conv70
  %xor72 = xor i32 %xor66, %mul71
  %27 = load i8, i8* %c, align 1
  %call73 = call zeroext i8 @xtime(i8 zeroext %27) #11
  %call74 = call zeroext i8 @xtime(i8 zeroext %call73) #11
  %call75 = call zeroext i8 @xtime(i8 zeroext %call74) #11
  %call76 = call zeroext i8 @xtime(i8 zeroext %call75) #11
  %conv77 = zext i8 %call76 to i32
  %mul78 = mul nsw i32 0, %conv77
  %xor79 = xor i32 %xor72, %mul78
  %xor80 = xor i32 %xor55, %xor79
  %28 = load i8, i8* %d, align 1
  %conv81 = zext i8 %28 to i32
  %mul82 = mul nsw i32 1, %conv81
  %29 = load i8, i8* %d, align 1
  %call83 = call zeroext i8 @xtime(i8 zeroext %29) #11
  %conv84 = zext i8 %call83 to i32
  %mul85 = mul nsw i32 0, %conv84
  %xor86 = xor i32 %mul82, %mul85
  %30 = load i8, i8* %d, align 1
  %call87 = call zeroext i8 @xtime(i8 zeroext %30) #11
  %call88 = call zeroext i8 @xtime(i8 zeroext %call87) #11
  %conv89 = zext i8 %call88 to i32
  %mul90 = mul nsw i32 0, %conv89
  %xor91 = xor i32 %xor86, %mul90
  %31 = load i8, i8* %d, align 1
  %call92 = call zeroext i8 @xtime(i8 zeroext %31) #11
  %call93 = call zeroext i8 @xtime(i8 zeroext %call92) #11
  %call94 = call zeroext i8 @xtime(i8 zeroext %call93) #11
  %conv95 = zext i8 %call94 to i32
  %mul96 = mul nsw i32 1, %conv95
  %xor97 = xor i32 %xor91, %mul96
  %32 = load i8, i8* %d, align 1
  %call98 = call zeroext i8 @xtime(i8 zeroext %32) #11
  %call99 = call zeroext i8 @xtime(i8 zeroext %call98) #11
  %call100 = call zeroext i8 @xtime(i8 zeroext %call99) #11
  %call101 = call zeroext i8 @xtime(i8 zeroext %call100) #11
  %conv102 = zext i8 %call101 to i32
  %mul103 = mul nsw i32 0, %conv102
  %xor104 = xor i32 %xor97, %mul103
  %xor105 = xor i32 %xor80, %xor104
  %conv106 = trunc i32 %xor105 to i8
  %33 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %34 = load i32, i32* %i, align 4
  %idxprom107 = sext i32 %34 to i64
  %arrayidx108 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %33, i64 0, i64 %idxprom107
  %arrayidx109 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx108, i64 0, i64 0
  store i8 %conv106, i8* %arrayidx109, align 1
  %35 = load i8, i8* %a, align 1
  %conv110 = zext i8 %35 to i32
  %mul111 = mul nsw i32 1, %conv110
  %36 = load i8, i8* %a, align 1
  %call112 = call zeroext i8 @xtime(i8 zeroext %36) #11
  %conv113 = zext i8 %call112 to i32
  %mul114 = mul nsw i32 0, %conv113
  %xor115 = xor i32 %mul111, %mul114
  %37 = load i8, i8* %a, align 1
  %call116 = call zeroext i8 @xtime(i8 zeroext %37) #11
  %call117 = call zeroext i8 @xtime(i8 zeroext %call116) #11
  %conv118 = zext i8 %call117 to i32
  %mul119 = mul nsw i32 0, %conv118
  %xor120 = xor i32 %xor115, %mul119
  %38 = load i8, i8* %a, align 1
  %call121 = call zeroext i8 @xtime(i8 zeroext %38) #11
  %call122 = call zeroext i8 @xtime(i8 zeroext %call121) #11
  %call123 = call zeroext i8 @xtime(i8 zeroext %call122) #11
  %conv124 = zext i8 %call123 to i32
  %mul125 = mul nsw i32 1, %conv124
  %xor126 = xor i32 %xor120, %mul125
  %39 = load i8, i8* %a, align 1
  %call127 = call zeroext i8 @xtime(i8 zeroext %39) #11
  %call128 = call zeroext i8 @xtime(i8 zeroext %call127) #11
  %call129 = call zeroext i8 @xtime(i8 zeroext %call128) #11
  %call130 = call zeroext i8 @xtime(i8 zeroext %call129) #11
  %conv131 = zext i8 %call130 to i32
  %mul132 = mul nsw i32 0, %conv131
  %xor133 = xor i32 %xor126, %mul132
  %40 = load i8, i8* %b, align 1
  %conv134 = zext i8 %40 to i32
  %mul135 = mul nsw i32 0, %conv134
  %41 = load i8, i8* %b, align 1
  %call136 = call zeroext i8 @xtime(i8 zeroext %41) #11
  %conv137 = zext i8 %call136 to i32
  %mul138 = mul nsw i32 1, %conv137
  %xor139 = xor i32 %mul135, %mul138
  %42 = load i8, i8* %b, align 1
  %call140 = call zeroext i8 @xtime(i8 zeroext %42) #11
  %call141 = call zeroext i8 @xtime(i8 zeroext %call140) #11
  %conv142 = zext i8 %call141 to i32
  %mul143 = mul nsw i32 1, %conv142
  %xor144 = xor i32 %xor139, %mul143
  %43 = load i8, i8* %b, align 1
  %call145 = call zeroext i8 @xtime(i8 zeroext %43) #11
  %call146 = call zeroext i8 @xtime(i8 zeroext %call145) #11
  %call147 = call zeroext i8 @xtime(i8 zeroext %call146) #11
  %conv148 = zext i8 %call147 to i32
  %mul149 = mul nsw i32 1, %conv148
  %xor150 = xor i32 %xor144, %mul149
  %44 = load i8, i8* %b, align 1
  %call151 = call zeroext i8 @xtime(i8 zeroext %44) #11
  %call152 = call zeroext i8 @xtime(i8 zeroext %call151) #11
  %call153 = call zeroext i8 @xtime(i8 zeroext %call152) #11
  %call154 = call zeroext i8 @xtime(i8 zeroext %call153) #11
  %conv155 = zext i8 %call154 to i32
  %mul156 = mul nsw i32 0, %conv155
  %xor157 = xor i32 %xor150, %mul156
  %xor158 = xor i32 %xor133, %xor157
  %45 = load i8, i8* %c, align 1
  %conv159 = zext i8 %45 to i32
  %mul160 = mul nsw i32 1, %conv159
  %46 = load i8, i8* %c, align 1
  %call161 = call zeroext i8 @xtime(i8 zeroext %46) #11
  %conv162 = zext i8 %call161 to i32
  %mul163 = mul nsw i32 1, %conv162
  %xor164 = xor i32 %mul160, %mul163
  %47 = load i8, i8* %c, align 1
  %call165 = call zeroext i8 @xtime(i8 zeroext %47) #11
  %call166 = call zeroext i8 @xtime(i8 zeroext %call165) #11
  %conv167 = zext i8 %call166 to i32
  %mul168 = mul nsw i32 0, %conv167
  %xor169 = xor i32 %xor164, %mul168
  %48 = load i8, i8* %c, align 1
  %call170 = call zeroext i8 @xtime(i8 zeroext %48) #11
  %call171 = call zeroext i8 @xtime(i8 zeroext %call170) #11
  %call172 = call zeroext i8 @xtime(i8 zeroext %call171) #11
  %conv173 = zext i8 %call172 to i32
  %mul174 = mul nsw i32 1, %conv173
  %xor175 = xor i32 %xor169, %mul174
  %49 = load i8, i8* %c, align 1
  %call176 = call zeroext i8 @xtime(i8 zeroext %49) #11
  %call177 = call zeroext i8 @xtime(i8 zeroext %call176) #11
  %call178 = call zeroext i8 @xtime(i8 zeroext %call177) #11
  %call179 = call zeroext i8 @xtime(i8 zeroext %call178) #11
  %conv180 = zext i8 %call179 to i32
  %mul181 = mul nsw i32 0, %conv180
  %xor182 = xor i32 %xor175, %mul181
  %xor183 = xor i32 %xor158, %xor182
  %50 = load i8, i8* %d, align 1
  %conv184 = zext i8 %50 to i32
  %mul185 = mul nsw i32 1, %conv184
  %51 = load i8, i8* %d, align 1
  %call186 = call zeroext i8 @xtime(i8 zeroext %51) #11
  %conv187 = zext i8 %call186 to i32
  %mul188 = mul nsw i32 0, %conv187
  %xor189 = xor i32 %mul185, %mul188
  %52 = load i8, i8* %d, align 1
  %call190 = call zeroext i8 @xtime(i8 zeroext %52) #11
  %call191 = call zeroext i8 @xtime(i8 zeroext %call190) #11
  %conv192 = zext i8 %call191 to i32
  %mul193 = mul nsw i32 1, %conv192
  %xor194 = xor i32 %xor189, %mul193
  %53 = load i8, i8* %d, align 1
  %call195 = call zeroext i8 @xtime(i8 zeroext %53) #11
  %call196 = call zeroext i8 @xtime(i8 zeroext %call195) #11
  %call197 = call zeroext i8 @xtime(i8 zeroext %call196) #11
  %conv198 = zext i8 %call197 to i32
  %mul199 = mul nsw i32 1, %conv198
  %xor200 = xor i32 %xor194, %mul199
  %54 = load i8, i8* %d, align 1
  %call201 = call zeroext i8 @xtime(i8 zeroext %54) #11
  %call202 = call zeroext i8 @xtime(i8 zeroext %call201) #11
  %call203 = call zeroext i8 @xtime(i8 zeroext %call202) #11
  %call204 = call zeroext i8 @xtime(i8 zeroext %call203) #11
  %conv205 = zext i8 %call204 to i32
  %mul206 = mul nsw i32 0, %conv205
  %xor207 = xor i32 %xor200, %mul206
  %xor208 = xor i32 %xor183, %xor207
  %conv209 = trunc i32 %xor208 to i8
  %55 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %56 = load i32, i32* %i, align 4
  %idxprom210 = sext i32 %56 to i64
  %arrayidx211 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %55, i64 0, i64 %idxprom210
  %arrayidx212 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx211, i64 0, i64 1
  store i8 %conv209, i8* %arrayidx212, align 1
  %57 = load i8, i8* %a, align 1
  %conv213 = zext i8 %57 to i32
  %mul214 = mul nsw i32 1, %conv213
  %58 = load i8, i8* %a, align 1
  %call215 = call zeroext i8 @xtime(i8 zeroext %58) #11
  %conv216 = zext i8 %call215 to i32
  %mul217 = mul nsw i32 0, %conv216
  %xor218 = xor i32 %mul214, %mul217
  %59 = load i8, i8* %a, align 1
  %call219 = call zeroext i8 @xtime(i8 zeroext %59) #11
  %call220 = call zeroext i8 @xtime(i8 zeroext %call219) #11
  %conv221 = zext i8 %call220 to i32
  %mul222 = mul nsw i32 1, %conv221
  %xor223 = xor i32 %xor218, %mul222
  %60 = load i8, i8* %a, align 1
  %call224 = call zeroext i8 @xtime(i8 zeroext %60) #11
  %call225 = call zeroext i8 @xtime(i8 zeroext %call224) #11
  %call226 = call zeroext i8 @xtime(i8 zeroext %call225) #11
  %conv227 = zext i8 %call226 to i32
  %mul228 = mul nsw i32 1, %conv227
  %xor229 = xor i32 %xor223, %mul228
  %61 = load i8, i8* %a, align 1
  %call230 = call zeroext i8 @xtime(i8 zeroext %61) #11
  %call231 = call zeroext i8 @xtime(i8 zeroext %call230) #11
  %call232 = call zeroext i8 @xtime(i8 zeroext %call231) #11
  %call233 = call zeroext i8 @xtime(i8 zeroext %call232) #11
  %conv234 = zext i8 %call233 to i32
  %mul235 = mul nsw i32 0, %conv234
  %xor236 = xor i32 %xor229, %mul235
  %62 = load i8, i8* %b, align 1
  %conv237 = zext i8 %62 to i32
  %mul238 = mul nsw i32 1, %conv237
  %63 = load i8, i8* %b, align 1
  %call239 = call zeroext i8 @xtime(i8 zeroext %63) #11
  %conv240 = zext i8 %call239 to i32
  %mul241 = mul nsw i32 0, %conv240
  %xor242 = xor i32 %mul238, %mul241
  %64 = load i8, i8* %b, align 1
  %call243 = call zeroext i8 @xtime(i8 zeroext %64) #11
  %call244 = call zeroext i8 @xtime(i8 zeroext %call243) #11
  %conv245 = zext i8 %call244 to i32
  %mul246 = mul nsw i32 0, %conv245
  %xor247 = xor i32 %xor242, %mul246
  %65 = load i8, i8* %b, align 1
  %call248 = call zeroext i8 @xtime(i8 zeroext %65) #11
  %call249 = call zeroext i8 @xtime(i8 zeroext %call248) #11
  %call250 = call zeroext i8 @xtime(i8 zeroext %call249) #11
  %conv251 = zext i8 %call250 to i32
  %mul252 = mul nsw i32 1, %conv251
  %xor253 = xor i32 %xor247, %mul252
  %66 = load i8, i8* %b, align 1
  %call254 = call zeroext i8 @xtime(i8 zeroext %66) #11
  %call255 = call zeroext i8 @xtime(i8 zeroext %call254) #11
  %call256 = call zeroext i8 @xtime(i8 zeroext %call255) #11
  %call257 = call zeroext i8 @xtime(i8 zeroext %call256) #11
  %conv258 = zext i8 %call257 to i32
  %mul259 = mul nsw i32 0, %conv258
  %xor260 = xor i32 %xor253, %mul259
  %xor261 = xor i32 %xor236, %xor260
  %67 = load i8, i8* %c, align 1
  %conv262 = zext i8 %67 to i32
  %mul263 = mul nsw i32 0, %conv262
  %68 = load i8, i8* %c, align 1
  %call264 = call zeroext i8 @xtime(i8 zeroext %68) #11
  %conv265 = zext i8 %call264 to i32
  %mul266 = mul nsw i32 1, %conv265
  %xor267 = xor i32 %mul263, %mul266
  %69 = load i8, i8* %c, align 1
  %call268 = call zeroext i8 @xtime(i8 zeroext %69) #11
  %call269 = call zeroext i8 @xtime(i8 zeroext %call268) #11
  %conv270 = zext i8 %call269 to i32
  %mul271 = mul nsw i32 1, %conv270
  %xor272 = xor i32 %xor267, %mul271
  %70 = load i8, i8* %c, align 1
  %call273 = call zeroext i8 @xtime(i8 zeroext %70) #11
  %call274 = call zeroext i8 @xtime(i8 zeroext %call273) #11
  %call275 = call zeroext i8 @xtime(i8 zeroext %call274) #11
  %conv276 = zext i8 %call275 to i32
  %mul277 = mul nsw i32 1, %conv276
  %xor278 = xor i32 %xor272, %mul277
  %71 = load i8, i8* %c, align 1
  %call279 = call zeroext i8 @xtime(i8 zeroext %71) #11
  %call280 = call zeroext i8 @xtime(i8 zeroext %call279) #11
  %call281 = call zeroext i8 @xtime(i8 zeroext %call280) #11
  %call282 = call zeroext i8 @xtime(i8 zeroext %call281) #11
  %conv283 = zext i8 %call282 to i32
  %mul284 = mul nsw i32 0, %conv283
  %xor285 = xor i32 %xor278, %mul284
  %xor286 = xor i32 %xor261, %xor285
  %72 = load i8, i8* %d, align 1
  %conv287 = zext i8 %72 to i32
  %mul288 = mul nsw i32 1, %conv287
  %73 = load i8, i8* %d, align 1
  %call289 = call zeroext i8 @xtime(i8 zeroext %73) #11
  %conv290 = zext i8 %call289 to i32
  %mul291 = mul nsw i32 1, %conv290
  %xor292 = xor i32 %mul288, %mul291
  %74 = load i8, i8* %d, align 1
  %call293 = call zeroext i8 @xtime(i8 zeroext %74) #11
  %call294 = call zeroext i8 @xtime(i8 zeroext %call293) #11
  %conv295 = zext i8 %call294 to i32
  %mul296 = mul nsw i32 0, %conv295
  %xor297 = xor i32 %xor292, %mul296
  %75 = load i8, i8* %d, align 1
  %call298 = call zeroext i8 @xtime(i8 zeroext %75) #11
  %call299 = call zeroext i8 @xtime(i8 zeroext %call298) #11
  %call300 = call zeroext i8 @xtime(i8 zeroext %call299) #11
  %conv301 = zext i8 %call300 to i32
  %mul302 = mul nsw i32 1, %conv301
  %xor303 = xor i32 %xor297, %mul302
  %76 = load i8, i8* %d, align 1
  %call304 = call zeroext i8 @xtime(i8 zeroext %76) #11
  %call305 = call zeroext i8 @xtime(i8 zeroext %call304) #11
  %call306 = call zeroext i8 @xtime(i8 zeroext %call305) #11
  %call307 = call zeroext i8 @xtime(i8 zeroext %call306) #11
  %conv308 = zext i8 %call307 to i32
  %mul309 = mul nsw i32 0, %conv308
  %xor310 = xor i32 %xor303, %mul309
  %xor311 = xor i32 %xor286, %xor310
  %conv312 = trunc i32 %xor311 to i8
  %77 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %78 = load i32, i32* %i, align 4
  %idxprom313 = sext i32 %78 to i64
  %arrayidx314 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %77, i64 0, i64 %idxprom313
  %arrayidx315 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx314, i64 0, i64 2
  store i8 %conv312, i8* %arrayidx315, align 1
  %79 = load i8, i8* %a, align 1
  %conv316 = zext i8 %79 to i32
  %mul317 = mul nsw i32 1, %conv316
  %80 = load i8, i8* %a, align 1
  %call318 = call zeroext i8 @xtime(i8 zeroext %80) #11
  %conv319 = zext i8 %call318 to i32
  %mul320 = mul nsw i32 1, %conv319
  %xor321 = xor i32 %mul317, %mul320
  %81 = load i8, i8* %a, align 1
  %call322 = call zeroext i8 @xtime(i8 zeroext %81) #11
  %call323 = call zeroext i8 @xtime(i8 zeroext %call322) #11
  %conv324 = zext i8 %call323 to i32
  %mul325 = mul nsw i32 0, %conv324
  %xor326 = xor i32 %xor321, %mul325
  %82 = load i8, i8* %a, align 1
  %call327 = call zeroext i8 @xtime(i8 zeroext %82) #11
  %call328 = call zeroext i8 @xtime(i8 zeroext %call327) #11
  %call329 = call zeroext i8 @xtime(i8 zeroext %call328) #11
  %conv330 = zext i8 %call329 to i32
  %mul331 = mul nsw i32 1, %conv330
  %xor332 = xor i32 %xor326, %mul331
  %83 = load i8, i8* %a, align 1
  %call333 = call zeroext i8 @xtime(i8 zeroext %83) #11
  %call334 = call zeroext i8 @xtime(i8 zeroext %call333) #11
  %call335 = call zeroext i8 @xtime(i8 zeroext %call334) #11
  %call336 = call zeroext i8 @xtime(i8 zeroext %call335) #11
  %conv337 = zext i8 %call336 to i32
  %mul338 = mul nsw i32 0, %conv337
  %xor339 = xor i32 %xor332, %mul338
  %84 = load i8, i8* %b, align 1
  %conv340 = zext i8 %84 to i32
  %mul341 = mul nsw i32 1, %conv340
  %85 = load i8, i8* %b, align 1
  %call342 = call zeroext i8 @xtime(i8 zeroext %85) #11
  %conv343 = zext i8 %call342 to i32
  %mul344 = mul nsw i32 0, %conv343
  %xor345 = xor i32 %mul341, %mul344
  %86 = load i8, i8* %b, align 1
  %call346 = call zeroext i8 @xtime(i8 zeroext %86) #11
  %call347 = call zeroext i8 @xtime(i8 zeroext %call346) #11
  %conv348 = zext i8 %call347 to i32
  %mul349 = mul nsw i32 1, %conv348
  %xor350 = xor i32 %xor345, %mul349
  %87 = load i8, i8* %b, align 1
  %call351 = call zeroext i8 @xtime(i8 zeroext %87) #11
  %call352 = call zeroext i8 @xtime(i8 zeroext %call351) #11
  %call353 = call zeroext i8 @xtime(i8 zeroext %call352) #11
  %conv354 = zext i8 %call353 to i32
  %mul355 = mul nsw i32 1, %conv354
  %xor356 = xor i32 %xor350, %mul355
  %88 = load i8, i8* %b, align 1
  %call357 = call zeroext i8 @xtime(i8 zeroext %88) #11
  %call358 = call zeroext i8 @xtime(i8 zeroext %call357) #11
  %call359 = call zeroext i8 @xtime(i8 zeroext %call358) #11
  %call360 = call zeroext i8 @xtime(i8 zeroext %call359) #11
  %conv361 = zext i8 %call360 to i32
  %mul362 = mul nsw i32 0, %conv361
  %xor363 = xor i32 %xor356, %mul362
  %xor364 = xor i32 %xor339, %xor363
  %89 = load i8, i8* %c, align 1
  %conv365 = zext i8 %89 to i32
  %mul366 = mul nsw i32 1, %conv365
  %90 = load i8, i8* %c, align 1
  %call367 = call zeroext i8 @xtime(i8 zeroext %90) #11
  %conv368 = zext i8 %call367 to i32
  %mul369 = mul nsw i32 0, %conv368
  %xor370 = xor i32 %mul366, %mul369
  %91 = load i8, i8* %c, align 1
  %call371 = call zeroext i8 @xtime(i8 zeroext %91) #11
  %call372 = call zeroext i8 @xtime(i8 zeroext %call371) #11
  %conv373 = zext i8 %call372 to i32
  %mul374 = mul nsw i32 0, %conv373
  %xor375 = xor i32 %xor370, %mul374
  %92 = load i8, i8* %c, align 1
  %call376 = call zeroext i8 @xtime(i8 zeroext %92) #11
  %call377 = call zeroext i8 @xtime(i8 zeroext %call376) #11
  %call378 = call zeroext i8 @xtime(i8 zeroext %call377) #11
  %conv379 = zext i8 %call378 to i32
  %mul380 = mul nsw i32 1, %conv379
  %xor381 = xor i32 %xor375, %mul380
  %93 = load i8, i8* %c, align 1
  %call382 = call zeroext i8 @xtime(i8 zeroext %93) #11
  %call383 = call zeroext i8 @xtime(i8 zeroext %call382) #11
  %call384 = call zeroext i8 @xtime(i8 zeroext %call383) #11
  %call385 = call zeroext i8 @xtime(i8 zeroext %call384) #11
  %conv386 = zext i8 %call385 to i32
  %mul387 = mul nsw i32 0, %conv386
  %xor388 = xor i32 %xor381, %mul387
  %xor389 = xor i32 %xor364, %xor388
  %94 = load i8, i8* %d, align 1
  %conv390 = zext i8 %94 to i32
  %mul391 = mul nsw i32 0, %conv390
  %95 = load i8, i8* %d, align 1
  %call392 = call zeroext i8 @xtime(i8 zeroext %95) #11
  %conv393 = zext i8 %call392 to i32
  %mul394 = mul nsw i32 1, %conv393
  %xor395 = xor i32 %mul391, %mul394
  %96 = load i8, i8* %d, align 1
  %call396 = call zeroext i8 @xtime(i8 zeroext %96) #11
  %call397 = call zeroext i8 @xtime(i8 zeroext %call396) #11
  %conv398 = zext i8 %call397 to i32
  %mul399 = mul nsw i32 1, %conv398
  %xor400 = xor i32 %xor395, %mul399
  %97 = load i8, i8* %d, align 1
  %call401 = call zeroext i8 @xtime(i8 zeroext %97) #11
  %call402 = call zeroext i8 @xtime(i8 zeroext %call401) #11
  %call403 = call zeroext i8 @xtime(i8 zeroext %call402) #11
  %conv404 = zext i8 %call403 to i32
  %mul405 = mul nsw i32 1, %conv404
  %xor406 = xor i32 %xor400, %mul405
  %98 = load i8, i8* %d, align 1
  %call407 = call zeroext i8 @xtime(i8 zeroext %98) #11
  %call408 = call zeroext i8 @xtime(i8 zeroext %call407) #11
  %call409 = call zeroext i8 @xtime(i8 zeroext %call408) #11
  %call410 = call zeroext i8 @xtime(i8 zeroext %call409) #11
  %conv411 = zext i8 %call410 to i32
  %mul412 = mul nsw i32 0, %conv411
  %xor413 = xor i32 %xor406, %mul412
  %xor414 = xor i32 %xor389, %xor413
  %conv415 = trunc i32 %xor414 to i8
  %99 = load [4 x [4 x i8]]*, [4 x [4 x i8]]** @state, align 8
  %100 = load i32, i32* %i, align 4
  %idxprom416 = sext i32 %100 to i64
  %arrayidx417 = getelementptr inbounds [4 x [4 x i8]], [4 x [4 x i8]]* %99, i64 0, i64 %idxprom416
  %arrayidx418 = getelementptr inbounds [4 x i8], [4 x i8]* %arrayidx417, i64 0, i64 3
  store i8 %conv415, i8* %arrayidx418, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %101 = load i32, i32* %i, align 4
  %inc = add nsw i32 %101, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @getSBoxInvert(i8 zeroext %num) #0 {
entry:
  %num.addr = alloca i8, align 1
  store i8 %num, i8* %num.addr, align 1
  %0 = load i8, i8* %num.addr, align 1
  %idxprom = zext i8 %0 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @rsbox, i64 0, i64 %idxprom
  %1 = load i8, i8* %arrayidx, align 1
  ret i8 %1
}

; Function Attrs: noinline nounwind optnone uwtable
define void @AES128_CBC_encrypt_buffer(i8* %output, i8* %input, i32 %length, i8* %key, i8* %iv) #0 {
entry:
  %output.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %length.addr = alloca i32, align 4
  %key.addr = alloca i8*, align 8
  %iv.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %remainders = alloca i8, align 1
  store i8* %output, i8** %output.addr, align 8
  store i8* %input, i8** %input.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i8* %key, i8** %key.addr, align 8
  store i8* %iv, i8** %iv.addr, align 8
  %0 = load i32, i32* %length.addr, align 4
  %rem = urem i32 %0, 16
  %conv = trunc i32 %rem to i8
  store i8 %conv, i8* %remainders, align 1
  %1 = load i8*, i8** %output.addr, align 8
  %2 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %1, i8* %2) #11
  %3 = load i8*, i8** %output.addr, align 8
  %4 = bitcast i8* %3 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %4, [4 x [4 x i8]]** @state, align 8
  %5 = load i8*, i8** %key.addr, align 8
  %cmp = icmp ne i8* null, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %key.addr, align 8
  store i8* %6, i8** @Key, align 8
  call void @KeyExpansion() #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i8*, i8** %iv.addr, align 8
  %cmp2 = icmp ne i8* %7, null
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %8 = load i8*, i8** %iv.addr, align 8
  store i8* %8, i8** @Iv, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %9 = load i64, i64* %i, align 8
  %10 = load i32, i32* %length.addr, align 4
  %conv6 = zext i32 %10 to i64
  %cmp7 = icmp ult i64 %9, %conv6
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %input.addr, align 8
  call void @XorWithIv(i8* %11) #11
  %12 = load i8*, i8** %output.addr, align 8
  %13 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %12, i8* %13) #11
  %14 = load i8*, i8** %output.addr, align 8
  %15 = bitcast i8* %14 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %15, [4 x [4 x i8]]** @state, align 8
  call void @Cipher() #11
  %16 = load i8*, i8** %output.addr, align 8
  store i8* %16, i8** @Iv, align 8
  %17 = load i8*, i8** %input.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %17, i64 16
  store i8* %add.ptr, i8** %input.addr, align 8
  %18 = load i8*, i8** %output.addr, align 8
  %add.ptr9 = getelementptr inbounds i8, i8* %18, i64 16
  store i8* %add.ptr9, i8** %output.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8
  %add = add i64 %19, 16
  store i64 %add, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i8, i8* %remainders, align 1
  %tobool = icmp ne i8 %20, 0
  br i1 %tobool, label %if.then10, label %if.end15

if.then10:                                        ; preds = %for.end
  %21 = load i8*, i8** %output.addr, align 8
  %22 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %21, i8* %22) #11
  %23 = load i8*, i8** %output.addr, align 8
  %24 = load i8, i8* %remainders, align 1
  %conv11 = zext i8 %24 to i32
  %idx.ext = sext i32 %conv11 to i64
  %add.ptr12 = getelementptr inbounds i8, i8* %23, i64 %idx.ext
  %25 = load i8, i8* %remainders, align 1
  %conv13 = zext i8 %25 to i32
  %sub = sub nsw i32 16, %conv13
  %conv14 = sext i32 %sub to i64
  %call = call i8* @memset(i8* %add.ptr12, i32 0, i64 %conv14) #13
  %26 = load i8*, i8** %output.addr, align 8
  %27 = bitcast i8* %26 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %27, [4 x [4 x i8]]** @state, align 8
  call void @Cipher() #11
  br label %if.end15

if.end15:                                         ; preds = %if.then10, %for.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @XorWithIv(i8* %buf) #0 {
entry:
  %buf.addr = alloca i8*, align 8
  %i = alloca i8, align 1
  store i8* %buf, i8** %buf.addr, align 8
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8, i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** @Iv, align 8
  %2 = load i8, i8* %i, align 1
  %idxprom = zext i8 %2 to i64
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1
  %conv2 = zext i8 %3 to i32
  %4 = load i8*, i8** %buf.addr, align 8
  %5 = load i8, i8* %i, align 1
  %idxprom3 = zext i8 %5 to i64
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %idxprom3
  %6 = load i8, i8* %arrayidx4, align 1
  %conv5 = zext i8 %6 to i32
  %xor = xor i32 %conv5, %conv2
  %conv6 = trunc i32 %xor to i8
  store i8 %conv6, i8* %arrayidx4, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i8, i8* %i, align 1
  %inc = add i8 %7, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define void @AES128_CBC_decrypt_buffer(i8* %output, i8* %input, i32 %length, i8* %key, i8* %iv) #0 {
entry:
  %output.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %length.addr = alloca i32, align 4
  %key.addr = alloca i8*, align 8
  %iv.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %remainders = alloca i8, align 1
  store i8* %output, i8** %output.addr, align 8
  store i8* %input, i8** %input.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i8* %key, i8** %key.addr, align 8
  store i8* %iv, i8** %iv.addr, align 8
  %0 = load i32, i32* %length.addr, align 4
  %rem = urem i32 %0, 16
  %conv = trunc i32 %rem to i8
  store i8 %conv, i8* %remainders, align 1
  %1 = load i8*, i8** %output.addr, align 8
  %2 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %1, i8* %2) #11
  %3 = load i8*, i8** %output.addr, align 8
  %4 = bitcast i8* %3 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %4, [4 x [4 x i8]]** @state, align 8
  %5 = load i8*, i8** %key.addr, align 8
  %cmp = icmp ne i8* null, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %key.addr, align 8
  store i8* %6, i8** @Key, align 8
  call void @KeyExpansion() #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i8*, i8** %iv.addr, align 8
  %cmp2 = icmp ne i8* %7, null
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %8 = load i8*, i8** %iv.addr, align 8
  store i8* %8, i8** @Iv, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %9 = load i64, i64* %i, align 8
  %10 = load i32, i32* %length.addr, align 4
  %conv6 = zext i32 %10 to i64
  %cmp7 = icmp ult i64 %9, %conv6
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %output.addr, align 8
  %12 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %11, i8* %12) #11
  %13 = load i8*, i8** %output.addr, align 8
  %14 = bitcast i8* %13 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %14, [4 x [4 x i8]]** @state, align 8
  call void @InvCipher() #11
  %15 = load i8*, i8** %output.addr, align 8
  call void @XorWithIv(i8* %15) #11
  %16 = load i8*, i8** %input.addr, align 8
  store i8* %16, i8** @Iv, align 8
  %17 = load i8*, i8** %input.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %17, i64 16
  store i8* %add.ptr, i8** %input.addr, align 8
  %18 = load i8*, i8** %output.addr, align 8
  %add.ptr9 = getelementptr inbounds i8, i8* %18, i64 16
  store i8* %add.ptr9, i8** %output.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8
  %add = add i64 %19, 16
  store i64 %add, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i8, i8* %remainders, align 1
  %tobool = icmp ne i8 %20, 0
  br i1 %tobool, label %if.then10, label %if.end15

if.then10:                                        ; preds = %for.end
  %21 = load i8*, i8** %output.addr, align 8
  %22 = load i8*, i8** %input.addr, align 8
  call void @BlockCopy(i8* %21, i8* %22) #11
  %23 = load i8*, i8** %output.addr, align 8
  %24 = load i8, i8* %remainders, align 1
  %conv11 = zext i8 %24 to i32
  %idx.ext = sext i32 %conv11 to i64
  %add.ptr12 = getelementptr inbounds i8, i8* %23, i64 %idx.ext
  %25 = load i8, i8* %remainders, align 1
  %conv13 = zext i8 %25 to i32
  %sub = sub nsw i32 16, %conv13
  %conv14 = sext i32 %sub to i64
  %call = call i8* @memset(i8* %add.ptr12, i32 0, i64 %conv14) #13
  %26 = load i8*, i8** %output.addr, align 8
  %27 = bitcast i8* %26 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %27, [4 x [4 x i8]]** @state, align 8
  call void @InvCipher() #11
  br label %if.end15

if.end15:                                         ; preds = %if.then10, %for.end
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @klee_overshift_check(i64 %bitWidth, i64 %shift) #9 !dbg !357 {
entry:
  %bitWidth.addr = alloca i64, align 8
  %shift.addr = alloca i64, align 8
  store i64 %bitWidth, i64* %bitWidth.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bitWidth.addr, metadata !362, metadata !DIExpression()), !dbg !363
  store i64 %shift, i64* %shift.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %shift.addr, metadata !364, metadata !DIExpression()), !dbg !365
  %0 = load i64, i64* %shift.addr, align 8, !dbg !366
  %1 = load i64, i64* %bitWidth.addr, align 8, !dbg !368
  %cmp = icmp uge i64 %0, %1, !dbg !369
  br i1 %cmp, label %if.then, label %if.end, !dbg !370

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.22, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.23, i64 0, i64 0)) #18, !dbg !371
  unreachable, !dbg !371

if.end:                                           ; preds = %entry
  ret void, !dbg !373
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #10

define internal void @klee.ctor_stub() {
entry:
  call void @cgc_initialize_flag_page()
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline noreturn nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin }
attributes #12 = { nobuiltin noreturn }
attributes #13 = { nobuiltin nounwind }
attributes #14 = { nobuiltin nounwind readonly }
attributes #15 = { nobuiltin noreturn nounwind }
attributes #16 = { nobuiltin nounwind readnone }
attributes #17 = { nounwind }
attributes #18 = { noreturn }

!llvm.dbg.cu = !{!0, !3, !5, !7, !9}
!llvm.ident = !{!11, !11, !11, !11, !11, !11, !11, !11}
!llvm.module.flags = !{!12, !13, !14, !15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 9.0.0 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/challenges/Palindrome/lib/libc.c", directory: "/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C99, file: !4, producer: "clang version 9.0.0 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!4 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/challenges/Palindrome/src/service.c", directory: "/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/challenges/Palindrome")
!5 = distinct !DICompileUnit(language: DW_LANG_C89, file: !6, producer: "clang version 9.0.0 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!6 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memcpy.c", directory: "/media/haoxin/SeagateData/haoxin-data/smu-research/klee/smu-build/runtime/FreeStanding")
!7 = distinct !DICompileUnit(language: DW_LANG_C89, file: !8, producer: "clang version 9.0.0 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!8 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memset.c", directory: "/media/haoxin/SeagateData/haoxin-data/smu-research/klee/smu-build/runtime/FreeStanding")
!9 = distinct !DICompileUnit(language: DW_LANG_C89, file: !10, producer: "clang version 9.0.0 (tags/RELEASE_900/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!10 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/Intrinsic/klee_overshift_check.c", directory: "/media/haoxin/SeagateData/haoxin-data/smu-research/klee/smu-build/runtime/Intrinsic")
!11 = !{!"clang version 9.0.0 (tags/RELEASE_900/final)"}
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = distinct !DISubprogram(name: "cgc_transmit_all", scope: !17, file: !17, line: 4, type: !18, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "challenges/Palindrome/lib/libc.c", directory: "/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios")
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20, !21, !24}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "cgc_size_t", file: !26, line: 19, baseType: !27)
!26 = !DIFile(filename: "include/libcgc.h", directory: "/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios")
!27 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocalVariable(name: "fd", arg: 1, scope: !16, file: !17, line: 4, type: !20)
!29 = !DILocation(line: 4, column: 26, scope: !16)
!30 = !DILocalVariable(name: "buf", arg: 2, scope: !16, file: !17, line: 4, type: !21)
!31 = !DILocation(line: 4, column: 42, scope: !16)
!32 = !DILocalVariable(name: "size", arg: 3, scope: !16, file: !17, line: 4, type: !24)
!33 = !DILocation(line: 4, column: 64, scope: !16)
!34 = !DILocalVariable(name: "sent", scope: !16, file: !17, line: 5, type: !25)
!35 = !DILocation(line: 5, column: 16, scope: !16)
!36 = !DILocalVariable(name: "sent_now", scope: !16, file: !17, line: 6, type: !25)
!37 = !DILocation(line: 6, column: 16, scope: !16)
!38 = !DILocalVariable(name: "ret", scope: !16, file: !17, line: 7, type: !20)
!39 = !DILocation(line: 7, column: 9, scope: !16)
!40 = !DILocation(line: 9, column: 10, scope: !41)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 9, column: 9)
!42 = !DILocation(line: 9, column: 9, scope: !16)
!43 = !DILocation(line: 10, column: 9, scope: !41)
!44 = !DILocation(line: 12, column: 10, scope: !45)
!45 = distinct !DILexicalBlock(scope: !16, file: !17, line: 12, column: 9)
!46 = !DILocation(line: 12, column: 9, scope: !16)
!47 = !DILocation(line: 13, column: 9, scope: !45)
!48 = !DILocation(line: 15, column: 5, scope: !16)
!49 = !DILocation(line: 15, column: 12, scope: !16)
!50 = !DILocation(line: 15, column: 19, scope: !16)
!51 = !DILocation(line: 15, column: 17, scope: !16)
!52 = !DILocation(line: 16, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !16, file: !17, line: 15, column: 25)
!54 = !DILocation(line: 16, column: 32, scope: !53)
!55 = !DILocation(line: 16, column: 38, scope: !53)
!56 = !DILocation(line: 16, column: 36, scope: !53)
!57 = !DILocation(line: 16, column: 44, scope: !53)
!58 = !DILocation(line: 16, column: 51, scope: !53)
!59 = !DILocation(line: 16, column: 49, scope: !53)
!60 = !DILocation(line: 16, column: 15, scope: !53)
!61 = !DILocation(line: 16, column: 13, scope: !53)
!62 = !DILocation(line: 17, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !53, file: !17, line: 17, column: 13)
!64 = !DILocation(line: 17, column: 22, scope: !63)
!65 = !DILocation(line: 17, column: 13, scope: !53)
!66 = !DILocation(line: 20, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !17, line: 17, column: 28)
!68 = !DILocation(line: 22, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !53, file: !17, line: 22, column: 13)
!70 = !DILocation(line: 22, column: 17, scope: !69)
!71 = !DILocation(line: 22, column: 13, scope: !53)
!72 = !DILocation(line: 23, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !17, line: 22, column: 23)
!74 = !DILocation(line: 25, column: 17, scope: !53)
!75 = !DILocation(line: 25, column: 14, scope: !53)
!76 = distinct !{!76, !48, !77}
!77 = !DILocation(line: 26, column: 5, scope: !16)
!78 = !DILocation(line: 28, column: 5, scope: !16)
!79 = !DILocation(line: 29, column: 1, scope: !16)
!80 = distinct !DISubprogram(name: "cgc_receive_delim", scope: !17, file: !17, line: 31, type: !81, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!20, !20, !83, !24, !23}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!84 = !DILocalVariable(name: "fd", arg: 1, scope: !80, file: !17, line: 31, type: !20)
!85 = !DILocation(line: 31, column: 27, scope: !80)
!86 = !DILocalVariable(name: "buf", arg: 2, scope: !80, file: !17, line: 31, type: !83)
!87 = !DILocation(line: 31, column: 37, scope: !80)
!88 = !DILocalVariable(name: "size", arg: 3, scope: !80, file: !17, line: 31, type: !24)
!89 = !DILocation(line: 31, column: 59, scope: !80)
!90 = !DILocalVariable(name: "delim", arg: 4, scope: !80, file: !17, line: 31, type: !23)
!91 = !DILocation(line: 31, column: 70, scope: !80)
!92 = !DILocalVariable(name: "rx", scope: !80, file: !17, line: 32, type: !25)
!93 = !DILocation(line: 32, column: 16, scope: !80)
!94 = !DILocalVariable(name: "rx_now", scope: !80, file: !17, line: 33, type: !25)
!95 = !DILocation(line: 33, column: 16, scope: !80)
!96 = !DILocalVariable(name: "ret", scope: !80, file: !17, line: 34, type: !20)
!97 = !DILocation(line: 34, column: 9, scope: !80)
!98 = !DILocation(line: 36, column: 10, scope: !99)
!99 = distinct !DILexicalBlock(scope: !80, file: !17, line: 36, column: 9)
!100 = !DILocation(line: 36, column: 9, scope: !80)
!101 = !DILocation(line: 37, column: 9, scope: !99)
!102 = !DILocation(line: 39, column: 10, scope: !103)
!103 = distinct !DILexicalBlock(scope: !80, file: !17, line: 39, column: 9)
!104 = !DILocation(line: 39, column: 9, scope: !80)
!105 = !DILocation(line: 40, column: 9, scope: !103)
!106 = !DILocation(line: 42, column: 5, scope: !80)
!107 = !DILocation(line: 42, column: 12, scope: !80)
!108 = !DILocation(line: 42, column: 17, scope: !80)
!109 = !DILocation(line: 42, column: 15, scope: !80)
!110 = !DILocation(line: 43, column: 27, scope: !111)
!111 = distinct !DILexicalBlock(scope: !80, file: !17, line: 42, column: 23)
!112 = !DILocation(line: 43, column: 31, scope: !111)
!113 = !DILocation(line: 43, column: 37, scope: !111)
!114 = !DILocation(line: 43, column: 35, scope: !111)
!115 = !DILocation(line: 43, column: 15, scope: !111)
!116 = !DILocation(line: 43, column: 13, scope: !111)
!117 = !DILocation(line: 44, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !17, line: 44, column: 13)
!119 = !DILocation(line: 44, column: 20, scope: !118)
!120 = !DILocation(line: 44, column: 13, scope: !111)
!121 = !DILocation(line: 47, column: 13, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 44, column: 26)
!123 = !DILocation(line: 49, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !111, file: !17, line: 49, column: 13)
!125 = !DILocation(line: 49, column: 17, scope: !124)
!126 = !DILocation(line: 49, column: 13, scope: !111)
!127 = !DILocation(line: 50, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !17, line: 49, column: 23)
!129 = !DILocation(line: 52, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !17, line: 52, column: 13)
!131 = !DILocation(line: 52, column: 17, scope: !130)
!132 = !DILocation(line: 52, column: 24, scope: !130)
!133 = !DILocation(line: 52, column: 21, scope: !130)
!134 = !DILocation(line: 52, column: 13, scope: !111)
!135 = !DILocation(line: 53, column: 12, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !17, line: 52, column: 31)
!137 = !DILocation(line: 55, column: 15, scope: !111)
!138 = !DILocation(line: 55, column: 12, scope: !111)
!139 = distinct !{!139, !106, !140}
!140 = !DILocation(line: 56, column: 5, scope: !80)
!141 = !DILocation(line: 58, column: 5, scope: !80)
!142 = !DILocation(line: 59, column: 1, scope: !80)
!143 = distinct !DISubprogram(name: "main", scope: !144, file: !144, line: 14, type: !145, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!144 = !DIFile(filename: "challenges/Palindrome/src/service.c", directory: "/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios")
!145 = !DISubroutineType(types: !146)
!146 = !{!20, !20, !147}
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!148 = !DILocalVariable(name: "cgc_argc", arg: 1, scope: !143, file: !144, line: 14, type: !20)
!149 = !DILocation(line: 14, column: 14, scope: !143)
!150 = !DILocalVariable(name: "cgc_argv", arg: 2, scope: !143, file: !144, line: 14, type: !147)
!151 = !DILocation(line: 14, column: 30, scope: !143)
!152 = !DILocalVariable(name: "r", scope: !143, file: !144, line: 15, type: !20)
!153 = !DILocation(line: 15, column: 9, scope: !143)
!154 = !DILocation(line: 17, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !143, file: !144, line: 17, column: 9)
!156 = !DILocation(line: 17, column: 47, scope: !155)
!157 = !DILocation(line: 17, column: 9, scope: !143)
!158 = !DILocation(line: 18, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !144, line: 17, column: 53)
!160 = !DILocation(line: 21, column: 5, scope: !143)
!161 = !DILocation(line: 22, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !163, file: !144, line: 22, column: 13)
!163 = distinct !DILexicalBlock(scope: !143, file: !144, line: 21, column: 13)
!164 = !DILocation(line: 22, column: 53, scope: !162)
!165 = !DILocation(line: 22, column: 13, scope: !163)
!166 = !DILocation(line: 23, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !144, line: 22, column: 59)
!168 = !DILocation(line: 25, column: 13, scope: !163)
!169 = !DILocation(line: 25, column: 11, scope: !163)
!170 = !DILocation(line: 26, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !144, line: 26, column: 13)
!172 = !DILocation(line: 26, column: 15, scope: !171)
!173 = !DILocation(line: 26, column: 13, scope: !163)
!174 = !DILocation(line: 27, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !144, line: 26, column: 21)
!176 = !DILocation(line: 29, column: 18, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !144, line: 29, column: 18)
!178 = !DILocation(line: 29, column: 20, scope: !177)
!179 = !DILocation(line: 29, column: 18, scope: !171)
!180 = !DILocation(line: 30, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !182, file: !144, line: 30, column: 17)
!182 = distinct !DILexicalBlock(scope: !177, file: !144, line: 29, column: 25)
!183 = !DILocation(line: 30, column: 55, scope: !181)
!184 = !DILocation(line: 30, column: 17, scope: !182)
!185 = !DILocation(line: 31, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !181, file: !144, line: 30, column: 61)
!187 = !DILocation(line: 33, column: 9, scope: !182)
!188 = !DILocation(line: 35, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !190, file: !144, line: 35, column: 17)
!190 = distinct !DILexicalBlock(scope: !177, file: !144, line: 34, column: 13)
!191 = !DILocation(line: 35, column: 57, scope: !189)
!192 = !DILocation(line: 35, column: 17, scope: !190)
!193 = !DILocation(line: 36, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !144, line: 35, column: 63)
!195 = distinct !{!195, !160, !196}
!196 = !DILocation(line: 39, column: 5, scope: !143)
!197 = !DILocation(line: 40, column: 5, scope: !143)
!198 = distinct !DISubprogram(name: "cgc_check", scope: !144, file: !144, line: 43, type: !199, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !3, retainedNodes: !2)
!199 = !DISubroutineType(types: !200)
!200 = !{!20}
!201 = !DILocalVariable(name: "len", scope: !198, file: !144, line: 44, type: !20)
!202 = !DILocation(line: 44, column: 9, scope: !198)
!203 = !DILocalVariable(name: "i", scope: !198, file: !144, line: 45, type: !20)
!204 = !DILocation(line: 45, column: 9, scope: !198)
!205 = !DILocalVariable(name: "pal", scope: !198, file: !144, line: 46, type: !20)
!206 = !DILocation(line: 46, column: 9, scope: !198)
!207 = !DILocalVariable(name: "string", scope: !198, file: !144, line: 47, type: !208)
!208 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 512, elements: !209)
!209 = !{!210}
!210 = !DISubrange(count: 64)
!211 = !DILocation(line: 47, column: 10, scope: !198)
!212 = !DILocation(line: 48, column: 12, scope: !213)
!213 = distinct !DILexicalBlock(scope: !198, file: !144, line: 48, column: 5)
!214 = !DILocation(line: 48, column: 10, scope: !213)
!215 = !DILocation(line: 48, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !144, line: 48, column: 5)
!217 = !DILocation(line: 48, column: 19, scope: !216)
!218 = !DILocation(line: 48, column: 5, scope: !213)
!219 = !DILocation(line: 49, column: 16, scope: !216)
!220 = !DILocation(line: 49, column: 9, scope: !216)
!221 = !DILocation(line: 49, column: 19, scope: !216)
!222 = !DILocation(line: 48, column: 38, scope: !216)
!223 = !DILocation(line: 48, column: 5, scope: !216)
!224 = distinct !{!224, !218, !225}
!225 = !DILocation(line: 49, column: 21, scope: !213)
!226 = !DILocation(line: 54, column: 30, scope: !227)
!227 = distinct !DILexicalBlock(scope: !198, file: !144, line: 54, column: 9)
!228 = !DILocation(line: 54, column: 9, scope: !227)
!229 = !DILocation(line: 54, column: 49, scope: !227)
!230 = !DILocation(line: 54, column: 9, scope: !198)
!231 = !DILocation(line: 55, column: 9, scope: !227)
!232 = !DILocation(line: 57, column: 11, scope: !233)
!233 = distinct !DILexicalBlock(scope: !198, file: !144, line: 57, column: 5)
!234 = !DILocation(line: 57, column: 9, scope: !233)
!235 = !DILocation(line: 57, column: 23, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !144, line: 57, column: 5)
!237 = !DILocation(line: 57, column: 16, scope: !236)
!238 = !DILocation(line: 57, column: 26, scope: !236)
!239 = !DILocation(line: 57, column: 5, scope: !233)
!240 = !DILocation(line: 58, column: 12, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !144, line: 57, column: 39)
!242 = !DILocation(line: 59, column: 5, scope: !241)
!243 = !DILocation(line: 57, column: 36, scope: !236)
!244 = !DILocation(line: 57, column: 5, scope: !236)
!245 = distinct !{!245, !239, !246}
!246 = !DILocation(line: 59, column: 5, scope: !233)
!247 = !DILocalVariable(name: "steps", scope: !198, file: !144, line: 60, type: !20)
!248 = !DILocation(line: 60, column: 9, scope: !198)
!249 = !DILocation(line: 60, column: 17, scope: !198)
!250 = !DILocation(line: 61, column: 8, scope: !251)
!251 = distinct !DILexicalBlock(scope: !198, file: !144, line: 61, column: 8)
!252 = !DILocation(line: 61, column: 12, scope: !251)
!253 = !DILocation(line: 61, column: 16, scope: !251)
!254 = !DILocation(line: 61, column: 8, scope: !198)
!255 = !DILocation(line: 62, column: 14, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !144, line: 61, column: 21)
!257 = !DILocation(line: 63, column: 5, scope: !256)
!258 = !DILocation(line: 64, column: 11, scope: !259)
!259 = distinct !DILexicalBlock(scope: !198, file: !144, line: 64, column: 5)
!260 = !DILocation(line: 64, column: 9, scope: !259)
!261 = !DILocation(line: 64, column: 16, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !144, line: 64, column: 5)
!263 = !DILocation(line: 64, column: 21, scope: !262)
!264 = !DILocation(line: 64, column: 26, scope: !262)
!265 = !DILocation(line: 64, column: 18, scope: !262)
!266 = !DILocation(line: 64, column: 5, scope: !259)
!267 = !DILocation(line: 65, column: 19, scope: !268)
!268 = distinct !DILexicalBlock(scope: !269, file: !144, line: 65, column: 12)
!269 = distinct !DILexicalBlock(scope: !262, file: !144, line: 64, column: 34)
!270 = !DILocation(line: 65, column: 12, scope: !268)
!271 = !DILocation(line: 65, column: 32, scope: !268)
!272 = !DILocation(line: 65, column: 35, scope: !268)
!273 = !DILocation(line: 65, column: 38, scope: !268)
!274 = !DILocation(line: 65, column: 37, scope: !268)
!275 = !DILocation(line: 65, column: 25, scope: !268)
!276 = !DILocation(line: 65, column: 22, scope: !268)
!277 = !DILocation(line: 65, column: 12, scope: !269)
!278 = !DILocation(line: 66, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !268, file: !144, line: 65, column: 41)
!280 = !DILocation(line: 67, column: 9, scope: !279)
!281 = !DILocation(line: 68, column: 5, scope: !269)
!282 = !DILocation(line: 64, column: 31, scope: !262)
!283 = !DILocation(line: 64, column: 5, scope: !262)
!284 = distinct !{!284, !266, !285}
!285 = !DILocation(line: 68, column: 5, scope: !259)
!286 = !DILocation(line: 69, column: 8, scope: !287)
!287 = distinct !DILexicalBlock(scope: !198, file: !144, line: 69, column: 8)
!288 = !DILocation(line: 69, column: 18, scope: !287)
!289 = !DILocation(line: 69, column: 8, scope: !198)
!290 = !DILocation(line: 70, column: 13, scope: !291)
!291 = distinct !DILexicalBlock(scope: !292, file: !144, line: 70, column: 13)
!292 = distinct !DILexicalBlock(scope: !287, file: !144, line: 69, column: 25)
!293 = !DILocation(line: 70, column: 65, scope: !291)
!294 = !DILocation(line: 70, column: 13, scope: !292)
!295 = !DILocation(line: 71, column: 13, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !144, line: 70, column: 71)
!297 = !DILocation(line: 73, column: 5, scope: !292)
!298 = !DILocation(line: 74, column: 12, scope: !198)
!299 = !DILocation(line: 74, column: 5, scope: !198)
!300 = !DILocation(line: 75, column: 1, scope: !198)
!301 = !{i32 -2146908278}
!302 = !{i32 -2146907866}
!303 = !{!"True"}
!304 = distinct !DISubprogram(name: "memcpy", scope: !305, file: !305, line: 12, type: !306, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !5, retainedNodes: !2)
!305 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memcpy.c", directory: "")
!306 = !DISubroutineType(types: !307)
!307 = !{!308, !308, !309, !311}
!308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!310 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!311 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !312, line: 46, baseType: !27)
!312 = !DIFile(filename: "dut-research/compilers/llvm-9.0/llvm-src/build/lib/clang/9.0.0/include/stddef.h", directory: "/media/haoxin/SeagateData/haoxin-data")
!313 = !DILocalVariable(name: "destaddr", arg: 1, scope: !304, file: !305, line: 12, type: !308)
!314 = !DILocation(line: 12, column: 20, scope: !304)
!315 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !304, file: !305, line: 12, type: !309)
!316 = !DILocation(line: 12, column: 42, scope: !304)
!317 = !DILocalVariable(name: "len", arg: 3, scope: !304, file: !305, line: 12, type: !311)
!318 = !DILocation(line: 12, column: 58, scope: !304)
!319 = !DILocalVariable(name: "dest", scope: !304, file: !305, line: 13, type: !83)
!320 = !DILocation(line: 13, column: 9, scope: !304)
!321 = !DILocation(line: 13, column: 16, scope: !304)
!322 = !DILocalVariable(name: "src", scope: !304, file: !305, line: 14, type: !21)
!323 = !DILocation(line: 14, column: 15, scope: !304)
!324 = !DILocation(line: 14, column: 21, scope: !304)
!325 = !DILocation(line: 16, column: 3, scope: !304)
!326 = !DILocation(line: 16, column: 13, scope: !304)
!327 = !DILocation(line: 16, column: 16, scope: !304)
!328 = !DILocation(line: 17, column: 19, scope: !304)
!329 = !DILocation(line: 17, column: 15, scope: !304)
!330 = !DILocation(line: 17, column: 10, scope: !304)
!331 = !DILocation(line: 17, column: 13, scope: !304)
!332 = distinct !{!332, !325, !328}
!333 = !DILocation(line: 18, column: 10, scope: !304)
!334 = !DILocation(line: 18, column: 3, scope: !304)
!335 = distinct !DISubprogram(name: "memset", scope: !336, file: !336, line: 12, type: !337, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !2)
!336 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/FreeStanding/memset.c", directory: "")
!337 = !DISubroutineType(types: !338)
!338 = !{!308, !308, !20, !311}
!339 = !DILocalVariable(name: "dst", arg: 1, scope: !335, file: !336, line: 12, type: !308)
!340 = !DILocation(line: 12, column: 20, scope: !335)
!341 = !DILocalVariable(name: "s", arg: 2, scope: !335, file: !336, line: 12, type: !20)
!342 = !DILocation(line: 12, column: 29, scope: !335)
!343 = !DILocalVariable(name: "count", arg: 3, scope: !335, file: !336, line: 12, type: !311)
!344 = !DILocation(line: 12, column: 39, scope: !335)
!345 = !DILocalVariable(name: "a", scope: !335, file: !336, line: 13, type: !83)
!346 = !DILocation(line: 13, column: 9, scope: !335)
!347 = !DILocation(line: 13, column: 13, scope: !335)
!348 = !DILocation(line: 14, column: 3, scope: !335)
!349 = !DILocation(line: 14, column: 15, scope: !335)
!350 = !DILocation(line: 14, column: 18, scope: !335)
!351 = !DILocation(line: 15, column: 12, scope: !335)
!352 = !DILocation(line: 15, column: 7, scope: !335)
!353 = !DILocation(line: 15, column: 10, scope: !335)
!354 = distinct !{!354, !348, !351}
!355 = !DILocation(line: 16, column: 10, scope: !335)
!356 = !DILocation(line: 16, column: 3, scope: !335)
!357 = distinct !DISubprogram(name: "klee_overshift_check", scope: !358, file: !358, line: 20, type: !359, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !2)
!358 = !DIFile(filename: "/home/haoxin/haoxin-data/smu-research/klee/runtime/Intrinsic/klee_overshift_check.c", directory: "")
!359 = !DISubroutineType(types: !360)
!360 = !{null, !361, !361}
!361 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!362 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !357, file: !358, line: 20, type: !361)
!363 = !DILocation(line: 20, column: 46, scope: !357)
!364 = !DILocalVariable(name: "shift", arg: 2, scope: !357, file: !358, line: 20, type: !361)
!365 = !DILocation(line: 20, column: 75, scope: !357)
!366 = !DILocation(line: 21, column: 7, scope: !367)
!367 = distinct !DILexicalBlock(scope: !357, file: !358, line: 21, column: 7)
!368 = !DILocation(line: 21, column: 16, scope: !367)
!369 = !DILocation(line: 21, column: 13, scope: !367)
!370 = !DILocation(line: 21, column: 7, scope: !357)
!371 = !DILocation(line: 27, column: 5, scope: !372)
!372 = distinct !DILexicalBlock(scope: !367, file: !358, line: 21, column: 26)
!373 = !DILocation(line: 29, column: 1, scope: !357)
