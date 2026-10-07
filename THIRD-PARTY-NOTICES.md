# Third-party notices

This repository bundles and links content from the following sources. Each is
credited here along with its license terms. Nothing in this repo claims to be
original work where it isn't.

## Vendored verbatim (MIT)

- **`skills/tailwind-merge/docs/`** — documentation of [tailwind-merge](https://github.com/dcastil/tailwind-merge) (v3.7.x docs, supports Tailwind v4.0–4.3) by Lucas Wiesendanger / dcastil — MIT License.
- **`skills/typography/docs/README.md`** — official documentation of the [@tailwindcss/typography](https://github.com/tailwindlabs/typography) plugin by Tailwind Labs, Inc. — MIT License. © Tailwind Labs, Inc.
- **`skills/heroicons/docs/README.md`** — README of [Heroicons](https://github.com/tailwindlabs/heroicons) by Tailwind Labs, Inc. — MIT License. © Tailwind Labs, Inc. (MIT stated in the README: "This library is MIT licensed.")

## Fetched on demand, not vendored

The following sources are **not** redistributed in this repository (no license
grants redistribution of their content). The `tailwind-docs` and `headless-ui`
skills instead fetch from the official sources into a local cache:

- **Tailwind CSS v4 documentation** (MDX) — fetched by `skills/tailwind-docs/scripts/fetch-tailwind-docs.sh` from [github.com/tailwindlabs/tailwindcss.com](https://github.com/tailwindlabs/tailwindcss.com). Content © Tailwind Labs, Inc.; not covered by an open-source license. Cached locally for reference lookup with attribution and source links intact.
- **Headless UI documentation** (headlessui.com) — fetched and Markdown-converted by `skills/headless-ui/scripts/fetch-docs.mjs`. Content © Tailwind Labs, Inc.

## Referenced / restated

- **`skills/refactoring-ui/`** — the skill body and its `refs/` notes are an independent, transformative distillation (paraphrased, no reproduced passages) of the ideas in *Refactoring UI* by Adam Wathan & Steve Schoger (© Wathan, Inc. / Steve Schoger). Ideas summarized; underlying book text is NOT included and the book should not be redistributed with this repo.

## Runtime tooling

- `skills/headless-ui/scripts/fetch-docs.mjs` uses [turndown](https://github.com/mixmark-io/turndown) (MIT) and [jsdom](https://github.com/jsdom/jsdom) (MIT) as development/runtime dependencies of the repo, not part of the distributed skills themselves.