---
name: distinctive-ui
description: Make UIs feel intentionally designed and non-generic — escape the template/bootstrap/shadcn default look and avoid AI-slop tells. Use when a design reads as "generic", bland, or template-y, when the user wants personality or a memorable visual identity, when asked to AUDIT/critique an existing page for slop or generic tells (return a ranked punch list, don't edit), or when adding finishing touches to default-styled components. Pairs with refactoring-ui (foundations) and tailwind-docs (class lookup).
---

# Distinctive UI — escaping the generic look

The generic look is what you get from default decisions. Distinctiveness comes from choosing a personality before styling, then adding a **small set of deliberate signature moves** on top of solid foundations. Foundations (hierarchy, spacing, type scale) are in the `refactoring-ui` skill — apply those first; flourishes on bad foundations still look bad.

## Verbs

- *(default)* The user wants a design built or improved → plan, then build following §1–3.
- **audit** — the user asks to review/critique a page or design ("audit", "why does this look AI-generated", "roast this UI"). Read the target, score it against §4 (slop tells) and the `refactoring-ui` foundations, and return a **ranked punch list** (`file:line` + fix). **Do not edit.**
- **study** — the user supplies a screenshot or URL of a design they admire. Extract the *DNA* only — macrostructure (page shape), type pairing roles (display/body), colour anchor, spacing rhythm, signature details — as a short diagnosis, then offer to rebuild the user's content with the DNA. **Never copy pixels, copy, or identity; note what NOT to carry over.** Don't copy from template-marketplace sites.

Interop: if the `hallmark` skill is installed and manages the project (a `design.md` at the project root or `.hallmark/log.json`), defer to it for theme/structure decisions and only apply this skill's foundations alongside it.

## 1. Choose a personality before styling anything

Four levers decide how a UI "feels" more than anything else:

- **Typeface**: serif → elegant/classic; rounded sans → playful; neutral sans → quiet (lets other elements speak). Pick by the audience's world, not by competitors: a fintech app for conservative users sets formal copy and system-neutral type; a youth brand sets rounded faces and casual copy. With two families make them *clearly* distinct; more than two typefaces is slop (a third only for wordmark/hero-stat/pull-quote).
- **Color temperature**: cool blue-tinted greys read corporate/technical; warm orange-tinted greys read friendly/human. Golds, deep indigos, single-vivid-accent palettes each send different signals.
- **Border radius**: none → serious/formal; small → neutral; large → playful. Pick one and apply with total consistency — mixing is worse than either alone. One radius on everything regardless of hierarchy is an AI tell.
- **Copy register**: "Thank you, Mr. Benson" vs "Sweet, thanks Steve!" — words set personality as much as pixels. Copy rules: write from the user's perspective, active voice, CTAs say exactly what they do ("Save changes", not "Submit"), keep the vocabulary consistent across the flow, errors explain what happened and how to fix it without apologizing, empty screens invite action.

Also systematize: fixed radius steps, shadow ladder, grey palette (temperature included) — defined once, reused everywhere.

## 2. Signature moves (the non-generic kit)

Add 2–4 of these per page, deliberately. They are cheap, need no illustration skill, and instantly separate a design from the default look:

- **Accent borders**: colored strip on the top edge of the key card, a short bar under a headline, a left edge strip on alerts, a full-width band at the very top of the layout, an accent underline on the active nav item. A single colored rectangle makes an otherwise plain surface feel designed.
- **Decorated background**: tint or gradient a standout panel (e.g. the featured pricing card) or entire sections; if gradient, keep the two hues within ~30° of each other, and never purple-to-blue. Or add a low-contrast repeating pattern along one edge, or a simple geometric shape/partial pattern in a corner. Keep pattern contrast low — decoration must never fight content.
- **Overlap / layering**: let a hero card or form straddle the boundary between two background sections (negative margin, e.g. `margin-bottom: -60px`); let controls protrude outside their container edges; give overlapping images a background-colored ring (`border: 4px solid <page bg>`) so they read as tidy stacked layers.
- **Two-part shadows everywhere**: big soft ambient + small tight contact shadow (recipes in `refactoring-ui` refs `part4.md` §1) — instantly reads more "physical" and crafted than single blurred shadows. For flat designs: darker/lighter surface + zero-blur solid shadow (`box-shadow: 0 3px 0 hsl(220,7%,83%)`).
- **Supercharge defaults instead of adding components**: replace bullet dots with check/custom icons (padlocks on a security list), enlarge and recolor testimonial quote marks into graphic elements, style links with weight and a thick overlapping underline (highlighter-marker look), brand-color the checked state of checkboxes/radios/buttons.
- **Two-tone headlines**: split a headline across two font sizes/weights/colors.
- **Button inside the input**: put the submit button inside the text field (newsletter email + Join). Rebuilding familiar layouts from their own inversions is a distinctive move.
- **Structural variety, not just visual variety**: two pages for two briefs should not share the same hero → 3 features → CTA → footer rhythm. Vary section shapes, dividers, and heading placement between builds.
- **Designed empty states**: illustration/icon + one strong CTA, and hide tabs/filters/search until content exists — most apps ship ugly empty panels; a characterful empty state is a memorability cheat.
- **Scale icons by containment** (from refactoring-ui): small icons enlarged inside colored circles/squares read as deliberate brand styling, not lazy scaling.

## 3. Spend your boldness in one place

Let **one** element be the memorable thing; keep everything else quiet and disciplined. Before shipping, run a quick 5–10s self-critique (score 1–5, rework anything < 3):

- **Hierarchy** — 2-second test: is primary/secondary/tertiary instantly readable?
- **Specificity** — could this page belong to anyone? Restructure until it could only belong to this brief.
- **Restraint** — remove one accessory: any flourish that isn't earning its place goes.
- **Motion** — one orchestrated moment beats scattered fade-and-slide-up entrances; motion answering a user action is fine.

## 4. AI-slop tells — never emit these

The defaults every generated UI falls back to. Each is legitimate for *some* brief, but never reach for them unconsciously:

- Purple-to-blue / cyan-to-magenta gradients (incl. gradient text); the cream + terracotta + serif + single-accent default palette.
- `min-height: 100vh` hero with everything centered on one axis — break the alignment: off-axis eyebrow or CTA.
- 3-equal-column card grid with icon-above-heading tiles; icon-in-colored-rounded-square on every feature card.
- Display font = Inter/Roboto/Open Sans/system default; ALL-CAPS tracked-out eyebrow label above every heading; numbered `01 · THE TOUR` markers when content isn't a sequence.
- One-word-accent headlines only in *italic* — headers are roman; emphasis via weight/accent/underline. Italic only as body emphasis.
- Emoji glyphs (✨🚀⚡🎯) as feature/step/pricing icons; mixing two icon libraries on one page.
- Re-drawn browser/phone/IDE chrome: don't fake it — wrap real screenshots in a `<figure>` with a hairline border.
- Invented metrics ("+47% conversion", "trusted by 50,000+ teams") — if the user didn't supply a number, use a placeholder slot (`—`) and a "to confirm" note, or restructure. Also never fabricate testimonials or logos.
- Uniform `hover:scale-105` on everything; `transition-all`; overshoot/bounce easings on UI state; animated entrance on the focus ring (rings appear instantly).
- "Jane Doe"/"Acme"-class placeholder names; `→` appended to every link; meta strings joined by middle dots.

Pre-ship checklist for non-generic:

1. Could this page be mistaken for a stock template or an AI default? If yes, add or push a signature move.
2. Is there exactly one clear hero/primary element per view (rest de-emphasized)?
3. Do the greys have a temperature? Are shadows two-part?
4. Is there any decoration tuned to the content (accent bar, pattern, overlap) — but at most a few, consistent with the chosen personality?
5. Did every flourish survive a "does the content deserve it" test (decoration on solid hierarchy only)?
6. Empty states, form controls, and links: default-styled or branded?

## References

Recipes and rationale for every move live in the `refactoring-ui` skill's `refs/` (personality → part1 §1; accents/backgrounds/empty states/defaults → part4 §3; overlap/shadows → part3 §12–14 and part4 §1). The "Leveling Up" habit worth adopting: whenever you see a design decision you'd never have made, catalog it — that's how the moves above were all collected.