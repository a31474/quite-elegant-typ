#let f-heading(level: 1) = {
  let h = counter(heading).get()
  if h.len() > level {
    h.slice(0, count: level)
  } else {
    h
  }
}

#let ar-h = state("array-heading-num", ())

#let f-numbering(name) = context {
  let i = ar-h.get().rev().filter(it => it == name or type(it) == dictionary)
  let r = i.position(it => type(it) == dictionary)
  [#numbering("1.1", ..i.at(r).values().first())-#{ i.slice(0, r).len() + 1 }]
}

#let f-numbering-ref(loc, name) = {
  let i = ar-h.at(loc).rev().filter(it => it == name or type(it) == dictionary)
  let r = i.position(it => type(it) == dictionary)
  [#numbering("1.1", ..i.at(r).values().first())-#{ i.slice(0, r).len() + 1 }]
}