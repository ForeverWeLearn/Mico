#import "lib/lib.typ": *

#show: template

#let first-row-width = 12em;

#large("Typography")

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Font*], [*str*]),
  "Text", font-text,
  "Icon", font-icon,
)

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Weight*], [*int*]),
  "Normal", str(weight-normal),
  "Bold", str(weight-bold),
)

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Text*], [*px*]),
  "Small", "12 px",
  "Medium", "16 px",
  "Large", "24 px",
)

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Leading*], [*em*]),
  "Small", "1.333 em",
  "Medium", "1.0 em",
  "Large", "0.5 em",
)

#v(unit-y)

#pagebreak()

#large("Palette")

#table(
  columns: (2 * unit-x, first-row-width, 1fr, 2fr),
  align: (left, left + horizon, center + horizon, center + horizon),
  table.header([*Color*], [], [*hex*], [*oklch*]),
  color-node(c: color-bg), "Background", color-bg.to-hex(), "oklch(16%, 0, 0deg)",
  color-node(c: color-fg), "Foreground", color-fg.to-hex(), "oklch(95%, 0, 0deg)",
)

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Opacity*], [*float*]),
  "Hover", "0.2",
  "Muted", "0.1",
)

#v(unit-y)

#pagebreak()

#large("Length")

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Unit*], [*px*]),
  "X", "16 px",
  "Y", "48 px",
)

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Border*], [*px*]),
  "Width", "2 px",
)

#table(
  columns: (first-row-width, 1fr),
  align: (left, center),
  table.header([*Radius*], [*px*]),
  "Medium", "8 px",
  "Large", "16 px",
)

#v(unit-y)

#pagebreak()

#align(center)[
  #stack(
    dir: ltr,
    spacing: unit-y,
    component-card(
      width: 360pt * PX,
      title-text: "Text",
      components: (
        [#align(center, large("Title!"))],
        [#align(center, bold("Modern ♥ Minimalistic"))],
        [#lorem(8)],
        [#small(lorem(21))],
      ),
    ),
    component-card(
      width: 360pt * PX,
      title-text: "Button",
      components: (
        [#align(center, stack(dir: ltr, spacing: unit-x, button(icon-name: "search", name: ""), button(
          icon-name: "search",
          name: "",
          active: true,
        )))],
        [#align(center, stack(dir: ltr, spacing: unit-x, button(), button(active: true)))],
        [#stack(dir: ttb, spacing: unit-x, button(icon-name: "search", width: 100%), button(
          icon-name: "search",
          active: true,
          width: 100%,
        ))],
      ),
    ),
  )
]

#v(unit-y)
