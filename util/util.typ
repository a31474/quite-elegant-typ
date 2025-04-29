#import "problemset.typ": problemset-numbering-fn, adf-triple-flourish-left, adf-triple-flourish-right

#let f-heading(level: 1) = {
  let h = counter(heading).get()
  if h.len() > level {
    h.slice(0, count: level)
  } else {
    h
  }
}

#let dic-he-ma = state("dictionary-heading-math", (:))

#let f-numbering(kind) = context {
  let i = dic-he-ma.get()
  let heading-num = i.at("heading", default: (0,))
  let kind-num = i.at(kind, default: 0)
  [#numbering("1.1",..heading-num).#kind-num]
}

#let f-numbering-ref(loc, kind) = {
  let i = dic-he-ma.at(loc)
  let heading-num = i.at("heading", default: (0,))
  let kind-num = i.at(kind, default: 0) + 1
  [#numbering("1.1",..heading-num).#kind-num]
}

#let dic-he-ma-update(kind) = dic-he-ma.update(it => {
  it.insert(kind, it.at(kind, default: 0) + 1)
  it
})

//  标题格式
#let heading-style(color, doc) = {
  show heading: set block( above: 1.69em, below: 1.3em)
  show heading: it => if it.level == 1 {
    set text(size: 1.2em, fill: color)
    align(center)[#it]
  } else if it.level == 2 {
    if it.numbering == problemset-numbering-fn {
      set text(size: 1.2em, fill: color)
      align(
        center,
        box(image(adf-triple-flourish-left(color), height: 1em), baseline: 0.2em)
          + " "
          + box(it)
          + " "
          + box(image(adf-triple-flourish-right(color), height: 1em), baseline: 0.2em),
      )
    } else {
      set text(size: 1.2em, fill: color)
      it
    }
  } else {
    set text(size: 1.2em, fill: color)
    it
  }
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
#let math-fun-heading-update(it, update-level) = if it.numbering == none { } else {
  if it.level <= update-level {
    dic-he-ma.update(i => ("heading": counter(heading).at(it.location())))
  }
}
