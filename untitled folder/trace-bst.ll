; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.bst = type { %struct.bstnode* }
%struct.bstnode = type { i32, %struct.bstnode*, %struct.bstnode*, i32 }

@.str = private unnamed_addr constant [5 x i8] c"tree\00", align 1
@.str.1 = private unnamed_addr constant [62 x i8] c"/u1/dtompkins/.seashell/projects/_A8_part2/q5-bst/trace-bst.c\00", align 1
@__PRETTY_FUNCTION__.trace_bst_core = private unnamed_addr constant [54 x i8] c"void trace_bst_core(const struct bst *, _Bool, _Bool)\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [33 x i8] c">>> [trace_bst] >> {empty tree}\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c">>> [trace_bst] >>\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"depth <= MAXDEPTH\00", align 1
@__PRETTY_FUNCTION__.bst_print_node = private unnamed_addr constant [68 x i8] c"void bst_print_node(const struct bstnode *, int, int, _Bool, _Bool)\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"node->right || node->left || node\00", align 1
@bst_print_node.pattern = internal global [1048578 x i8] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [10 x i8] c" %d [%d]\0A\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c" %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c" \E2\94\8F\E2\94\81\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c" +-\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c" \E2\94\97\E2\94\81\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c" \E2\94\83 \00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c" | \00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c" \E2\94\81\E2\94\81\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c" --\00", align 1
@.str.17 = private unnamed_addr constant [4 x i8] c"   \00", align 1
@.str.18 = private unnamed_addr constant [21 x i8] c"!\22UNEXPECTED ERROR!\22\00", align 1
@__PRETTY_FUNCTION__.pattern_print = private unnamed_addr constant [40 x i8] c"void pattern_print(const char *, _Bool)\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c" \00", align 1

; Function Attrs: noinline nounwind optnone
define void @trace_bst(%struct.bst* %tree) #0 {
entry:
  %tree.addr = alloca %struct.bst*, align 8
  store %struct.bst* %tree, %struct.bst** %tree.addr, align 8
  %0 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  call void @trace_bst_core(%struct.bst* %0, i1 zeroext true, i1 zeroext false)
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @trace_bst_core(%struct.bst* %tree, i1 zeroext %pretty, i1 zeroext %show_count) #0 {
entry:
  %tree.addr = alloca %struct.bst*, align 8
  %pretty.addr = alloca i8, align 1
  %show_count.addr = alloca i8, align 1
  store %struct.bst* %tree, %struct.bst** %tree.addr, align 8
  %frombool = zext i1 %pretty to i8
  store i8 %frombool, i8* %pretty.addr, align 1
  %frombool1 = zext i1 %show_count to i8
  store i8 %frombool1, i8* %show_count.addr, align 1
  %0 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %tobool = icmp ne %struct.bst* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1, i32 0, i32 0), i32 72, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.trace_bst_core, i32 0, i32 0)) #5
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %root = getelementptr inbounds %struct.bst, %struct.bst* %1, i32 0, i32 0
  %2 = load %struct.bstnode*, %struct.bstnode** %root, align 8
  %cmp = icmp eq %struct.bstnode* %2, null
  br i1 %cmp, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0))
  br label %if.end8

if.else3:                                         ; preds = %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0))
  %5 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  %root5 = getelementptr inbounds %struct.bst, %struct.bst* %5, i32 0, i32 0
  %6 = load %struct.bstnode*, %struct.bstnode** %root5, align 8
  %7 = load i8, i8* %pretty.addr, align 1
  %tobool6 = trunc i8 %7 to i1
  %8 = load i8, i8* %show_count.addr, align 1
  %tobool7 = trunc i8 %8 to i1
  call void @bst_print_node(%struct.bstnode* %6, i32 0, i32 0, i1 zeroext %tobool6, i1 zeroext %tobool7)
  br label %if.end8

