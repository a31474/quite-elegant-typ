#import "math.typ": color-themes, math-fun-exam

// 示例类环境
#let example(number: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  kind: "例",
)
#let problem(number: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  kind: "例题",
)
#let exercise(number: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  kind: "练习",
)
