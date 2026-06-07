#import "../util/color.typ": color-select
#import "../util/util.typ": heading-math-update, math-env-numbering

// 颜色主题
#let math-fun-color-theme-state = state("math-fun-color-theme-state", color-select("blue"))

// 定理类环境-框架
#let math-fun-def-frame(main-color, title, content) = {
  v(-0.5em)
  block(
    breakable: false,
    stack(
      dir: btt,
      rect(
        width: 100%,
        radius: 3pt,
        inset: 1.2em,
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
    ),
  )
}

// 定理类环境
#let math-fun-def(color: none, color-theme-kind: "main", kind: "", number: true, name, content) = {
  let main-color() = if type(color) == std.color { color } else if color == none {
    math-fun-color-theme-state.get().at(color-theme-kind)
  } else { black }
  if number { heading-math-update(kind) }
  let title = kind + if number { math-env-numbering(kind) } + name
  context math-fun-def-frame(main-color(), title, content)
}

// 示例类环境
#let math-fun-exam(color: none, color-theme-kind: "main", number: true, kind: "") = {
  let main-color() = if type(color) == std.color { color } else if color == none {
    math-fun-color-theme-state.get().at(color-theme-kind)
  } else { black }
  if number { heading-math-update(kind) }
  let title = kind + " " + if number { math-env-numbering(kind) }
  context text(fill: main-color(), weight: "bold", font: ("Times New Roman", "FZHei-B01S"))[#title] + " "
}

// 提示类环境
#let math-fun-note(color: none, color-theme-kind: "main", font: ("Times New Roman", "FZShuSong-Z01S"), kind, body) = {
  let main-color() = if type(color) == std.color { color } else if color == none {
    math-fun-color-theme-state.get().at(color-theme-kind)
  } else { black }
  (
    context text(fill: main-color(), weight: "bold")[#kind]
      + " "
      + {
        set text(font: font)
        body
      }
  )
}
