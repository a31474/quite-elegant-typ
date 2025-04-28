#let adf-triple-flourish-left(color) = bytes(
  read("../svg/adf-triple-flourish-left.svg").replace(
    "currentColor",
    color.to-hex(),
  ),
)

#let adf-triple-flourish-right(color) = bytes(
  read("../svg/adf-triple-flourish-right.svg").replace(
    "currentColor",
    color.to-hex(),
  ),
)

#let problemset-numbering-fn = (..nums) => {
  numbering("第一章",nums.pos().first())
}
#let problemset(color: black, body) = {
  heading(numbering: problemset-numbering-fn,level: 2)[练习]
  body
}