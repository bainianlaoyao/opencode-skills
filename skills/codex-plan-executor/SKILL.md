---
name: codex-plan-executor
description: Use when an orchestrator has a written implementation plan and wants OpenAI Codex CLI to execute the full plan autonomously, then perform top-level review and escalate blockers.
---

# Codex Plan Executor

## Overview

This skill teaches an orchestrator how to run one end-to-end Codex execution for a plan, then review results at the top level.

**Core principle:** Delegate implementation to Codex in one full-plan run, but keep final acceptance decisions in the orchestrator.

**Announce at start:** "I'm using the codex-plan-executor skill to run Codex on the full plan, then review at the top level."

Do not re-implement plan execution logic in this skill.
Codex should use **superpowers:executing-plans** directly.

## When to Use

Use this skill when:
- You already have a written implementation plan file.
- You want Codex to execute the whole plan without per-task orchestration.
- You want a final orchestrator review after Codex finishes.
- You need explicit blocker escalation to the user.

Do not use this skill when:
- The task is trivial (single-file, tiny edit).
- You need mandatory checkpoint approval between each plan batch.
- Codex CLI is unavailable in the environment.

## Required Inputs

- Absolute `plan_path` (markdown plan file)
- `worktree_path` where changes should happen
- Codex CLI installed and authenticated

Validation requirement:
- Confirm `plan_path` is absolute before execution.

**REQUIRED SUB-SKILL:** Use superpowers:using-git-worktrees before running Codex.

## Execution Flow

1. Validate prerequisites.
2. Build Codex prompt from `codex-plan-prompt-template.md`.
3. Run `codex exec --full-auto` once for the full plan.
4. Collect Codex final message and JSONL event log.
5. If blocked, escalate to user (do not guess).
6. If completed, perform top-level review and verification.

## Quick Reference

### Launch full-plan execution (Bash)

```bash
codex exec --full-auto --json -C "<worktree_path>" \
  --output-last-message "<artifacts_dir>/final-message.txt" \
  - < "<prompt_file>" > "<artifacts_dir>/events.jsonl"
```

### Launch full-plan execution (PowerShell)

```powershell
$prompt = Get-Content -Raw "<prompt_file>"
$prompt | codex exec --full-auto --json -C "<worktree_path>" `
  --output-last-message "<artifacts_dir>/final-message.txt" `
  - | Out-File -Encoding utf8 "<artifacts_dir>/events.jsonl"
```

### Resume the same Codex thread

```bash
echo "Apply only the requested fixes and re-run verification." \
  | codex exec resume --last

# or explicit thread id
codex exec resume <thread_id> "Apply only the requested fixes and re-run verification."
```

### Non-git working folder (rare)

```bash
codex exec --full-auto --skip-git-repo-check -C "<folder>" "<prompt>"
```

## Prompting Pattern

Use `codex-plan-prompt-template.md` and fill placeholders.

Prompt must include:
- Exact plan path
- Instruction to use `superpowers:executing-plans`
- Instruction to run full plan before returning
- Instruction to report blocker as `BLOCKED:` with exact missing decision
- Instruction to run relevant verification before final output

## Top-Level Review Contract

After Codex returns `COMPLETED`, the orchestrator must:
- Review changed files and diffs
- Run local verification (tests, typecheck, build, lint as applicable)
- Confirm no policy violations
- Decide: accept, request fixes via `codex exec resume`, or escalate to user

Never accept solely based on Codex self-report.

## Blocker Handling

If Codex reports a blocker:
- Stop autonomous execution.
- Surface blocker to user with exact missing information.
- Do not invent product decisions.
- Continue only after user resolves the blocker.

Preferred blocker format to enforce in prompt:

```text
BLOCKED: <one-line reason>
NEEDED: <explicit decision or input>
CONTEXT: <file/path/command evidence>
```

## Common Mistakes

- Using relative `plan_path` that resolves in the wrong directory
- Forgetting `-C <worktree_path>` and executing in the wrong repo
- Recreating executing-plans logic in the orchestrator prompt
- Treating warnings as success without independent verification
- Auto-answering Codex blockers without user confirmation

## Minimal End-to-End Example

```bash
# 1) Prepare prompt file from template
# 2) Execute once
codex exec --full-auto --json -C "D:/repo/worktrees/feature-a" \
  --output-last-message "D:/repo/artifacts/final-message.txt" \
  - < "D:/repo/artifacts/codex-prompt.txt" \
  > "D:/repo/artifacts/events.jsonl"

# 3) If final-message starts with BLOCKED:, escalate to user
# 4) Else run top-level review commands in orchestrator
```

```powershell
# 1) Prepare prompt file from template
$prompt = Get-Content -Raw "D:/repo/artifacts/codex-prompt.txt"

# 2) Execute once
$prompt | codex exec --full-auto --json -C "D:/repo/worktrees/feature-a" `
  --output-last-message "D:/repo/artifacts/final-message.txt" `
  - | Out-File -Encoding utf8 "D:/repo/artifacts/events.jsonl"

# 3) If final-message starts with BLOCKED:, escalate to user
# 4) Else run top-level review commands in orchestrator
```

## Integration

**Required workflow skills:**
- **superpowers:using-git-worktrees** - REQUIRED: set up isolated workspace before running Codex.
- **superpowers:writing-plans** - creates the plan this skill executes.
- **superpowers:executing-plans** - executed by Codex; do not re-implement it here.
- **superpowers:finishing-a-development-branch** - used by Codex when plan completion requires branch wrap-up.
