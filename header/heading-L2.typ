#import "util.typ": heading-new

#let first-heading-l2 = state("first-heading-l2", (:))
#let last-heading-l2 = state("last-heading-l2", (:))

// 末标题更新
#let last-heading-l2-update(curr-heading) = {
  last-heading-l2.update(headings => {
    headings.insert(str(curr-heading.location().page()), heading-new(curr-heading))
    headings
  })
}
// 首标题更新
#let first-heading-l2-update(curr-heading) = context {
  first-heading-l2.update(headings => {
    let k = str(curr-heading.location().page())
    if k not in headings {
      headings.insert(k, heading-new(curr-heading))
    }
    headings
  })
}
// 查询函数
#let find-2() = {
  let page-num = here().page()
  let first-headings-l2 = first-heading-l2.final()
  let last-headings-l2 = last-heading-l2.get()
  if first-headings-l2.keys() == () {
    (has: false, value-h: none)
  } else if page-num < int(first-headings-l2.keys().first()) {
    (has: false, value-h: none)
  } else {
    let heading-2-page = first-headings-l2.keys().filter(it => int(it) <= page-num).last()
    let has = here().page() == int(heading-2-page)
    let value-h = if has {
      first-headings-l2.at(str(page-num))
    } else {
      last-headings-l2.at(heading-2-page)
    }
    (has: has, value-h: value-h)
  }
}