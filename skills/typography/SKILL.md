---
name: typography
description: Style rich text, Markdown, CMS or other uncontrolled HTML with the official @tailwindcss/typography plugin (prose classes), plus general readability rules for content-heavy pages (line length, line-height, scaling). Use when rendering blog posts, docs, articles, changelogs, comments, markdown, rich-text editors, or when the user mentions prose, typography, or readable long-form content in a Tailwind project.
---

# @tailwindcss/typography (prose classes)

For HTML you don't control (Markdown render output, CMS content), don't style every element by hand — wrap it in `prose`:

```shell
npm install -D @tailwindcss/typography
```

```css
/* v4: in your main CSS file */
@import "tailwindcss";
@plugin "@tailwindcss/typography";
```

```html
<article class="prose lg:prose-xl">{{ markdown }}</article>
```

## Essentials (full docs vendored in `docs/README.md`)

- **Grey scale modifier** must accompany base class: `prose prose-slate` (`-gray` default, `-slate`, `-zinc`, `-neutral`, `-stone`).
- **Size modifiers**: `prose-sm` (14px body) / `prose-base` (16px, default) / `prose-lg` (18px) / `prose-xl` (20px) / `prose-2xl` (24px); stackable with breakpoints (`md:prose-lg lg:prose-xl`). Always keep base `prose`.
- **Dark mode**: `prose dark:prose-invert` — every color theme ships a hand-tuned inverted version.
- **Element modifiers** target each element: `prose-a:hover:text-*`, `prose-img:rounded-xl`, `prose-headings:underline`, `prose-code:...`; full list of 31 modifiers in the vendored README (headings, p, a, blockquote, code, pre, ol/ul/li, table parts, img, hr...). In v4 the state modifier comes last (`prose-a:hover:...`), opposite of v3.
- **Max-width**: each size class carries a readability max-width; use `max-w-none` when the container already constrains width (e.g. inside a grid column).
- **Sandboxing**: `<div class="not-prose">` excludes an embedded block (embeds, demos) from prose styling; no nesting prose inside not-prose.
- **Custom color theme**: write a `@utility prose-<name>` setting the `--tw-prose-*` variables (body, headings, links, bullets, hr, quotes, code, pre-bg + `--tw-prose-invert-*` twins) — complete example in vendored README.
- **Rename the class**: `@plugin "@tailwindcss/typography" { className: wysiwyg; }` if `prose` collides.

## Readability rules to apply alongside (from `refactoring-ui` refs part2 §7–12, part3 §1–2)

- Line length 45–75 chars: prose's default max-width does this — keep it unless the layout already does.
- Line-height scales with width (up to ~2.0 wide) and inversely with font size; headings get tight (~1–1.2).
- Left-align long-form text; don't center paragraphs. Tighten letter-spacing on large headlines (~-0.05em), loosen ALL-CAPS labels (~+0.05em).
- For UI text (not rich content), plain Tailwind utilities follow the crafted scale: `12 14 16 18 20 24 30 36 48 60 72`px, body 400–500, emphasis 600–700.

## Doc reference

`docs/README.md` next to this file is the complete official typography-plugin documentation (install, themes, modifiers, customization, v3 differences), fetched from the plugin repo's `main` branch (matches published plugin 0.5.20; latest via `npm view @tailwindcss/typography version`).