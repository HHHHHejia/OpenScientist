---
name: base-model-empty-responses-from-chat-format-prompts
memory_type: episodic
subtype: anomalous
domain: computer-science
subdomain: artificial-intelligence
contributor: tanzelin430
source:
  type: session
  session_id: d8db9d3e-59ee-4386-bfe3-5e4dc4220fa4
extracted_at: 2026-04-19
tags: [evaluation, benchmark, base-model, prompt-format, HumanEval, coding]
---

## Situation
Evaluating a 14B base (pre-instruction-tuned) model on a coding benchmark using the same eval pipeline built for trained models. Expected modest but nonzero coding performance; the same pipeline worked fine for smaller base models.

## Action
Ran inference and scored outputs. Observed anomalously low accuracy (~5–10% vs expected ~30%+). Inspected raw generations and found the majority were completely empty — the model was immediately emitting EOS without generating any tokens.

## Outcome
Root cause: the eval pipeline serialized chat-format messages as a JSON string literal (e.g., `[{'content': 'Write a function...'}]`) and passed that string directly as the prompt. Instruction-tuned models parse this correctly because they've seen chat templates during fine-tuning. Base models have no such training and treat the JSON syntax as an arbitrary continuation task — when the continuation has low probability under their distribution, they emit EOS.

Math benchmarks in the same pipeline were unaffected because their prompts were plain natural-language strings with no serialization layer.

## Lesson
When a base model returns anomalously low benchmark scores (especially on tasks it should partially handle), check whether the eval pipeline introduces a format that was only ever seen by fine-tuned models. Empty/zero-length outputs at high rate are a diagnostic signal for prompt-format incompatibility, not capability failure. Verify by inspecting raw generations, not just accuracy numbers.

Downstream decision: if training evaluations already use the wrapped format, keep base-model evals wrapped too so accuracy deltas (base → trained) remain internally consistent, even though absolute base numbers are underestimated.

## Retrieval Cues
- Base model scores near zero on a benchmark where fine-tuned variant performs well
- High fraction of empty responses in base model outputs
- Eval pipeline shared between base and fine-tuned models
- Coding benchmarks (HumanEval, similar) with instruction-style prompts

