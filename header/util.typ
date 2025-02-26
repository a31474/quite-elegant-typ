#let heading-new(heading-old) = {
  let heading-old-numbering-fun = heading-old.numbering
  let heading-old-numbering-num = counter(heading).at(heading-old.location())
  let heading-old-numbering = if heading-old-numbering-fun == none {
    none
  } else {
    numbering(heading-old-numbering-fun, ..heading-old-numbering-num)
  }
  heading-old-numbering + " " + heading-old.body
}