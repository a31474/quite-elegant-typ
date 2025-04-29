#let Square-Shadow-Bottom-Right(color) = read("../svg/SquareShadowBottomRight.svg").replace(
  "currentColor",
  color.to-hex(),
)
#let sq(color) = image(bytes(Square-Shadow-Bottom-Right(color)), height: 0.7em)

#let introduction(color: black, title: "内容提要", ..arg) = context {
  let c = block(
    fill: color,
    radius: 3pt,
    inset: (x: 7pt, y: 3pt),
    text(fill: white, weight: "bold", bottom-edge: "descender")[#title],
  )
  let w = measure(c).width
  let h = measure(c).height
  stack(
    dir: btt,
    block(
      width: 100%,
      stroke: (top: color + 0.5pt, bottom: color + 0.5pt),
      inset: (x: 2%, top: 8pt + h / 2, bottom: 8pt),
      fill: color.lighten(90%),
      {
        set text(font: ("Times New Roman", "FZKai-Z03S"))
        grid(
          columns: (1fr,) * 2,
          inset: (left: 1em),
          row-gutter: 0.8em,
          ..for i in arg.pos() {
            ([~~~#box(sq(color))~~#i],)
          }
        )
      },
    ),
    move(dx: 50% - w / 2, dy: h / 2, c),
  )
}
