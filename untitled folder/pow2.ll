; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@maxpow2 = constant i32 30, align 4
@.str = private unnamed_addr constant [23 x i8] c"0 <= n && n <= maxpow2\00", align 1
@.str.1 = private unnamed_addr constant [57 x i8] c"/u1/dtompkins/.seashell/projects/_A8_part2/q5-bst/pow2.c\00", align 1
@__PRETTY_FUNCTION__.pow2 = private unnamed_addr constant [14 x i8] c"int pow2(int)\00", align 1
@pow2table = internal constant [31 x i32] [i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384, i32 32768, i32 65536, i32 131072, i32 262144, i32 524288, i32 1048576, i32 2097152, i32 4194304, i32 8388608, i32 16777216, i32 33554432, i32 67108864, i32 134217728, i32 268435456, i32 536870912, i32 1073741824], align 16
@.str.2 = private unnamed_addr constant [28 x i8] c"0 < n && n <= pow2(maxpow2)\00", align 1
@__PRETTY_FUNCTION__.log2floor = private unnamed_addr constant [19 x i8] c"int log2floor(int)\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"n <= pow2(maxpow2)\00", align 1
@__PRETTY_FUNCTION__.log2ceil = private unnamed_addr constant [18 x i8] c"int log2ceil(int)\00", align 1

; Function Attrs: noinline nounwind optnone
define i32 @pow2(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp sle i32 0, %0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp sle i32 %1, 30
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i32 0, i32 0), i32 12, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__PRETTY_FUNCTION__.pow2, i32 0, i32 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %2 = load i32, i32* %n.addr, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [31 x i32], [31 x i32]* @pow2table, i64 0, i64 %idxprom
  %3 = load i32, i32* %arrayidx, align 4
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind optnone
define i32 @log2floor(i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 0, %0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4
  %call = call i32 @pow2(i32 30)
  %cmp1 = icmp sle i32 %1, %call
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i32 0, i32 0), i32 17, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__PRETTY_FUNCTION__.log2floor, i32 0, i32 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4
  %2 = load i32, i32* %n.addr, align 4
  %call2 = call i32 @pow2(i32 30)
  %cmp3 = icmp eq i32 %2, %call2
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 30, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end5
  %3 = load i32, i32* %i, align 4
  %add = add nsw i32 %3, 1
  %call6 = call i32 @pow2(i32 %add)
  %4 = load i32, i32* %n.addr, align 4
  %cmp7 = icmp sle i32 %call6, %4
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %6 = load i32, i32* %i, align 4
  store i32 %6, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then4
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone
define i32 @log2ceil(i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %floor = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %call = call i32 @pow2(i32 30)
  %cmp = icmp sle i32 %0, %call
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i32 0, i32 0), i32 29, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__PRETTY_FUNCTION__.log2ceil, i32 0, i32 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load i32, i32* %n.addr, align 4
  %call1 = call i32 @log2floor(i32 %1)
  store i32 %call1, i32* %floor, align 4
  %2 = load i32, i32* %floor, align 4
  %call2 = call i32 @pow2(i32 %2)
  %3 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp eq i32 %call2, %3
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %floor, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %5 = load i32, i32* %floor, align 4
  %add = add nsw i32 %5, 1
  store i32 %add, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then4
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 7.1.0 (https://github.com/llvm-mirror/clang.git 4519e2637fcc4bf6e3049a0a80e6a5e7b97667cb) (https://github.com/llvm-mirror/llvm.git dd3329aeb25d87d4ac6429c0af220f92e1ba5f26)"}
!1 = !{i32 1, !"wchar_size", i32 4}
