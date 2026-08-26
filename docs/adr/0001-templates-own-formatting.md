# 0001 — Templates own formatting; sections are portable content via a stable macro contract

Status: Accepted

## Context

The goal is a few templates × many composable sections, tailored per application. If
formatting leaks into section files, every section couples to one template and the
template × section matrix collapses into copy-pasted variants — the exact thing this
repo exists to avoid.

## Decision

A **template** is a `.cls` that owns *all* formatting. **Section** files contain only
semantic macros drawn from a documented, stable **contract** in
`common/resume-api.tex`. Every template must implement the full contract; a template
that omits a macro fails to compile (a self-check errors loudly rather than rendering
something subtly wrong).

## Alternatives rejected

- **Templates as full skeletons, formatting living in sections** — couples content to
  one look; adding a template means editing every section.
- **Ad-hoc macros per template, fix mismatches as they surface** — silent drift; a
  section renders under one template and breaks under another with no warning.

## Consequences

- Adding a template = implement the contract once; all existing sections render under
  it immediately.
- Adding a macro to the contract is a deliberate breaking change across all templates
  — intentional friction that keeps the contract honest.
- Sections cannot do template-specific tweaks. That's the point.
