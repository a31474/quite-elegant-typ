#import "@local/quite-elegant-typ:0.2.0": *


#show: book.with(
  cover: layout(size => block(
    width: 100%,
    height: size.width * 3 / 4,
    align(center + horizon)[#text(size: 50pt)[封面]],
  )),
)


=

#lorem(50)

==
#lorem(50)


#pagebreak()
=
