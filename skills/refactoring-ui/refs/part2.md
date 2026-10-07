# Refactoring UI — Distilled Notes, Part 2 (PDF pages 56–110)

Covers the end of the Layout chapter (white space, spacing systems, screen width, grids, relative sizing, ambiguous spacing) and the start of the Designing Text chapter (type scale, fonts, line length, baseline alignment, line-height, link treatment). All paraphrased.

## Table of contents
1. Start with too much white space (p. 56)
2. Establish a spacing and sizing system (p. 60)
3. You don't have to fill the whole screen (p. 65)
4. Grids are overrated (p. 72)
5. Relative sizing doesn't scale (p. 79)
6. Avoid ambiguous spacing (p. 83)
7. Establish a type scale (p. 88)
8. Use good fonts (p. 94)
9. Keep your line length in check (p. 99)
10. Baseline, not center (p. 102)
11. Line-height is proportional (p. 105)
12. Not every link needs a color (p. 109)

---

## 1. Start with too much white space

- Easiest cleanup move: give every element more room to breathe.
- **White space should be removed, not added.** Typical workflow adds margin/padding only until things stop looking bad — that yields the *minimum* viable spacing, not great spacing.
- Better workflow: start with *way too much* space, then remove until it feels right. What feels like "a little too much" on an isolated element usually ends up "just enough" in a full UI.
- **Dense UIs have their place** — e.g. dashboards where lots of info must be visible at once. But make density a deliberate choice, not the default. It's much easier to notice when space needs removing than when it needs adding.
- Visual example: cramped two-factor-auth card (labels/inputs/button packed) vs. same card with generous padding — the roomy version reads instantly cleaner with identical content.
- Visual example: "50 customer reviews" panel — starting from excessive padding and trimming back lands on a better result than starting minimal and nudging outward.

## 2. Establish a spacing and sizing system

- Don't agonize between 120px and 125px. Trial-and-error pixel nudging is slow and produces inconsistent designs. Constrain yourself to a fixed set of values defined in advance.
- **A linear scale won't work.** Fixed steps (e.g. multiples of 4px) don't help because what matters is the *relative* difference between adjacent values:
  - Small end: 12px → 16px is a 33% jump — very significant.
  - Large end: 500px → 520px is only 4% — barely noticeable.
