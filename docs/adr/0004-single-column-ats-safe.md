# 0004 — Single-column, ATS-safe baseline for all templates

Status: Accepted

## Context

Résumés are frequently parsed by Applicant Tracking Systems (ATS) before a human sees
them. Multi-column layouts, text baked into graphics, and exotic fonts routinely get
mangled — causing silent rejection.

## Decision

Every template is **single-column**, with selectable text and standard-ish fonts.
Visual differentiation comes from typography, spacing, rules, and restrained color —
**never** column tricks. If a deliberately non-ATS "showpiece" template is ever added,
it must be explicitly flagged human-eyes-only.

## Alternatives rejected

- **Multi-column designer layouts as the default** — better looking to a human, worse
  for parsing; risks silent rejection with no feedback.

## Consequences

- Template creativity is constrained to single-column.
- Any future two-column template requires explicit opt-out labeling and is the
  exception, not the baseline.
