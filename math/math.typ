#import "../util/color.typ": color-select
#import "../util/util.typ": f-heading
// 颜色主题
#let color-themes = color-select("blue")

#let math-fun-def(main-color: rgb(0, 0, 0), type: "", number: true, step: true, name, content) = figure(
  {
    let title = (
      type
        + if number {
          if step {
            counter(type).step()
          }
          context {
            numbering("1.1-", ..f-heading()) + counter(type).display()
          }
        }
        + name
    )

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
  },
  kind: "math-fun-def",
  supplement: type,
  caption: context numbering("1.1-", ..f-heading()) + counter(type).display(),
  numbering: none,
)

///
/// 定理类环境
///
// definition 定义类
#let definition(number: true, step: true, name, content) = math-fun-def(
  main-color: color-themes.main,
  type: "定义",
  number: number,
  step: step,
  name,
  content,
)
// theorem 定理类
#let theorem(number: true, step: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "定理",
  number: number,
  step: step,
  name,
  content,
)
#let lemma(number: true, step: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "引理",
  number: number,
  step: step,
  name,
  content,
)
#let corollary(number: true, step: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "推论",
  number: number,
  step: step,
  name,
  content,
)
#let axiom(number: true, step: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "公理",
  number: number,
  step: step,
  name,
  content,
)
#let postulate(number: true, step: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "假设",
  number: number,
  step: step,
  name,
  content,
)
// proposition 命题类
#let proposition(number: true, step: true, name, content) = math-fun-def(
  main-color: color-themes.third,
  type: "命题",
  number: number,
  step: step,
  name,
  content,
)

//
#let math-fun-exam(main-color: rgb(0, 0, 0), number: true, step: true, type: "") = {
  let title = (
    type
      + " "
      + if number {
        if step {
          counter(type).step()
        }
        context {
          numbering("1.1-", ..f-heading()) + counter(type).display()
        }
      }
  )

  math.equation(
    supplement: type
      + context {
        numbering("1.1-", ..f-heading()) + counter(type).display()
      },
    numbering: "math-fun-exam",
    text(fill: main-color, weight: "bold", font: ("Times New Roman", "FZHei-B01S"))[#title] + " ",
  )
}
// 示例类环境
#let example(number: true, step: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  step: step,
  type: "例",
)
#let problem(number: true, step: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  step: step,
  type: "例题",
)
#let exercise(number: true, step: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  step: step,
  type: "练习",
)

//
#let math-fun-note(main-color: rgb(0, 0, 0), font: ("Times New Roman", "FZShuSong-Z01S"), type, body) = (
  text(fill: main-color, weight: "bold")[#type]
    + " "
    + {
      set text(font: font)
      body
    }
)

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
