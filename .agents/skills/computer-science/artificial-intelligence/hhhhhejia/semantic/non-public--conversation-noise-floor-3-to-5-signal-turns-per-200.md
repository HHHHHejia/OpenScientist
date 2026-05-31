---
name: "Conversation Noise Floor 3 To 5 Signal Turns Per 200"
memory_type: semantic
subtype: non-public
domain: computer-science
subdomain: artificial-intelligence
contributor: HHHHHejia
---
## Fact
Working estimate from in-session synthesis: in a PhD researcher's conversation log with an AI, only roughly **3–5 out of 200 turns** contain a genuine research decision point (a moment of direction change, rejected alternative, or un-stuck transition). The rest — ~95%+ — is formatting, grammar, citation lookups, code debugging, and noise. This sets a signal density of ~1.5–2.5% and implies any skill-extraction pipeline needs a filter with that signal-to-noise assumption baked in, not a uniform sampler.

## Evidence
Synthesized during the research-skills-extraction-system design conversation (April 2026). Based on reasoning about typical PhD-AI interaction patterns; not an empirical measurement.

## Expiry Signal
Empirical measurement on a real corpus could revise the estimate substantially. Also: as researchers use AI for more strategic decisions (vs just text editing), the signal density should rise. Reassess if AI becomes a primary research collaborator rather than a writing assistant.
