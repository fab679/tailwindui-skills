---
name: heroicons
description: Use Heroicons (@heroicons/react) — the official Tailwind Labs icon set — with the right variant (outline/solid/mini/micro), correct sizing, currentColor theming, and accessibility attributes. Use when adding or styling any icon in a Tailwind UI, when the user mentions heroicons or iconography, or when icons need to adapt to dark mode/brand color. Full README vendored in docs/.
---

# Heroicons (v2, @heroicons/react)

```shell
npm install @heroicons/react
```

```tsx
import { CakeIcon } from "@heroicons/react/24/outline";
<CakeIcon className="size-6" />
```

Every icon is a React component rendering an SVG; it has no default styling — set size via `className` (v4 `size-*` is idiomatic, `h-* w-*` also works), color via text classes and `currentColor`, and pass `aria-hidden="true"` when decorative (all icon names are suffixed `Icon`).

## Variant selection (this is the whole discipline)

| Import path | Variant | Use for |
|---|---|---|
| `@heroicons/react/24/outline` | Stroke ~1.5, 24px grid | Default UI: nav, buttons, feature icons, any icon beside text |
| `@heroicons/react/24/solid` | Filled, 24px grid | Active/selected/filled states; icons on colored chips |
| `@heroicons/react/20/solid` | Filled, 20px grid | Small UI: badges, table carry-overs, inline emphasis |
| `@heroicons/react/16/solid` | Filled, 16px grid ("micro") | Very small sizes (status dots, 16px lines) |

Rules:

- **One icon library per project.** Mixing two libraries (Material + Heroicons + Lucide) on one page is an AI-tell; if the project already uses one, stay in it. Never use emoji glyphs (✨🚀⚡) as feature/step/pricing-tier icons — that's a sloppy substitute for iconography.
- **Match variant to context, consistently**: outline by default; switch to solid only for state (active, filled, on colored chip). Mixing variants at the same size in the same list looks broken.
- **Never scale icons far past their intended size** (core `refactoring-ui` rule): a 16–24px icon blown up to 48px looks chunky. For large feature areas place the intended-size icon inside a colored circle/square instead. If you genuinely need big icons, prefer solid variants inside a shape or use an icon set drawn for large sizes.
- Small-size legibility: below ~20px prefer `20/solid` / `16/solid` over a scaled-down outline icon (outline strokes get too thin).
- Icon color = `currentColor`: set `text-*` on the icon or inherit from the parent — never hardcode `fill`/`stroke` hex; that's what makes icons theme-agnostic (dark mode free) — see `dark-mode` skill.
- Icons next to equal-weight text steal emphasis: soften with a muted text color (e.g. `text-muted`/`text-gray-400`) rather than shrinking.
- Icon-only buttons must still be accessible: `aria-label` (or visually-hidden text) on the button; `aria-hidden="true"` on the icon itself.
- Browse/search names at heroicons.com; check the vendored `docs/README.md` for anything else (version notes, framework packages, license).