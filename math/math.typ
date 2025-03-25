#import "../util/color.typ": color-select
#import "../util/util.typ": f-numbering, ar-h

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
#let math-fun-def(main-color: rgb(0, 0, 0), type: "", number: true, name, content) = {
  let title = type + if number { f-numbering("math-fun-def" + type) } + name
  math-fun-def-frame(main-color, title, content)
  if number { ar-h.update(it => it + ("math-fun-def" + type,)) }
}

// 示例类环境
#let math-fun-exam(main-color: rgb(0, 0, 0), number: true, type: "") = {
  let title = type + " " + if number { f-numbering("math-fun-exam" + type) }
  text(fill: main-color, weight: "bold", font: ("Times New Roman", "FZHei-B01S"))[#title] + " "
  if number { ar-h.update(it => it + ("math-fun-exam" + type,)) }
}

// 提示类环境
#let math-fun-note(main-color: rgb(0, 0, 0), font: ("Times New Roman", "FZShuSong-Z01S"), type, body) = (
  text(fill: main-color, weight: "bold")[#type]
    + " "
    + {
      set text(font: font)
      body
    }
)
