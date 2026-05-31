---
name: researchskills-extract
description: Extract or convert existing research know-how into ResearchSkills files under .agents/skills/.
---

## When
Use this meta skill when the task is to create ResearchSkills from existing material rather than to apply a domain skill directly. Typical inputs include AI conversation history, local agent skills, memory files, rubrics, prompts, lab notes, research logs, or project instructions that may contain reusable research know-how.

Do not use it for generic engineering, DevOps, UI, database, Docker, package-manager, git, or textbook material unless the content directly changes how research should be done.

## Decision
Treat extraction and conversion as a normal ResearchSkills skill workflow, not as a separate npm package or special command.

Preferred:
- Ask for the source path, conversation export, or pasted source material.
- Use `scripts/researchskills-extract.sh` on macOS/Linux or `scripts/researchskills-extract.ps1` on Windows when the source is a file or directory. The helper builds a bounded source bundle, a manifest, and an extraction prompt without installing anything globally.
- Read only the requested source bundle and directly referenced files needed to understand it.
- Extract one reusable research know-how item per output skill.
- Assign exactly one memory type: `procedural`, `semantic`, or `episodic`.
- Assign exactly one subtype:
  - `procedural`: `tie`, `no-change`, `constraint-failure`, `operator-fail`
  - `semantic`: `frontier`, `non-public`, `correction`
  - `episodic`: `failure`, `adaptation`, `anomalous`
- Place the generated file under `.agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md`.
- Remove private paths, usernames, private URLs, project names, and collaborator names while preserving scientific parameters, methods, model names, datasets, and mechanisms.
- Validate the generated files, then submit them by GitHub PR.

Helper examples:

```bash
.agents/skills/researchskills-extract/scripts/researchskills-extract.sh path/to/source \
  --domain computer-science \
  --subdomain artificial-intelligence \
  --contributor your-github-handle
```

```powershell
.agents/skills/researchskills-extract/scripts/researchskills-extract.ps1 path\to\source `
  -Domain computer-science `
  -Subdomain artificial-intelligence `
  -Contributor your-github-handle
```

After running the helper, read the generated `extraction-prompt.md`, create skill files under `.agents/skills/`, and validate them with:

```bash
python utils/tools/validate.py .agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md
```

Rejected:
- Do not install or document a separate npm package for this workflow.
- Do not preserve legacy slash-command framing when a normal skill invocation is enough.
- Do not merge multiple unrelated insights into one broad skill.
- Do not create skills that only restate common LLM knowledge.

Reasoning: the extraction workflow is itself a meta skill: it teaches an agent how to transform local knowledge into ResearchSkills. Keeping it in `.agents/skills/` makes installation, review, and contribution follow the same path as the rest of the library.

## Local Verifiers
- Every generated skill has frontmatter fields: `name`, `memory_type`, `subtype`, `domain`, `subdomain`, and `contributor`.
- The file path matches its frontmatter memory type and subtype.
- The helper output includes `source-manifest.tsv`, `source-bundle.md`, and `extraction-prompt.md`.
- The body contains a concrete trigger, action or fact, reasoning mechanism, and failure or anti-example guidance when applicable.
- Private identifiers are removed, but scientific content remains specific enough to be useful.
- Repository validation passes for the generated skill files.

## Failure Handling
If the source material is too broad, ask for a narrower source directory, date range, topic, or conversation export before extracting. If the content is mostly generic engineering, report that no ResearchSkills-quality item was found and list the closest rejected candidates. If domain or subdomain is unclear, choose the closest arXiv-aligned folder and mention the uncertainty in the PR.

## Anti-exemplars
- A build failure fixed by changing an npm version is not a ResearchSkill unless it reveals a research-method constraint.
- A prompt template for routine code review is not a ResearchSkill unless it encodes domain-specific research judgment.
- A lab-specific secret, private endpoint, or personal workflow should be de-identified or skipped.
