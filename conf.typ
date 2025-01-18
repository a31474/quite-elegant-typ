#import "header/header.typ": header-fun, heading-update
#import "util/color.typ": color-select
#import "util/util.typ": f-heading, fake-par

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

#let math-fun-heading-update(it, update-level, counter-list) = {
  if it.numbering == none { } else {
    if it.level <= update-level {
      for name in counter-list {
        counter(name).update(0)
      }
    }
  }
}

#let conf(doc, color-theme: "blue", eq-level: 1, new-math-fun: ()) = {
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
  // 数学环境编号
  let counter-list = ("定义", "定理", "引理", "推论", "公理", "假设", "命题", "例", "例题", "练习")
  counter-list = counter-list + new-math-fun
  show heading: it => it + math-fun-heading-update(it, 1, counter-list)
  show figure.where(kind: "math-fun-def"): it => {
    set align(left)
    it.body
  }
  // 引用
  show ref: it => {
    set text(fill: rgb(127, 0, 0))
    let i = it.element
    if i != none and i.func() == figure and i.kind == "math-fun-def" {
      link(i.location(), i.supplement + i.caption)
    } else if i != none and i.func() == math.equation and i.numbering == "math-fun-exam" {
      link(i.location(), i.supplement)
    } else if i != none and i.func() == heading {
      link(i.location(), numbering(i.numbering, ..counter(heading).at(i.location())) + " " + i.body)
    } else {
      it
    }
  }

  show link: set text(fill: rgb(127, 0, 0))

  // 图片
  show heading: it => it + figure-image-heading-update(it, eq-level)
  show figure.where(kind: image): set figure(
    numbering: _ => text(weight: "bold", fill: color-themes.structure)[
      #numbering("1.1",..f-heading(level: eq-level)).#counter(figure.where(kind: image)).display("1")
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
  set par(first-line-indent: 2em)
  set terms(indent: 2em)
  // fake-par 修复首行缩进
  show heading: it => it + fake-par
  show enum: it => it + fake-par
  show list: it => it + fake-par
  show terms: it => it + fake-par
  show figure: it => it + fake-par
  show raw.where(block: true): it => it + fake-par
  show math.equation.where(block: true): it => it + fake-par

  doc
}
