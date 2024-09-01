#import "@preview/touying:0.4.2": *
#import "@preview/tiaoma:0.2.0": qrcode

// For Japanese
// #set text(font: "Noto Serif CJK JP", lang: "ja")
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "Noto Serif CJK JP", lang: "ja")

#let s = themes.dewdrop.register(
  aspect-ratio: "16-9",
  footer: [Dewdrop],
  navigation: "mini-slides",
  primary: rgb("#0c4842"),
  // navigation: none,
)

#let s = (s.methods.info)(
  self: s,
  title: [Title],
  subtitle: [Subtitle],
  author: [Authors],
  date: datetime.today(),
  institution: [Institution],
)

#let (init, slides, touying-outline, alert, speaker-note) = utils.methods(s)
#show: init

#show strong: alert

#let (slide, empty-slide, title-slide, new-section-slide, focus-slide) = utils.slides(s)
#show: slides

= Section A

== Subsection A.1

#slide[
  #set align(center)
  This slide is available at \
  `https://github.com/tani/gitpod-typst`
  #qrcode(
    "https://github.com/tani/gitpod-typst",
    options: (scale: 4.0)
  )
]

#slide[
  A slide with equation:

  $ x_(n+1) = (x_n + a/x_n) / 2 $
]

== Subsection A.2

#slide[
  A slide without a title but with *important* infos
]

= Section B

== Subsection B.1

#slide[
  #lorem(80)
]

#focus-slide[
  Wake up!
]

== Subsection B.2

#slide[
  We can use `#pause` to #pause display something later.

  #pause
  
  Just like this.

  #meanwhile
  
  Meanwhile, #pause we can also use `#meanwhile` to #pause display other content synchronously.
]

// appendix by freezing last-slide-number
#let s = (s.methods.appendix)(self: s)
#let (slide, empty-slide) = utils.slides(s)

= Appendix

=== Appendix

#slide[
  Please pay attention to the current slide number.
]