if.end8:                                          ; preds = %if.else3, %if.then2
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind optnone
define internal void @bst_print_node(%struct.bstnode* %node, i32 %code, i32 %depth, i1 zeroext %pretty, i1 zeroext %show_count) #0 {
entry:
  %node.addr = alloca %struct.bstnode*, align 8
  %code.addr = alloca i32, align 4
  %depth.addr = alloca i32, align 4
  %pretty.addr = alloca i8, align 1
  %show_count.addr = alloca i8, align 1
  store %struct.bstnode* %node, %struct.bstnode** %node.addr, align 8
  store i32 %code, i32* %code.addr, align 4
  store i32 %depth, i32* %depth.addr, align 4
  %frombool = zext i1 %pretty to i8
  store i8 %frombool, i8* %pretty.addr, align 1
  %frombool1 = zext i1 %show_count to i8
  store i8 %frombool1, i8* %show_count.addr, align 1
  %0 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %cmp = icmp eq %struct.bstnode* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %depth.addr, align 4
  %cmp2 = icmp sle i32 %1, 1048576
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  br label %if.end4

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1, i32 0, i32 0), i32 57, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__PRETTY_FUNCTION__.bst_print_node, i32 0, i32 0)) #5
  unreachable

if.end4:                                          ; preds = %if.then3
  %2 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %right = getelementptr inbounds %struct.bstnode, %struct.bstnode* %2, i32 0, i32 2
  %3 = load %struct.bstnode*, %struct.bstnode** %right, align 8
  %tobool = icmp ne %struct.bstnode* %3, null
  br i1 %tobool, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %4 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %left = getelementptr inbounds %struct.bstnode, %struct.bstnode* %4, i32 0, i32 1
  %5 = load %struct.bstnode*, %struct.bstnode** %left, align 8
  %tobool5 = icmp ne %struct.bstnode* %5, null
  br i1 %tobool5, label %if.then8, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %6 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %tobool7 = icmp ne %struct.bstnode* %6, null
  br i1 %tobool7, label %if.then8, label %if.else9

if.then8:                                         ; preds = %lor.lhs.false6, %lor.lhs.false, %if.end4
  br label %if.end10

if.else9:                                         ; preds = %lor.lhs.false6
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1, i32 0, i32 0), i32 58, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__PRETTY_FUNCTION__.bst_print_node, i32 0, i32 0)) #5
  unreachable

if.end10:                                         ; preds = %if.then8
  %7 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %right11 = getelementptr inbounds %struct.bstnode, %struct.bstnode* %7, i32 0, i32 2
  %8 = load %struct.bstnode*, %struct.bstnode** %right11, align 8
  %9 = load i32, i32* %code.addr, align 4
  %mul = mul nsw i32 %9, 2
  %add = add nsw i32 %mul, 1
  %10 = load i32, i32* %depth.addr, align 4
  %add12 = add nsw i32 %10, 1
  %11 = load i8, i8* %pretty.addr, align 1
  %tobool13 = trunc i8 %11 to i1
  %12 = load i8, i8* %show_count.addr, align 1
  %tobool14 = trunc i8 %12 to i1
  call void @bst_print_node(%struct.bstnode* %8, i32 %add, i32 %add12, i1 zeroext %tobool13, i1 zeroext %tobool14)
  %13 = load i32, i32* %code.addr, align 4
  %14 = load i32, i32* %depth.addr, align 4
  call void @build_pattern(i8* getelementptr inbounds ([1048578 x i8], [1048578 x i8]* @bst_print_node.pattern, i32 0, i32 0), i32 %13, i32 %14)
  %15 = load i8, i8* %pretty.addr, align 1
  %tobool15 = trunc i8 %15 to i1
  call void @pattern_print(i8* getelementptr inbounds ([1048578 x i8], [1048578 x i8]* @bst_print_node.pattern, i32 0, i32 0), i1 zeroext %tobool15)
  %16 = load i8, i8* %show_count.addr, align 1
  %tobool16 = trunc i8 %16 to i1
  br i1 %tobool16, label %if.then17, label %if.else18

if.then17:                                        ; preds = %if.end10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %item = getelementptr inbounds %struct.bstnode, %struct.bstnode* %18, i32 0, i32 0
  %19 = load i32, i32* %item, align 8
  %20 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %count = getelementptr inbounds %struct.bstnode, %struct.bstnode* %20, i32 0, i32 3
  %21 = load i32, i32* %count, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i32 %19, i32 %21)
  br label %if.end21

if.else18:                                        ; preds = %if.end10
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %item19 = getelementptr inbounds %struct.bstnode, %struct.bstnode* %23, i32 0, i32 0
  %24 = load i32, i32* %item19, align 8
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i32 %24)
  br label %if.end21

