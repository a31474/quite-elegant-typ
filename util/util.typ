#import "problemset.typ": adf-triple-flourish-left, adf-triple-flourish-right, problemset-numbering-fn

#let heading-numbers(level: 1) = {
  let h = counter(heading).get()
  if h.len() > level {
    h.slice(0, count: level)
  } else {
    h
  }
}

#let heading-math-state = state("dictionary-heading-math", (:))

#let math-env-numbering(kind) = context {
  let i = heading-math-state.get()
  let heading-num = i.at("heading", default: (0,))
  let kind-num = i.at(kind, default: 0)
  [#numbering("1.1", ..heading-num).#kind-num]
}

#let math-env-numbering-ref(loc, kind) = {
  let i = heading-math-state.at(loc)
  let heading-num = i.at("heading", default: (0,))
  let kind-num = i.at(kind, default: 0) + 1
  [#numbering("1.1", ..heading-num).#kind-num]
}

#let heading-math-update(kind) = heading-math-state.update(it => {
  it.insert(kind, it.at(kind, default: 0) + 1)
  it
})

//  标题格式
#let heading-style(color, doc) = {
  show heading: set block(above: 1.69em, below: 1.3em)
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

#let equation-heading-update(it, update-level) = if it.numbering == none {} else {
  if it.level <= update-level {
    counter(math.equation).update(0)
  }
}
#let figure-image-heading-update(it, update-level) = if it.numbering == none {} else {
  if it.level <= update-level {
    counter(figure.where(kind: image)).update(0)
  }
}
#let math-fun-heading-update(it, update-level) = if it.numbering == none {} else {
  if it.level <= update-level {
    heading-math-state.update(i => ("heading": counter(heading).at(it.location())))
  }
}
