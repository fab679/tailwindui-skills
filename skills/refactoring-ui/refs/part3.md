# Refactoring UI — Distilled Notes (Pages 111–165)

Pages 111–165 of *Refactoring UI* (Wathan & Schoger). Covers the tail of the
Typography chapter, the entire "Working with Color" chapter, and the start of
"Creating Depth" (light source emulation and shadows). All paraphrased.

## Table of Contents

1. Align with readability in mind (p111–114) — Typography chapter tail
2. Use letter-spacing effectively (p115–117)
3. Working with Color — chapter intro (p118)
4. Ditch hex for HSL (p119–122)
5. You need more colors than you think (p123–128)
6. Define your shades up front (p129–132)
7. Don't let lightness kill your saturation (p133–138)
8. Greys don't have to be grey (p139–141)
9. Accessible doesn't have to mean ugly (p142–145)
10. Don't rely on color alone (p146–148)
11. Creating Depth — chapter intro (p149)
12. Emulate a light source (p150–157)
13. Use shadows to convey elevation (p158–162)
14. Shadows can have two parts (p163–165)

---

## 1. Align with readability in mind (p111–114)

- Default: left-align text in English and other left-to-right languages. Other
  alignments have their place but must be used deliberately.
- **Don't center long-form text.** Center alignment suits headlines and short,
  self-contained blocks. Anything longer than ~2–3 lines reads better
  left-aligned.
- If one of several centered blocks runs longer than the others, the cleanest
  fix is to shorten the copy, not change the alignment — also improves
  consistency across the blocks.
- **Right-align numbers in tables.** Keeping decimals vertically aligned makes
  magnitudes scannable at a glance.
- **Justified text needs hyphenation.** Without it, justification creates ugly
  rivers of whitespace between words (`hyphens: none` = bad; `hyphens: auto` =
  good). Justify only when deliberately going for a print/newspaper feel;
  left-aligned is fine even then.

Visual examples:
- Centered vs left-aligned feature-card paragraph: left-aligned wins once the
  copy passes ~3 lines.
- Three-column icon features where shortening the middle block's copy restores
  even baselines.
- Stock-price table with unit-aligned right columns: decimals line up,
  comparisons get easy.

## 2. Use letter-spacing effectively (p115–117)

- People fuss over weight/color/line-height but forget letter-spacing is
  tunable. Examples shown: tight `-0.05em`, normal `0`, wide `0.05em`.
- Baseline rule: trust the type designer's built-in spacing. Two cases where
  overriding helps:
  - **Tighten headlines.** Fonts made for small text (e.g. Open Sans) ship
    with wide tracking; at headline sizes they look loose. Reduce spacing
    (example: `-0.05em`) to imitate purpose-built headline faces (e.g. Oswald).
  - Don't do the reverse: display/headline fonts generally can't be rescued
    for small sizes by adding space.
- **Loosen all-caps text.** Default tracking is tuned for sentence case;
  caps lack the shape variety of lowercase (ascenders/descenders/x-height),
  so add spacing (example: `0.05em`) for legibility.

Visual examples:
- Same sentence set tight/normal/wide: how tracking changes texture.
- Open Sans vs Oswald headline: purpose-built headline face looks tighter even
  at fresh defaults; tightening Open Sans mimics it.
- "FULL STACK DEVELOPER" default vs `+0.05em`: spaced caps read easier.

---

## 3. Working with Color — intro (p118)

- Chapter divider.

## 4. Ditch hex for HSL (p119–122)

- Hex/RGB are the web's default notations but terrible for reasoning: visually
  similar shades share nothing in code (example donut chart: `#03369E`,
  `#507DD7`, `#9FB9ED` vs the same set in HSL `hsl(220,95%,34%)`,
  `hsl(220,65%,61%)`, `hsl(220,69%,80%)` — relationship obvious in HSL).
- HSL maps to how people perceive color:
  - **Hue** — position on the wheel; 0° red, 120° green, 240° blue.
  - **Saturation** — vividness; 0% = grey, 100% = fully intense. At 0%
    saturation hue is meaningless (all hues collapse to the same grey).
  - **Lightness** — black↔white distance; 0% black, 100% white, 50% = the pure
    hue.
