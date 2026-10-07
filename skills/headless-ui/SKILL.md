---
name: headless-ui
description: Build accessible, fully unstyled interactive React components with @headlessui/react v2 — dialogs, popovers, menus, comboboxes, listboxes, tabs, switches, checkboxes, transitions and form primitives. Use when implementing or debugging any Headless UI component, when asked for accessible/custom-styled interactive UI (modals, dropdowns, datepickers, comboboxes...), or when styling component state with Tailwind. Full official docs are vendored in this skill's docs/ folder.
---

# Headless UI v2 (React)

Unstyled, accessibility-complete components you style yourself (typically with Tailwind). Before writing any Headless UI code, **read the component's vendored doc** at `docs/<component>.md` next to this file — it has the exact API, props, data attributes, and proven examples. Doc files are the official headlessui.com docs, converted to Markdown (React section; Vue docs are not vendored). If `docs/` is empty (fresh install), populate it once: `node <this-skill-folder>/scripts/fetch-docs.mjs` (fetches all 16 pages; needs `turndown` + `jsdom` from the repo root's package.json), then use that folder path for all lookups.

## Component map

| Need | Components | Doc |
|---|---|---|
| Modal / dialogs | `Dialog`, `DialogPanel`, `DialogTitle`, `DialogBackdrop` — portal + focus trap + scroll lock built in | `docs/dialog.md` |
| Menus | `Menu`, `MenuButton`, `MenuItems`, `MenuItem` | `docs/menu.md` |
| Popovers / panels | `Popover`, `PopoverButton`, `PopoverPanel`, `PopoverGroup` | `docs/popover.md` |
| Typeahead combobox | `Combobox`, `ComboboxInput`, `ComboboxOptions`, `ComboboxOption` | `docs/combobox.md` |
| Select-like listbox | `Listbox`, `ListboxButton`, `ListboxOptions`, `ListboxOption` | `docs/listbox.md` |
| Tabs | `TabGroup`, `TabList`, `Tab`, `TabPanels`, `TabPanel` | `docs/tabs.md` |
| Toggle switch | `Switch`, `SwitchGroup` | `docs/switch.md` |
| Checkbox / radio cards | `Checkbox`, `RadioGroup` (supports custom "card" rendering) | `docs/checkbox.md`, `docs/radio-group.md` |
| Text inputs (a11y wiring) | `Field`, `Label`, `Description`, `Input`, `Textarea`, `Select` | `docs/fieldset.md`, `docs/input.md`, `docs/textarea.md`, `docs/select.md` |
| Buttons, accordions, reveals | `Button`, `Disclosure` | `docs/button.md`, `docs/disclosure.md` |
| Animations | `Transition`, `TransitionChild` | `docs/transition.md` |

## Key conventions

- **Styling by data attributes**, not props: components expose `data-open`, `data-closed`, `data-active`, `data-selected`, `data-hover`, `data-focus`, `data-disabled`; style them directly in Tailwind: `<MenuItem data-[focus]:bg-indigo-100>...`. Read the component doc for its specific attribute set.
- **Wrap interactive controls in `Field` with `Label`/`Description`** for correct accessibility wiring instead of bare `<label for>` juggling.
- Anchor positioning: `PopoverPanel`/`MenuItems` support an `anchor="bottom"` prop (and `anchor="bottom start"` etc.) so you don't hand-roll absolute positioning. Details in the popover/menu docs.
- `Transition` can be composed with Dialogs (`Dialog` + `TransitionChild`) and its own components accept transition data attributes directly — see `docs/transition.md` before writing any open/close animation.
- Form components work with native forms and controlled/uncontrolled usage; radios and checkboxes accept `value`, `defaultValue`.

## Common patterns

- Custom dropdown (native `<select>` replacement): `Listbox`; combobox with free text + filtering: `Combobox` (docs cover `immediate` and manual filter modes).
- Modal with animated backdrop: `Dialog` + `Transition appear` (full recipe in `docs/dialog.md`).
- Accessible "card picker" (plan/option cards): `RadioGroup` renders children however you like — bordered cards with a selected state are a documented pattern.
- Keyboard/ARIA behavior is automatic — never manually manage focus, `aria-expanded`, roving tabindex, or Escape handling; that's what these components are for.

## Related skills

Styling snippets and design rules come from `refactoring-ui` and `distinctive-ui`; exact Tailwind class names can be verified with `tailwind-docs`.