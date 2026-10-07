# Refactoring UI — Distilled Notes, Part 4 (pages 166–218)

Note: distilled/paraphrased from the book; no verbatim passages. Page numbers refer to PDF pages.

## Table of Contents (this range)

1. Creating Depth (cont.)
   - Shadows can have two parts (p. 166)
   - Even flat designs can have depth (p. 167)
   - Overlap elements to create layers (p. 170)
2. Working with Images
   - Use good photos (p. 174)
   - Text needs consistent contrast (p. 176)
   - Everything has an intended size (p. 181)
   - Beware user-uploaded content (p. 187)
3. Finishing Touches
   - Supercharge the defaults (p. 192)
   - Add color with accent borders (p. 195)
   - Decorate your backgrounds (p. 198)
   - Don't overlook empty states (p. 203)
   - Use fewer borders (p. 206)
   - Think outside the box (p. 210)
4. Leveling Up (p. 215–218)

---

## 1. Creating Depth (continued)

### Shadows can have two parts (p. 166)

- The two-shadow system: one large soft shadow (diffused ambient light) + one small tight shadow (direct light with sharper edge).
- Rule: the *sharp/direct* shadow should get MORE subtle the higher the elevation — crisp and distinct at the lowest elevation, almost invisible at the highest.
- Concrete elevation recipes shown (top line + bottom line pairs):
  - Lowest: `0 1px 3px rgba(0,0,0,.12)` + `0 1px 2px rgba(0,0,0,.24)`
  - Next: `0 3px 6px rgba(0,0,0,.15)` + `0 2px 4px rgba(0,0,0,.12)`
  - Next: `0 10px 20px rgba(0,0,0,.15)` + `0 3px 6px rgba(0,0,0,.10)`
  - Next: `0 15px 25px rgba(0,0,0,.15)` + `0 5px 10px rgba(0,0,0,.05)`
  - Highest: `0 20px 40px rgba(0,0,0,.2)` (second shadow gone)
- Visual: five cards at increasing elevation with annotated shadow values — shows the small shadow fading while the large blur grows with each level.

### Even flat designs can have depth (p. 167–169)

- Flat design (no shadows/gradients) still needs to convey depth; it just uses other means.
- **Creating depth with color**: of same-hue shades, lighter surfaces read as closer/raised, darker surfaces read as further/inset.
  - Make an element lighter than the page background to feel raised; darker to feel like an inset well.
  - Example: login card in white on a light gray bg (raised/prominent) vs. a darker gray "Don't have an account?" strip (recessed/secondary).
- **Solid (no-blur) shadows**: short, vertically offset shadow with zero blur keeps the flat aesthetic while lifting elements slightly.
  - Recipe: `box-shadow: 0 3px 0 hsl(220, 7%, 83%)` — a thin hard edge under cart items.
  - Example: shopping cart lines each get a subtle solid bottom edge instead of blurred shadows.

### Overlap elements to create layers (p. 170–172)

- Overlap is one of the strongest depth cues — makes the design feel like stacked layers.
- Let a card straddle the boundary between two background sections instead of fully containing it inside one: `margin-bottom: -60px` pulls the next section up underneath.
  - Before/after: flight search form contained inside the hero vs. hanging down over the white section below — overlapping version reads richer and layered.
- Make an element taller than its parent so it protrudes both sides: `margin: -60px 0 -60px 0` (license-renewal card over/under a dark banner band).
- Works for small controls too: carousel arrows pushed outside the card with `margin-left: -24px` / `margin-right: -24px`.
- **Overlapping images**: give each image an "invisible border" matching the background color so neighboring images never clash: `border: 4px solid #FFFFFF`.
  - Example: profile avatar and follower avatar stack overlapping the cover photo — with white rings they read as tidy layers; without, they collide messily.

---

## 2. Working with Images

### Use good photos (p. 174–175)

- Bad photography will sink an otherwise great design.
- Example: same apartment listing card — dim poorly-composed photo vs. bright staged photo; identical layout, dramatically different perceived quality.
- Options:
  1. Hire a professional photographer (great photos are about lighting/composition/color skill, not gear).
  2. Use high-quality stock photography (e.g., Unsplash for free).
- Don't design around placeholders planning to swap in smartphone shots later — that swap never happens well.

### Text needs consistent contrast (p. 176–180)

- Problem: white headline text is unreadable on heroes because photos have both very light and very dark areas. Fix the image, not the text color.
- Example: hero "Meeting Room Scheduling Made Easy" — text vanishes in bright areas; "too light"/"too dark" crops show no single text color works across a dynamic photo.
- Fix 1 — **Add an overlay**: semi-transparent dark (or light) layer over the whole image.
  - Recipe: `background-color: hsla(0, 0%, 0%, .55)` for dark overlay supporting white text; white overlay supports dark text.
- Fix 2 — **Lower the image's own contrast** (more surgical than an overlay, which darkens/brightens everything):
  - Recipe: Brightness +40%, Contrast −70%. After lowering contrast, rebalance brightness since the image's overall tonality shifts.
