# L2 Knowledge Base Lifecycle (Create / Update / Refactor)

## Scope

Use for: creating the L1/L2/L3 knowledge base, updating it after code changes, and refactoring it when it becomes messy.

## Canonical Files (This Skill)

Use the existing set unless you are explicitly creating a new domain:

- L1: `docs/L1-index.md`
- L2: `docs/L2/build-test.md`, `docs/L2/architecture.md`, `docs/L2/conventions.md`, `docs/L2/auth.md`, `docs/L2/api-contracts.md`, `docs/L2/knowledge-base.md`
- L3: `docs/L3/README.md` plus optional deep refs like `docs/L3/<topic>.md` (flat)

Rule: do not reference additional `docs/L2/*.md` paths unless you also create them and add them to `docs/L1-index.md`.

## Linking Rules (Exact)

- L1 (`docs/L1-index.md`) -> L2: use `docs/L2/<name>.md` as link text and keep it in Domains/Keywords.
- L2 (`docs/L2/*.md`) -> L3: use `../L3/<topic>.md` (L3 is a sibling directory).
- L1 -> L3: avoid by default; only add a keyword route to an L2, not a deep link.

## Forbidden Patterns

- Mentioning non-existent files like `docs/L2/code-organization.md` unless you create them and update `docs/L1-index.md`.
- Creating `docs/L3/<dir>/...` subdirectories by default. Prefer flat `docs/L3/<topic>.md`.
- Adding detailed rules into `docs/L1-index.md` (it is routing only).

## Create (Bootstrap)

0. Scope: this knowledge base lives inside this Skill's `docs/` only.
1. Create (or confirm) `docs/L1-index.md` with only: domains list + keyword routing + links to L2.
2. Create (or confirm) `docs/L2/knowledge-base.md` (this file) and keep it as the authoritative placement rules.
3. Confirm the canonical L2 files listed in "Canonical Files (This Skill)" exist; only add a new L2 domain if it will be reused.
4. Create (or confirm) `docs/L3/README.md`.
5. Add L3 deep references only when an L2 guide explicitly points to a specific L3 path.

**Placement rules:**

- L1: index-only (no detailed rules), keep it short.
- L2: stable guidance (scope, source of truth, what to extract, when to load L3).
- L3: deep, authoritative references (specs, ADRs, runbooks, FAQs).

## Update (After Implementing a Change)

When you add/change behavior, update docs so future agents can find entry points and constraints quickly.

1. Update `docs/L1-index.md` only if routing needs a new domain or new keywords.
2. Update exactly one relevant L2 domain guide:
   - Add/adjust the "Source of truth" pointer(s)
   - Add new keywords or a short "What to extract" bullet if needed
3. Add or update one L3 doc only when needed for deep reference:
   - L3 should capture invariants, constraints, edge cases, and authoritative specs
4. Ensure L2 contains the explicit link to the L3 file you added/changed.

**Non-negotiables:**

- Do not invent file paths; if you reference a doc, create it at that exact `docs/` path.
- Default L3 layout is flat: `docs/L3/<topic>.md` (avoid new subdirectories unless truly necessary).

**Anti-bloat guardrails:**

- Never paste L3 details into L1.
- Prefer linking rather than duplicating.
- If multiple domains are affected, update the single most relevant L2 and link out to L3.

## Refactor (Fix Bloat / Duplication / Contradictions)

1. Scan L1 for duplicated rules: move details out of L1 into the correct L2/L3 and replace with links.
2. For contradictions between L2 docs, resolve by selecting a single source of truth (prefer L3 spec), then update both L2 docs to point to it.
3. Remove duplicate guidance across L2 by keeping one canonical L2 and making others link to it.
4. Keep routing stable: L1 should only change when domains/keywords change.
