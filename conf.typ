#import "header/header.typ": header-fun, heading-update
#import "util/color.typ": color-select
#import "util/util.typ": f-heading, dic-he-ma, f-numbering-ref
#import "util/util.typ": heading-style
#import "util/util.typ": equation-heading-update, figure-image-heading-update, math-fun-heading-update

#import "@preview/numbly:0.1.0": numbly


#let conf(doc, color-theme: "blue", eq-level: 1, fig-image-level: 1, math-fun-level: 1) = {
  // 颜色
  let color-themes = color-select(color-theme)

  // 页面
  set page(margin: (x: 9.5%))
  // 页眉
  show heading: it => it + heading-update(it)
  set page(header: header-fun(color-themes.structure), header-ascent: 20%)
  // 页脚
  set page(
    footer-descent: 30%,
    footer: context align(center, text(fill: color-themes.structure)[#counter(page).display()]),
  )

  // 段落
  set par(justify: true, spacing: 0.8em)

  // 字体
  set text(lang: "zh", region: "cn", size: 10pt)
  set text(font: ("Times New Roman", "FZShuSong-Z01S"))
  show emph: set text(font: ("Times New Roman", "FZKai-Z03S"))
  show strong: set text(font: ("Times New Roman", "FZHei-B01S"))
  show text.where(weight: "bold"): set text(font: ("Times New Roman", "FZHei-B01S"))

  // 标题
  show: heading-style.with(color-themes.structure)
  set heading(numbering: numbly("第{1:一}章", default: "1.1"))
  // 标题计数更新
  show heading: it => {
    it
    equation-heading-update(it, eq-level)
    figure-image-heading-update(it, fig-image-level)
    math-fun-heading-update(it, math-fun-level)
  }

  // 数学计数
  set math.equation(
    numbering: _ => [
      (#numbering("1.1",..f-heading(level: eq-level)).#counter(math.equation).display("1"))
    ],
  )
  // 图片计数
  show figure.where(kind: image): set figure(
    numbering: _ => text(weight: "bold", fill: color-themes.structure)[
      #numbering("1.1",..f-heading(level: fig-image-level)).#counter(figure.where(kind: image)).display("1")
    ],
    gap: 0.2em,
    supplement: text(weight: "bold", fill: color-themes.structure)[图],
  )

  // 引用
  show link: set text(fill: rgb(127, 0, 0))
  // math-fun-ref
  let math-fun-ref(element) = {
    let state-update = state("test").update(it => it).func()
    let kind = str(element.label).split(":").first()
    let i = element.children.first()
    if i.func() == state-update {
      if i.fields().values().first() == "dictionary-heading-math" {
        link(element.location(), kind + f-numbering-ref(element.location(), kind))
      }
    }
  }
  show ref: it => {
    set text(fill: rgb(127, 0, 0))
    let e = it.element
    if e != none and e.func() == heading {
      link(e.location(), numbering(e.numbering, ..counter(heading).at(e.location())) + " " + e.body)
    } else if e != none and e.func() == [].func() { math-fun-ref(e) } else {
      it
    }
  }

  // 列表
  set list(
    marker: (
      text(fill: color-themes.structure)[•],
      text(fill: color-themes.structure)[‣],
      text(fill: color-themes.structure)[–],
    ),
    indent: 1em,
  )
  set enum(
    numbering: (..it) => {
      set text(fill: color-themes.structure)
      numbly("{1}.", "({2:a}).", "{3:I}.")(..it.pos())
    },
    full: true,
    indent: 1em,
  )

  // 首行缩进
  set par(first-line-indent: (amount: 2em, all: true))
  set terms(indent: 2em)

  doc
}
