#import "lib.typ": *

#show raw.where(block: true): it => {
  set par(justify: false)
  block(
    fill: luma(245),
    inset: (top: 4pt, bottom: 4pt),
    radius: 4pt,
    width: 100%,
    stack(
      ..it.lines.map(raw_line => block(
        inset: 3pt,
        width: 100%,
        grid(
          columns: (1em + 4pt, 1fr),
          align: (right + horizon, left),
          column-gutter: 0.7em,
          row-gutter: 0.6em,
          text(gray, [#raw_line.number]), raw_line,
        ),
      )),
    ),
  )
}

#show: conf
#default-cover(
  cover: image("image/cover.jpg", width: 100%),
  title: [Quite-Elegant-Typ：简单的书籍模板],
  subtitle: [ElegantBook 的 Typst 复刻],
  author: [编译型战狼],
  date: datetime.today().display(),
  version: version(0, 2, 0),
  other: (自定义: "信息"),
)
#default-outline()

#set raw(lang: "typst")

= 模板介绍
== 模板说明
本模板旨在用 Typst 对 #link("https://github.com/ElegantLaTeX/ElegantBook")[ElegantBook] 进行复刻.

== 模板下载
模板发布在 #link("https://github.com/a31474/quite-elegant-typ")[https://github.com/a31474/quite-elegant-typ]

== 模板使用
下载后, 把模板放在本地文件夹下. 然后导入 `lib.typ` 即可使用

```
#import "lib.typ": *

#show: conf
#default-cover()
#default-outline()
```

注意把 `lib.typ` 改成其对应的本地路径

其中 `#default-cover()` 和 `#default-outline()` 分别添加了封面和目录. 若不需要, 可以不用加上.

封面和目录设置请参考 @封面 和 @目录

== 注意事项
本模板字体请一定按 @字体 配置好, 本模板依据特定字体进行编写. 没有考虑到使用其他字体的情况.

== 待办事项
本模板仍未完善, 未能完成对 ElegantBook 的完全复刻. 还有以下事项需要解决

+ 章节摘要
+ 章后习题
+ 参考文献

== 其他

使用模板时, 若需要添加 `show` , `set` 规则时. 注意把 `show` 规则添加到本文档设置 `#show: conf` 前, 以免与模板设置发生冲突. 而可以把 `set` 规则添加到 `#show: conf` 后, 以覆盖模板的配置.

如本文档对代码块进行的 `show` , `set` 设置
```
#show raw.where(block: true): it => {
  set par(justify: false)
  block(
    fill: luma(245),
    inset: (top: 4pt, bottom: 4pt),
    radius: 4pt,
    width: 100%,
    stack(
      ..it.lines.map(raw_line => block(
        inset: 3pt,
        width: 100%,
        grid(
          columns: (1em + 4pt, 1fr),
          align: (right + horizon, left),
          column-gutter: 0.7em,
          row-gutter: 0.6em,
          text(gray, [#raw_line.number]), raw_line,
        ),
      )),
    ),
  )
}

#show: conf
#default-cover(
  image: image("image/cover.jpg", width: 100%),
  title: [Quite-Elegant-Typ：简单的书籍模板],
  subtitle: [ElegantBook 的 Typst 复刻],
)
#default-outline()

#set raw(lang: "typst")

```
#pagebreak()

= 字体设置 <字体>
== 需要的字体
本模板需要以下字体

- Times New Roman
- 方正书宋
- 方正黑体
- 方正楷体
- 方正仿宋

其中方正的方正书宋、*方正黑体*、_方正楷体_、#text(font: "FZFangSong-Z02S")[方正仿宋] 四款字体均可免费试用，且可用于商业用途。

== 具体细节
本模板的详细配置如下
```
#set text(font: ("Times New Roman", "FZShuSong-Z01S"))

#show emph: set text(font: ("Times New Roman", "FZKai-Z03S"))

#show strong: set text(font: ("Times New Roman", "FZHei-B01S"))
#show text.where(weight: "bold"): set text(font: ("Times New Roman", "FZHei-B01S"))
```
选用方正书宋作为正文字体

