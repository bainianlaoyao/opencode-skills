# Codex Plan Execution Prompt Template

Use this template to build the prompt passed to `codex exec`.

---

You are executing a written implementation plan in this repository.

Plan file (absolute path): `<PLAN_PATH>`

## Required skill usage

1. Use `superpowers:executing-plans` for task discipline, but do not wait for checkpoints; execute all batches consecutively unless BLOCKED.
2. Follow `superpowers:test-driven-development` for implementation tasks.
3. Do not push, merge, create PRs, or rewrite git history in this run. If a human decision is required, report `BLOCKED`.

## Execution mode

- Execute the full plan end-to-end in this run.
- Do not pause for intermediate approval.
- Respect repository conventions and safety constraints.

## Verification requirements

- Run all relevant tests for changed areas.
- Run typecheck/build/lint when applicable.
- Include command outputs in your final report.
- If any required verification fails, you are BLOCKED and must include failing command output.

## Blocker protocol

If blocked, stop and report exactly:

Your final message must start with `BLOCKED:` on the first line (no preamble).

BLOCKED: <one-line reason>
NEEDED: <explicit decision or missing input>
CONTEXT: <evidence with files/commands>

Do not guess missing product or policy decisions.

## Completion report format

If completed, report exactly:

Your final message must start with `COMPLETED` on the first line (no preamble).

COMPLETED
CHANGES: <files and high-level changes>
VERIFICATION: <commands and pass/fail>
RISKS: <remaining concerns or NONE>
