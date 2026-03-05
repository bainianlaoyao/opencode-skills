# L1 Index (Always Read First)

Rule: this file is index-only (links + keywords + routing). No detailed rules.

Location: create this knowledge base in the project at `.codex/knowledge-shifu/docs/` (preferred) or `.opencode/knowledge-shifu/docs/` (fallback).

Purpose: route to the smallest set of documents needed for a task.

## Domains (pick 1)

- Build / test / dev environment -> `L2/build-test.md`
- Architecture / module boundaries -> `L2/architecture.md`
- Coding conventions / style rules -> `L2/conventions.md`
- Auth / security model -> `L2/auth.md`
- API contracts / error handling -> `L2/api-contracts.md`
- Knowledge base lifecycle (create/update/refactor) -> `L2/knowledge-base.md`

## Keywords -> Domain

- "where is" / "source of truth" -> start with the most likely domain guide and look for its "Source of truth" section.
- "rules" / "conventions" -> `L2/conventions.md`
- "how does auth work" -> `L2/auth.md`
- "error handling" / "status code" -> `L2/api-contracts.md`
- "create knowledge base" / "update docs" / "refactor knowledge base" -> `L2/knowledge-base.md`