- Rule: no two adjacent values in the scale should be closer than ~25%.
- **Defining the system:** start with a sensible base value and build factors/multiples of it. **16px is a great base** (divides nicely, and it's the default browser font size).
- Recommended practical scale (dense at small end, sparse at large end):
  - 4, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512, 640, 768 px
  - (≈ 16 × 0.25, 0.5, 0.75, 1, 1.5, 2, 3, 4, 6, 8, 12, 16, 24, 32, 40, 48)
- **Using it:** need space? Grab a scale value. Not enough? Try the next one up. Benefits: much faster decisions (especially designing in the browser) plus a subtle consistency across the whole design.
- Visual example: hotel listing card annotated with scattered one-off values (26, 12, 15, 21, 25, 13, 22px…) vs. same card normalized to only 12/24px — identical layout, calmer and more consistent.

## 3. You don't have to fill the whole screen

- Modern displays tempt you to stretch layouts to 1200–1400px, but available space ≠ obligation to use it. **If you only need 600px, use 600px.** Over-wide content is harder to interpret; edge whitespace never hurts.
- Applies per-section too: an element doesn't need to go full-width just because the nav is.
- **Shrink the canvas:** designing something small is easier when constraints are real. For responsive web apps, start with a ~400px canvas (mobile first), then scale up and adjust the few things that were a compromise — usually less than you expect.
- **Thinking in columns:** if something is naturally narrow but looks unbalanced in a wide UI, split into columns rather than widening the thing itself (e.g. move a form's supporting/help text into a side column; keeps the form at its optimal width while using the page).
- **Don't force it:** don't cram content into small areas just to prove density either. Use lots of space when you need it; don't fill space when you don't.
- Visual example: full-width checkout page with tiny contents stretched across 1400px vs. the same content in a centered ~600px column.
- Visual example: full-width login card vs. centered narrow card under a full-width navbar.
- Visual example: single-column account-settings form stretched wide vs. two-column version with helper text moved left of the fields.

## 4. Grids are overrated

- A 12-column grid simplifies layout decisions and adds order, but outsourcing *all* layout decisions to it does harm.
- **Not all elements should be fluid.** A grid = fluid percentage widths from a constrained set (12-col: each column 8.33%). Some elements deserve fixed widths instead.
  - Sidebar example: 25% fluid sidebar gets wastefully wide on big screens and too cramped (wrapping/truncation) on small ones. Better: fixed-width sidebar sized for its contents + flex main area, which then uses its own internal grid.
  - Same inside components: don't size things in % unless you actually want them to scale (e.g. fixed-width avatar in a feed card).
- **Don't shrink an element until you need to.** Column-based sizing can make an element paradoxically *wider on medium screens than on large ones* (e.g. 8 of 12 fluid columns at a medium breakpoint vs. 6 of 12 at large). If a card's ideal width is ~500px, it should never be smaller while space permits. Solution: give it a **max-width** and only let it shrink below that when the viewport forces it.
- Give components the space they need; compromise only when necessary.
- Visual example: fluid 25%/75% sidebar stretching absurdly on a wide monitor / crushing nav labels on narrow vs. fixed sidebar at both sizes.
- Visual example: login card at 6/12 and 8/12 fluid columns producing inconsistent widths vs. constant-width centered card across breakpoints.

## 5. Relative sizing doesn't scale

- Tempting but wrong: sizing everything relative to everything else (e.g. headline = 2.5em of 18px body = 45px). Shrink body to 14px on mobile and the headline auto-becomes 35px — far too big; it really wants ~20–24px (only 1.5–1.7× body, a totally different ratio).
- General rule: **elements that are large on large screens must shrink faster than small ones** — the gap between large and small elements should narrow on small screens. So fixed relative relationships don't survive breakpoints; don't try to encode them.
- **Relationships within elements:** same trap with em-based padding. Buttons scaled proportionally (16px font/12×16 padding → 12px font/9×12) look like zoomed copies, not real size variants.
  - Better: large buttons get disproportionately *more* padding, small ones disproportionately *less*. E.g.: 20px font → 15px 30px padding; 16px → 12px 16px; 14px → 8px 10px; 12px → 6px 8px. Then large buttons feel large and small ones feel small.
- Let go of proportional scaling; tune properties independently per context.
- Visual example: article with 45px headline defined as 2.5em breaking on mobile (35px too huge) vs. explicit 24px mobile headline.
- Visual example: four buttons scaled by ratio (uniform proportions, "zoomed" feel) vs. four with hand-tuned padding per size (genuinely different button sizes).

## 6. Avoid ambiguous spacing

- When groups are separated by borders/backgrounds, membership is obvious. With spacing alone, ambiguous gaps confuse grouping.
- Rule: **when relying on spacing to group elements, keep more space around the group than within it.**
- Form example: stacked label+input where margin under label ≈ margin under input (e.g. 20px/20px) makes labels float between fields — users may fill the wrong input. Fix: shrink label→input gap (e.g. 10px) vs. input→next-label gap (20px+).
- Article example: section headings need clearly more space above than below (e.g. 24/24 bad → 36px above, 12px below) or they visually attach to the preceding paragraph.
- List example: gap between bullets equal to a bullet's own line-height (24/24) muddies which lines belong together; tighten intra-item vs. inter-item (e.g. 24px within, 36px between).
- Horizontal case too: action rows (like 45 · comment 17 · share) with equal 16px gaps confuse which number belongs to which icon; tighten icon→count (6px) and widen between actions (36px).
- Hard-to-understand interfaces always look worse than clear ones.
- Visual examples: billing form with uniform 20px gaps vs. 10px label gap/20px group gap; heading with 24/24 vs. 36/12; bullet list with matching line-height spacing vs. grouped spacing; like/comment/share row with equal vs. grouped gaps.

---

# Designing Text

## 7. Establish a type scale

- Most interfaces use too many font sizes — without a system you end up with every pixel value from 10 to 24px somewhere. Costs: inconsistency + slower workflow.
- Linear scales fail for the same reason as spacing (see §2).
- **Modular scales** (a ratio like 4:5, 2:3, or golden ratio 1:1.618 applied to a 16px base) sound elegant but have two practical flaws:
  1. **Fractional values** — e.g. 31.25px, 39.063px; browsers round sub-pixels differently → off-by-one inconsistencies. (If used, round values yourself.)
  2. **Too few sizes** — jumps that suit long-form articles are too coarse for UI; e.g. rounded 3:4 gives 12/16/21/28, leaving you wanting a size between 12 and 16 and between 16 and 21. Using a tighter ratio just becomes reverse-engineering sizes you already wanted.
- **Hand-crafted scales win for UI:** pick values by hand — full control, no rounding errors, exactly the sizes you need.
- Recommended practical scale: **12, 14, 16, 18, 20, 24, 30, 36, 48, 60, 72 px** — constrained enough to speed up choices without missing a useful size; aligns with the spacing scale.
- **Avoid em units** for the type scale: em is relative to the *current* font size, so nesting breaks the scale (inside a 1.25em element, a nested .875em computes to 17.5px — off-scale). Use **px or rem** so the system is actually guaranteed.
- Visual example: product card with 11 different font sizes (18/13/11/26/15/13/12/17/14…) vs. same card normalized to 14/16/18/24.
- Visual example: golden-ratio modular scale producing fractional ems vs. the hand-picked 12–72px ladder.

## 8. Use good fonts

- Picking quality typefaces without years of training — use these heuristics:
- **Play it safe:** for UI, a neutral sans-serif (Helvetica-like). Zero-taste fallback: the system font stack (`-apple-system, Segoe UI, Roboto, Noto Sans, Ubuntu, Cantarell, Helvetica Neue`) — unambitious but already familiar to users.
- **Ignore typefaces with fewer than five weights.** More weights usually signals more care in crafting. Filter font directories (e.g. Google Fonts) by "number of styles" ≥ 10+ (weights × italics); on Google Fonts that eliminates ~85% of options, leaving <50 sans-serifs.
- **Optimize for legibility:** fonts are designed for a purpose. Headline fonts have tighter letter-spacing and shorter x-height; small-size fonts have wider spacing and taller x-height. Avoid condensed, short-x-height faces for main UI text.
- **Trust the wisdom of the crowd:** sort font directories by popularity — a popular font is probably good; most useful when picking something with personality (e.g. a serif).
- **Steal from people who care:** inspect great sites (dev tools) and adopt their typeface choices — strong design teams find gems you'd miss via safe routes.
- Visual example: "Hello World" in Futura PT (tight spacing, short x-height — display face) vs. Proxima Nova (wider spacing, taller x-height — UI-appropriate).
- Visual example: Google Fonts style-count filter set to 10+; browser dev-tools panel revealing a site's font-family stack.

## 9. Keep your line length in check

- Common mistake: fitting text to the layout instead of the reading experience → lines too long (~120 chars) become hard to read.
- **Optimal: 45–75 characters per line.** On the web use em units; **20–35em width** lands you in range. Exceeding 75 is risky territory — stay within 45–75 to be safe.
- **Dealing with wider content:** even when a content area must be wide (images, feature columns), constrain the paragraph text itself (e.g. `max-width: 34em` on the intro text while the 3-column row below stays wide). Mixed widths within one area look *more* polished, not less.
- Visual examples: Moby Dick paragraph at ~120 chars vs. 45–55 / 55–65 / 65–75 char versions; marketing page intro stretched full-width (`max-width: none`) vs. intro clamped to 34em above a wide three-up section.

## 10. Baseline, not center

- When mixing font sizes on one line (e.g. card title + small action links), vertical centering looks subtly off — especially when the texts sit close together.
- **Align mixed sizes by their baseline** (the line letters rest on) — it exploits an alignment the eye already perceives, giving a cleaner result than centered boxes with offset baselines.
- Visual example: "Who to follow" card header — title and small links with `align-items: center` (awkward when tightened) vs. `align-items: baseline`.

## 11. Line-height is proportional

- "Line-height ~1.5" is a fine starting point but not universal — right value depends on line length *and* font size.
- Purpose of line spacing: helping the eye find the next line after wrapping. Ever re-read or skip a line? Line-height was too small.
- **Accounting for line length:** the longer the line, the further the eye travels back, the easier to lose your place. Line-height and paragraph width are proportional: **narrow content can use ~1.5; wide content may need up to 2.0.**
- **Accounting for font size:** line-height and font size are *inversely* proportional:
  - Small text needs extra line spacing (e.g. 1.25 too tight → 1.75 readable).
  - Large headline text needs little or none — **line-height of 1 can be fine** for big headings (1.5 on a large serif headline looks spaced-out and broken).
- Visual examples: long-line paragraph at tight line-height with "lost your place" arrows vs. 1.5 narrow / 2.0 wide; small text at 1.25 vs. 1.75; big headline at 1.5 vs. 1.

## 12. Not every link needs a color

- In a block of non-link body text, links must visibly stand out as clickable (underline/color).
- But in link-heavy interfaces (e.g. video grids where every title/channel is a link), "pop" treatments on everything are overbearing.
- **Emphasize most links subtly:** heavier font weight or darker color is enough.
- **Ancillary links may need no default emphasis at all:** for off-the-main-path actions, show underline/color only on hover — still discoverable, but they stop competing with primary actions.
- Visual examples: prose paragraph with underlined links (appropriate) → YouTube-style grid with every title+channel colored (overbearing) → same grid with bold dark titles and subdued metadata → channel names emphasized only on hover.

---

## Key takeaways (top 10)

1. **Start with too much white space, then remove it** — never add just enough to stop looking bad.
2. **Use a pre-defined spacing/sizing scale**; adjacent values ≥25% apart; 16px base; practical ladder: 4–768px.
3. **Don't fill the screen** — use only the width content needs (~600px is fine); design mobile-first on a ~400px canvas.
4. **Grids are a tool, not a religion** — prefer fixed widths for sidebars/avatars; use max-width so elements shrink only when forced.
5. **Relative sizing doesn't scale** — large things must shrink faster than small ones across breakpoints; tune padding/font-size independently (big buttons get disproportionately more padding).
6. **Kill ambiguous spacing** — always more space *around* a group than *within* it (label 10px / group 20px; heading 36px above, 12px below).
7. **Hand-craft a type scale** (12/14/16/18/20/24/30/36/48/60/72px); avoid modular-scale fractions; use px/rem, never em, for font sizes.
8. **Choose fonts by heuristic:** ≥5 weights, popular, legible x-height, or borrowed from great sites; system stack is a safe default.
9. **Constrain line length to 45–75 chars (20–35em)** even inside wide layouts; max-width the paragraphs.
10. **Line-height is contextual:** proportional to line length (1.5 narrow → 2.0 wide), inversely proportional to font size (up to 1.75 for small text, ~1 for big headlines); align mixed-size text by baseline; keep most links subtle (weight/hover).