- **HSL ≠ HSB.** HSB's 100% brightness with 100% saturation equals HSL at
  S 100 / L 50. Design tools often show HSB, but browsers speak HSL — web work
  should be done in HSL.

Visual examples:
- Donut chart labeled with hex vs HSL: HSL exposes that all slices are one hue.
- Hue wheel with degree labels.
- Saturation ramp H210 L50 at S 0/25/50/75/100; grey-equality demo showing hue
  rotation is a no-op at S 0%.
- Lightness ramp H210 S100 at L 0/25/50/75/100.
- Side-by-side HSB and HSL 2D pickers showing the different gradient shapes.

## 5. You need more colors than you think (p123–128)

- Don't trust 5-hex-code palette generators — five colors can't build a real
  UI without it looking garish (example: chat app skinned with exactly the
  5 generated swatches looks clownish).
- A real palette splits into **three categories**:
  - **Greys** — most of the UI is greys: text, backgrounds, panels, form
    controls, borders. 3–4 greys isn't enough; aim for **8–10 shades**. Start
    from a very dark grey (true black looks unnatural) and step steadily to
    near-white.
  - **Primary color(s)** — usually one, maybe two; defines the brand look
    ("Facebook = blue"). Needs **5–10 shades** too: ultra-light tints for
    alert/tinted backgrounds, dark shades for text, mid for buttons/active nav.
  - **Accent colors** — for communicating states/highlights: yellow/pink/teal
    for "new feature" highlights; semantic ramps: red (destructive confirm),
    yellow (warning), green (success/positive trend). Each accent also wants
    several shades even if used sparingly.
- Data-heavy UIs (graph lines, calendar events, tags) may need many more
  accents. A complex UI commonly needs **~10 colors × 5–10 shades each**.

Visual examples:
- Freestyle app: same chat UI rebuilt from a proper multi-shade palette with
  callouts to every swatch in use.
- Form annotated with 5 named greys (darkest→lightest) mapped to heading,
  button, border, input, background.
- 10-step grey ramp; 7-step blue ramp wired to a checkout UI (progress steps,
  icons, primary button); teal ramp under a "NEW" nav badge; red ramp under a
  destructive-action dialog; yellow ramp under a warning banner; green ramp
  under an up-trend stock widget.

## 6. Define your shades up front (p129–132)

- Don't generate tints on the fly with preprocessor `lighten()`/`darken()` —
  that yields dozens of nearly-identical blues. Define a **fixed shade set**
  per color before you build (swatch grid: primary, neutral, 3 accents × 7
  each).
- **Process:**
  1. **Pick the base color first** (middle of the scale). Rule of thumb for
     primary/accents: pick the shade that would look right as a **button
     background**. No formula (no fixed "start at 50% lightness") — judge by
     eye; each color behaves differently.
  2. **Find the edges**: darkest + lightest shades. Think in context: darkest
     ≈ text color, lightest ≈ background tint. An alert component (light
     tinted bg + dark text) is a good test bed for both extremes.
  3. **Fill the gaps.** Target at least **5 shades per color, ~9–10 ideal**.
     Nine divides neatly: label darkest 900, base 500, lightest 100. Pick 700
     and 300 as midpoints of the two gaps, then halve again to 800/600/400/200.
- **Greys**: same process but the base matters less — start from the edges:
  darkest grey = darkest body text, lightest = subtle off-white background.
- **Not a science**: tweak saturation/step sizes as needed; trust eyes over
  numbers. But avoid *adding new shades* after the fact — an ever-growing
  palette is no system at all.

Visual examples:
- Three "GET STARTED" buttons (too dark / right / too light) showing the
  button-background heuristic for base color.
- Alert with darkest-shade text and lightest-shade background as edge-picker.
- 9-slot scale diagrams: 900/500/100 → +700/300 → full 100–900 sequence.
- Full 9-step primary blue ramp and 9-step grey ramp.

## 7. Don't let lightness kill your saturation (p133–138)

