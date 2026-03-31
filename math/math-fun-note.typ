#import "math.typ": color-themes, math-fun-note

// 提示类环境
#let note = math-fun-note.with(main-color: color-themes.second, font: ("Times New Roman", "FZKai-Z03S"), "笔记")

// 结论类环境
#let conclusion = math-fun-note.with(main-color: color-themes.third, font: ("Times New Roman", "FZKai-Z03S"), "结论")
#let assumption = math-fun-note.with(main-color: color-themes.third, font: ("Times New Roman", "FZKai-Z03S"), "假设")
#let property = math-fun-note.with(main-color: color-themes.third, font: ("Times New Roman", "FZKai-Z03S"), "性质")
#let remark = math-fun-note.with(main-color: color-themes.second, font: ("Times New Roman", "FZKai-Z03S"), "注")
#let solution = math-fun-note.with(main-color: color-themes.main, font: ("Times New Roman", "FZKai-Z03S"), "解")

// 证明类环境
#let proof = math-fun-note.with(main-color: color-themes.second, font: ("Times New Roman", "FZFangSong-Z02S"), "证明")
