#let f-heading(level: 1) = {
  let h = counter(heading).get()
  if h.len() > level {
    h.slice(0, count: level)
  } else {
    h
  }
}
