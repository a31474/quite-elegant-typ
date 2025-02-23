#import "color.typ": color-select

#let default-cover(
  cover: image("../image/cover.jpg", width: 100%),
  rect-color: rgb(31, 177, 170),
  logo: none,
  title: "标题",
  subtitle: "副标题",
  author: none,
  institute: none,
  date: none,
  version: none,
  extrainfo: none,
  other: (:),
) = (
  page(footer: none, margin: 0%)[
    #grid(
      columns: 1fr,
      align(top + center, block(height: 56.57%, { if cover == none { } else { cover } })),
      block(height: 4.2%, fill: rect-color, width: 100%)
    )
    #v(3%)
    #block(text(size: 27pt, weight: "bold")[#title], inset: (x: 4%), width: 100%)
    #v(2%)
    #block(text(size: 15pt, weight: "bold", fill: black.lighten(25%))[#subtitle], inset: (x: 5%), width: 100%)
    #v(2%)
    #let main = {
      let info = (
        (作者: author, 组织: institute, 时间: date, 版本: version) + if type(other) == dictionary { other }
      )
      for (i, j) in info {
        if j == none { } else {
          block(
            text(font: ("Times New Roman", "FZKai-Z03S"), fill: black.lighten(50%))[#i：#j],
            inset: (x: 6%),
            width: 100%,
          )
        }
      }
    }
    #if logo == none {
      main
    } else {
      grid(
        columns: (6%, 70.4%, 17.6%, 6%),
        [], align(left, main), align(right, logo), [],
      )
    }
    #extrainfo
  ]
    + counter(page).update(1)
)

#let default-outline(color-theme: "blue") = (
  {
    let color-themes = color-select(color-theme)

    set page(footer: context align(center, text(fill: color-themes.structure)[#counter(page).display("i")]))
    heading(numbering: none, outlined: false)[目录]

    show outline.entry.where(level: 1): it => {
      set block(above: 1.2em)
      strong(it)
    }
    set outline.entry(fill: repeat(" . "))
    outline(title: none, indent: 1.8em)
  }
    + counter(page).update(1)
)