- Fix 3 — **Colorize the image** (also helps match brand colors):
  1. Lower contrast to even things out.
  2. Desaturate fully.
  3. Solid color fill with multiply blend mode. Recipe: color `#035581`, blend mode multiply → deep blue monochrome hero.
- Fix 4 — **Text shadow**: keeps more of the photo's dynamics; boost contrast only under the glyphs.
  - Goal is a soft "glow," not a drop shadow: large blur radius, no offset.
  - Recipe: `text-shadow: 0 0 50px hsla(0, 0%, 0%, .4)`.
  - Combine with a mild image-contrast reduction (you can reduce less than you otherwise would).

### Everything has an intended size (p. 181–186)

- **Don't scale up icons**: SVGs drawn for 16–24px look amateurish and disproportionately "chunky" at 3–4x (48px) — they lack the detail large icons need.
  - Example: megaphone at intended 24px (fine) vs. scaled to 48px (chunky) vs. icon *drawn* for 48px (right amount of detail).
  - Workaround with small-only icon sets: keep the icon near intended size, enclose it in a circle/square with a colored background to fill the space ("larger but not scaled").
  - Example: features page with icons at raw scaled size vs. icons inside tinted circles — the latter looks deliberate.
- **Don't scale down screenshots**: shrinking a full-app screenshot (e.g., by 70%) crams too much detail; 16px UI text becomes ~4px mush.
  - Instead: capture at a smaller viewport (tablet/mobile layout) and give it ample space; or capture only the relevant partial area; or draw a simplified mock UI (details removed, text as gray lines) to communicate the big picture.
  - Examples: distorted tiny full screenshot (bad) → mobile-layout screenshot (good) → cropped single-panel screenshot (good) → simplified line-art UI illustration (good).
- **Don't scale icons DOWN either**: large detailed icons get choppy/fuzzy at small sizes. Favicons are the extreme case — a 128px logo reduced to 16px turns to mush.
  - Fix: redraw a drastically simplified version of the logo at the target size; control the compromises yourself instead of letting the browser average the pixels.
  - Example: asterisk-in-rounded-square logo — original, browser-shrunk (blurry blob) vs. simplified redraw (fewer, thicker arms) shrunk (clean).

### Beware user-uploaded content (p. 187–190)

- You can't color-grade or crop user uploads, so defend the layout structurally.
- **Control shape and size**: never show uploads at intrinsic aspect ratios — mixed ratios wreck grids.
  - Example: burger recipe grid with ragged mixed-ratio images (messy) vs. uniform cards.
  - Fix: fixed-size container, image centered and cropped (CSS background image + `background-size: cover`).
- **Prevent background bleed**: when an upload's background matches your UI background, the image loses its edges.
  - Don't reach for a solid border — colors often clash with photo content.
  - Use a subtle *inset* box shadow instead: `box-shadow: inset 0 2px 4px 0 hsla(0,0%,0%,.2)`.
  - Alternative if you dislike the inset feel — a semi-transparent hairline inner ring: `box-shadow: inset 0 0 0 1px hsla(0,0%,0%,.1)`.
  - Example: avatar list where a light-background portrait blends into the page; inset shadow restores the circle's shape, and most viewers never consciously notice it.

---

## 3. Finishing Touches

### Supercharge the defaults (p. 192–194)

- Add flair by upgrading elements you already have, instead of adding new ones.
- **Bulleted lists → custom icon markers**: checkmarks/arrows are safe generics; better, use content-relevant icons (padlocks for security features).
  - Example: plain disc bullets vs. blue check icons; padlock icons in security list.
- **Testimonials**: promote quote marks into visual elements — enlarge them, recolor, offset them.
  - Example: small inline quotes vs. big light-blue oversized quote glyphs flanking the testimonial text.
- **Links**: go beyond default blue — change color + font weight, or use a thick colored custom underline that partially overlaps the text (highlight-marker look).
- **Checkboxes/radios**: custom styled controls (e.g., brand-colored checked state instead of browser default blue) instantly reads "polished."
  - Example: default browser inputs vs. purple brand-colored check/radio states.

### Add color with accent borders (p. 195–197)

- Cheap graphic flair without illustration skill: colored border strips on otherwise plain areas.
- Placements:
  - Top edge of a card (pricing card with gradient top bar).
  - Under the active nav item (underline accent on "Products").
  - Left edge of an alert/banner (blue strip on info callout).
  - Short accent bar beneath a headline.
  - Full-width bar across the very top of the layout.
- Example: conference page plain vs. with teal top band — the colored rectangle alone makes it feel "designed."

### Decorate your backgrounds (p. 198–202)

- When hierarchy/spacing/type are solid but pages feel plain, energize selected backgrounds.
- **Change the background color**: emphasize one panel (pricing card in indigo) or distinguish whole page sections.
  - Gradients add energy — rule: keep the two hues within roughly 30° of each other on the color wheel.
- **Repeating pattern**: subtle tileable patterns (e.g., from Hero Patterns); doesn't have to cover everything — a strip along one edge works (dotted band under a footer).
  - Keep pattern-to-background contrast low so text stays readable.