- In HSL, saturation's visual impact weakens as lightness approaches 0% or
  100% — the same S value at L 50 looks far more colorful than at L 90.
- **Fix:** as shades move away from 50% lightness, **increase saturation** to
  keep light/dark shades from looking washed out (chart: flat S line =
  washed-out edges; curved S line = vivid edges).
- If the base is already at S 100, you can't raise S — use **perceived
  brightness** instead.
- **Perceived brightness**: equal-HSL-lightness colors are not equally bright
  to the eye (yellow looks lighter than blue at identical H 60 vs 240, S 100,
  L 50). Formula given: sqrt(0.299 r² + 0.587 g² + 0.114 b²) / 255.
- Luminosity around the wheel isn't linear: 3 dark minima at the primary hues
  (red 0°, green 120°, blue 240°) and 3 bright maxima (yellow 60°, cyan 180°,
  magenta 300°).
- **Change brightness by rotating hue** instead of (or with) lightness:
  - To lighten: rotate hue toward the nearest **bright** hue (60°/180°/300°).
  - To darken: rotate toward the nearest **dark** hue (0°/120°/240°).
  - Keeps intensity where raising L would push toward white/black.
  - Classic application: darkening yellow — rotate toward orange so dark
    shades read warm gold instead of dirty olive/brown.
  - Can combine hue rotation + lightness change (testimonial banner gradient
    pairs H221 L33 with H194 L73).
  - **Limit:** keep hue rotation within **20–30°**, else it reads as a
    different color entirely.

Visual examples:
- Scatter charts of saturation vs lightness: constant-S scale vs increasing-S
  scale.
- Yellow vs blue squares at identical HSL lightness — yellow clearly perceived
  lighter.
- Luminosity-vs-hue dot graph showing the three humps and troughs.
- Blue app icon lightened two ways: L 50→75 (washes out) vs hue 210→190
  (stays punchy); yellow icon darkened via hue 60→32.
- Two 10-step yellow ramps: plain lightness (muddy darks) vs hue-rotated
  (warm golds).

## 8. Greys don't have to be grey (p139–141)

- True grey = 0% saturation, but attractive UI greys are usually **saturated**:
  example invoice UI uses greys around H 208–212, S 16–56%. Saturation
  controls the grey's "temperature".
- **Color temperature:** like warm vs cool light bulbs.
  - Cool greys: saturate with **blue** (e.g. H ~208–210, S 12–21%).
  - Warm greys: saturate with **yellow/orange** (e.g. H ~39–41, S 12–21%).
  - Shown on 5-step ramps with lightnesses ~28/43/58/76/88.
- Remember to raise saturation for the very light and dark greys too, or the
  temperature drops off at the edges and those steps look washed out.
- Amount is taste: a little tips the tone; a lot commits the whole UI warm or
  cool.

Visual examples:
- Invoice cards with real HSL callouts for each grey in use.
- Neutral vs cool vs warm 5-step grey ramps labeled with exact H/S/L values.

## 9. Accessible doesn't have to mean ugly (p142–145)

- WCAG contrast targets: normal text (<~18px) ≥ **4.5:1**; large text ≥
  **3:1**. Dark-on-light is easy; colored text/backgrounds are where it gets
  hard. (Examples: normal grey text lifts from 3.45:1 fail → 5.41:1 AA at
  hsl(0,0%,42%) → 7.57:1 AAA at hsl(0,0%,33%)).
- **Flipping the contrast:** white text on a colored badge often needs a very
  dark color to hit 4.5:1, and dark badges scream for attention even when
  they're secondary info. Fix: **dark colored text on a light tint of the
  same hue** — example status pills jump from 2.25/1.56/3.14 (fail) to
  9.01/9.78/12.32:1 (AAA) while staying quiet.
- **Rotating the hue:** for colored text on a colored background (e.g.
  secondary text on a dark panel), lightening the background's own hue forces
  you near-white. Instead rotate the text hue toward a **brighter hue**
  (cyan/magenta/yellow) — example: secondary text hsl(240,44%,89%) @ 8.37:1 →
  hsl(188,100%,85%) @ 8.71:1 AAA, still colored.

