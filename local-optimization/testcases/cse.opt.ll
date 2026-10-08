; ModuleID = 'cse.ll'
source_filename = "cse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compute(i32 noundef %b, i32 noundef %c) #0 {
entry:
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %b, ptr %b.addr, align 4
  store i32 %c, ptr %c.addr, align 4
  %add = add nsw i32 %b, %c
  store i32 %add, ptr %a, align 4
  store i32 %add, ptr %d, align 4
  %mul = mul nsw i32 %add, %add
  ret i32 %mul
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"PIE Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 24.0.0git (https://github.com/asinbarajx/llvm-project-.git 20913cfb73ee109c0ad4e9cb298e2c1a0595fb0b)"}
