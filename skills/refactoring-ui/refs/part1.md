# Refactoring UI — Notes, Part 1 (pages 1–55)

Distilled notes from "Refactoring UI" by Adam Wathan & Steve Schoger. All paraphrased. Covers the front matter, Chapter 1 (Starting from Scratch), Chapter 2 (Hierarchy is Everything), and the start of Chapter 3 (Layout and Spacing divider page).

## Table of contents (this range)

1. **Contents / front matter** (pp. 1–5)
2. **Starting from Scratch** (pp. 6–28)
   - Start with a feature, not a layout
   - Detail comes later (Hold the color, Don't over-invest)
   - Don't design too much (Work in cycles, Be a pessimist)
   - Choose a personality (Font choice, Color, Border radius, Language, Deciding what you want)
   - Limit your choices (Define systems in advance, Designing by process of elimination, Systematize everything)
3. **Hierarchy is Everything** (pp. 29–54)
   - Not all elements are equal
   - Size isn't everything
   - Don't use grey text on colored backgrounds
   - Emphasize by de-emphasizing
   - Labels are a last resort
   - Separate visual hierarchy from document hierarchy
   - Balance weight and contrast
   - Semantics are secondary (Destructive actions)
4. **Layout and Spacing** — chapter divider at p. 55 (content begins p. 56, outside this range)

---

## 1. Starting from Scratch

### Start with a feature, not a layout
- Don't begin a new app design by "designing the shell" (nav bar placement, sidebar vs top nav, container vs full-width, logo position). Those decisions can't be made before you know what the app does.
- An app is a bundle of features; design a real piece of functionality first (e.g., for flight booking: departure city, destination, departure date, return date, search button).
- You may discover you don't even need the rest of the chrome (Google's homepage argument).
- *Visual example:* three vague wireframe shells with "?" badges vs. a concrete flight-search form — the feature-first sketch is immediately buildable.

### Detail comes later
- Early on, ignore typefaces, shadows, icons, etc. — they matter eventually, not yet.
- Trick (Jason Fried): sketch on paper with a thick marker so obsessing over fine details is physically impossible; good for exploring layouts fast.
- **Hold the color:** even at higher fidelity, refine in grayscale first so spacing, contrast, and size carry the hierarchy; add color at the end as an enhancement.
- *Visual example:* grayscale signup/pricing page vs the same page with a blue toggle and CTA added — the monochrome version already has clear hierarchy.
- **Don't over-invest:** sketches/wireframes are disposable; use them to explore, then abandon them and build the real thing.

### Don't design too much
- Don't try to design every feature and edge case up front (e.g., 2000 contacts, form errors, overlapping calendar events) — nearly impossible in the abstract.
- **Work in cycles:** design a simple version of the next feature → build it → fix problems in the working UI → iterate until no problems remain → design the next feature. Real software beats imagination.
- **Be a pessimist:** assume everything will be hard to build. Never imply functionality in a design you can't ship yet (the file-attachments-in-comments cautionary tale: shipping comments without attachments beats shipping nothing).
- Ship the smallest useful version; design nice-to-haves later.
- *Visual example:* comment box with vs without the attachment drop zone — the stripped version is shippable.

### Choose a personality
- Personality comes from a few concrete levers: font, color, border radius, language.
- **Font:** serif → elegant/classic; rounded sans → playful; neutral sans → plain/lets other elements speak (examples shown via CSS: freight text, proxima soft, freight sans).
- **Color:** psychology is mostly intuition; blue = safe/familiar, gold = expensive/sophisticated, pink = fun/not serious. Use psychology to explain choices, not to make them.
- **Border radius:** none → serious/formal; small → neutral; large → playful. Whichever you pick, stay consistent — mixing square and rounded corners looks worse than either alone.
- **Language (copy):** formal wording reads professional; casual wording reads friendly. Words influence personality as much as color or type.
- Deciding: look at the sites your target audience uses and match the register — but don't imitate direct competitors.
- *Visual examples:* same banking-vs-startup heros; verify-identity flow written formally ("Thank you Mr. Benson…") vs casually ("Sweet, thanks Steve!") — same UI, different personality from copy alone.

