# Skill Schema

This document defines the current specification for ResearchSkills skill files.

---

## 1. File Location

```
.agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md
```

- `domain` must match one of: `physics`, `mathematics`, `computer-science`, `quantitative-biology`, `statistics`, `eess`, `economics`, `quantitative-finance`, `management`
- `subdomain` must match one of the arXiv-aligned subdomain folders under each domain (see `.agents/skills/<domain>/` for the full list)
- `contributor` should be the contributor's GitHub username or stable public handle
- `memory_type` must be one of: `procedural`, `semantic`, `episodic`
- `skill-name` must be lowercase, hyphen-separated

---

## 2. Frontmatter Fields

```yaml
---
name: <string>                  # REQUIRED. Unique identifier. Lowercase, hyphen-separated.
memory_type: <string>           # REQUIRED. procedural | semantic | episodic
subtype: <string>               # REQUIRED. Depends on memory_type.
domain: <string>                # REQUIRED. One of: physics | mathematics | computer-science | quantitative-biology | statistics | eess | economics | quantitative-finance | management
subdomain: <string>             # REQUIRED. arXiv-aligned subdomain slug.
contributor: <string>           # REQUIRED. GitHub username or stable public handle.
---
```

### 2.1 Field Reference

| Field | Required | Type | Valid Values |
|---|---|---|---|
| `name` | yes | string | lowercase, hyphens only |
| `memory_type` | yes | enum | `procedural` `semantic` `episodic` |
| `subtype` | yes | enum | see subtype table below |
| `domain` | yes | enum | see list above |
| `subdomain` | yes | string | arXiv-aligned subdomain folder |
| `contributor` | yes | string | GitHub username or public handle |

### 2.2 Subtypes

| Memory Type | Valid Subtypes |
|---|---|
| `procedural` | `tie`, `no-change`, `constraint-failure`, `operator-fail` |
| `semantic` | `frontier`, `non-public`, `correction` |
| `episodic` | `failure`, `adaptation`, `anomalous` |

---

## 3. Body Sections

The skill body (after frontmatter) should follow the structure for its memory type.

### 3.1 Procedural

```markdown
## When
Precise trigger conditions and exclusions.

## Decision
Preferred action, rejected alternatives, and reasoning.

## Local Verifiers
Concrete checks that the action is working.

## Failure Handling
Fallback steps if the preferred action fails.

## Anti-exemplars
Situations where this skill should not be used.
```

### 3.2 Semantic

```markdown
## Fact
The specific fact, correction, or frontier knowledge.

## Evidence
Why this fact is known or credible.

## LLM Default Belief
For correction skills, what the model is likely to get wrong.

## Expiry Signal
When this fact may become stale.
```

### 3.3 Episodic

```markdown
## Situation
The concrete research situation.

## Action
What was tried or changed.

## Outcome
What happened.

## Lesson
The reusable lesson.

## Retrieval Cues
When an agent should recall this episode.
```
