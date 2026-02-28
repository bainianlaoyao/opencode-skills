# L2 Knowledge Base Lifecycle (Create / Update / Refactor)

## Scope

Use for: creating the L1/L2/L3 knowledge base, updating it after code changes, and refactoring it when it becomes messy.

## Create (Bootstrap)

1. Create `docs/L1-index.md` with only: domains list + keyword routing + links to L2.
2. Create `docs/L2/<domain>.md` for the smallest set of domains you actually need (start with 3-5, not 20).
3. Create `docs/L3/README.md` and add L3 deep references only when an L2 guide explicitly points to them.

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

**Anti-bloat guardrails:**

- Never paste L3 details into L1.
- Prefer linking rather than duplicating.
- If multiple domains are affected, update the single most relevant L2 and link out to L3.

## Refactor (Fix Bloat / Duplication / Contradictions)

1. Scan L1 for duplicated rules: move details out of L1 into the correct L2/L3 and replace with links.
2. For contradictions between L2 docs, resolve by selecting a single source of truth (prefer L3 spec), then update both L2 docs to point to it.
3. Remove duplicate guidance across L2 by keeping one canonical L2 and making others link to it.
4. Keep routing stable: L1 should only change when domains/keywords change.
