---
name: research-memory-extraction-needs-post-pass-curation
memory_type: episodic
subtype: adaptation
domain: computer-science
subdomain: software-engineering
contributor: anon-b34ee36c
source:
  type: session
  session_id: 5045bb90-b090-4cdb-8b87-65dd59d9c703
extracted_at: 2026-04-13
---

## Situation
An automated extraction pass over scientist-AI session history produced 6 candidate research skills for one project.

## Action
A separate cleanup/finalization pass was run to reject engineering contamination, remove duplicates, and fix de-identification issues before upload.

## Outcome
Only 5 skills survived finalization.

## Lesson
First-pass LLM extraction overcalls. For research-memory capture, a distinct curation stage is necessary even after seemingly successful extraction, because quality failures are often subtle rather than syntactic.

## Retrieval Cues
Use when an agent assumes raw extracted memories are ready to store because the extraction script completed without errors.

