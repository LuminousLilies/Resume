# Content review notes

## Sources

- `resume.md` supplies the SurveyMonkey platform, migration, design-system, and
  developer-tooling accomplishments. The selected bullets are condensed from that
  document without adding savings, performance percentages, or other new metrics.
- Existing `common/identity.tex` and `sections/education.tex` supply Ashley's contact
  and education details. Existing experience content supplies the remote location
  and QA platform accomplishment. Ashley's clarified timeline supplies the four
  roles, their dates, and the grouping of accomplishments by role.
- `Keara Bird Resume.pdf` supplies the visual and organizational reference only.
  Keara's employers, personal details, awards, and individual accomplishments are
  not evidence about Ashley and were not incorporated as Ashley's experience.

## Selection

The platform resume emphasizes migration leadership, ownership of shared CI/CD and
release tooling, Jest-to-Vitest rollout, ARM and AWS migrations, design-system
TypeScript and styling work, component adoption, and AI review tooling. Skills and
the summary align with that work. The skills-first recipe omits the summary to
follow the reference's structure, while sharing all other content with `platform`.

PR/commit totals and ticket identifiers were omitted in favor of concrete work and
scope. The roughly 12 application packages in the testing migration come directly
from the source. Node and pnpm version upgrades, package extraction, Nx migration,
and routine security maintenance remain in `resume.md` for future tailoring.

## Confirmed role history

Ashley clarified the four-role history on October 9, 2026:

- QA Engineer: May 2018–2019.
- Software Engineer, Design System: 2019–2021. TypeScript conversion, styling
  performance, shared components, migration guides, and visual-regression testing.
- Senior Software Engineer I, Platform Development: 2021–2024. TeamCity to GitHub
  Actions and GitHub Enterprise Server to GitHub Enterprise Cloud migrations.
- Senior Software Engineer II, Platform Development: 2024–Present. Remaining
  platform work, including CI/CD and release automation, testing and infrastructure
  migrations, and AI code review.

The existing contact information and education dates are unchanged; check that
they are current when reviewing the PDF.

## Skills and personal projects

The skills list now names languages, frameworks, platform capabilities, and AI
integration technologies. The AI review system remains an employment achievement;
it is not listed as a standalone skill. Personal GitHub source supports MCP server
development, Claude Code skills and hooks, Ollama, FastAPI, GraphQL, Next.js, and SQL.
See [GitHub project review](github-project-review.md) for evidence and reusable
project entries. The personal projects are presented in a separate supplement;
they are not attributed to SurveyMonkey.

Ashley also confirmed direct Amazon Bedrock API integrations in GitHub Actions,
Claude actions using Bedrock in GitHub Actions, and local Claude use through
Bedrock. Bedrock APIs are included in skills, with the GitHub Actions integrations
described under Senior Software Engineer II.
