---
name: dark-mode
description: Implement and review light/dark theming in Tailwind CSS v4 — dark variant strategies (prefers-color-scheme media vs class or data-attribute toggling), three-way system toggles, semantic color tokens via CSS variables and @theme inline, FOUC prevention, and dark-mode design quality (contrast, tinted dark surfaces). Use when adding dark mode, theme switching or a light/dark toggle, using color-scheme CSS variables, or fixing a UI that looks broken in dark mode.
---

# Dark mode & theming (Tailwind v4)

## 1. Pick the strategy

| Strategy | How | When |
|---|---|---|
| Media (default) | nothing to configure; `dark:` follows `prefers-color-scheme` | No manual toggle needed; zero JS |
| Class toggle | `@custom-variant dark (&:where(.dark, .dark *));` | User switchable, OS preference optional |
| Data attribute | `@custom-variant dark (&:where([data-theme=dark], [data-theme=dark] *));` | Same, plays nicer with other theming dimensions (data-color-scheme="brand") |

## 2. The canonical toggle (paste-ready)

Inline in `<head>` before first paint (avoids FOUC), respecting OS preference when the user hasn't chosen:

```js
document.documentElement.classList.toggle(
  "dark",
  localStorage.theme === "dark" ||
    (!("theme" in localStorage) && window.matchMedia("(prefers-color-scheme: dark)").matches),
);
// user picks: localStorage.theme = "light" | "dark"; removing the key = follow OS
```

Three-way toggles (light/dark/system): also `addEventListener("change")` on the `matchMedia` while unset. The preference may equally live server-side and render the attribute/class — anything that sets the selector works.

## 3. Prefer semantic tokens over scattered `dark:` classes

Sprinkling `dark:bg-gray-800` across every component doubles the styling surface and drifts. The better architecture: semantic CSS variables that flip, mapped once through `@theme inline`:

```css
@import "tailwindcss";
@custom-variant dark (&:where(.dark, .dark *));

:root {
  --color-bg: hsl(210, 20%, 98%);
  --color-surface: hsl(0, 0%, 100%);
  --color-text: hsl(212, 30%, 13%);
  --color-muted: hsl(208, 18%, 42%);
  --color-primary: hsl(212, 92%, 45%);
}
.dark {
  --color-bg: hsl(216, 20%, 8%);
  --color-surface: hsl(216, 16%, 12%);
  --color-text: hsl(210, 20%, 92%);
  --color-muted: hsl(214, 12%, 62%);
  --color-primary: hsl(212, 88%, 60%);  /* lightened to keep contrast on dark */
}

@theme inline {
  --color-bg: var(--color-bg);       /* the class bg-bg, text-text etc. now follow the mode */
  --color-surface: var(--color-surface);
  --color-text: var(--color-text);
  --color-muted: var(--color-muted);
  --color-primary: var(--color-primary);
}
```

Components then read `bg-surface text-text text-muted bg-primary` with no `dark:` prefix at all — the whole design system re-themes centrally. (Vendored doc refs: `docs/tailwind/src/docs/theme.mdx` and `adding-custom-styles.mdx` in the tailwindui-skills repo document `@theme inline`; `dark-mode.mdx` documents the variant overrides above.)

Keep `dark:` for one-offs that can't be expressed as a token flip (e.g. `dark:hidden` on a decoration). `prose dark:prose-invert` (typography plugin) and `currentColor` icons (heroicons) follow the theme automatically.

## 4. Dark-mode design quality (not just "invert it")

- **Don't use pure black** — heavily de-saturated dark surfaces (e.g. L 8–14%) read calmer and let shadows exist at all. Keep the grey temperature consistent with light mode.
- **Contrast stays 4.5:1 (text) / 3:1 (large) in both modes.** Re-check `--color-muted` and disabled states; text that passed in light mode often fails dark. Colored text on colored panels may need the hue-rotation fix from `refactoring-ui` refs part3 §9.
- **Lighten primary/accents slightly** in dark mode — mid-lightness brand colors lose pop and contrast against dark surfaces.
- **Shadows barely read on dark backgrounds.** For elevation use surface lightness steps (higher = lighter circle) + hairline borders/rings; or reduce shadow opacity and add a subtle light edge (`ring-1 ring-white/10`).
- **Images/logos/code blocks**: provide inverted or dimmed variants (or wrap photos in a slightly darker surface with the hairline ring); heroicons colored with `currentColor`/`text-*` adapt for free.
- Each hydration flash is a bug: never paint the light theme before the class/attribute script runs (see §2).

## 5. Review checklist for any page in dark mode

1. Token set present for every semantic color the page uses (grep for raw `bg-gray-*`/`text-*` that bypass tokens).
2. Toggle each view: backgrounds, cards, borders, shadows, badges, charts, images.
3. Contrast spot-check: body text, muted text, placeholder text, disabled buttons.
4. No FOUC on hard refresh in dark preference.
5. `prefers-color-scheme` respected when user hasn't toggled.