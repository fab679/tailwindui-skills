---
name: branding-plan
description: Plan a product's visual brand and design-system foundations before building UI — audience & personality definition, color palette with full shade scales, typeface selection, border radius and copy register, spacing/radius/shadow systems, and a written design brief or token file. Use when starting a new project/app/site, when the user mentions branding, brand identity, design tokens, design system, palette, "define the look/feel", or needs a theme defined for Tailwind (@theme).
---

# Branding & design planning

Do not start styling before these decisions exist. This skill produces a concrete written spec (design brief / token file); the craft rules for executing it live in the `refactoring-ui` and `distinctive-ui` skills.

## The planning workflow

0. **Pre-flight scan (existing projects — always run before asking anything).** Read the project for existing signals: `design.md`/token files/Tailwind `@theme` blocks (colors, fonts, radii), font imports (`next/font`, Google Fonts, fontsource), motion-library deps, spacing scale. Emit a short findings block with `file:line` citations: what will be **preserved** (existing font stack, palette, spacing), what will be **introduced**. Stomping an established system loses the user's trust. If the `hallmark` skill manages the project (`design.md` at root or `.hallmark/log.json`), the locked system always wins — plan within it, extend it, don't fork it.
1. **Define the audience and intended feel — max 3 adjectives.** Interrogate the user if missing: who uses this (developers? parents? executives?), where do they already feel at home (hackernews vs pinterest vs linkedin)? Never imitate direct competitors; imitate the register of the audience's other tools.
2. **Lock the personality levers** (each is a decision, not a preference):
   - Typeface: serif → elegant/classic; rounded sans → playful; neutral sans → quiet. Neutral sans is the safe default; add personality elsewhere.
   - Color temperature of greys: cool (blue-tinted) = corporate/technical; warm (orange-tinted) = friendly/human.
   - Border radius: none → serious; small → neutral; large → playful. Total consistency, one scale.
   - Copy register: formal vs casual — this affects UI text, empty states, and microcopy.
3. **Define the color system concretely** (see `refactoring-ui` refs part3 §4–8 for the full method; book examples use HSL — write final values in OKLCH when the project convention supports it, since OKLCH lightness tracks perceived + WCAG contrast better, and both notations express the same shade ladder):
   - 8–10 grey shades from near-black (not pure black) to near-white, with the chosen temperature (S ~12–21%). Raise saturation for the extreme shades.
   - Primary family: 9 steps 100–900. Base 500 = "looks right as a button background". 900 ≈ text-on-tint, 100 ≈ tint-behind-text. Raise S as L leaves 50%; lightening = hue-rotate ≤20–30° toward bright hues (60°/180°/300°), darkening toward dark hues (0°/120°/240°).
   - Semantic accents: red (destructive), yellow/amber (warning), green (success), each 5–9 shades; plus highlight accents for features/badges if the brand needs them.
   - Validate: 4.5:1 contrast everywhere text lands; no meaning carried by color alone.
4. **Define the type system**: one primary family by heuristic (≥5 weights, legible x-height, popular, or borrowed from a site you admire); the type scale `12 14 16 18 20 24 30 36 48 60 72`px (adjust); default line-heights by context (body 1.5, tight 1.2–1.4 for headings; scale up for wide text, down for big headlines).
5. **Define the remaining scales** so nobody ever free-styles: spacing (16px base: 4, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512, 640, 768), radius steps (pick 2–3), border widths, opacity steps, and the two-part shadow ladder.
6. **Write the deliverable.** Either a design brief or, better, a Tailwind v4 token file:

```css
/* theme-tokens.css — the briefing becomes code */
@import "tailwindcss";

:root {
  --color-bg: hsl(210, 20%, 98%);        /* page */
  --color-surface: hsl(210, 20%, 100%);  /* cards/panels */
  --color-text: hsl(212, 30%, 13%);
  --color-muted: hsl(208, 18%, 42%);
  --color-primary: hsl(...)  /* 5 used + full 100–900 scale */
  ...
  --radius-card: 0.75rem;  /* consistent with the chosen personality */
}

@theme inline {
  --color-bg: var(--color-bg);
  --color-surface: var(--color-surface);
  /* ... */
}
```

Semantic names (bg/surface/text/primary/...) beat raw color names (gray-500) because they survive rebrands and map cleanly onto dark mode (see `dark-mode` skill).

## Brief checklist (leave no section empty)

- [ ] Audience + 3 adjectives + register
- [ ] Typeface + fallback stack; text colors tie to the grey scale
- [ ] Grey scale with temperature, written as HSL
- [ ] Primary 100–900 + accents, all step values written out
- [ ] Type scale, line-height defaults, letter-spacing policy (tighten headlines, loosen caps)
- [ ] Spacing / radius / shadow / border scales
- [ ] Dark mode handled as second token set (see `dark-mode`)
- [ ] Every token referenced in a `@theme`/CSS-variable file, never inline hex in components

Where to go next: `refactoring-ui` for executing components; `distinctive-ui` for the signature non-generic moves; `tailwind-docs` for the `@theme` syntax.