Visual examples:
- Contrast table of grey text grades (Fail/AA/AAA) for normal and large text.
- Policy table with white-on-bright pills (fail) vs dark-on-mid pills (pass
  but shouty) vs dark-on-light-tint pills (pass and calm).
- Dark indigo help panel: same-hue light text vs cyan-rotated text, both AAA.

## 10. Don't rely on color alone (p146–148)

- Color-blind users can't read color-coded meaning. Red/green trend badges are
  indistinguishable under red-green blindness.
- **Add a second channel**: icons/arrows for up/down change (+icons on metric
  cards ✓).
- For multi-series charts: prefer **contrast differences** (light/medium/dark
  tints of one hue) over several distinct hues — luminance separations survive
  color blindness (donut chart example works under blue-yellow blindness).
- Rule of thumb: color should reinforce what the design already communicates,
  never be the sole carrier of meaning.

Visual examples:
- Metric cards in normal vs simulated red-green blindness; fixed version adds
  up/down arrows.
- Three-slice donut in 3 hues collapses under blue-yellow blindness; single-
  hue light→dark version stays readable in both.

---

## 11. Creating Depth — intro (p149)

- Chapter divider.

## 12. Emulate a light source (p150–157)

- UI elements read as raised or inset purely from how light/shade is faked.
  One rule underlies it all:
- **Light comes from above.**
  - Raised panel: top edge lit (angled toward sky), bottom edge in shadow —
    our brains infer "raised".
  - Inset panel: top in shadow (lip blocks light), bottom edge lit — brains
    infer "recessed". (Photo demos: blue raised door panels vs recessed
    kitchen cabinet panels.)
- **Simulating a raised element (e.g. button):**
  - Viewers look slightly downward at screens, so show a hint of the top edge
    and hide the bottom.
  - Lighten the top edge: top border or `box-shadow: inset 0 1px 0
    hsl(224,84%,74%)`. **Pick the lighter color by hand** — a semi-transparent
    white overlay drains saturation from the underlying color.
  - Add a small sharp drop shadow only below: `box-shadow: 0 1px 3px
    hsla(0,0%,0%,0.2)`. Keep blur tiny ("a couple of pixels") and edges crisp
    — like the shadow under a wall outlet.
