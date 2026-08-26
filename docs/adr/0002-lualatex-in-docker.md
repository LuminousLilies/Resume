# 0002 — LuaLaTeX in a pinned TeX Live Docker image

Status: Accepted

## Context

No LaTeX toolchain was installed on the machine. We need reproducible builds,
Unicode/OpenType fonts, and want to keep the door open to conditional / data-driven
composition later (e.g. "show this bullet only for backend roles").

## Decision

Compile with **LuaLaTeX** via `latexmk`, inside a **pinned** `texlive/texlive` Docker
image (year-tagged, e.g. `TL2025`). Everything generated goes to `out/`.

## Alternatives rejected

- **XeLaTeX via Tectonic** (single self-contained binary, small, reproducible) —
  rejected because Tectonic *is* XeTeX and cannot run LuaLaTeX. The maintainer is
  fluent in LuaLaTeX; LuaLaTeX adds font expansion (better microtypography) and a real
  embedded Lua interpreter for future in-document logic. Docker already delivers
  reproducibility, which was Tectonic's main advantage.
- **Full local TeX Live install** — ~5 GB, and not reproducible across machines.

## Consequences

- One-time image pull (~1–5 GB depending on scheme), layer-cached thereafter.
- Reproducible via the pinned tag; CI uses the same image.
- Lua programmability stays available for later conditional/data-driven content
  without a separate rendering pipeline (the data-driven deferral itself is recorded in
  ADR-0005).
