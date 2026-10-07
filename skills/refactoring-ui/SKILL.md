---
name: refactoring-ui
description: Core UI-craft rules for hierarchy, spacing, typography, color, depth, images and polish, distilled from Refactoring UI (Wathan & Schoger). Use when building or reviewing any UI (web apps, marketing pages, dashboards, cards, forms), when a design looks "off", plain, or amateur, or when asked to improve, fix, restyle, or "make a UI look designed". Complements distinctive-ui (personality/anti-generic) and tailwind-docs (class lookup).
---

# Refactoring UI — craft rules

## Workflow (do this on any new UI)

1. **Feature first, shell later.** Build one real piece of functionality before deciding on nav/chrome. Skip "designing the empty shell".
2. **Grayscale before color.** Get hierarchy working with spacing, weight and contrast alone; add color at the end as enhancement.
3. **Design in cycles.** Simple version → build → fix in the working UI → repeat. Ship the smallest useful version; never design unbuildable nice-to-haves.
4. **Predefine systems before styling** (see scales below), then pick values by elimination — compare a guess against its neighbors, two are usually obviously wrong.
5. **Choose a personality up front** — see `distinctive-ui` skill for the levers (font, color, radius, copy register).

## Non-negotiable rules

### Hierarchy
- Every surface needs clear primary / secondary / tertiary tiers. Equal emphasis everywhere reads as noise.
- Size is the weakest hierarchy tool. Use **weight + color**: body text 400–500; emphasis 600–700; **never below 400**. Two or three text colors only (dark ~L13%, grey ~L34%, lighter grey ~L47% — keep same hue family).
- Don't put grey text on colored backgrounds — pick a **same-hue lighter color** instead (e.g. text `hsl(183,70%,84%)` on teal).
- To make something pop, **de-emphasize its competitors** before emphasizing it further.
- Data display: drop labels when format/context suffices; merge label+value into natural phrasing ("3 bedrooms", not "Bedrooms: 3"). When labels are needed, make them small/light and keep the value dominant.
- Semantic markup (h1, labels) is for accessibility; **style by visual importance, not by tag**. Section titles can be small or even visually hidden.
- Style buttons by importance pyramid, not meaning: **primary = solid**, secondary = outline/muted, tertiary = link-style. Destructive actions get loud red only at the confirmation step.

### Layout & spacing
- Start with **too much white space, then remove** — adding "just enough" always undershoots.
- Spacing/sizing scale (16px base, adjacent values ≥25% apart):
  `4, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512, 640, 768 px`
- **More space around a group than within it.** If two gaps compete (label vs field, rows of a list), the intra-group gap must be clearly smaller (e.g. label→input 10px vs group→group 20px; heading 36px above / 12px below).
- Don't fill the screen: use the width the content needs (~600px is fine). Design mobile-first on a ~400px canvas. Split into columns rather than widening naturally-narrow content.
- Fixed widths for fixed-purpose elements (sidebars, avatars) — fluid grids for real grids. Use max-width so elements shrink only when the viewport forces it.
- Elements that are large on desktop **shrink faster** than small ones on mobile — don't encode relative (em-based) relationships across breakpoints. Bigger buttons get disproportionately more padding; smaller ones disproportionately less.

### Typography
- Type scale (px/rem, **never em**): `12, 14, 16, 18, 20, 24, 30, 36, 48, 60, 72`
- Line length 45–75 characters (constrain paragraphs to ~20–35em even in wide layouts).
- Line-height: proportional to line length (1.5 narrow → 2.0 wide), inversely to font size (up to ~1.75 for tiny text, ~1 for big headlines).
- Align mixed text sizes by **baseline**, not vertical center.
- Letter-spacing: tighten headlines (~-0.05em), loosen ALL-CAPS (~+0.05em), otherwise trust the font.
- Left-align long-form text; center only headlines/short blocks; right-align numbers in tables.
- Font pick heuristics: ≥5 weights available, legible x-height, popular, or stolen from sites you admire. System font stack is an acceptable default.

### Color
- Think in **HSL** (not hex) — it makes relationships visible. Don't confuse with HSB.
- You need ~10 color families × 5–10 shades each: 8–10 greys, one primary, semantic accents (red/yellow/green) + highlight accents. Define all shades up front (fill 100–900 by halving gaps from base/edges); don't `lighten()` on the fly.
- Base color = "what looks right as a button background". Edges tested in context (darkest = text on tint, lightest = tint behind text).
- As lightness leaves 50%, **raise saturation**. Lighten by rotating hue up to 20–30° toward bright hues (60°/180°/300°); darken toward dark hues (0°/120°/240°).
- Greys don't have to be grey: tint them blue-ish (cool) or orange-ish (warm), S ~12–21%.
- Contrast: 4.5:1 normal text, 3:1 large. For quiet badges/pills use **dark text on a light tint** of the same hue instead of white text on a dark fill. Never convey meaning by color alone (add icons/arrows; prefer lightness differences between chart series).

