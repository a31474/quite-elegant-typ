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

// 查询函数：查找当前页或上一页最近的一级标题
// 返回格式：(exists: bool, content: content)
#let find-current-heading-l1() = {
  let current-page = here().page()
  let first-headings = first-heading-l1.final()
  let last-headings = last-heading-l1.get()

  if first-headings.keys() == () {
    return (exists: false, content: none)
  }

  // 筛选出小于等于当前页的所有记录页
  let valid-pages = first-headings.keys().filter(it => int(it) <= current-page)

  if valid-pages == () {
    return (exists: false, content: none)
  }

  // 获取最接近当前页的页码
  let target-page-key = valid-pages.last()
  let target-page-num = int(target-page-key)
  let is-current-page = current-page == target-page-num

  // 如果在当前页，取该页第一个标题；否则取上一页的最后一个标题
  let content = if is-current-page {
    first-headings.at(str(current-page))
  } else {
    last-headings.at(target-page-key)
  }

  (exists: is-current-page, content: content)
}
