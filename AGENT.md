# ResearchSkills Agent Notes

## Repository Layout

- Public research skills live under `.agents/skills/`.
- The `researchskills-extract/` package is the meta-skill tooling for extracting or converting skills; do not delete it when moving the public skill library.
- Repository validators and contribution examples should point at `.agents/skills/`, not a top-level `skills/` directory.

## Editing Rules

- Keep README install instructions simple: use `npx skills add ScienceIntelligence/ResearchSkills` or `bunx skills add ScienceIntelligence/ResearchSkills`.
- Preserve `/researchskills-extract` and `/researchskills-convert` documentation; those commands are for generating and submitting skills.
- Use minimal diffs and avoid rewording unrelated project text.
