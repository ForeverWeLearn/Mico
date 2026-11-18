#let PX = 72 / 96;

#let opacity-active = 100%;
#let opacity-muted = 7.5%;

#let color-fg = oklch(95%, 0, 0deg)
#let color-bg = oklch(16%, 0, 0deg);
#let color-border = color-fg.transparentize(100% - opacity-muted)

#let border-width = 2pt * PX;
#let radius-base = 4pt * PX;
#let radius-container = 8pt * PX;

#let unit-x = 16pt * PX;
#let unit-y = 40pt * PX;

#let font-text = "JetBrains Mono";
#let font-icon = "Material Symbols Outlined";

#let weight-normal = 500;
#let weight-bold = 900;

#let text-sm = 12pt * PX;
#let text-md = 16pt * PX;
#let text-lg = 24pt * PX;

#let leading-sm = 1.333em;
#let leading-md = 1.0em;
#let leading-lg = 0.5em;

#let template(doc) = {
  set page(
    width: 29.7cm,
    height: auto,
    fill: color-bg,
  )
  set text(
    font: font-text,
    size: text-md,
    weight: weight-normal,
    fill: color-fg,
  )
  set par(leading: leading-md, spacing: leading-md * 3)

  doc
}

#let small(doc) = {
  set text(size: text-sm)
  set par(leading: leading-sm, spacing: leading-sm * 2)
  doc
}

#let large(doc) = {
  set text(size: text-lg, weight: weight-bold)
  set par(leading: leading-lg, spacing: leading-lg * 2)
  set underline(offset: 8pt * PX, stroke: 4pt * PX + color-fg)
  doc
}

#let bold(doc) = {
  set text(weight: weight-bold)
  doc
}

#let container(
  width: auto,
  doc
) = block(
  width: width,
  inset: unit-x,
  above: 10pt,
  radius: radius-container,
  stroke: border-width + color-border,
  spacing: unit-x,
  doc
)

#let component-card(width: auto, title-text: str, components: array) = container(
  width: width,
  stack(
    dir: ttb,
    spacing: unit-x,
    align(center, block(inset: unit-y, large(title-text))),
    components.map(element => container(width: 100%, element)).join()
  )
)

#let icon(name: str, fill: stroke) = scale(x: 125%, y: 125%)[#text(name, font: font-icon, fill: fill)]

#let button(icon-name: "", name: "Button", active: false, width: auto) = {
  let bg = if active { color-fg } else { color-bg };
  let fg = if active { color-bg } else { color-fg };
  let has-icon = icon-name != "";
  let has-name = name != "";

  block(
    width: width,
    height: unit-y,
    radius: radius-base,
    fill: bg,
    inset: unit-x,
    align(center,
      stack(
        dir: ltr,
        spacing: if has-icon and has-name { unit-x } else { 0pt },
        if has-icon { align(horizon + center, icon(name: icon-name, fill: fg)) },
        if has-name { align(horizon, text(name, fill: fg)) },
      )
    )
  )
}