---
name: knowledge-shifu
description: Use when the user asks for project-specific knowledge (architecture, conventions, workflows, "where is X", or "how does X work") and the project has lots of docs; apply progressive disclosure to load only the minimum needed context.
---

# Knowledge Shifu

## Core Rule (Progressive Disclosure)

- Always start at `docs/L1-index.md`.
- Then load at most **2** files from `docs/L2/`.
- Load `docs/L3/` only if an L2 doc explicitly points to a specific L3 file.
- Never read or summarize the entire docs tree.

## Operating Procedure

1. Read `docs/L1-index.md` to identify the most relevant domain.
2. Read 1-2 matching domain guides in `docs/L2/`.
3. If needed, follow explicit L2 links into `docs/L3/`.
4. Answer using only what you verified from loaded docs; if the docs don't say it, say what is missing and what you would read next.

## Knowledge Base Lifecycle (Create / Update / Refactor)

- If the user asks to create a knowledge base from scratch, update it after changes, or refactor bloat/contradictions, follow `docs/L2/knowledge-base.md`.
- Keep `docs/L1-index.md` index-only: links + keywords + routing, no detailed rules.

## Pressure Handling

- If asked to go fast: still do step 1 + read **one** L2 guide before acting.
- If the request is broad/ambiguous: scope it by selecting the smallest domain(s) from L1, not by expanding reading.

## Stop Conditions

- Stop reading as soon as you can answer: (a) where the source of truth is, and (b) the rules/constraints.
- If you cannot answer after 2 L2 docs: list the next single doc you would load (by exact path) and why.

## Common Mistakes

- Reading many docs "just in case".
- Making claims that aren't in the loaded docs.
- Duplicating detailed rules into `docs/L1-index.md` instead of linking.
