#import "header/header.typ": header-fun, heading-update
#import "util/color.typ": color-select
#import "util/util.typ": f-heading, f-numbering-ref, ar-h

#import "@preview/numbly:0.1.0": numbly

//  标题格式
#let heading-style(color, doc) = {
  show heading: it => (
    if it.level == 1 {
      set text(size: 1.2em, fill: color)
      align(center)[#it]
    } else if it.level == 2 {
      set text(size: 1.2em, fill: color)
      it
    } else {
      set text(size: 1.2em, fill: color)
      it
    }
      + v(0.5em)
  )
  doc
}

#let equation-heading-update(it, update-level) = if it.numbering == none { } else {
  if it.level <= update-level {
    counter(math.equation).update(0)
  }
}
#let figure-image-heading-update(it, update-level) = if it.numbering == none { } else {
  if it.level <= update-level {
    counter(figure.where(kind: image)).update(0)
  }
}

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
  set heading(numbering: numbly("第{1}章", default: "1.1"))

  // 数学计数
  show heading: it => it + equation-heading-update(it, eq-level)
  set math.equation(
    numbering: _ => [
      (#numbering("1.1",..f-heading(level: eq-level)).#counter(math.equation).display("1"))
    ],
  )

  show heading: it => (
    it + if it.level <= math-fun-level { ar-h.update(i => i + ((h: counter(heading).at(it.location())),)) }
  )
  // 引用
  show ref: it => {
    set text(fill: rgb(127, 0, 0))
    let i = it.element
    if i != none and i.func() == heading {
      link(i.location(), numbering(i.numbering, ..counter(heading).at(i.location())) + " " + i.body)
    } else {
      it
    }
  }
  // math-fun-ref
  show ref: it => if it.element != none and it.element.func() == [].func() {
    let state-update = state("test").update(it => it).func()
    let type = str(it.element.label).split(":").first()
    let i = it.element.children.last()
    if i.func() == state-update {
      if i.fields().values().first() == "array-heading-num" {
        link(it.element.location(), type + f-numbering-ref(it.element.location(), "math-fun-def" + type))
      }
    }
  } else {
    it
  }

  show link: set text(fill: rgb(127, 0, 0))

  // 图片
  show heading: it => it + figure-image-heading-update(it, fig-image-level)
  show figure.where(kind: image): set figure(
    numbering: _ => text(weight: "bold", fill: color-themes.structure)[
      #numbering("1.1",..f-heading(level: fig-image-level)).#counter(figure.where(kind: image)).display("1")
    ],
    gap: 0.2em,
    supplement: text(weight: "bold", fill: color-themes.structure)[图],
  )

  set list(
    marker: (
      text(fill: color-themes.structure)[•],
      text(fill: color-themes.structure)[‣],
      text(fill: color-themes.structure)[–],
    ),
    indent: 1em,
  )

  // 列表
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
