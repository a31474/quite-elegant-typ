#import "color.typ": color-select

#let default-cover(
  cover: none,
  rect-color: rgb(32, 178, 170),
  title: "标题",
  subtitle: "副标题",
  author: none,
  institute: none,
  date: none,
  version: none,
  other: (:),
  logo: none,
  extrainfo: none,
) = {
  page(footer: none, margin: 0%)[
    #grid(
      rows: (auto, auto, 0.6fr, auto, 0.4fr, auto, 1fr, auto, 1fr),
      columns: 100%,
      // 封面
      align(top, if cover == none {
        layout(size => rect(width: size.width, height: size.width * 3 / 4, fill: luma(245), stroke: luma(220)))
      } else {
        cover
      }),
      align(top, block(height: 0.5in, fill: rect-color, width: 100%)),
      [],
      // 标题
      block(
        text(size: 24.88pt, weight: "bold")[#h(5pt)#title],
        inset: (left: 2em),
        width: 80%,
      ),
      [],
      // 信息
      {
        let info = (
          ("作者": author, "组织": institute, "时间": date, "版本": version)
            + if type(other) == dictionary { other } else { (:) }
        )
        let info-body = block(inset: (left: 2.5em), {
          if subtitle != none {
            block(text(
              size: 14.4pt,
              weight: "bold",
              fill: black.lighten(25%),
            )[#h(5pt)#subtitle])
            v(0.7em)
          }
          set par(spacing: 1em)
          for (k, v) in info {
            if v != none {
              block(width: 100%, text(
                font: ("Times New Roman", "FZKai-Z03S"),
                fill: black.lighten(50%),
              )[#h(5pt)#h(1em)#k：#v])
            }
          }
        })
        if logo == none {
          info-body
        } else {
          grid(
            columns: (67%, 27%, 6%),
            align(left, info-body), align(right + bottom, logo), [],
          )
        }
      },
      [],
      {
        if extrainfo == none {
          none
        } else {
          align(center, block(width: 70%, text(
            font: ("Times New Roman", "FZKai-Z03S"),
            fill: black.lighten(50%),
          )[#extrainfo]))
        }
      },
      [],
    )
  ]
  counter(page).update(1)
}

#let default-outline(outline-color: none) = {
  {
    let outline-color = if outline-color == none {
      color-select("blue").structure
    } else { outline-color }

    set page(footer: context align(center, text(fill: outline-color)[#counter(page).display("i")]))
    heading(numbering: none, outlined: false)[#text(fill: outline-color)[目录]]

    show outline.entry.where(level: 1): it => {
      set block(above: 1.2em)
      strong(it)
    }
    set outline.entry(fill: repeat(" . "))
    outline(title: none, indent: 1.8em)
  }
  counter(page).update(1)
}
