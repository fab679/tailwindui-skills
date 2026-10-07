# tailwindui-skills

Nine Claude Code skills for designing and building **better, non-generic UIs** with Tailwind CSS — design foundations distilled from *Refactoring UI*, anti-generic design guidance with UI audits, brand planning, and lookup skills backed by vendored/fetched official docs for Tailwind CSS v4, Headless UI, tailwind-merge, the typography plugin, and Heroicons.

## Skills

| Skill | Purpose |
|---|---|
| [`refactoring-ui`](skills/refactoring-ui/) | Core UI craft: hierarchy, spacing, typography, color, depth, images, polish, interactive states, responsive floor. Distilled (paraphrased, transformative) from *Refactoring UI* (Wathan & Schoger) into `refs/`. |
| [`distinctive-ui`](skills/distinctive-ui/) | Personality + signature moves for escaping the template look, AI-slop tell list, **audit** and **study** verbs. |
| [`branding-plan`](skills/branding-plan/) | Up-front brand & design-system planning: audience/personality, palettes with shade scales, typefaces, radius/copy register, token file — with a pre-flight scan of existing projects. |
| [`tailwind-docs`](skills/tailwind-docs/) | Verify Tailwind CSS **v4** utility classes and syntax against the official docs (fetched as MDX into a local cache by its script). |
| [`headless-ui`](skills/headless-ui/) | Headless UI v2 (React): accessible unstyled components, docs fetched and converted to Markdown on demand. |
| [`tailwind-merge`](skills/tailwind-merge/) | Class composition & component code hygiene: twMerge/twJoin/cn(), variant-first APIs (official MIT docs vendored). |
| [`typography`](skills/typography/) | @tailwindcss/typography (prose) for Markdown/CMS/rich text + readability rules (official README vendored). |
| [`dark-mode`](skills/dark-mode/) | Light/dark theming in Tailwind v4: variant strategies, semantic tokens with `@theme inline`, toggle + FOUC prevention. |
| [`heroicons`](skills/heroicons/) | @heroicons/react v2: variant selection, sizing, currentColor, a11y (official README vendored). |

The set is benchmarked against Anthropic's official exemplar skills and the `hallmark` anti-slop skill; borrowed patterns: audit/study verbs + slop tells (`distinctive-ui`), pre-flight scan + `design.md` interop (`branding-plan`), 8-state + input-state discipline and responsive non-negotiables (`refactoring-ui`), one-icon-library rule (`heroicons`).

## Install (any fresh machine)

**Option A — Claude Code plugin (recommended):** the repo is both a plugin and a marketplace:

```
# in Claude Code
/plugin marketplace add fab679/tailwindui-skills
/plugin install tailwindui-skills@tailwindui-skills

# or from a shell
claude plugin marketplace add fab679/tailwindui-skills
claude plugin install tailwindui-skills@tailwindui-skills
```

Updates are picked up with `/plugin marketplace update` (or enable auto-update for the marketplace in `/plugin`).

**Option B — plain skills folder (no plugin system):**

```bash
git clone https://github.com/fab679/tailwindui-skills.git
cd tailwindui-skills && ./install.sh              # → ~/.claude/skills
./install.sh ~/.agents/skills                     # cross-agent shared skills dir
```

`install.sh` symlinks each skill; re-run any time to add new ones (existing links are skipped). Other agents that read standard skill directories can be pointed at the same folders.

**On first use**, `tailwind-docs` and `headless-ui` fetch their official docs into a local cache next to the skill (see each `SKILL.md`) — the sources for those two don't allow redistribution, so they are not committed to this repo. Vendored MIT content (tailwind-merge docs, typography and Heroicons READMEs) is committed; full attribution in [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md).

## Repo layout

```
.claude-plugin/    plugin.json + marketplace.json (plugin/marketplace manifests)
skills/<name>/     SKILL.md (+ refs/, docs/, scripts/ per skill)
install.sh         symlink installer for non-plugin setups
```

Updating skills = updating this repo; plugin users run `/plugin marketplace update`, symlink users just `git pull`.

## License

MIT for original content — see [LICENSE](LICENSE). Third-party content is governed by its own terms, see [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md).