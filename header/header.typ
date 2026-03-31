#import "heading-L1.typ": find-current-heading-l1, first-heading-l1-update, last-heading-l1-update
#import "heading-L2.typ": find-current-heading-l2, first-heading-l2-update, last-heading-l2-update

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
  let l1-info = find-current-heading-l1()
  let l2-info = find-current-heading-l2()
  let heading-count = counter(heading).get().len()

  let show-l1 = (
    l1-info.at("exists") or (not l2-info.at("exists") and heading-count <= 1)
  )

  if show-l1 {
    // header-rect(l1-info.at("content"), color)
  } else {
    header-rect(l2-info.at("content"), color)
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
