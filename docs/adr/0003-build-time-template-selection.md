# 0003 — Template selected at build time, not baked into the application

Status: Accepted

## Context

We want to render the *same* tailored content in different templates without
duplicating the content — to A/B how a résumé looks, or send different looks to
different audiences.

## Decision

Application files declare **content only** (identity + chosen sections). The template
is a **build parameter**:

```
make APP=platform TEMPLATE=modern
```

Output is named `out/<app>--<template>.pdf` so variants of one résumé coexist rather
than overwriting each other.

## Alternatives rejected

- **`\usetemplate{...}` inside the application file** — switching looks then means
  editing or duplicating the recipe; you cannot cheaply render one résumé across all
  templates.

## Consequences

- The build command carries two axes (application × template).
- Application files never name a template.
- Rendering one résumé in every template is a trivial loop.
