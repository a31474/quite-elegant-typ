#import "util.typ": heading-new

#let first-heading-l1 = state("first-heading-l1", (:))
#let last-heading-l1 = state("last-heading-l1", (:))

// 末标题更新
#let last-heading-l1-update(curr-heading) = {
  last-heading-l1.update(headings => {
    headings.insert(str(curr-heading.location().page()), heading-new(curr-heading))
    headings
  })
}

// 首标题更新
#let first-heading-l1-update(curr-heading) = context {
  first-heading-l1.update(headings => {
    let k = str(curr-heading.location().page())
    if k not in headings {
      headings.insert(k, heading-new(curr-heading))
    }
    headings
  })
}

// 查询函数
#let find-1() = {
  let page-num = here().page()
  let first-headings-l1 = first-heading-l1.final()
  let last-headings-l1 = last-heading-l1.get()
  if first-headings-l1.keys() == () {
    (has: false, value-h: none)
  } else if page-num < int(first-headings-l1.keys().first()) {
    (has: false, value-h: none)
  } else {
    let heading-1-page = first-headings-l1.keys().filter(it => int(it) <= page-num).last()
    let has = here().page() == int(heading-1-page)
    let value-h = if has {
      first-headings-l1.at(str(page-num))
    } else {
      last-headings-l1.at(heading-1-page)
    }
    (has: has, value-h: value-h)
  }
}
