---
name: claim-level-paper-chat-diffing-reveals-tacit-decisions
memory_type: procedural
subtype: tie
domain: computer-science
subdomain: software-engineering
contributor: anon-b34ee36c
source:
  type: session
  session_id: bfafe2a8-ae36-43c3-9b2b-7a7c0c0c5857
extracted_at: 2026-04-13
tags: [tacit-knowledge-capture, research-methodology, decision-archaeology, paper-chat-alignment]
---

## When

You are designing a system to extract tacit research knowledge from researcher-AI conversations and need to decide **at what granularity to align published papers with chat transcripts**.

### Exclusions

- Do NOT use this when you only have chat logs (no paper anchor)
- Do NOT use this when the paper and chats are months/years apart (alignment signal too weak)
- Do NOT use this when you want to extract generic coding skills (not research-specific)

## Decision

### Preferred: Claim-level diffing

1. **Extract 5-15 atomic claims** from the paper (using full text if available, e.g., arXiv)
2. **For each claim**, scan chat history for:
   - Discussions leading to that claim
   - Alternative approaches considered but rejected
   - Failed experiments not mentioned in paper
   - Judgment calls made during exploration
3. **Flag mismatches**:
   - Claim appears in paper but no chat evidence → likely imported knowledge or trivial
   - Extensive chat discussion but claim absent/minimized in paper → **tacit decision point**
4. **Extract the delta** as a decision node: "Considered X, chose Y instead because Z" (Z often never written down)

### Rejected: Paragraph-level or section-level diffing

- **Too coarse**: Misses fine-grained judgment calls within a section
- **High false negatives**: A single sentence in a paper may hide weeks of探索

### Rejected: Sentence-level or phrase-level diffing

- **Too brittle**: Paraphrasing breaks alignment
- **Too noisy**: Not all sentences are claims worth tracking

### Reasoning

Published papers are **compressed narratives** that erase:
- Dead ends
- Tie-breaking heuristics when multiple methods seemed viable
- Contextual constraints that made a "worse" method actually correct for this case

**Claims are the right unit** because:
- Semantically stable (survive paraphrasing)
- Correspond to **actual research decisions** (not just implementation details)
- 5-15 claims cover a paper without overwhelming annotators

## Local Verifiers

- ✅ If extraction surfaces "considered A vs B, chose B" patterns not in paper → working
- ✅ If researchers confirm "yes, I forgot I tried that" during review → high signal
- ❌ If most claims have 1:1 chat matches with no alternatives → too shallow, adjust claim extraction prompt

## Failure Handling

**If claims are too abstract** (e.g., "We improve X"):
- Retry extraction with prompt: "Break this into 3-5 falsifiable sub-claims"

**If no chat discussions found for a claim**:
- Check if claim is trivial/assumed background
- OR: Researcher may have done this work elsewhere (email, whiteboard, prior project) — flag for user interview

**If chat has rich discussion but claim not in paper**:
- High-value capture target: "Why was this explored but not published?"
- Common answers: "Didn't work well enough" / "Out of scope" / "Forgot to mention" ← all valuable negative results

## Anti-exemplars

❌ "Diff the entire paper text against chat transcript and extract anything not mentioned"
- Result: Floods with introduction/related work (not research decisions)

❌ "Only extract things explicitly marked 'TODO' or 'FIXME' in chat"
- Misses implicit decisions ("let's just use method B" without saying "we reject A")

❌ "Ask LLM to summarize what the paper is about, then what the chat is about, then compare"
- Loses causal structure: WHEN was the decision made, WHAT was considered, WHY was it rejected

