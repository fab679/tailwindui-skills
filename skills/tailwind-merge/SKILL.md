---
name: tailwind-merge
description: Merge and compose Tailwind CSS class strings correctly — tailwind-merge (twMerge/twJoin), clsx, cn() helpers, className-override patterns for reusable React components, and cva-style variants. Use when writing components that accept a className prop, composing styles across component layers, resolving class conflicts (p-4 vs p-2 / px-* vs prefix-*), or deciding whether/where tailwind-merge belongs. Full official docs vendored in docs/.
---

# tailwind-merge — class composition for component code

`npm install tailwind-merge clsx` (for cva: `npm install class-variance-authority`).

`twMerge(inputs...)` resolves conflicts (last conflict wins, refinements kept); `clsx` handles conditional classes. The standard helper pattern:

```ts
// lib/cn.ts — the ONLY place importing tailwind-merge, so it's configurable later
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
```

## Where to use twMerge vs twJoin

| Situation | Use |
|---|---|
| Merging a component's internal classes with a caller `className` prop | `twMerge()` (the primary purpose) |
| Classes all internal to the component (no incoming overrides) | `twJoin()` — no conflict resolution, clsx-speed, forces ternaries to express conflicts explicitly |
| Joining conditionals on one element of a leaf component | `cn()`/`twJoin()` is enough |

```tsx
import { twJoin, twMerge } from "tailwind-merge";

function MyComponent({ forceHover, disabled, className }) {
  return (
    <div className={twMerge(
      "grid w-max gap-2",
      forceHover ? "bg-gray-200" : ["bg-white", !disabled && "hover:bg-gray-200"],
      className, // always last
    )} />
  );
}
```

```tsx
// internal-only: prefer twJoin
className={twJoin(TYPO_STYLES, "grid w-max gap-2", isMuted && "text-gray-600")}
```

## Design guidance (important — it's an escape hatch, not a default)

- **Prefer explicit `variant` props** for styling you intend to control (`variant="primary" | "secondary"`). Add `className`-pass-through for one-off overrides, and promote a one-off to a variant once it repeats.
- Trade-offs when exposing `twMerge`-merged `className` to large/public APIs: bundle cost (~7 kB gz), users gain styling freedom you must keep working across refactors. For internal design systems, that's usually fine; for public libraries it may not be.
- Results are LRU-cached (500 entries); `twMerge` calls are cheap on re-renders.
- Alternatives when tailwind-merge is too heavy: Tailwind's important modifier (`bg-red-500!`) — one level deep only; or a `:where()`-based custom variant to make base classes low-specificity (`@custom-variant component (:where(&));` and `component:bg-blue-500`).

## Cheat sheet of merging behavior (see `docs/features.md` for all)

- Last conflicting class wins: `p-5 p-2 p-4` → `p-4`
- Refinements kept: `p-3 px-5` stays; `inset-x-4 right-4` stays; `inline block` → `block`
- Modifiers resolve: `hover:p-2 hover:p-4` → `hover:p-4`; stacked-modifier order-aware
- Arbitrary values supported, but ambiguous ones need CSS-type labels: `text-[length:...]/text-[color:...]` — unlabeled arbitrary values on ambiguous groups (like `text-*`) won't merge correctly
- Arbitrary properties/variants do NOT conflict-resolve against their predefined equivalents (`[padding:1rem] p-8` keeps both) — avoid mixing them
- Important modifier recognized: `p-3! p-4! p-5` → `p-4! p-5`; postfix like `text-lg/7` handled
- Non-Tailwind classes preserved untouched; custom color names work out of the box

## Custom configs

If Tailwind has custom classes groups tailwind-merge can't infer, extend it once in `lib/cn.ts` via `extendTailwindMerge({ extend: { classGroups: ... } })` — full API in `docs/configuration.md` and `docs/api-reference.md`. The `docs/recipes.md` file has real-world composition recipes.

## References

All official docs are vendored in `docs/` next to this file: what-is-it-for, when-and-how-to-use-it (decision guide), features, limitations, configuration, recipes, api-reference, writing-plugins.