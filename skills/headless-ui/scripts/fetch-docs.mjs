// Fetches the official Headless UI React docs pages from headlessui.com and
// caches them as Markdown next to this script's skill.
//
// Usage: node skills/headless-ui/scripts/fetch-docs.mjs [pages...]
// (optional page list; defaults to all 16)
//
// Requires `turndown` and `jsdom` resolvable from the repo root
// (npm install at the repo root — package.json lists them).
import { JSDOM } from "jsdom";
import TurndownService from "turndown";
import { mkdirSync } from "node:fs";
import { writeFile } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const here = path.dirname(fileURLToPath(import.meta.url));
const outDir = process.env.HUI_DOCS_DIR ?? path.join(here, "..", "docs");
const pages = process.argv[2] ? process.argv.slice(2) : [
  "button", "checkbox", "combobox", "dialog", "disclosure", "fieldset",
  "input", "listbox", "menu", "popover", "radio-group", "select",
  "switch", "tabs", "textarea", "transition",
];

const turndown = new TurndownService({ codeBlockStyle: "fenced", headingStyle: "atx" });
turndown.remove(["script", "style", "noscript", "svg"]);

mkdirSync(outDir, { recursive: true });

for (const page of pages) {
  const url = `https://headlessui.com/react/${page}`;
  const res = await fetch(url);
  if (!res.ok) {
    console.error(`FAIL ${url}: HTTP ${res.status}`);
    continue;
  }
  const html = await res.text();
  const dom = new JSDOM(html);
  // Prefer the main docs region; fall back to body.
  const region = dom.window.document.querySelector("main") || dom.window.document.body;
  for (const bad of region.querySelectorAll("nav, header, footer")) bad.remove();

  let md = turndown.turndown(region.innerHTML);
  // Collapse excess blank lines.
  md = md.replace(/\n{4,}/g, "\n\n\n").trim();

  const file = path.join(outDir, `${page}.md`);
  await writeFile(file, `---\ntitle: ${page}\nsource: ${url}\n---\n\n${md}\n`);
  console.log(`OK   ${url} -> ${file} (${md.length} chars)`);
}