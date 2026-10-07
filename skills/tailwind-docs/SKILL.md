---
name: tailwind-docs
description: Verify Tailwind CSS utility classes, variants, defaults and syntax against a local copy of the official Tailwind CSS v4 docs before using them. Use when writing or reviewing any Tailwind markup, when unsure whether a class/modifier exists, when configuring the theme (custom colors, fonts, breakpoints, shadows, animations), or when explaining a utility. Avoid guessing class names from memory.
---

# Tailwind CSS v4 — local docs lookup

The complete official Tailwind CSS v4 documentation is vendored as MDX in `docs/` next to this file — one `<property>.mdx` per CSS property, plus `colors.ts` (the full default palette definitions). If `docs/` is empty (fresh install), populate it once: `bash <this-skill-folder>/scripts/fetch-tailwind-docs.sh` (sparse-clones the 197 MDX pages from the official tailwindcss.com repo into `docs/`), then use that folder path for all lookups. To refresh the cached docs later, re-run the same script.

**Rule: when applying this skill, don't write a class name from memory.** Check the doc page for the property first (ls/grep, then Read). The MDX files contain exact class tables, variants, defaults, and code examples.

## How to look things up

- One page per CSS property, named `<property>.mdx` (e.g. `box-shadow.mdx`, `border-radius.mdx`, `grid-template-columns.mdx`, `animate.mdx`... ). `ls` the directory to find candidates, or `grep -ril "<css property or keyword>"` over the MDX files.
- Theme customization, custom utilities/variants, and the `@theme` directive: `adding-custom-styles.mdx` and `theme.mdx`-related pages.
- Default palette values: `docs/colors.ts`.

## Quick page map

| Area | Pages |
|---|---|
| Layout | `container`, `display`, `position`, `inset`, `top-*`/`bottom-*` (property pages), `z-index`, `float`, `clear`, `columns`, `isolation`, `aspect-ratio`, grid templates (grid-template-columns/rows), grid placement, `flex` (`flex-direction`, `flex-wrap`, `flex-grow/shrink/basis`), `gap`, `order`, `justify-*`/`align-*`/`place-*` |
| Spacing & sizing | `padding`, `margin`, `space-x-*`/`space-y-*`, `width`/`height` (incl. `min`/`max` variants), `size`, `box-sizing`, `object-fit`/`object-position`, `overscroll-behavior` |
| Color | `background-color`, `text-color`, `border-color`, `accent-color`, `caret-color`, gradient pages (`background-image`), ring/outline/shadow color pages |
| Typography | `font-family`, `font-size`, `font-weight`, `line-height`, `letter-spacing`, `text-align`, `text-decoration-*`, `text-transform`, `text-wrap`, `white-space`, `word-break`, `overflow-wrap`, `hyphens`, `content` |
| Borders & effects | `border-width/style/radius`, `outline-*`, `divide-*`, `ring`, `box-shadow`, `opacity`, `mix-blend-mode`, `backdrop-filter*`, `filter-*` (`blur`, `brightness`, `contrast`, `saturate`...) |
| Transforms & animation | `scale`, `rotate`, `translate`, `skew`, `transform-origin`, `transition` (`transition-property/duration/timing-function`), `animation`, `keyframes` |
| Responsive & states | breakpoints & min/max/range variants, `dark-mode`, `hover`/`focus` variants, `@media` custom variants (in custom-styles page), `container queries` |
| Other | `pointer-events`, `select`, `will-change`, `scroll-behavior`, `scroll-margin/padding`, `columns`, `break-*`, `visibility`, `accent-color` |
| Upgrading | `upgrade-guide.mdx` — v3→v4 migration; consult when the codebase shows v3 patterns (`tailwind.config.js`-based theming, old class names, JSX-only config) |

New in v4 (worth remembering when translating older code): CSS-first configuration via `@theme` (no mandatory `tailwind.config.js`), cascading CSS variables, easier dynamic values (`grid-cols-15`, `w-17` work without config), container-query variants built in, `@starting-style` transition support. Check the docs rather than assuming v3 syntax.

## Related skills

Use with `refactoring-ui` (design rules that determine WHICH styles), `distinctive-ui` (personality moves), and `headless-ui` (component state attributes to style).