### Limit your choices
- Unlimited options cause decision paralysis (12 vs 13px text, 10% vs 15% shadow opacity, 24 vs 25px avatar, 18 vs 20px margin…). Indistinguishable options (three near-identical blue buttons: #33B1BB / #2F7DB3 / #2B78AD) are un-chooseable.
- **Define systems in advance:** pick a restricted palette (8–10 pre-chosen shades per color) and a restrictive type scale up front; all future decisions come from the set. Example type scale shown: 12, 14, 16, 18, 20, 24, 32, 48 px. Do the hard choosing once.
- **Design by process of elimination:** guess a middle value (e.g., 16px icon), compare against its neighbors (12, 24); two are usually obviously wrong, so the survivor wins. If an outer value wins, re-center and repeat. Example size scale 12/16/24/32px.
- **Systematize everything:** build systems for font size, font weight, line height, color, margin, padding, width, height, box shadows, border radius, border width, opacity. Never make the same low-level decision twice.

---

## 2. Hierarchy is Everything

### Not all elements are equal
- Visual hierarchy (relative importance) is the biggest factor in a "designed" feel — more than styling.
- Everything competing at equal emphasis = noisy wall of content. De-emphasize secondary/tertiary info and highlight the important elements.
- *Visual example:* dense investments dashboard with everything same-sized vs same dashboard with an emphasized balance summary bar and muted secondary rows — same colors/fonts, instantly better.

### Size isn't everything
- Using font size as the only hierarchy tool makes primary content too huge and secondary content too tiny. Use **font weight and color** instead.
- Recommended text color tiers (2–3 total):
  - Dark for primary (e.g., `hsl(202, 57%, 15%)` headline)
  - Grey for secondary (e.g., `hsl(201, 23%, 34%)`)
  - Lighter grey for tertiary (e.g., `hsl(203, 15%, 47%)`)
- Two font weights suffice for UI: **normal (400 or 500)** for most text, **600–700** for emphasis. Recipe card example: 24px/700 title, 18px/700 price, 400 body.
- Avoid font weights under 400 in UI text — unreadable small; de-emphasize with a lighter color or smaller size instead, not a lighter weight.
- *Visual example:* Amsterdam tour card: everything 400-weight at wildly different sizes (bad) vs title bold 24px, body normal, secondary text recolored grey at readable 16px (good).

### Don't use grey text on colored backgrounds
- Grey-on-white works because it reduces *contrast*, not because it's grey; plain grey on a colored panel just looks wrong.
- White text at reduced opacity (e.g., `hsla(0,0%,100%,0.6)`) reduces contrast but looks washed out / disabled, and over images the background shows through.
- Fix: hand-pick a color with the **same hue as the background**, then tune saturation/lightness until legible (example: `hsl(183, 70%, 84%)` text on teal).
- *Visual example:* testimonial card on teal: grey text (muddy) → translucent white (faded, pattern bleeds through) → same-hue light teal (crisp but de-emphasized).

### Emphasize by de-emphasizing
- When the key element still doesn't pop after you've emphasized it, stop adding to it — mute its competitors instead (active nav pops once inactive items get a softer color).
- Same idea at layout scale: if a sidebar competes with content, remove its background fill and let content sit on the page background.
- *Visual example:* nav bar where bold active item is lost among bold items vs one bold item among grey items; and boxed sidebar panel vs panel-less flight-search sidebar.

### Labels are a last resort
- (About displaying data, not form fields.) Naive `label: value` lists give every datum equal weight and kill hierarchy.
- Often **no label needed** — format identifies data (an email, a phone number, `$19.99`), or context does (job title below a name).
- **Combine label and value** into natural phrasing: not "In stock: 12" but "12 left in stock"; not "Bedrooms: 3" but "3 bedrooms" (with icon).
- When a label truly is needed (scannable dashboards), make it supporting content: **smaller size, lighter weight, reduced contrast**; data stays dominant (HEART RATE / **82** BPM example).
- **When to emphasize the label instead:** info-dense pages where users hunt by label (product specs — they scan for "depth", not "7.6mm"). Then label dark, value slightly lighter — but don't de-emphasize the value too much.
- *Visual examples:* profile card as four label:value pairs vs clean name/title/email stack; planter card "In stock: 12" vs "12 left in stock"; real-estate card "Bedrooms: 3" vs "3 Bedrooms" with icon.

### Separate visual hierarchy from document hierarchy
- Keep semantic markup (`h1` etc.) but don't style by tag: browsers' default heading sizes tempt you into oversized page titles (24px+ "Manage Account").
- Section titles act as labels; the content is the star, so titles can be small (16px shown) — even visually hidden for accessibility while kept in markup.
- Rule: choose elements for semantics, style them for the hierarchy you want.
- *Visual example:* settings page with giant h1 title vs same page with a quiet small title — content gets the attention.

### Balance weight and contrast
- Bold feels emphasized because it covers more surface area (illustration: bold A ≈ 90px² vs regular A ≈ 50px² of ink).
- **Contrast to compensate for weight:** icons (esp. solid) are inherently heavy; next to text they steal emphasis. Lower their contrast with a softer color (`hsl(212, 20%, 68%)` next to 13%-lightness text shown) — weight unchanged but balance restored.
- **Weight to compensate for contrast:** if a 1px soft-color border is too subtle (e.g., `1px solid hsl(210, 23%, 95%)`) but a darker border feels harsh (`hsl(200, 16%, 74%)`), thicken the line instead of darkening it: `2px solid hsl(210, 23%, 95%)` = visible yet soft.
- *Visual examples:* music app sidebar with all-dark icons fighting the text vs softened icons; tweet list with too-dark borders vs too-light borders vs a thicker light border.

### Semantics are secondary
- Don't style buttons purely by meaning (red delete + blue edit + green publish = rainbow chaos). Style by **place in the importance pyramid**: one primary, a couple secondary, a few tertiary.
- **Primary:** solid, high-contrast background. **Secondary:** outline style or low-contrast background. **Tertiary:** link-like, discoverable but unobtrusive.
- **Destructive actions:** destructive ≠ automatically big red bold. If deletion isn't the page's primary action, give it secondary/tertiary treatment; reserve the loud red solid button for the confirmation dialog where it *is* primary.
- *Visual examples:* listing card with equal-weight red/blue/green buttons vs publish solid / edit muted / delete as text; button sets showing primary→tertiary treatments on light, dark, and purple backgrounds; "Unpublish" shown as red-solid, outline, and plain text.

---

## 3. Layout and Spacing
- Chapter divider page only (content starts p. 56 — covered in next part).

---

## Key takeaways (top 10)

1. Design features first, shell later — the nav and logo placement resolve themselves once real features exist.
2. Work in short design→build cycles; ship the smallest useful version and never design unbuildable features.
3. Design in grayscale first; let spacing, contrast, and size do the hierarchy work before adding color.
4. Constraint beats freedom: predefine systems (type scale, 8–10-shade palettes, spacing, radii, shadows, opacities) and pick from them by elimination.
5. Hierarchy is the single biggest lever in making UI look designed; every page needs clear primary/secondary/tertiary tiers.
6. Don't rely on font size alone for hierarchy — use weight (400/500 normal, 600–700 emphasis) and three text-color tiers (dark / grey / light grey).
7. Never de-emphasize text by going lighter than weight 400; use color or size instead.
8. On colored backgrounds, don't use grey or translucent white text — pick the background's same hue and lighten it.
9. To make something stand out, de-emphasize what competes with it (nav items, sidebars, surrounding chrome).
10. Style actions by importance, not semantics: solid primary, outline secondary, link-style tertiary — even destructive buttons only get the loud treatment in the confirmation step.
