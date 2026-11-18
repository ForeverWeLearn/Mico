#import "lib/lib.typ": *

#show: template

#let token-col-width = 12em;
#let numeric-col-width = 6em;

#large("Typography")

#table(
  columns: (auto, auto),
  align: (left, left),
  table.header([*Font*], [*str*]),
  "font-text", font-text,
  "font-icon", font-icon,
)

#table(
  columns: (token-col-width, numeric-col-width),
  align: (left, right),
  table.header([*Weight*], [*int*]),
  "weight-normal", str(weight-normal),
  "weight-bold", str(weight-bold),
)

#table(
  columns: (token-col-width, numeric-col-width),
  align: (left, right),
  table.header([*Text*], [*px*]),
  "text-sm", pt-to-px(text-sm),
  "text-md", pt-to-px(text-md),
  "text-lg", pt-to-px(text-lg),
)

#table(
  columns: (token-col-width, numeric-col-width),
  align: (left, right),
  table.header([*Leading*], [*em*]),
  "leading-sm", repr(leading-sm),
  "leading-md", repr(leading-md),
  "leading-lg", repr(leading-lg),
)

#v(unit-y)

#pagebreak()

#large("Palette")

#table(
  columns: (2 * unit-x, token-col-width - 2 * unit-x, token-col-width, 1fr, 2fr),
  align: (left, left + horizon, left + horizon, center + horizon, center + horizon),
  table.header([*Color*], [], [*Inherit*], [*hex*], [*oklch*]),
  color-node(color-bg), "color-bg", "", color-bg.to-hex(), oklch-to-str(color-bg),
  color-node(color-fg), "color-fg", "", color-fg.to-hex(), oklch-to-str(color-fg),
)

#table(
  columns: (token-col-width, numeric-col-width),
  align: (left, right),
  table.header([*Opacity*], [*float*]),
  "opacity-hover", repr(opacity-hover),
)

#v(unit-y)

#pagebreak()

#large("Length")

#table(
  columns: (token-col-width, numeric-col-width),
  align: (left, right),
  table.header([*Unit*], [*px*]),
  "unit-x", pt-to-px(unit-x),
  "unit-y", pt-to-px(unit-y),
)

#table(
  columns: (token-col-width, numeric-col-width),
  align: (left, right),
  table.header([*Border Width*], [*px*]),
  "border-width-sm", pt-to-px(border-width-sm),
  "border-width-md", pt-to-px(border-width-md),
)

#table(
  columns: (token-col-width, token-col-width, numeric-col-width),
  align: (left, left, right),
  table.header([*Radius*], [*Inherit*], [*px*]),
  "radius-md", "", pt-to-px(radius-md),
  "radius-lg", "", pt-to-px(radius-lg),
  "radius-button", inherit("radius-md"), pt-to-px(radius-md),
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
        [#align(center, large("Monospace"))],
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
