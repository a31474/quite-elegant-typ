#import "math.typ": math-fun-def, color-themes

// 定理类环境

// definition 定义类
#let definition(number: true, name, content) = math-fun-def(
  main-color: color-themes.main,
  type: "定义",
  number: number,
  name,
  content,
)
// theorem 定理类
#let theorem(number: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "定理",
  number: number,
  name,
  content,
)
#let lemma(number: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "引理",
  number: number,
  name,
  content,
)
#let corollary(number: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "推论",
  number: number,
  name,
  content,
)
#let axiom(number: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "公理",
  number: number,
  name,
  content,
)
#let postulate(number: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "假设",
  number: number,
  name,
  content,
)
// proposition 命题类
#let proposition(number: true, name, content) = math-fun-def(
  main-color: color-themes.third,
  type: "命题",
  number: number,
  name,
  content,
)