- **Simulating an inset element (e.g. well, input, checkbox):**
  - Lighten the *bottom* lip (it faces the sky): `box-shadow: 0 2px 0
    hsla(0,0%,100%,0.15)` (bottom border).
  - Darken just inside the *top* where the lip above blocks light:
    `box-shadow: inset 0 2px 2px hsla(0,0%,0%,0.1)` (positive offset so it
    doesn't show at the bottom).
  - Same recipe works for text inputs and checkboxes (newsletter form demo).
- **Don't get carried away:** borrow lighting cues for tasteful depth; chasing
  photorealism makes UIs busy and unclear.

Visual examples:
- Door photo: top edges light, bottoms dark ⇒ raised. Cabinet photo: reversed
  ⇒ inset. Cross-section diagrams with light source annotated.
- Button before/after with inset top highlight, then before/after adding the
  small floor shadow.
- Upload "well" before/after: bottom-lip highlight, then top inner shadow;
  newsletter inputs/checkbox before/after with the same treatment.

## 13. Use shadows to convey elevation (p158–162)

- Shadows are a **z-axis system**: small/sharp = slightly raised; big/soft =
  close to the viewer. The nearer an element feels, the more attention it pulls
  (front + profile diagram of two cards at different z-heights).
- Match shadow size to desired hierarchy:
  - **Small** — buttons that should be noticed but not dominate:
    `0 1px 3px hsla(0,0%,0%,.2)`.
  - **Medium** — dropdowns/popovers sitting a layer up:
    `0 4px 6px hsla(0,0%,0%,.1)`(shown with `.2`? page shows `0 4px 6px
    hsla(0,0%,0%,.1)`).
  - **Large** — modals that must grab full attention:
    `0 15px 35px hsla(0,0%,0%,.2)`.
- **Define an elevation system:** like color/type scales, fix a small set —
  **five shadows is plenty**. Define smallest & largest first, fill the middle
  roughly linearly. Example set:
  `0 1px 3px .2`, `0 4px 6px .2`(page: 6px), `0 5px 15px .2`,
  `0 10px 24px .2`, `0 15px 35px .2` (all hsla(0,0%,0%,.2)).
- **Shadows + interaction:**
  - Drag-and-drop: raise the dragged row's shadow so it pops above siblings
    and signals "you're holding it".
  - Pressed button: shrink or remove the shadow on click so it feels pushed
    into the page (e.g. `0 4px 6px .2` normal → `0 1px 3px .2` on click).
- Don't design shadows as decoration — decide where the element sits on the
  z-axis, then give it the matching shadow.

Visual examples:
- Publish button flat vs small shadow; user dropdown borderless vs medium
  shadow; password modal subtle vs large shadow.
- 5-step white-card elevation ladder with the five box-shadow recipes labeled.
- Sortable playlist with the dragged row lifted; subscribe button normal vs
  pressed state at reduced shadow.

## 14. Shadows can have two parts (p163–165)

- Pro-looking shadows on polished sites are often **two stacked shadows**, each
  with a job:
  - **Shadow 1 (direct light):** larger, softer, bigger vertical offset, big
    blur — mimics the cast shadow from a directional light.
  - **Shadow 2 (ambient):** tighter, darker, small offset, small blur — mimics
    the dark pocket right under an object where ambient light can't reach.
  - Example toast: `box-shadow: 0 4px 6px rgba(0,0,0,.7? → shown as
    rgba(0,0,0,.7) for direct? page: 0 4px 6px rgba(0,0,0,.7), 0 5px 15px
    rgba(0,0,0,.1))` — annotated: small sharp part + large soft part.
- Combining keeps the big shadow subtle while edges near the element stay
  defined; a single shadow can't do both.
- **Account for elevation:** as an object's height grows, the tight ambient
  shadow weakens (ambient light creeps in) — shrink/fade the small dark shadow
  for higher elevations. (Plant-pot photos: floor contact shadow vs plant
  against wall.)

Visual examples:
- ChitChat notification card annotated to a plant-pot photo: cast-by-direct vs
  cast-by-ambient shadows.
- Three stacked toasts: direct-only, ambient-only, combined — combined looks
  most natural.

---

## Key takeaways

1. **Left-align almost everything**; center only headlines/short blocks,
   right-align numbers, hyphenate justified text.
2. **Tighten letter-spacing on headlines, loosen it on all-caps** (±~0.05em);
   otherwise trust the font's defaults.
3. **Work in HSL, not hex/RGB** — it mirrors human perception; don't confuse
   with HSB.
4. **Real UIs need ~10 colors with 5–10 shades each**: 8–10 greys, a primary
   family, and semantic accents (red/yellow/green, highlights).
5. **Define shade scales up front**: base = "good button background",
   edges from real contexts (darkest = text, lightest = tint), fill gaps →
   100–900 nine-step scale; don't lighten/darken on the fly.
6. **Raise saturation as lightness leaves 50%** — and **rotate hue toward
   bright hues (60/180/300°) to lighten, dark hues (0/120/240°) to darken**,
   staying within 20–30°.
7. **Tint your greys**: blue for cool, orange/yellow for warm (S ~12–21%),
   keeping edge shades saturated too.
8. **Accessibility without ugliness**: 4.5:1 / 3:1 contrast — flip to
   dark-text-on-light-tint for badges, rotate hue toward brighter colors for
   text on colored panels, and never convey meaning by color alone (add
   icons; use luminance contrast in charts).
9. **Light comes from above**: raised = lit top edge + small sharp shadow
   below; inset = lit bottom edge + dark inner top shadow; pick highlight
   colors by hand (no white overlays); keep it subtle.
10. **Shadows = elevation system**: ~5 fixed levels, shadow size ∝ z-height
    and attention; directionally animate on drag/press; the best shadows are
    **two-part** (soft direct-light cast + tight dark ambient contact
    shadow), with the contact shadow shrinking as elevation rises.
