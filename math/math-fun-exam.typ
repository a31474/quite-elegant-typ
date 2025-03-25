#import "math.typ": math-fun-exam, color-themes

// 示例类环境
#let example(number: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  type: "例",
)
#let problem(number: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  type: "例题",
)
#let exercise(number: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  type: "练习",
)
