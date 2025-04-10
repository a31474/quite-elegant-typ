#import "../util/color.typ": color-select
#import "../util/util.typ": dic-he-ma, dic-he-ma-update, f-numbering

// 颜色主题
#let color-themes = color-select("blue")

// 定理类环境-框架
#let math-fun-def-frame(main-color, title, content) = {
  v(-0.5em)
  stack(
    dir: btt,
    rect(
      width: 100%,
      radius: 3pt,
      inset: 1.5em,
      stroke: main-color,
      fill: main-color.lighten(95%),
      {
        set text(font: ("Times New Roman", "FZKai-Z03S"))
        content
      },
    ),
    move(
      dx: 2em,
      dy: 0.8em,
      block(
        stroke: none,
        fill: main-color,
        inset: 0.3em,
        outset: (x: 0.8em),
        text(fill: white, weight: "bold", bottom-edge: "descender")[#title],
      ),
    ),
  )
}

// 定理类环境
#let math-fun-def(main-color: rgb(0, 0, 0), kind: "", number: true, name, content) = {
  if number { dic-he-ma-update(kind) }
  let title = kind + if number { f-numbering(kind) } + name
  math-fun-def-frame(main-color, title, content)
}

// 示例类环境
#let math-fun-exam(main-color: rgb(0, 0, 0), number: true, kind: "") = {
  if number { dic-he-ma-update(kind) }
  let title = kind + " " + if number { f-numbering(kind) }
  text(fill: main-color, weight: "bold", font: ("Times New Roman", "FZHei-B01S"))[#title] + " "
}

// 提示类环境
#let math-fun-note(main-color: rgb(0, 0, 0), font: ("Times New Roman", "FZShuSong-Z01S"), kind, body) = (
  text(fill: main-color, weight: "bold")[#kind]
    + " "
    + {
      set text(font: font)
      body
    }
)
