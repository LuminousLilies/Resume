# 0005 — Author content directly in LaTeX; defer a data-driven pipeline

Status: Accepted

## Context

We considered keeping résumé content in structured data (YAML/JSON) and rendering it
into LaTeX with a script — which would make the content portable to other output
formats (plain-text, HTML) and separate content from even the macro layer.

## Decision

Author content **directly in LaTeX** section files, using the contract macros. No data
layer, no rendering script.

## Alternatives rejected

- **Data-driven rendering pipeline (YAML/JSON → LaTeX)** — earns its keep only once a
  *second* output format is actually needed. Until then it is indirection plus an extra
  toolchain dependency. LuaLaTeX's in-document programmability (ADR-0002) keeps a
  lighter version of this option available without a separate pipeline.

## Consequences

- One language, the simplest path today.
- If a second output format is ever required, **reopen this ADR** — it is the
  designated place that decision lives.

## Note (visibility / license)

Repo is public and shared with friends; the **template machinery is MIT**, the résumé
**content is personal** (not licensed for reuse). See CONTEXT.md "Standing facts".
