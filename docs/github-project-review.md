# Personal GitHub review

Reviewed October 9, 2026. Scope: repositories owned by LuminousLilies, including
private repositories accessible through the authenticated GitHub account. Findings
come from README files, dependencies, and implementation code; this was a source
review, not a deployment or performance audit. No project code was executed.

## Skills selection

The skills list prioritizes durable capabilities over a catalog of every package
used. Specific tools such as Vitest, Chromatic, Changesets, CodeArtifact, and ECR
remain in the work accomplishments where they explain what was delivered.

| Group | Included | Evidence |
| --- | --- | --- |
| Languages | TypeScript, JavaScript, Python, SQL | SurveyMonkey source material; TypeScript MCP servers and applications; Python API; SQL scheduler and migrations |
| Web & APIs | React, Next.js, Node.js, FastAPI, GraphQL | SurveyMonkey work; LilyReader API and UI; Luminous Lilies web dependencies and GraphQL service |
| Platform | GitHub Actions, Docker, AWS, CI/CD, monorepo tooling | SurveyMonkey migrations and release ownership; personal-project Compose builds and CI |
| AI tooling | Amazon Bedrock APIs, MCP servers, Claude Code skills/hooks, Ollama | Ashley's confirmed Bedrock experience; custom servers, skill definitions, hooks, and local inference client in `.claude` |

Ashley confirmed direct Amazon Bedrock API integrations in GitHub Actions,
Claude actions using Bedrock in GitHub Actions, and local Claude use through
Bedrock. The skills line includes Bedrock APIs, and the Senior II accomplishment
reflects the CI integrations. This evidence comes from Ashley's clarification,
not from the personal GitHub repositories.
The AI code-review system stays an employment achievement, not a skill label.

## Recommended project entries

### Claude Code Workflow System — strongest fit for AI developer tooling

Reusable entry: `sections/projects/claude-workflows.tex`.

The repository implements two MCP servers: knowledge retrieval and local-model
offload. The retrieval implementation combines BM25 and embedding similarity, and
the MCP layer exposes citations, confidence, and source staleness. The offload
server registers model queries, agent tasks, health checks, and savings accounting.
Skills and hooks cover verification, reports, and context handoffs. The accounting
code distinguishes measured local usage from estimated avoided model cost; the
resume does not claim a measured percentage reduction or production adoption.

Private repository, inspected at `3b5cdf33ab7dc398d7fdd1d1566188a2884997da`:

- [Knowledge MCP server](https://github.com/LuminousLilies/.claude/blob/3b5cdf33ab7dc398d7fdd1d1566188a2884997da/knowledge/src/mcp/server.ts)
- [Hybrid retrieval](https://github.com/LuminousLilies/.claude/blob/3b5cdf33ab7dc398d7fdd1d1566188a2884997da/knowledge/src/lookup/retrieve.ts)
- [Local-offload server](https://github.com/LuminousLilies/.claude/blob/3b5cdf33ab7dc398d7fdd1d1566188a2884997da/local-offload/src/index.ts)
- [Usage and cost ledger](https://github.com/LuminousLilies/.claude/blob/3b5cdf33ab7dc398d7fdd1d1566188a2884997da/local-offload/src/ledger.ts)
- [Verification skill authoring](https://github.com/LuminousLilies/.claude/blob/3b5cdf33ab7dc398d7fdd1d1566188a2884997da/skills/create-verification-skill/SKILL.md)

### LilyReader — strongest fit for full-stack application work

Reusable entry: `sections/projects/lilyreader.tex`.

A React reader backed by FastAPI, Strawberry GraphQL, PostgreSQL, and background
jobs. The synchronization hook queues progress locally before attempting a network
write, drains the outbox after reconnection, and uses per-user sync cursors. These
are concrete implementation details supporting the resume's offline-sync claim.
Audio processing is described without claiming a proprietary speech model or
invented accuracy/latency results.

Private repository, inspected at `fbe05a450178333b9cbaac64048635d69a6d5d1d`:

- [Overview and worker architecture](https://github.com/LuminousLilies/LilyReader/blob/fbe05a450178333b9cbaac64048635d69a6d5d1d/README.md)
- [API composition](https://github.com/LuminousLilies/LilyReader/blob/fbe05a450178333b9cbaac64048635d69a6d5d1d/apps/api/lilyreader/main.py)
- [Reading-state synchronization](https://github.com/LuminousLilies/LilyReader/blob/fbe05a450178333b9cbaac64048635d69a6d5d1d/apps/web/src/hooks/useSync.ts)

### Luminous Lilies — strongest fit for data and platform work

Reusable entry: `sections/projects/luminous-lilies.tex`.

An ingestion and catalog application with source adapters, a SQL-backed scheduler,
GraphQL, Next.js, and operational controls. Its CI includes image builds, Compose
validation, and a stack smoke test. The resume describes implemented mechanisms
without claiming traffic scale, active users, or completion of the project's roadmap.

Private repository (spelled `LuminousLiles` on GitHub), inspected at
`b535d90961661262b2b4a4b23371e87fe5e332b8`:

- [Adapter registry](https://github.com/LuminousLilies/LuminousLiles/blob/b535d90961661262b2b4a4b23371e87fe5e332b8/apps/ingest/src/adapters/registry.ts)
- [SQL-backed scheduler](https://github.com/LuminousLilies/LuminousLiles/blob/b535d90961661262b2b4a4b23371e87fe5e332b8/apps/ingest/src/orchestrator/scheduler.ts)
- [Next.js application](https://github.com/LuminousLilies/LuminousLiles/blob/b535d90961661262b2b4a4b23371e87fe5e332b8/apps/web/package.json)
- [CI pipeline](https://github.com/LuminousLilies/LuminousLiles/blob/b535d90961661262b2b4a4b23371e87fe5e332b8/.github/workflows/ci.yml)

The project supplement labels these as personal projects and omits private GitHub
URLs from the PDF. Source links here are for the owner's review.

## Other candidates

- [MTG Cube Helper](https://github.com/LuminousLilies/MTG-Cube-Helper): a useful
  public example of API integration, reproducible card-data workflows, and draft
  simulation. Its Scryfall MCP server is a third-party dependency, so it is not
  evidence that Ashley authored that server. Less relevant than the custom MCP
  servers for this platform/AI resume.
- [Game Engine](https://github.com/LuminousLilies/Game-Engine): a private Rust/Bevy
  procedural-world project. A useful alternate for systems or game-development
  roles, but not a reason to crowd this resume's skills list with Rust.
- Dotfiles, the personal site, and recipes were not prioritized. Forks were not
  treated as original projects without contribution evidence. Installed Cursor skills
  and generated tool metadata were not counted as authored projects.

## Composition

`applications/personal-projects.tex` renders all three selected entries as a
standalone supplement. For a targeted resume, include the most relevant project
module in that application's `Selected Projects` section and trim employment
detail deliberately rather than shrinking the body text to force everything in.
