// Constants
#let PX = 0.75
#let transparent = oklch(0%, 0, 0deg, 0%)
#let pangram = "The quick brown fox jumps over the lazy dog"


// Typography
#let font-text = "JetBrains Mono"
#let font-icon = "Material Symbols Outlined"

#let weight-normal = 600
#let weight-bold = 900

#let text-sm = 12pt * PX
#let text-md = 16pt * PX
#let text-lg = 24pt * PX

#let leading-sm = 1.333em
#let leading-md = 1.0em
#let leading-lg = 0.5em


// Palette
#let color-bg = oklch(16%, 0, 0deg)
#let color-fg = oklch(95%, 0, 0deg)
#let color-muted = oklch(62%, 0, 0deg)
#let color-stroke = oklch(32%, 0, 0deg)


// Measurement
#let unit-x = 16pt * PX
#let unit-y = 48pt * PX

#let corner-radius = 6pt * PX

#let stroke-width = 1.5pt * PX

#let icon-scale = 125%;


// Utils
#let to-rgb(c) = {
  let (r, g, b, a) = rgb(c).components()
  (
    "rgb("
      + repr(int(calc.round(r / 1% * 2.55)))
      + ", "
      + repr(int(calc.round(g / 1% * 2.55)))
      + ", "
      + repr(int(calc.round(b / 1% * 2.55)))
      + ")"
  )
}

#let to-oklch(c) = {
  let (l, chroma, h, alpha) = oklch(c).components()
  "oklch(" + repr(l) + ", " + str(calc.round(chroma, digits: 3)) + ", " + repr(h) + ")"
}

#let pt-to-px(p, truncate: true) = {
  let truncate = calc.trunc(p / PX / 1pt)
  let estimate = calc.round(p / PX / 1pt, digits: 1)
  repr(if calc.abs(truncate - estimate) < 0.01 { truncate } else { estimate }) + "px"
}


// Document Template
#let template(doc) = {
  set page(
    width: unit-x * 88,
    height: auto,
    margin: (x: unit-x * 8, y: unit-y * 2),
    fill: color-bg,
  )
  set text(
    font: font-text,
    size: text-md,
    weight: weight-normal,
    fill: color-fg,
  )
  show strong: set text(weight: weight-bold)
  set strike(stroke: stroke-width, extent: unit-x / 4)
  set par(leading: leading-md, spacing: leading-md * 3)
  show table: it => block(
    breakable: false,
    radius: corner-radius,
    stroke: stroke-width + color-stroke,
    clip: true,
    it,
  )
  show table.cell.where(y: 0): set text(fill: color-bg, weight: weight-bold)
  set table(
    stroke: (x, y) => if y == 0 { 1pt + color-fg } else if y == 1 { (top: 1pt + color-fg) } else {
      transparent
    },
    fill: (x, y) => if y == 0 { color-fg } else { color-bg },
    align: (x, y) => left + horizon,
    inset: unit-x,
  )
  doc
}


// Primitive Components
#let small(doc) = {
  set text(size: text-sm)
  set par(leading: leading-sm, spacing: leading-sm * 3)
  doc
}

#let large(doc) = {
  set text(size: text-lg)
  set par(leading: leading-lg, spacing: leading-lg * 2)
  set underline(offset: 8pt * PX, stroke: 4pt * PX + color-fg)
  doc
}

#let muted(doc) = {
  set text(fill: color-muted)
  doc
}

#let icon(name, fill: color-fg) = box(
  width: unit-x,
  height: unit-x,
  scale(x: icon-scale, y: icon-scale)[#text(name, font: font-icon, fill: fill)],
)

#let color-node(c) = box(
  width: unit-x,
  height: unit-x,
  fill: c,
  radius: unit-x,
  stroke: stroke-width + color-fg,
)

#let inherit(sth) = sym.arrow.r.curve + " " + sth

#let container(
  width: auto,
  dash: "solid",
  doc,
) = block(
  width: width,
  inset: unit-x,
  radius: corner-radius,
  stroke: (thickness: stroke-width, paint: if dash == none { transparent } else { color-stroke }, dash: dash),
  spacing: unit-x,
  doc,
)


// Components
#let button(icon-name: "", name: "Button", muted: false, hover: false, active: false, width: auto) = {
  let bg = if active { color-fg } else { color-bg }
  let fg = if active { color-bg } else if muted { color-muted } else { color-fg }
  let has-icon = icon-name != ""
  let has-name = name != ""

  block(
    width: width,
    height: unit-y,
    radius: corner-radius,
    fill: bg,
    stroke: if active { stroke-width + color-fg } else if hover { stroke-width + color-stroke } else { none },
    inset: unit-x,
    align(center, stack(
      dir: ltr,
      spacing: if has-icon and has-name { unit-x } else { 0pt },
      if has-icon { align(horizon + center, icon(icon-name, fill: fg)) },
      if has-name { align(horizon, text(name, fill: fg)) },
    )),
  )
}

#let component-card(width: auto, title-text: str, components: array) = container(
  width: width,
  dash: none,
  stack(
    dir: ttb,
    spacing: unit-x,
    align(center, block(inset: unit-y, large(title-text))),
    components.map(element => container(width: 100%, element)).join(),
  ),
)

#let color-row(color-name, c) = table.header(
  color-node(c),
  color-name,
  c.to-hex(),
  to-rgb(c),
  to-oklch(c),
)
