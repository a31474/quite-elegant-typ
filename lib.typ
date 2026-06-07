// 颜色
#import "util/color.typ": book-color, color-select

// 模板
#import "conf.typ": conf

// 目录
#import "util/tool.typ": default-cover, default-outline

// 便捷入口：cover + outline + conf，一次调用完成所有设置
#let book(
  doc,
  // conf 参数
  color-theme: "blue",
  math-fun-color-theme: none,
  eq-level: 1,
  fig-image-level: 1,
  math-fun-level: 1,
  // cover 参数
  cover: none,
  rect-color: rgb(32, 178, 170),
  title: "标题",
  subtitle: "副标题",
  author: none,
  institute: none,
  date: none,
  version: none,
  other: none,
  logo: none,
  extrainfo: none,
  outline-color: none,
) = {
  let cover = default-cover(
    cover: cover,
    rect-color: rect-color,
    title: title,
    subtitle: subtitle,
    author: author,
    institute: institute,
    date: date,
    version: version,
    other: other,
    logo: logo,
    extrainfo: extrainfo,
  )
  let outline-color = if outline-color == none {
    color-select(color-theme).structure
  } else { outline-color }
  let outline = default-outline(outline-color: outline-color)
  conf(
    cover + outline + doc,
    color-theme: color-theme,
    math-fun-color-theme: math-fun-color-theme,
    eq-level: eq-level,
    fig-image-level: fig-image-level,
    math-fun-level: math-fun-level,
  )
}

// 定理类环境
#import "math/math-fun-def.typ": definition
#import "math/math-fun-def.typ": axiom, corollary, lemma, postulate, theorem
#import "math/math-fun-def.typ": proposition

// 示例类环境
#import "math/math-fun-exam.typ": example, exercise, problem

// 提示类环境
#import "math/math-fun-note.typ": note
// 结论类环境
#import "math/math-fun-note.typ": assumption, conclusion, proof, property, remark, solution

//
#import "math/math.typ": math-fun-def, math-fun-exam, math-fun-note
#import "math/math.typ": math-fun-color-theme-state

#import "util/problemset.typ": problemset
#import "util/introduction.typ": introduction
