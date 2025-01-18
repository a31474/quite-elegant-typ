#import "heading-L1.typ": find-1, last-heading-l1-update, first-heading-l1-update
#import "heading-L2.typ": find-2, last-heading-l2-update, first-heading-l2-update

#let header-rect(it, color) = rect(
  width: 100%,
  stroke: (bottom: 0.5pt + color),
  align(
    right,
    {
      set text(font: ("Times New Roman", "FZKai-Z03S"))
      it
    },
  ),
)

#let header-heading(color) = context {
  if (
    find-1().at("has")
      or {
        not find-2().at("has") and counter(heading).get().len() <= 1
      }
  ) {
    // header-rect(find-1().at("value-h"), color)
  } else {
    header-rect(find-2().at("value-h"), color)
  }
}

#let header-fun(color) = {
  set text(fill: color)
  header-heading(color)
}

#let heading-update(it) = if it.level == 1 {
  last-heading-l1-update(it)
  first-heading-l1-update(it)
} else if it.level == 2 {
  last-heading-l2-update(it)
  first-heading-l2-update(it)
}
