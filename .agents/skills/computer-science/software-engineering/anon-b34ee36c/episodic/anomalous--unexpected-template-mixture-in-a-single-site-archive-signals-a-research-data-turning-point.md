---
name: unexpected-template-mixture-in-a-single-site-archive-signals-a-research-data-turning-point
memory_type: episodic
subtype: anomalous
domain: computer-science
subdomain: software-engineering
contributor: anon-b34ee36c
source:
  type: session
  session_id: 019d3b6c-4052-73d2-9a4d-cd978d5409d5
extracted_at: 2026-04-13
tags: ["\"template-drift\"", "\"web-corpora\"", "\"data-anomalies\"", "\"case-based-reasoning\"", "\"corpus-audit\""]
---

## Situation
A decade-spanning archive from one source was initially treated as if it contained one uniform case-page template suitable for direct structured extraction.

## Action
The corpus was sampled for field anchors and page structure rather than only filename patterns. This exposed multiple page families, including standard success stories, older historical pages, roundup posts, announcements, and other non-case content.

## Outcome
The extraction plan was reorganized around page classification first, then template-specific extraction, with the standard success-story subset becoming the main research lane.

## Lesson
On long-lived websites, same-domain provenance is not evidence of schema homogeneity. A small structural audit can prevent a major validity error in downstream analysis.

## Retrieval Cues
- A corpus spans many years from one publisher.
- Early extraction works on some pages but fails strangely on others.
- Mixed signals appear between labeled fields and narrative content.

