---
name: knowledge-shifu
description: Use when the user asks project-specific questions ("where is X", "how does X work", architecture, conventions, workflows) and the project has lots of docs.
---

# Knowledge Shifu

## Contract

- Start at `.opencode/knowledge-shifu/docs/L1-index.md`.
- Pick L2 files only via links in `.opencode/knowledge-shifu/docs/L1-index.md`.
- Read 1-2 files in `.opencode/knowledge-shifu/docs/L2/` (max 2 total).
- Read `.opencode/knowledge-shifu/docs/L3/<topic>.md` only when an L2 guide links to that exact file.
- Never scan, read, or summarize the entire docs tree.
- Stop as soon as you can point to the source of truth + the relevant rules/constraints.

## Workflow

1. Read `.opencode/knowledge-shifu/docs/L1-index.md` and pick the smallest matching domain.
2. Read up to 2 L2 guides from `.opencode/knowledge-shifu/docs/L2/`.
3. Only if an L2 guide links to an L3 path, read that exact `.opencode/knowledge-shifu/docs/L3/<topic>.md`.
4. Answer only from what you loaded. If missing, name the next single doc path you would load and why.

## Fast / Ambiguous Requests

- Fast: still read `.opencode/knowledge-shifu/docs/L1-index.md` + 1 L2 before acting.
- Ambiguous: reduce scope via L1 domain selection; do not expand reading.

## Knowledge Base Maintenance

- Create/update/refactor the project knowledge base: follow `.opencode/knowledge-shifu/docs/L2/knowledge-base.md`.
- Keep `.opencode/knowledge-shifu/docs/L1-index.md` index-only (routing only; no detailed rules).
- Write KB docs in the project directory under `.opencode/knowledge-shifu/docs/` (not inside the global skill installation).
- Do not invent KB paths.

## Common Mistakes

- Over-reading "just in case".
- Stating rules not present in the loaded docs.
- Copying L2/L3 details into `.opencode/knowledge-shifu/docs/L1-index.md`.
