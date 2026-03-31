#import "math.typ": color-themes, math-fun-def

// 定理类环境

// definition 定义类
#let definition = math-fun-def.with(main-color: color-themes.main, kind: "定义")

// theorem 定理类
#let theorem = math-fun-def.with(main-color: color-themes.second, kind: "定理")
#let lemma = math-fun-def.with(main-color: color-themes.second, kind: "引理")
#let corollary = math-fun-def.with(main-color: color-themes.second, kind: "推论")
#let axiom = math-fun-def.with(main-color: color-themes.second, kind: "公理")
#let postulate = math-fun-def.with(main-color: color-themes.second, kind: "假设")

// proposition 命题类
#let proposition = math-fun-def.with(main-color: color-themes.third, kind: "命题")
