# Ashley Nanjo — Web Platform / Developer Experience Engineer

---

## Summary

Web Platform engineer focused on build, release, and CI/CD infrastructure for
SurveyMonkey's web monorepo and its surrounding tooling. Owned the pipelines,
runners, and release machinery that the whole web engineering org depends on, led
the company's source-control and CI platform migration onto GitHub, and was an
early, heavy contributor to both the web design system and the monorepo itself.

**By the numbers:** 641 pull requests (434 merged) across ~47 repositories,
tracked against 77 WEBPLAT platform tickets, over three and a half years — and that
count reflects only post-cutover history on GitHub Cloud; substantial earlier work
on the design system and monorepo predates the migration and lived on GitHub
Enterprise Server.

---

## What I worked on

### Source-control & CI platform migration (led)
Led SurveyMonkey's web org through two foundational platform migrations:
- **GitHub Enterprise Server → GitHub Enterprise Cloud (GHEC).** Drove the cutover of
  the web platform onto GitHub Cloud — repository moves, reference/link updates across
  `smweb`, `smpackages`, and the notes/tooling repos, and removing the old
  GHES-specific bot and server code afterward.
- **TeamCity → GitHub Actions.** Moved the build and publish pipelines off TeamCity
  onto GitHub Actions — migrating the TC configurations to GHA, rebuilding the release
  and app-diff flow (via `coxswain`, pulling artifacts/diffs from the QA API instead
  of the old server), and decommissioning TeamCity auth once the cutover was complete.

These two migrations reshaped how every web engineer builds, reviews, and ships, and
set the foundation for the CI/CD and release tooling below.

### Design system (Wrench / WDS)
Core contributor to SurveyMonkey's web design system — **Wrench** and the Wrench
Design System (WDS), the shared component framework every web app is built on —
from 2020 to 2022. **173 commits to the Wrench repo**, a top individual contributor
among roughly 70 authors over the project's life, across components, build, styling,
and docs. Highlights:
- **Led the TypeScript conversion of Wrench** — added the TS configurations and
  typed the shared utilities, typography, and component APIs across the library.
- **JSS styling performance** — authored the `createMemoStyles` / `useMemoStyles`
  memoization fix for a known JSS `useStyles` performance problem (WRENCH-1660), plus
  a new theme layout (WRENCH-1620).
- **Built and maintained components** — the Radio component, tab indicator and error
  icons, and broad ownership across popout, menu, tooltip, tabs, modal, slider,
  select/multiselect, table, pagination, checkbox, accordion, and typography.
- **Authored the component migration guides** for the library (tooltip, toast,
  switch, popout, tabs, slider, grid, table, button, and more) that teams used to
  adopt the new design system.
- Introduced **Chromatic** visual-regression testing and semver/version checks into
  the WDS build.

Later continued to steward WDS from the platform side — centralizing WDS and shared
versions through pnpm catalogs in the monorepo and handling dependency/CVE
remediation.

### Monorepo development (pre- and post-cutover)
Contributed heavily to the `smweb` monorepo from its early days, including
restructuring app folders (e.g. consolidating Nextweb into Respweb) and the build
layout. Carried that ownership forward into the post-cutover era as the monorepo's
primary CI/CD and release maintainer.

### Build & release infrastructure
Built and ran the release system for the web platform — release-candidate creation,
automated publishing, and asset bundling. Stood up changesets-based versioning and
release automation across the template repos and shared-action repos, replacing
ad-hoc release scripts with a consistent, versioned workflow. Added lint gates and
AI-generated changeset descriptions to the release path.

### CI/CD pipelines and GitHub Actions (the largest body of work)
Authored and maintained the reusable workflows, composite actions, and runner
configuration behind the web platform's CI. Broke monolithic workflow steps out
into shared, versioned actions consumed across repos; added a reusable
static-analysis workflow; and consolidated lint orchestration. Roughly 140 PRs
touched the CI/CD surface.

### Major platform migrations (led end to end)
- **Jest → Vitest** across the entire `smweb` monorepo — a phased, package-by-package
  migration (foundation, pilot, then ~12 app packages) ending in the removal of all
  dead Jest tooling and ESLint plugin cutover.
- **AMD → ARM runners** across `smweb`, `smpackages`, `smtools`, and the shared
  pipeline repos, including Docker ARM builds and retiring the old AMD runner fleet.
- **Node → Node 24** across base images, Docker images, shared actions, and a codified
  runtime policy.
- **Artifactory → AWS CodeArtifact** for package publishing and resolution.
- **Docker images → ECR**, including trusted ECR layer caching in CI.
- **Turborepo → Nx** orchestration in the packages repo.
- **Package extraction** — migrated "Wave 1" shared packages out of the `smpackages`
  monolith into a dedicated `webplatform-packages` repo and removed the originals.

### pnpm / monorepo tooling
Centralized shared dependency versions via pnpm catalogs, kept the toolchain current
through pnpm major upgrades (including pnpm 12 support in the publish actions), and
maintained lockfile and workspace health across the monorepo.

### AI code review
Built out the AI code-review tooling (`ai-code-reviews`): versioned the repo with
changesets and a lint gate, made the Claude review action run on demand, taught it to
use each repo's `CLAUDE.md`/`AGENTS.md` as review guidance, and skipped review on
draft PRs to control cost.

### Developer platform & templates
Maintained the clone/scaffold template repos and shared action libraries
(`clone-template`, `reusable-workflows`, `changesets-actions`, `sync-assets`,
`conventional-pr`) that new services inherit, plus asset-publishing and
observability (OpenTelemetry) tooling.

### Reliability & security hygiene
Routine upkeep that kept the platform safe and current: security dependency updates,
removing deprecated/abandoned actions (e.g. Snyk, `tj-actions`), replacing a broken
Dependabot ECR job with a scheduled drift workflow, and introducing an environment
variable schema workflow to flag unknown config across the platform.

---

## Scope & breadth

Primary ownership in `smweb` (the web monorepo, 267 PRs), `app-sea-spider` (the next
template, 86 PRs), `smpackages` (52 PRs), and the shared pipeline/workflow repos
(`pipeline-tools`, `reusable-workflows`, `smtools`, `coxswain`). Also contributed
across service repos (`svc-coral-api`, `svc-apollo-coprocessor`), infra
(`infra-helm`, `base-images`), and quality tooling (`e2e`) — roughly 47 repositories
in total, spanning the full web platform surface.

---

## Strengths

- Running long-lived, multi-repo migrations as sequenced, verifiable phases rather
  than big-bang cutovers.
- Owning CI/CD and release infrastructure that the broader engineering org relies on.
- Reducing toil through shared, versioned tooling and automation instead of per-repo
  copies.
