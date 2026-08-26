# Résumé

A modular LaTeX résumé system. **Content and formatting are fully separated**, so you
compose a résumé for a specific job from reusable pieces and render it in any template
— without copy-pasting.

Three moving parts:

- **Templates** (`templates/*.cls`) own *all* formatting — fonts, margins, colours, how
  each entry looks.
- **Sections** (`sections/`) are pure content, written with semantic macros only.
- **Applications** (`applications/*.tex`) are thin *recipes*: each picks the sections to
  show and in what order. The template is chosen at build time, not baked in.

The glue is a **macro contract** (`common/resume-api.tex`): the fixed vocabulary every
template must implement. A template that forgets a macro fails to compile — which is
what lets any section render under any template.

## Requirements

Just **Docker**. The toolchain (LuaLaTeX via a pinned TeX Live image) lives in the
container — nothing to install on your machine.

## Build

```sh
make build APP=acme-senior-swe TEMPLATE=modern   # -> out/acme-senior-swe--modern.pdf
make build APP=acme-senior-swe TEMPLATE=classic  # same content, different look
make all                                         # every application × every template
make list                                        # what's available
make clean                                       # rm -rf out/  (instant artifact wipe)
```

Output is named `out/<application>--<template>.pdf`, so template variants of the same
résumé never overwrite each other. Everything generated lives in `out/` (gitignored).

## Add a new application (a résumé for a job)

Create `applications/<company>-<role>.tex`. Start from `acme-senior-swe.tex`:

```latex
\input{common/identity.tex}

\resumeheader{\myname}{Staff Platform Engineer}   % tailor the tagline per role
\contact{\myemail}{\myphone}{\mylocation}{\mylinks}

\input{sections/summary.tex}

\ressection{Experience}
\input{sections/experience/acme.tex}              % pick which jobs to show, in order

\ressection{Skills}
\input{sections/skills.tex}
```

Then `make build APP=<company>-<role> TEMPLATE=modern`.

## Add a section or entry

- A tailorable entry (a job, a project) → a file under `sections/experience/` or
  `sections/projects/`, using the contract macros (`\job`, `\project`, `bullets`).
- A stable section (skills, education) → a whole file in `sections/`.
- Section *headings* live in the application file (via `\ressection{...}`), not in the
  section files — so each application controls order and titles.

Content uses **only** the contract macros; never put formatting in a section.

## Add a template

Copy `templates/classic.cls`, implement every macro in `common/resume-api.tex`, and
keep it **single-column and ATS-safe** (see `docs/adr/0004`). Every existing section and
application renders under it immediately. `\input{resume-api.tex}` at the end of the
class enables the self-check that catches a missing macro.

## The macro contract

Defined and documented in [`common/resume-api.tex`](common/resume-api.tex):

```
\resumeheader{name}{tagline}      \contact{email}{phone}{location}{links}
\ressection{Title}
\job{title}{company}{location}{dates}        + \begin{bullets}…\end{bullets}
\project{name}{stack}{link}                  + \begin{bullets}…\end{bullets}
\education{degree}{institution}{location}{dates}
\skillgroup{category}{comma, separated, list}
```

## Design decisions

The why behind the structure lives in [`docs/adr/`](docs/adr/); shared vocabulary in
[`CONTEXT.md`](CONTEXT.md).

## Continuous integration

`.github/workflows/build.yml` compiles every application × template on push and uploads
the PDFs as artifacts (kept 7 days) — so a broken macro is caught immediately.

## License

The **template machinery** (templates, build system, contract) is MIT — see
[`LICENSE`](LICENSE). The **résumé content** is personal and not licensed for reuse.