- **Simple shape or illustration in a corner**: geometric shapes (dot-grid triangle cluster beside an article header), a partial chunk of a pattern (wave lines behind a pricing header), or something representational like a simplified dotted world map behind a newsletter signup — again, low contrast so nothing fights the content.

### Don't overlook empty states (p. 203–205)

- If the feature depends on user content, the empty state is the FIRST thing new users see — design it deliberately, not as an afterthought.
- Bad: blank panel with tiny "No contacts found."
- Good: illustration/icon to grab attention + emphasized call-to-action button ("Add contact").
- Hide UI that's useless without content — tabs, filters, search bars over an empty list are noise.
  - Example: discounts screen with tab bar/search over empty state (bad) vs. simple hero "Create a discount code" with big illustration (good); supporting UI returns once content exists.
- Empty states are a chance to be interesting and exciting.

### Use fewer borders (p. 206–209)

- Borders for separation are a habit; too many lines make interfaces busy.
- Example: contacts dialog divided by rules everywhere (cluttered) vs. alternatives:
  1. **Box shadow**: outlines like a border but softer — `box-shadow: 0 5px 15px 0 hsla(0,0%,0%,.15)`. Works best when the element's fill differs from the page background.
  2. **Different background colors**: adjacent surfaces in slightly different tints (panel on `background-color: hsl(200, 10%, 94%)`) creates separation with no lines. If you already have both a border AND a background change, try deleting the border.
  3. **Extra spacing**: just spread items apart — `margin-bottom: 6px` between rows; separation through whitespace adds zero new visuals.

### Think outside the box (p. 210–214)

- Challenge default mental models of components — most components are just boxes you can fill however you like.
- **Dropdowns**: not just stacked link lists. Use sections, multi-column layouts, icons + descriptions, badges.
  - Example: plain "Features" link list vs. two-column menu with icons, one-line descriptions, a "NEW" badge, separated docs/footer section.
- **Tables**: merge related columns when they don't need independent sorting — stack secondary data under the primary value (role under name, policy type under price) to create hierarchy. Enrich cells with avatars and colored status pills instead of plain text.
- **Radio buttons**: when the choice is important, replace the label-circle stack with selectable cards (plan picker: bordered cards with name/size/price, selected card outlined green with check).
- Constraints are useful, but loosening fixed beliefs is what elevates an interface.

---

## 4. Leveling Up (p. 215–218)

- **Look for decisions you wouldn't have made**: when you see a design you like, ask what the designer did that would never have occurred to you. Catalog un-obvious moves:
  - Dark/inverted background on a datepicker.
  - Button placed *inside* the text input (newsletter email field + Join button).
  - Two different colors within one headline.
  - Collecting these unintuitive decisions is how new tools enter your toolbelt.
- **Rebuild favorite interfaces from scratch** (no peeking at devtools). Reverse-engineering forces you to discover the micro-details: reduced line-height on headings (recipe: `line-height: 1.2`), cropping images with `overflow: hidden`, stacked shadows (recipe: `0 4px 6px hsla(0,0%,.7)` + `0 5px 15px hsla(0,0%,.1)` — as annotated), letter-spacing on uppercase text (recipe: `letter-spacing: 0.8rem` as book shows for dramatic tracking; in practice uppercase utility text uses smaller tracking).

---

## Key Takeaways (top 10 from this range)

1. **Use a two-part shadow system** — big soft ambient shadow + small sharp direct shadow; the sharp one fades as elevation rises (see the 5-recipe ladder).
2. **Depth can come from color alone** — lighter surface = closer/raised, darker = recessed; plus hard zero-blur "solid shadows" for flat UIs.
3. **Overlap creates layers** — let cards straddle section boundaries (negative margins), and give overlapping images a background-colored "invisible border" (~4px) to avoid clashing.
4. **Use good photography** — hire a pro or quality stock; never design with placeholders expecting to swap in phone photos.
5. **Fix text-over-image at the image**: overlay (`hsla(0,0%,0%,.55)`), contrast reduction (contrast −70% / brightness +40%), single-color multiply colorize (e.g., `#035581`), or offset-free large-blur text shadow (`0 0 50px hsla(0,0%,0%,.4)`).
6. **Respect intended sizes** — don't blow 16–24px icons up to 48px (wrap small icons in colored shapes instead); don't shrink full screenshots (capture mobile layout/partial/simplified redraw); redraw logos for favicon size.
7. **Harden against user uploads** — fixed containers with `background-size: cover`; separate images from matching backgrounds with inset shadows (`inset 0 2px 4px hsla(0,0%,0%,.2)` or hairline `inset 0 0 0 1px hsla(0,0%,0%,.1)`), not solid borders.
8. **Supercharge defaults & accent color cheaply** — icon bullets, big styled quote marks, thick overlapping link underlines, brand-colored form controls; colored top-bars/underlines/side-strips need zero design talent.
9. **Treat empty states as first impressions** — illustration + strong CTA, hide useless tabs/filters until content exists.
10. **Prefer separation without borders** — shadow, background-color difference, or extra spacing; and question component conventions (rich dropdowns, merged table columns, card-style radios).
