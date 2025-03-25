#import "math.typ": math-fun-note, color-themes

// 提示类环境
#let note(body) = math-fun-note(main-color: color-themes.second, "笔记", font: ("Times New Roman", "FZKai-Z03S"), body)

// 结论类环境
#let conclusion(body) = math-fun-note(
  main-color: color-themes.third,
  font: ("Times New Roman", "FZKai-Z03S"),
  "结论",
  body,
)
#let assumption(body) = math-fun-note(
  main-color: color-themes.third,
  font: ("Times New Roman", "FZKai-Z03S"),
  "假设",
  body,
)
#let property(body) = math-fun-note(
  main-color: color-themes.third,
  font: ("Times New Roman", "FZKai-Z03S"),
  "性质",
  body,
)
#let remark(body) = math-fun-note(main-color: color-themes.second, font: ("Times New Roman", "FZKai-Z03S"), "注", body)
#let solution(body) = math-fun-note(main-color: color-themes.main, font: ("Times New Roman", "FZKai-Z03S"), "解", body)

//
#let proof(body) = math-fun-note(
  main-color: color-themes.second,
  font: ("Times New Roman", "FZFangSong-Z02S"),
  "证明",
  body,
)