*选用方正黑体作为加粗字体*

_选用方正楷体作为强调字体_


#pagebreak()
= 模板设置说明

== 颜色主题

=== 颜色主题设置 <颜色>
本模板内置 5 种颜色主题，分别为 #text(fill: book-color.green.structure)[green]、#text(fill: book-color.cyan.structure)[cyan]、#text(fill: book-color.blue.structure)[blue]（默认）、#text(fill: book-color.gray.structure)[gray]、black。

调用其他颜色主题的方法为

```
#show: it => conf(it, color-theme: "green")
```

或

```
#show: conf.with(color-theme: "green")
```

也可以自定义颜色主题, 如
```
#show: it => conf(
  it,
  color-theme: (
    structure: rgb(255, 0, 0),
    main: rgb(0, 255, 0),
    second: rgb(0, 0, 255),
    third: rgb(255, 255, 0),
  ),
)
```
需传入一字典, 字典的 keys 必须分别为 structure, main, second, third. 各自的 value 为对应颜色.

=== 具体配置
下表为内置颜色主题的具体配置
#figure(
  table(
    columns: 7,
    stroke: none,
    align: horizon,
    table.hline(),
    table.header(
      [],
      text(fill: book-color.green.structure)[green],
      text(fill: book-color.cyan.structure)[cyan],
      text(fill: book-color.blue.structure)[blue],
      text(fill: book-color.gray.structure)[gray],
      [black],
      [主要使用的环境],
    ),
    table.hline(stroke: 0.5pt),
    [structure],
    square(fill: book-color.green.structure), square(fill: book-color.cyan.structure),
    square(fill: book-color.blue.structure), square(fill: book-color.gray.structure),
    square(fill: black),
    [chapter section subsection],
    [main],
    square(fill: book-color.green.main), square(fill: book-color.cyan.main),
    square(fill: book-color.blue.main), square(fill: book-color.gray.main),
    square(fill: black),
    [definition exercise problem],
    [second],
    square(fill: book-color.green.second), square(fill: book-color.cyan.second),
    square(fill: book-color.blue.second), square(fill: book-color.gray.second),
    square(fill: black),
    [theorem lemma corollary],
    [third],
    square(fill: book-color.green.third), square(fill: book-color.cyan.third),
    square(fill: book-color.blue.third), square(fill: book-color.gray.third),
    square(fill: black),
    [proposition],
    table.hline(stroke: 0.5pt),
  ),
)

== 封面设置 <封面>
=== 默认封面设置
封面 `default-cover` 提供了以下参数

/ cover: 封面图片
/ rect-color: 中间色块颜色
/ logo: 徽标
/ title: 标题
/ subtitle: 副标题
/ author: 作者,
/ institute: 机构,
/ date: 日期,
/ version: 版本,
/ other: 自定义元素,
/ extrainfo: 自定义内容,

其中 `other` 需要传入一字典来, 显示自定义的元素.

而 `extrainfo` 可以传入 `content`

如下为本文档的封面
```
#default-cover(
  cover: image("image/cover.jpg", width: 100%),
  title: [Quite-Elegant-Typ：简单的书籍模板],
  subtitle: [ElegantBook 的 Typst 复刻],
  author: [编译型战狼],
  date: datetime.today().display(),
  version: version(0, 1, 0),
  other: (自定义: "信息"),
)
```
=== 自定义封面
若不需要默认封面, 想自定义封面, 可以自己编写, 但要注意本模板添加了页眉, 页脚. 需要手动取消. 还要记得把页面计数重置.

例如
```
#show: conf
// 自定义封面
#{
  page(footer: none,header: none)[
    #align(center+horizon)[#text(30pt)[封面]]
  ]
  // 重置页面计数
  counter(page).update(1)
}
```


== 目录选项 <目录>
目录的颜色主题不会随 conf 的设置变化, 需要手动设定
```
#default-outline(color-theme: "green")
```

== 数学环境简介
本模板定义了三类数学环境, 有以下这些
- 定理类环境
  - definition
  - theorem、lemma、corollary、axiom、postulate
  - proposition