### Depth
- The light comes from above. Raised = lit top edge + small sharp shadow below (`inset 0 1px 0 <lighter-color>` + `0 1px 3px hsla(0,0%,0%,.2)`). Inset = shadow inside the top lips + lit bottom lip.
- Use a **two-part shadow** everywhere: large soft ambient + small tight contact shadow that fades as elevation rises. Five levels is plenty:
  `0 1px 3px .12`+`0 1px 2px .24`, `0 3px 6px .15`+`0 2px 4px .12`, `0 10px 20px .15`+`0 3px 6px .10`, `0 15px 25px .15`+`0 5px 10px .05`, `0 20px 40px .2`
- Shadow size = z-position = attention. Animate on interaction: raise on drag, shrink on press.
- Flat UIs convey depth with color instead: lighter surface = raised, darker = recessed; plus zero-blur solid shadows (`box-shadow: 0 3px 0 <bg-ish grey>`).
- Overlap to create layers: cards straddling section boundaries (negative margins); overlapping images get a background-colored "invisible border" (`border: 4px solid #fff`).

### Images & icons
- Never scale an icon past its intended size (16–24px icons at 48px look chunky) — enclose small icons in a colored circle/square instead. Never shrink detailed full screenshots (capture at tablet/mobile viewport, crop, or redraw simplified).
- Text over photos: fix the image, not the text — dark overlay (`hsla(0,0%,0%,.55)`), lowered contrast, single-color multiply colorize, or offset-free large-blur text shadow (`0 0 50px hsla(0,0%,0%,.4)`).
- User uploads: fixed containers + `background-size: cover`; separate images from same-color backgrounds with `box-shadow: inset 0 2px 4px hsla(0,0%,0%,.2)` (or hairline `inset 0 0 0 1px ...`), not borders.

### Polish
- **Fewer borders.** Prefer separation via background-color differences, shadows, or plain spacing.
- Design empty states deliberately: illustration/icon + strong CTA; hide tabs/filters until content exists.

### Interactive states (every interactive element ships all of them)
- Minimum set in code: default, hover, `:focus-visible`, `:active`, disabled. Add loading/error/success where the operation has that lifecycle. State details ship, not wishlists.
- **Focus rings appear instantly** — never transition/animate the ring into existence. Use `outline: 2px solid <color>` with `outline-offset` (not border; a border-based focus style shifts layout).
- **Inputs keep constant `border-width` across default/hover/focus/error** (1px throughout) — state changes go to color/shadow/background, never width. Reserve a helper-text line (`min-height` of one line) even when empty so an appearing error doesn't push the page. Input height shares one base with its adjacent button (~44px floor).
- **Disabled = three channels**: visual dimming (e.g. `opacity: .55`) + `cursor: not-allowed` + the native `disabled`/`aria-disabled` attribute.
- Prefer *silent success* over celebratory toasts; tooltips: ~800ms hover delay, 0ms focus delay; prefer optimistic update + undo over confirmation dialogs where reversible.

### Responsive floor (every page must survive 320–1920px)
- `overflow-x: clip` on both `html` and `body` (clip, not `hidden` — hidden breaks `position: sticky`/`fixed` descendants).
- Image-bearing grid tracks use `minmax(0, 1fr)`, never bare `1fr` (intrinsic-width images blow out the track on phones).
- Clickable text (buttons, nav/footer links, CTA/tab labels) **never wraps to two lines** — shorten the label or nowrap + collapse the nav on small screens.
- All-caps display heads keep `line-height: 1.0–1.08` (below it, wrapped caps collide).
- A second sticky element under a sticky top nav docks at `top: var(--banner-height)` (and lower z-index than the nav), never `top: 0`.

## Detailed references (in `refs/`, same directory as this file)

| Topic | File, section |
|---|---|
| Starting from scratch, personality, controlling choices | `refs/part1.md` §1 |
| Hierarchy (all of it) | `refs/part1.md` §2 |
| White space, spacing system, screens/grids, ambiguous spacing | `refs/part2.md` §1–6 |
| Type scale, fonts, line length/height, links | `refs/part2.md` §7–12 |
| Text alignment, letter-spacing | `refs/part3.md` §1–2 |
| HSL, palettes, shade scales, greys, contrast, color-blindness | `refs/part3.md` §4–10 |
| Light source, elevation shadows, two-part shadows, flat depth, overlap | `refs/part3.md` §12–14, `refs/part4.md` §1 |
| Photos, text-over-image, icon/screenshot sizes, user uploads | `refs/part4.md` §2 |
| Finishing touches (defaults, accent borders, backgrounds, empties, borders, component conventions) | `refs/part4.md` §3 |
| Leveling up (catalog un-obvious decisions, rebuild favorites) | `refs/part4.md` §4 |

When applying a rule feels uncertain, read that reference section — it holds the concrete recipes, exact values, and the before/after rationale.