#import "math.typ": math-fun-def

// 定理类环境

// definition 定义类
#let definition = math-fun-def.with(kind: "定义")

// theorem 定理类
#let theorem = math-fun-def.with(color-theme-kind: "second", kind: "定理")
#let lemma = math-fun-def.with(color-theme-kind: "second", kind: "引理")
#let corollary = math-fun-def.with(color-theme-kind: "second", kind: "推论")
#let axiom = math-fun-def.with(color-theme-kind: "second", kind: "公理")
#let postulate = math-fun-def.with(color-theme-kind: "second", kind: "假设")

// proposition 命题类
#let proposition = math-fun-def.with(color-theme-kind: "third", kind: "命题")