- 示例类环境
  - example、problem、exercise
- 结论类环境
  - note
  - conclusion、assumption、property、remark、solution
  - proof

=== 定理类环境
包括三种格式

#text(fill: book-color.blue.main)[definition] 环境，颜色为 #text(fill: book-color.blue.main)[main]；

#text(fill: book-color.blue.second)[theorem、lemma、corollary、axiom、postulate] 环境，颜色为 #text(fill: book-color.blue.second)[second]；

#text(fill: book-color.blue.third)[proposition] 环境，颜色为 #text(fill: book-color.blue.third)[third]。

并且提供参数 `number`, 控制是否显示计数器.

```
#definition[ 测试][$ a times b $] <定义:test>
#definition[ 测试][$ a times b $]
#definition(number: false)[ (测试)][$ c times d $] <test>
```
#definition[ 测试][$ a times b $] <定义:test>
#definition[ 测试][$ a times b $]
#definition(number: false)[ (测试)][$ c times d $] <test>

=== 示例类环境
包括 example、problem、exercise.

并且提供参数 `number`, 控制是否显示计数器.

```
#example() 测试

#example(number: false) 测试

#example() 测试
```
#example() 测试

#example(number: false) 测试

#example() 测试

=== 结论类环境
包括 note、conclusion、assumption、property、remark、solution、proof

```
#note[测试]

#note[] 测试
```

#note[测试]

#note[] 测试

被包含的内容字体会有变化

=== 数学环境的引用

引用有计数器的数学环境时, 标签前请加上对应计数器的名称.如下
```
#definition[ 测试][$ a times b $] <定义:test>
#definition(number: false)[ (测试)][$ c times d $] <test>

引用测试 @定义:test

引用测试 #link(<test>)[定义引用]
```

引用测试 @定义:test

引用测试 #link(<test>)[定义引用]

=== 颜色设置

数学环境的颜色想要更改需要手动更改文件.

需要更改 `math` 文件夹下的 `math.typ` 中

```
// 颜色主题
#let color-themes = color-select("blue")
```

改为对应颜色主题, 如
```
#let color-themes = color-select("black")
```
或像 @颜色, 传入一字典
```
#let color-themes = (
  structure: rgb(255, 0, 0),
  main: rgb(0, 255, 0),
  second: rgb(0, 0, 255),
  third: rgb(255, 255, 0),
)
```

=== 新增数学环境
要新增数学环境可以使用 `#math-fun-def`, `#math-fun-exam`, `#math-fun-note`, 分别对应定理类环境, 示例类环境, 结论类环境.

可以参照以下进行编写

*定理类*
```
#let postulate(number: true, name, content) = math-fun-def(
  main-color: color-themes.second,
  type: "假设",
  number: number,
  name,
  content,
)
```

*示例类*
```
#let example(number: true) = math-fun-exam(
  main-color: color-themes.main,
  number: number,
  type: "例",
)
```

*结论类*
```
#let conclusion(body) = math-fun-note(
  main-color: color-themes.third,
  font: ("Times New Roman", "FZKai-Z03S"),
  "结论",
  body,
)
```

== 列表环境

如下为列表环境, 没有进行太多设置. 如有需要可以自行设定

#grid(
  columns: 2,
  [
    - item1
    - 项目 2
      - item1
      - 项目 2
        - item1
        - 项目 2
  ],
  [
    + item1
    + 项目 2
      + item1
      + 项目 2
      + item1
      + 项目 2
  ],
)

== 数学公式编号

数学公式默认编号到一级标题

$ a times b $

可以改为二级标题

```
#show: conf.with(eq-level: 2)
```

== 添加序章
可以像这样添加无编号标题
```
#heading(numbering: none)[序章]
#heading(numbering: none, level: 2)[小节]
```
== 语言模式

本文档只按照编写中文文档的目标进行配置, 比如设置了
```
#set text(lang: "zh", region: "cn", size: 10pt)
```

== 章后习题
章后习题（problemset）环境，用于在每一章结尾，显示本章的练习。使用方法如下
```
#problemset[
  + exercise 1
  + exercise 2
  + exercise 3
]
```

