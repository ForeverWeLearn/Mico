#import "lib/lib.typ": *

#show: template

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
        [#small(lorem(16))],
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
