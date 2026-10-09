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
make build APP=platform TEMPLATE=modern   # -> out/platform--modern.pdf
make build APP=platform TEMPLATE=classic  # same content, different look
make build APP=platform-compact TEMPLATE=editorial # Keara-inspired, skills-first
make all                                  # every application × every template
make list                                 # what's available
make clean                                # rm -rf out/  (instant artifact wipe)
```

Output is named `out/<application>--<template>.pdf`, so template variants of the same
résumé never overwrite each other. Everything generated lives in `out/` (gitignored).

## Current content and review draft

Start with `out/platform-compact--editorial.pdf` after running the corresponding
build command above. The `editorial` template follows the supplied Keara Bird
resume's contact-first header, dark divider, condensed headings, monospaced body,
and single-column layout. It uses Source Code Pro and Roboto Condensed from the
existing Docker image. `platform-compact` orders skills, experience, and education;
`platform` also includes a professional summary. Both reuse the same section files
and can be built with any template.

Content is authored directly in LaTeX, as described in ADR-0005. `resume.md` is the
source material for editorial selection; it is **not automatically imported**.
Update these files to change the generated resumes:

- `common/identity.tex`: name, contact details, location, and links.
- `sections/experience/surveymonkey.tex`: selected accomplishments and role history.
- `sections/summary.tex` and `sections/skills.tex`: positioning and technical skills.
- `sections/education.tex`: degree, institution, and dates.
- `applications/*.tex`: section selection, order, and role-specific tagline.

See [content review notes](docs/content-review.md) for source decisions and the
confirmed employment timeline.

## Add a new application (a résumé for a job)

Create `applications/<company>-<role>.tex`. Start from `platform.tex`:

```latex
\input{common/identity.tex}

\resumeheader{\myname}{Staff Platform Engineer}   % tailor the tagline per role
\contact{\myemail}{\myphone}{\mylocation}{\mylinks}

\input{sections/summary.tex}

\ressection{Experience}
\input{sections/experience/surveymonkey.tex}     % pick which jobs to show, in order

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