#problemset[
  + exercise 1
  + exercise 2
  + exercise 3
]
#pagebreak()
= 写作示例

== Lebesgue 积分

在前面各章做了必要的准备后，本章开始介绍新的积分。在 Lebesgue 测度理论的基础上建立了 Lebesgue 积分，其被积函数和积分域更一般，可以对有界函数和无界函数统一处理。正是由于 Lebesgue 积分的这些特点，使得 Lebesgue 积分比 Riemann 积分具有在更一般条件下的极限定理和累次积分交换积分顺序的定理，这使得 Lebesgue 积分不仅在理论上更完善，而且在计算上更灵活有效。

Lebesgue 积分有几种不同的定义方式。我们将采用逐步定义非负简单函数，非负可测函数和一般可测函数积分的方式。

由于现代数学的许多分支如概率论、泛函分析、调和分析等常常用到一般空间上的测度与积分理论，在本章最后一节将介绍一般的测度空间上的积分。

=== 积分的定义
我们将通过三个步骤定义可测函数的积分。首先定义非负简单函数的积分。以下设 $E$ 是 $cal(R)^n$ 中的可测集。

#definition[ (可积性)][
  设 $f(x)= limits(sum)_(i=1)^(k) a_i  chi_(A_i) (x)$ 是 $E$ 上的非负简单函数，中文其中 ${A_1,A_2,dots,A_k}$ 是 $E$ 上的一个可测分割，$a_1,a_2, dots,a_k$ 是非负实数。定义 $f$ 在 $E$ 上的积分为 $ integral_(a)^b f(x)$

  $
    integral_E f dif x = sum_(i=1)^k a_i m( A_i ) pi alpha beta sigma gamma nu epsilon.alt epsilon . integral.cont_a^b limits(integral.cont)_a^b product_(i=1)^n
  $
  一般情况下 $0 lt.eq integral_E f dif x lt.eq infinity $。若 $integral_E f dif x < infinity $，则称 $f$ 在 $E$ 上可积。
]
一个自然的问题是，Lebesgue 积分与我们所熟悉的 Riemann 积分有什么联系和区别？在 4.4 在我们将详细讨论 Riemann 积分与 Lebesgue 积分的关系。这里只看一个简单的例子。设 $D(x)$ 是区间 $[0,1]$ 上的 Dirichlet 函数。即 $D(x)= chi_(Q_0)(x)$，其中 $Q_0$ 表示 $[0,1]$ 中的有理数的全体。根据非负简单函数积分的定义，$D(x)$ 在 $[0,1]$ 上的 Lebesgue 积分为

$ integral_0^1 D(x) dif x = integral_0^1 chi_Q_0 (x) dif x = m(Q_0) =0 $

即 $D(x)$ 在 $[0,1]$ 上是 Lebesgue 可积的并且积分值为零。但 $D(x)$ 在 $[0,1]$ 上不是 Riemann 可积的。

有界变差函数是与单调函数有密切联系的一类函数。有界变差函数可以表示为两个单调递增函数之差。与单调函数一样，有界变差函数几乎处处可导。与单调函数不同，有界变差函数类对线性运算是封闭的，它们构成一线空间。

#exercise()
设 $f in.not in L(cal(R)^1)$, $g$ 是 $cal(R)^1$ 上的有界可测函数。证明函数

$ I(t)=integral_(cal(R)^1) f(x+t) g(x) dif x quad t in cal(R)^1 $

是 $cal(R)^1$ 上的连续函数。

#solution[即 $D(x)$ 在 $[0,1]$ 上是 Lebesgue 可积的并且积分值为零。但 $D(x)$ 在 $[0,1]$ 上不是 Riemann 可积的。]

#proof[即 $D(x)$ 在 $[0,1]$ 上是 Lebesgue 可积的并且积分值为零。但 $D(x)$ 在 $[0,1]$ 上不是 Riemann 可积的。]