if.end21:                                         ; preds = %if.else18, %if.then17
  %25 = load %struct.bstnode*, %struct.bstnode** %node.addr, align 8
  %left22 = getelementptr inbounds %struct.bstnode, %struct.bstnode* %25, i32 0, i32 1
  %26 = load %struct.bstnode*, %struct.bstnode** %left22, align 8
  %27 = load i32, i32* %code.addr, align 4
  %mul23 = mul nsw i32 %27, 2
  %28 = load i32, i32* %depth.addr, align 4
  %add24 = add nsw i32 %28, 1
  %29 = load i8, i8* %pretty.addr, align 1
  %tobool25 = trunc i8 %29 to i1
  %30 = load i8, i8* %show_count.addr, align 1
  %tobool26 = trunc i8 %30 to i1
  call void @bst_print_node(%struct.bstnode* %26, i32 %mul23, i32 %add24, i1 zeroext %tobool25, i1 zeroext %tobool26)
  br label %return

return:                                           ; preds = %if.end21, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @build_pattern(i8* %pattern, i32 %code, i32 %depth) #0 {
entry:
  %pattern.addr = alloca i8*, align 8
  %code.addr = alloca i32, align 4
  %depth.addr = alloca i32, align 4
  store i8* %pattern, i8** %pattern.addr, align 8
  store i32 %code, i32* %code.addr, align 4
  store i32 %depth, i32* %depth.addr, align 4
  %0 = load i32, i32* %depth.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %pattern.addr, align 8
  %call = call i8* @strcpy(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0)) #6
  br label %while.end

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %pattern.addr, align 8
  %call1 = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0)) #6
  %3 = load i8*, i8** %pattern.addr, align 8
  %4 = load i32, i32* %depth.addr, align 4
  %add = add nsw i32 %4, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  %5 = load i32, i32* %code.addr, align 4
  %rem = srem i32 %5, 2
  %tobool = icmp ne i32 %rem, 0
  %6 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 114, i32 76
  %conv = trunc i32 %cond to i8
  %7 = load i8*, i8** %pattern.addr, align 8
  %8 = load i32, i32* %depth.addr, align 4
  %idxprom2 = sext i32 %8 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %idxprom2
  store i8 %conv, i8* %arrayidx3, align 1
  br label %while.cond

while.cond:                                       ; preds = %lor.end, %if.end
  %9 = load i32, i32* %depth.addr, align 4
  %cmp4 = icmp sgt i32 %9, 1
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %10 = load i32, i32* %depth.addr, align 4
  %dec = add nsw i32 %10, -1
  store i32 %dec, i32* %depth.addr, align 4
  %11 = load i32, i32* %code.addr, align 4
  %rem6 = srem i32 %11, 4
  %cmp7 = icmp eq i32 %rem6, 2
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.body
  %12 = load i32, i32* %code.addr, align 4
  %rem9 = srem i32 %12, 4
  %cmp10 = icmp eq i32 %rem9, 1
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.body
  %13 = phi i1 [ true, %while.body ], [ %cmp10, %lor.rhs ]
  %14 = zext i1 %13 to i64
  %cond12 = select i1 %13, i32 124, i32 32
  %conv13 = trunc i32 %cond12 to i8
  %15 = load i8*, i8** %pattern.addr, align 8
  %16 = load i32, i32* %depth.addr, align 4
  %idxprom14 = sext i32 %16 to i64
  %arrayidx15 = getelementptr inbounds i8, i8* %15, i64 %idxprom14
  store i8 %conv13, i8* %arrayidx15, align 1
  %17 = load i32, i32* %code.addr, align 4
  %div = sdiv i32 %17, 2
  store i32 %div, i32* %code.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @pattern_print(i8* %pattern, i1 zeroext %pretty) #0 {
entry:
  %pattern.addr = alloca i8*, align 8
  %pretty.addr = alloca i8, align 1
  %len = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %pattern, i8** %pattern.addr, align 8
  %frombool = zext i1 %pretty to i8
  store i8 %frombool, i8* %pretty.addr, align 1
  %0 = load i8*, i8** %pattern.addr, align 8
  %call = call i64 @strlen(i8* %0) #7
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %len, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %len, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %pattern.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom
  %5 = load i8, i8* %arrayidx, align 1
  %conv2 = sext i8 %5 to i32
  %cmp3 = icmp eq i32 %conv2, 114
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8, i8* %pretty.addr, align 1
  %tobool = trunc i8 %7 to i1
  %8 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0)
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* %cond)
  br label %if.end51

