#import "lib/lib.typ": *

#show: template

#let token-col-width = 12em;
#let value-col-width = 6em;

#large([*Typography*])

#table(
  columns: (auto, auto, auto),
  align: (left, center, center),
  table.header([*Font*]),
  "font-text", font-text, pangram,
  "font-icon",
  font-icon,
  stack(
    dir: ltr,
    spacing: unit-x,
    icon("interests"),
    icon("favorite"),
    icon("imagesmode"),
    icon("camera"),
    icon("palette"),
    icon("aspect_ratio"),
    icon("contrast"),
    icon("compare"),
    icon("tonality"),
    icon("filter_center_focus"),
    icon("transition_slide"),
    icon("transition_chop"),
    icon("category_search"),
  ),
)

#table(
  columns: (token-col-width, value-col-width, auto),
  align: (left, center, center),
  table.header([*Weight*]),
  "weight-normal", str(weight-normal), pangram,
  "weight-bold", str(weight-bold), strong(pangram),
)

#stack(
  dir: ltr,
  spacing: unit-x,
  table(
    columns: (token-col-width, value-col-width, value-col-width, unit-x * 16),
    align: (horizon, center + horizon, center + horizon, center),
    table.header([*Text*]),
    "text-sm", pt-to-px(text-sm), repr(leading-sm), small(lorem(8)),
    "text-md", pt-to-px(text-md), repr(leading-md), lorem(6),
    "text-lg", pt-to-px(text-lg), repr(leading-lg), large(lorem(5)),
  ),
)

#v(unit-y)

#pagebreak()

#large([*Palette*])

#table(
  columns: (2 * unit-x, auto, auto, auto, auto),
  table.header("Color"),
  color-row("color-bg", color-bg),
  color-row("color-fg", color-fg),
  color-row("color-muted", color-muted),
  color-row("color-stroke", color-stroke),
)

#v(unit-y)

#pagebreak()

#large([*Measurement*])

#table(
  columns: (token-col-width, value-col-width),
  align: (left, right),
  table.header("Unit"),
  "unit-x", pt-to-px(unit-x),
  "unit-y", pt-to-px(unit-y),
)

#table(
  columns: (token-col-width, value-col-width),
  align: (left, right),
  table.header("Width"),
  "stroke-width", pt-to-px(stroke-width),
)

#table(
  columns: (token-col-width, value-col-width),
  align: (auto, right),
  table.header("Radius"),
  "corner-radius", pt-to-px(corner-radius),
)

#v(unit-y)

#pagebreak()

#align(center)[
  #stack(
    dir: ltr,
    spacing: unit-y,
    component-card(
      width: 21 * unit-x,
      title-text: strong("Text"),
      components: (
        large(strong("Monospace")),
        strong("Modern & Minimalistic"),
        [#muted(strike("My")) Your Image Collection

          I am obsessed with organizing images even when I rarely open them.],
        [#small([
          #lorem(14)

          #lorem(18)
        ])],
      ),
    ),
    component-card(
      width: 19 * unit-x,
      title-text: strong("Button"),
      components: (
        align(center, stack(
          dir: ltr,
          spacing: unit-x,
          button(icon-name: "search", name: "", muted: true),
          button(icon-name: "search", name: ""),
          button(icon-name: "search", name: "", hover: true),
          button(icon-name: "search", name: "", active: true),
        )),
        grid(
          columns: (1fr, 1fr),
          gutter: unit-x,
          button(width: 100%, muted: true), button(width: 100%),
          button(width: 100%, hover: true), button(width: 100%, active: true),
        ),
        stack(
          dir: ttb,
          spacing: unit-x,
          button(icon-name: "search", width: 100%, muted: true),
          button(icon-name: "search", width: 100%),
          button(icon-name: "search", width: 100%, hover: true),
          button(icon-name: "search", active: true, width: 100%),
        ),
      ),
    ),
  )
]

#v(unit-y)

