---
name: "Jagged Frontier Verifiability Gates Automation"
memory_type: procedural
subtype: constraint-failure
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## When
Deciding whether an AI capability is ready to be automated / productized / trusted for a task. The capability passes on some benchmarks but fails unpredictably on others — the so-called "jagged frontier."

## Decision
Use verifiability, not average benchmark score, as the gate: if you cannot cheaply verify a task's output, you cannot reliably automate it regardless of model capability. Foundation Capital framing: the jagged frontier is really a verifiability frontier in disguise. Tasks where ground truth is cheap to check (math, code, formal proofs, API responses) are automatable even with a weak model plus verifier. Tasks where verification requires another frontier model or a human expert (research judgment, writing quality, strategic decisions) are not automatable at today's reliability levels even with a strong model. This reframes "Agentic RL + Test-Time Reasoning" as "Agentic RL + **Verified/Formal** Reasoning" — verification is the binding constraint, not reasoning capacity.

## Local Verifiers
- Can the output be checked by a cheaper-than-the-generator process? If no → don't automate.
- Is there a formal oracle (compiler, theorem prover, unit test, ground-truth dataset)? If yes → automation is feasible at near-arbitrary quality.
- Would a human expert need >1 hour to verify a single output? If yes → automation produces liability, not efficiency.

## Failure Handling
If the task is valuable but unverifiable, either (a) narrow the task until a sub-task becomes verifiable, or (b) invest in a domain-specific verifier before investing in a better generator. Building a better generator against an unverifiable loss optimizes for the wrong thing.

## Anti-exemplars
- Trusting a model's legal analysis because it passes a bar-exam benchmark (bar exam is verifiable; open-ended legal judgment is not).
- Deploying an agent for "writing good research papers" without a verifier — the loss function is ill-defined, so there's no training target.
- Deploying coding agents inside CI/CD — *does* pass this gate because tests are the verifier.
