#import "util.typ": heading-new

#let _first-l1 = state("first-heading-l1", (:))
#let _last-l1 = state("last-heading-l1", (:))
#let _first-l2 = state("first-heading-l2", (:))
#let _last-l2 = state("last-heading-l2", (:))

#let _states(level) = if level == 1 {
  (first: _first-l1, last: _last-l1)
} else if level == 2 {
  (first: _first-l2, last: _last-l2)
}

// 末标题更新
#let last-heading-update(curr-heading) = {
  let s = _states(curr-heading.level)
  if s != none {
    s.last.update(headings => {
      headings.insert(str(curr-heading.location().page()), heading-new(curr-heading))
      headings
    })
  }
}

// 首标题更新
#let first-heading-update(curr-heading) = context {
  let s = _states(curr-heading.level)
  if s != none {
    s.first.update(headings => {
      let k = str(curr-heading.location().page())
      if k not in headings {
        headings.insert(k, heading-new(curr-heading))
      }
      headings
    })
  }
}

// 查询函数：查找当前页或上一页最近的指定级别标题
// level: 标题级别 (1 或 2)
// 返回格式：(exists: bool, content: content)
#let find-current-heading(level) = {
  let s = _states(level)
  if s == none { return (exists: false, content: none) }

  let current-page = here().page()
  let first-headings = s.first.final()
  let last-headings = s.last.get()

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
