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
  let kind-num = i.at(kind, default: 1)
  [#numbering("1.1",..heading-num).#kind-num]
}

#let f-numbering-ref(loc, kind) = {
  let i = dic-he-ma.at(loc)
  let heading-num = i.at("heading", default: (0,))
  let kind-num = i.at(kind, default: 1) + 1
  [#numbering("1.1",..heading-num).#kind-num]
}

#let dic-he-ma-update(kind) = dic-he-ma.update(it => {
  it.insert(kind, it.at(kind, default: 0) + 1)
  it
})
