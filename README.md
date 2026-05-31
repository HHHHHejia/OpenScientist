<div align="right">

[English](#-researchskills) · [中文](readme_zh.md)

</div>

<div align="center">

# 🌍 ResearchSkills

[![GitHub stars](https://img.shields.io/github/stars/ScienceIntelligence/ResearchSkills?style=social)](https://github.com/ScienceIntelligence/ResearchSkills/stargazers) [![GitHub forks](https://img.shields.io/github/forks/ScienceIntelligence/ResearchSkills?style=social)](https://github.com/ScienceIntelligence/ResearchSkills/fork) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

2015: 5,154 scientists co-authored one paper on the Higgs boson.

Today: We're launching the largest academic collaboration in human history

**— 🏛️ Building the Library of Alexandria for AGI, Accelerating Automated Scientific Discovery.**

<p align="center">
  <a href="https://researchskills.ai/">https://researchskills.ai/</a>
</p>

---

<h2 align="center">1. About ResearchSkills</h2>

</div>

**Science is the last important problem left for AI to solve.** Real scientific breakthroughs require something no model has: the hard-won intuition of researchers who've spent years at the frontier.

This intuition lives in your head — the know-how, the heuristics, the reasoning patterns, the "I just know this won't work" instinct. It never makes it into papers. It dies when you retire.

**ResearchSkills captures it before it's lost.** We turn the tacit knowledge of the world's top researchers — their skills, thinking frameworks, and principles — into reusable AI agent skills (compatible with **Claude Code** and **Codex**). Every contribution makes every AI scientist — now and in the future — smarter, permanently.

Each skill encodes the knowledge, tools, reasoning protocols, and common pitfalls of a scientific field. Skills can be written by domain experts or **auto-extracted from your research conversations** using the included ResearchSkills meta skill. The meta skill extracts three types of cognitive memory from your research sessions — **procedural** (IF-THEN rules for research impasses), **semantic** (facts LLMs don't know), and **episodic** (concrete research episodes) — then packages them as reusable skills. Point your AI agent at a skill, and it reasons like a domain expert.

> **Note:** Applying a skill may trigger broad edits, long workflows, and significant token usage — review the expected scope before running one deeply.

---

<h2 align="center">Why Contribute?</h2>

- **Your skills make YOUR AI smarter first.** Extracted skills are cached locally. Your Claude Code / Codex / Cursor immediately reasons better in your domain — before you ever submit anything.

- **Privacy first.** Nothing is scanned or uploaded without your explicit consent. A blocking consent gate asks before every operation. You review everything before submission.

- **Low cost, smart caching.** Conversations are compressed before analysis. Already-processed sessions are cached and skipped on re-runs. The heavy lifting is delegated to lighter models.

- **Works everywhere.** Claude Code, Codex, Cursor, Windsurf, VS Code, JetBrains — any tool that reads markdown instructions. Skills are plain `.md` files, not locked to one platform.

- **Works on remote servers.** SSH and headless environments are auto-detected. No browser needed — the submission URL is printed to your terminal.

- **Immortalize your expertise.** Your decades of know-how become a permanent, citable contribution to science. Every skill you contribute trains every future AI scientist.

---

<h2 align="center">2. Install ResearchSkills</h2>

Install the public ResearchSkills library into your local agent:

```bash
npx skills add ScienceIntelligence/ResearchSkills
```

Or with Bun:

```bash
bunx skills add ScienceIntelligence/ResearchSkills
```

---

<h2 align="center">3. How to Contribute</h2>

### Method A: Use the ResearchSkills Meta Skill (Recommended)

Install the library, then ask Claude Code, Codex, or another markdown-aware agent to use the `researchskills-extract` skill. This is a **meta skill**: it turns conversation history, local skills, prompts, rubrics, notes, or other research know-how into ResearchSkills files.

Example prompt:

```text
Use the ResearchSkills meta skill to extract or convert my research know-how into ResearchSkills files, validate them, and prepare a GitHub PR.

Source material:
- Ask me for the path(s), pasted text, or conversation export to use.
- Read only that source and directly referenced files needed to understand it.

Rules:
- Create one ResearchSkills file per reusable research know-how item.
- Use exactly one memory type: procedural, semantic, or episodic.
- Use exactly one valid subtype for that memory type.
- Put files under `.agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md`.
- Preserve scientific content, but remove private paths, usernames, project names, private URLs, and collaborator names.
- Skip generic engineering, DevOps, UI, database, Docker, git/npm, and textbook content unless it is directly research-method knowledge.
```

The meta skill extracts **research skills** organized by cognitive memory type:

- **Procedural memory:** IF-THEN rules for navigating research impasses (e.g., "IF gradient explodes THEN check learning rate before architecture")
- **Semantic memory:** Domain facts that LLMs don't reliably know (e.g., calibration constants, method limitations, undocumented tool behaviors)
- **Episodic memory:** Concrete research episodes capturing what was tried, what failed, and what the researcher learned

Review the generated files, check de-identification, validate them, and submit them by GitHub PR.

### Method B: One-Click Prompt for Web Users (ChatGPT / Claude / Gemini)
After running, submit via [**here →**](https://researchskills.ai/submit-manually/#auto-parse)

### Method C: Convert Existing Skills

Already have a local skill, command, memory file, rubric, prompt, project instruction, note, or document? Use the same ResearchSkills meta skill from Method A. It converts existing material into `.agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md` files and prepares a PR.

### Method D: Write Manually

Write your own skill following the [**guide →**](https://researchskills.ai/submit-manually/#manual-entry)

> Don't see your field? [Propose a new area →](https://github.com/ScienceIntelligence/ResearchSkills/issues/new?template=04-propose-new-area.md) · Need a skill but can't write it yourself? [Request a skill →](https://github.com/ScienceIntelligence/ResearchSkills/issues/new?template=02-skill-request.yml)

---

<h2 align="center">4. Skill Architecture</h2>

ResearchSkills skills are grounded in cognitive architecture theory — [Soar](https://en.wikipedia.org/wiki/Soar_(cognitive_architecture)) (Laird, 2012), [ACT-R](https://en.wikipedia.org/wiki/ACT-R) (Anderson, 1996), and [Case-Based Reasoning](https://en.wikipedia.org/wiki/Case-based_reasoning) (Kolodner, 1993). Skills are organized by **how researchers' minds actually store and retrieve expertise**, not by arbitrary categories.

### Three Memory Types

| Type | What it stores | When it triggers |
|------|---------------|-----------------|
| **Procedural** | IF-THEN rules for research impasses | Agent faces a decision, gets stuck, or assumptions fail |
| **Semantic** | Facts missing from LLM training data | Agent needs domain knowledge it doesn't have |
| **Episodic** | Concrete research episodes | Agent encounters a situation similar to a past experience |

### Procedural Memory — "How to decide"

Classified by the type of **research impasse** (adapted from Soar's impasse taxonomy):

| Subtype | Impasse | Example |
|---------|---------|---------|
| `tie` | Multiple paths, unclear which to choose | "Ablation vs. full retrain — which first?" |
| `no-change` | Completely stuck, no idea what to do next | "Results are bizarre, nothing makes sense" |
| `constraint-failure` | A methodological assumption doesn't hold | "Data violates i.i.d. assumption" |
| `operator-fail` | Chose the right approach but execution fails | "Correct method, but CUDA OOM on large batch" |

Each procedural skill contains: **When** (trigger condition + exclusions) → **Decision** (preferred action + rejected alternatives + reasoning) → **Local Verifiers** (how to check) → **Failure Handling** (what if it doesn't work) → **Anti-exemplars** (when NOT to use this).

### Semantic Memory — "What LLMs don't know"

Only three sub-types qualify — everything else is redundant with LLM training data:

| Subtype | What it stores | Example |
|---------|---------------|---------|
| `frontier` | Post-training-cutoff knowledge | "Flash Attention 3 renamed the `causal` parameter" |
| `non-public` | Lab-internal, unpublished knowledge | "This vendor's H100 batch has NCCL topology issues" |
| `correction` | Fixes for LLM's incorrect default beliefs | "Adam eps=1e-8 is unstable for mixed-precision; use 1e-5" |

### Episodic Memory — "What happened"

Classified using Case-Based Reasoning terminology:

| Subtype | Signal | Retrieval trigger |
|---------|--------|------------------|
| `failure` | "Did X, broke because of hidden reason Y" | Agent is about to do something similar |
| `adaptation` | "Standard method failed, but workaround Z worked" | Agent is stuck with the standard approach |
| `anomalous` | "Expected A, observed B — turned out to be important" | Agent observes a similar anomaly |

### Directory Structure

```
.agents/skills/
└── {domain}/                    # 8 arXiv-aligned domains + management
    └── {subdomain}/             # 181 subcategories
        └── {contributor}/       # Your name
            ├── procedural/      # tie--, no-change--, constraint-failure--, operator-fail--
            ├── semantic/        # frontier--, non-public--, correction--
            └── episodic/        # failure--, adaptation--, anomalous--
```

### Theoretical Foundation

For the full rationale — why research is hard, why LLMs struggle with it, and how skills change agent behavior — see [Why Research Is Hard](docs/why-research-is-hard.md). For the complete schema specification, see [Skill Schema Design](docs/superpowers/specs/2026-04-11-skill-schema-design.md).

---

<h2 align="center">5. Become a Reviewer</h2>

Reviewers are domain experts who guard the scientific quality of skills in their subdomain. You need substantial peer-review experience in the relevant field.

**What you do:** Review submitted skills for scientific accuracy and completeness. Provide constructive feedback to contributors. Promote skill status from `draft` to `reviewed` once verified.

**What you get:** Approve or request changes on submissions in your subdomain.

[**Apply to become a reviewer →**](https://github.com/ScienceIntelligence/ResearchSkills/issues/new?template=03-maintainer-application.yml)

---

<h2 align="center">6. Domains</h2>

<div align="center">

Aligned with the [arXiv category taxonomy](https://arxiv.org/category_taxonomy), plus one management domain. 9 domains, 181 subcategories.

| Domain                                      | arXiv                                              | Subcategories | Reviewer(s)        |
| --------------------------------------------- | ---------------------------------------------------- | --------------- | -------------------- |
| ⚛️ Physics                                | astro-ph, cond-mat, gr-qc, hep, nlin, physics, ... | 51            | *Seeking reviewer* |
| ➗ Mathematics                              | math                                               | 32            | *Seeking reviewer* |
| 💻 Computer Science                         | cs                                                 | 40            | *Seeking reviewer* |
| 🧬 Quantitative Biology                     | q-bio                                              | 10            | *Seeking reviewer* |
| 📊 Statistics                               | stat                                               | 6             | *Seeking reviewer* |
| ⚡ Electrical Engineering & Systems Science | eess                                               | 4             | *Seeking reviewer* |
| 📈 Economics                                | econ                                               | 3             | *Seeking reviewer* |
| 🏢 Management                               | N/A                                                | 26            | *Seeking reviewer* |
| 💹 Quantitative Finance                     | q-fin                                              | 9             | *Seeking reviewer* |
| 🎯 Management                               | mgmt                                               | 10            | *Seeking reviewer* |


[View all 181 subcategories in the interactive knowledge tree →](https://scienceintelligence.github.io/ResearchSkills/)

</div>

---

<h2 align="center">Join the Community</h2>

<div align="center">

Scan the QR code below to join our WeChat group.

<img src=".context/WXGroup_QR_Code.jpg" alt="WeChat Group QR Code" width="240" />


</div>

---

## License

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) — free to share and adapt, with attribution.

---

<div align="center">

## Acknowledgments

With gratitude to everyone who makes this possible:

[**Contributors →**](https://github.com/ScienceIntelligence/ResearchSkills/graphs/contributors) · [**Reviewers →**](https://scienceintelligence.github.io/ResearchSkills/reviewers.html) · [**Sponsors →**](https://scienceintelligence.github.io/ResearchSkills/organizers.html) · [**Organizers →**](https://scienceintelligence.github.io/ResearchSkills/organizers.html)

---

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=ScienceIntelligence/ResearchSkills&type=Date)](https://star-history.com/#ScienceIntelligence/ResearchSkills&Date)

</div>
