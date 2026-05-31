# ResearchSkills Agent Notes

## Repository Layout

- Public research skills live under `.agents/skills/`.
- The extraction/conversion workflow is the normal meta skill at `.agents/skills/researchskills-extract/SKILL.md`, not a separate package or command.
- Repository validators and contribution examples should point at `.agents/skills/`, not a top-level `skills/` directory.

## Editing Rules

- Keep README install instructions simple: use `npx skills add ScienceIntelligence/ResearchSkills` or `bunx skills add ScienceIntelligence/ResearchSkills`.
- Describe extraction/conversion as using the ResearchSkills meta skill, not as legacy slash commands or separate packages.
- Use minimal diffs and avoid rewording unrelated project text.
