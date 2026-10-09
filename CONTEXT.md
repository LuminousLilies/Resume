# CONTEXT — shared language for this résumé system

One word per concept, so we never re-explain across sessions. When a term here has a
precise meaning, use it; the "avoid" phrasings cause a round of confusion.

## Glossary

- **Application file** — a thin per-job `.tex` in `applications/` that *composes* one
  résumé: it `\input`s the identity module and the chosen section files, in order. It
  is the **recipe**. It does **not** pick the template (that's build-time selection)
  and contains **no** formatting.
  _Avoid:_ "resume file", "master file", "main tex".

- **Template** — a LaTeX document class (`templates/*.cls`) that owns **all**
  formatting: fonts, margins, colors, spacing, how each entry is laid out.
  _Avoid:_ "layout file", "skeleton". ("style"/"theme" are fine informally, but the
  noun is *template*.)

- **Section** — a template-agnostic **content** module under `sections/`. Only
  semantic macros, never formatting. Per-entry granularity where you tailor
  (`sections/experience/surveymonkey.tex`, `sections/projects/*.tex`); whole-file where you
  don't (`sections/skills.tex`, `education.tex`, `summary.tex`).
  _Avoid:_ "component", "block". Use *section*.

- **Template API / macro contract** — the fixed set of semantic macros (`\job`,
  `\ressection`, `\skillgroup`, …) declared in `common/resume-api.tex`. Every template
  must implement all of them; a missing one is a **hard compile error**. This contract
  is what makes sections portable across templates.
  _Avoid:_ "the macros"/"the commands" when you mean the *contract*.

- **Identity module** — `common/identity.tex`, the single source of your
  name/contact/links, `\input` by every application. Edit contact info in exactly one
  place; never re-type it in an application file.

- **Build-time template selection** — the template is chosen when you build
  (`make APP=platform TEMPLATE=modern`), not baked into the application file.
  Same content → any template, zero duplication. Output: `out/<app>--<template>.pdf`.

- **`out/`** — the single sink for everything generated (final PDF **and** all LaTeX
  intermediates, via `latexmk -outdir=out`). `make clean` = `rm -rf out/`. Gitignored.

## Standing facts

- Repo is **public** (shared with friends; templates are MIT — see ADR-0005 note below,
  content is personal). `common/identity.tex` therefore commits real contact info to
  public history — intentional; keep anything you wouldn't publish out of it.
- Every template is **single-column and ATS-safe** by default (see ADR-0004).
- Engine is **LuaLaTeX** in a **pinned TeX Live Docker image** (see ADR-0002).