#theorem[ (Fubini 定理)][
  （1）若 $f(x,y)$ 是 $ cal(R)^p  times cal(R)^q$ 上的非负可测函数，则对几乎处处的 $x in cal(R)^p$，$f(x,y)$ 作为 $y$ 的函数是 $cal(R)^q$ 上的非负可测函数，$g(x)=integral_(cal(R)^q)f(x,y) dif y$ 是 $cal(R)^p$ 上的非负可测函数。并且

  $
    integral_(cal(R)^p times cal(R)^q) f(x,y) dif x dif y
    = integral_(cal(R)^p)( integral_(cal(R)^q) f(x,y) dif y )dif x
  $ <a>

  （2）若 $f(x,y)$ 是 $cal(R)^p times cal(R)^q$ 上的可积函数，则对几乎处处的 $x in cal(R)^p$，$f(x,y)$ 作为 $y$ 的函数是 $cal(R)^q$ 上的可积函数，并且 $g(x)=integral_(cal(R)^q) f(x,y) dif y$ 是 $cal(R)^p$ 上的可积函数。而且@a 成立。
] <定理:a>

#note[在本模板中，引理（lemma），推论（corollary）的样式和@定理:a 的样式一致，包括颜色，仅仅只有计数器的设置不一样。]
#proposition[ (最优性原理)][如果 $u^*$ 在 $[s,T]$ 上为最优解，则 $u^*$ 在 $[s, T]$ 任意子区间都是最优解，假设区间为 $[t_0, t_1]$ 的最优解为 $u^*$ ，则 $u(t_0)=u^{*}(t_0)$，即初始条件必须还是在 $u^*$ 上。]

我们知道最小二乘法可以用来处理一组数据，可以从一组测定的数据中寻求变量之间的依赖关系，这种函数关系称为经验公式。本课题将介绍最小二乘法的精确定义及如何寻求点与点之间近似成线性关系时的经验公式。假定实验测得变量之间的 $n$ 个数据，则在平面上，可以得到 $n$ 个点，这种图形称为 “散点图”，从图中可以粗略看出这些点大致散落在某直线近旁, 我们认为其近似为一线性函数，下面介绍求解步骤。

#figure(image("image/scatter.jpg", width: 60%), caption: [散点图示例] + $hat(y)=a + b x$)

以最简单的一元线性模型来解释最小二乘法。什么是一元线性模型呢？监督学习中，如果预测的变量是离散的，我们称其为分类（如决策树，支持向量机等），如果预测的变量是连续的，我们称其为回归。回归分析中，如果只包括一个自变量和一个因变量，且二者的关系可用一条直线近似表示，这种回归分析称为一元线性回归分析。如果回归分析中包括两个或两个以上的自变量，且因变量和自变量之间是线性关系，则称为多元线性回归分析。对于二维空间线性是一条直线；对于三维空间线性是一个平面，对于多维空间线性是一个超平面。

#property[
  柯西列的性质
  + $x_k$ 是柯西列，则其子列 $x_k^i$ 也是柯西列。
  + $x_k in cal(R)^n$，$rho(x,y)$ 是欧几里得空间，则柯西列收敛，$(cal(R)^n,rho)$ 空间是完备的。
]
#conclusion[
  回归分析（regression analysis） 是确定两种或两种以上变量间相互依赖的定量关系的一种统计分析方法。运用十分广泛，回归分析按照涉及的变量的多少，分为一元回归和多元回归分析；按照因变量的多少，可分为简单回归分析和多重回归分析；按照自变量和因变量之间的关系类型，可分为线性回归分析和非线性回归分析。
]

#problemset[
  + 设 $A$ 为数域 $K$ 上的 $n$ 级矩阵。证明：如果 $K_n$ 中任意非零列向量都是 $A$ 的特征向量，则 $A$ 一定是数量矩阵。
  + 证明：不为零矩阵的幂零矩阵不能对角化。
  + 设 $A = (a_(i j))$ 是数域 $K$ 上的一个 $n$ 级上三角矩阵，证明：如果 $a_(11) = a_(22) = dots.c = a_(n n)$，并且至少有一个 $a_(k l) eq.not 0 (k < l)$，则 $A$ 一定不能对角化。
]