if.else:                                          ; preds = %for.body
  %9 = load i8*, i8** %pattern.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %10 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i64 %idxprom7
  %11 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %11 to i32
  %cmp10 = icmp eq i32 %conv9, 76
  br i1 %cmp10, label %if.then12, label %if.else17

if.then12:                                        ; preds = %if.else
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = load i8, i8* %pretty.addr, align 1
  %tobool13 = trunc i8 %13 to i1
  %14 = zext i1 %tobool13 to i64
  %cond15 = select i1 %tobool13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0)
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* %cond15)
  br label %if.end50

if.else17:                                        ; preds = %if.else
  %15 = load i8*, i8** %pattern.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %16 to i64
  %arrayidx19 = getelementptr inbounds i8, i8* %15, i64 %idxprom18
  %17 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %17 to i32
  %cmp21 = icmp eq i32 %conv20, 124
  br i1 %cmp21, label %if.then23, label %if.else28

if.then23:                                        ; preds = %if.else17
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8, i8* %pretty.addr, align 1
  %tobool24 = trunc i8 %19 to i1
  %20 = zext i1 %tobool24 to i64
  %cond26 = select i1 %tobool24, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0)
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* %cond26)
  br label %if.end49

if.else28:                                        ; preds = %if.else17
  %21 = load i8*, i8** %pattern.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom29 = sext i32 %22 to i64
  %arrayidx30 = getelementptr inbounds i8, i8* %21, i64 %idxprom29
  %23 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %23 to i32
  %cmp32 = icmp eq i32 %conv31, 45
  br i1 %cmp32, label %if.then34, label %if.else39

if.then34:                                        ; preds = %if.else28
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = load i8, i8* %pretty.addr, align 1
  %tobool35 = trunc i8 %25 to i1
  %26 = zext i1 %tobool35 to i64
  %cond37 = select i1 %tobool35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0)
  %call38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* %cond37)
  br label %if.end48

if.else39:                                        ; preds = %if.else28
  %27 = load i8*, i8** %pattern.addr, align 8
  %28 = load i32, i32* %i, align 4
  %idxprom40 = sext i32 %28 to i64
  %arrayidx41 = getelementptr inbounds i8, i8* %27, i64 %idxprom40
  %29 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %29 to i32
  %cmp43 = icmp eq i32 %conv42, 32
  br i1 %cmp43, label %if.then45, label %if.else47

if.then45:                                        ; preds = %if.else39
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i32 0, i32 0))
  br label %if.end

if.else47:                                        ; preds = %if.else39
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1, i32 0, i32 0), i32 46, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__PRETTY_FUNCTION__.pattern_print, i32 0, i32 0)) #5
  unreachable

if.end:                                           ; preds = %if.then45
  br label %if.end48

if.end48:                                         ; preds = %if.end, %if.then34
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then23
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then12
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end51
  %31 = load i32, i32* %i, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind optnone
define void @trace_bst_count(%struct.bst* %tree) #0 {
entry:
  %tree.addr = alloca %struct.bst*, align 8
  store %struct.bst* %tree, %struct.bst** %tree.addr, align 8
  %0 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  call void @trace_bst_core(%struct.bst* %0, i1 zeroext true, i1 zeroext true)
  ret void
}

; Function Attrs: noinline nounwind optnone
define void @trace_bst_plain(%struct.bst* %tree) #0 {
entry:
  %tree.addr = alloca %struct.bst*, align 8
  store %struct.bst* %tree, %struct.bst** %tree.addr, align 8
  %0 = load %struct.bst*, %struct.bst** %tree.addr, align 8
  call void @trace_bst_core(%struct.bst* %0, i1 zeroext false, i1 zeroext false)
  ret void
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 7.1.0 (https://github.com/llvm-mirror/clang.git 4519e2637fcc4bf6e3049a0a80e6a5e7b97667cb) (https://github.com/llvm-mirror/llvm.git dd3329aeb25d87d4ac6429c0af220f92e1ba5f26)"}
!1 = !{i32 1, !"wchar_size", i32 4}
