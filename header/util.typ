// 工具函数：格式化标题，包含编号和正文
#let heading-new(heading-old) = {
  let numbering-fun = heading-old.numbering
  let numbering-nums = counter(heading).at(heading-old.location())

  let formatted-numbering = if numbering-fun == none {
    none
  } else {
    numbering(numbering-fun, ..numbering-nums)
  }

  if formatted-numbering == none {
    heading-old.body
  } else {
    formatted-numbering + " " + heading-old.body
  }
}
