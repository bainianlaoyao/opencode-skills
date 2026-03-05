# opencode-skills

This repository stores OpenCode/Agent Skills.

## Skills

- `skills/knowledge-shifu/` - Progressive-disclosure project knowledge router with its own `docs/` (L1/L2/L3).
- `skills/codex-plan-executor/` - Orchestrator reference for running full-plan autonomous execution via `codex exec` + top-level review.

## Installation (Codex)

Install directly from GitHub using Codex's built-in skill installer script:

### PowerShell

```powershell
$codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { "$HOME/.codex" }
python "$codexHome/skills/.system/skill-installer/scripts/install-skill-from-github.py" `
  --repo bainianlaoyao/opencode-skills `
  --path skills/knowledge-shifu skills/codex-plan-executor
```

### Bash

```bash
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
python "$CODEX_HOME/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo bainianlaoyao/opencode-skills \
  --path skills/knowledge-shifu skills/codex-plan-executor
```

After install, restart Codex to pick up new skills.

### Install from local checkout (PowerShell)

```powershell
.\scripts\install-codex.ps1
```

## Installation (OpenCode)

Reference style: follows the Superpowers OpenCode install flow (clone -> link into `~/.config/opencode/skills` -> restart).

### Quick Install

Tell OpenCode:

```text
Clone https://github.com/bainianlaoyao/opencode-skills to ~/.config/opencode/opencode-skills, then create ~/.config/opencode/skills if missing, then symlink ~/.config/opencode/opencode-skills/skills/knowledge-shifu to ~/.config/opencode/skills/knowledge-shifu, then symlink ~/.config/opencode/opencode-skills/skills/codex-plan-executor to ~/.config/opencode/skills/codex-plan-executor, then restart opencode.
```

### Manual Installation

Prerequisites:
- OpenCode installed
- Git installed

#### macOS / Linux

```bash
# 1) Clone or update
if [ -d ~/.config/opencode/opencode-skills ]; then
  cd ~/.config/opencode/opencode-skills && git pull
else
  git clone https://github.com/bainianlaoyao/opencode-skills.git ~/.config/opencode/opencode-skills
fi

# 2) Ensure skills directory exists
mkdir -p ~/.config/opencode/skills

# 3) Recreate links
rm -rf ~/.config/opencode/skills/knowledge-shifu
ln -s ~/.config/opencode/opencode-skills/skills/knowledge-shifu ~/.config/opencode/skills/knowledge-shifu
rm -rf ~/.config/opencode/skills/codex-plan-executor
ln -s ~/.config/opencode/opencode-skills/skills/codex-plan-executor ~/.config/opencode/skills/codex-plan-executor

# 4) Restart OpenCode
```

#### Windows (Command Prompt)

Run as Administrator, or enable Developer Mode.

```cmd
:: 1) Clone or update
if exist "%USERPROFILE%\.config\opencode\opencode-skills" (
  cd /d "%USERPROFILE%\.config\opencode\opencode-skills" && git pull
) else (
  git clone https://github.com/bainianlaoyao/opencode-skills.git "%USERPROFILE%\.config\opencode\opencode-skills"
)

:: 2) Ensure skills directory exists
mkdir "%USERPROFILE%\.config\opencode\skills" 2>nul

:: 3) Recreate junctions (works without symlink privilege)
rmdir "%USERPROFILE%\.config\opencode\skills\knowledge-shifu" 2>nul
mklink /J "%USERPROFILE%\.config\opencode\skills\knowledge-shifu" "%USERPROFILE%\.config\opencode\opencode-skills\skills\knowledge-shifu"
rmdir "%USERPROFILE%\.config\opencode\skills\codex-plan-executor" 2>nul
mklink /J "%USERPROFILE%\.config\opencode\skills\codex-plan-executor" "%USERPROFILE%\.config\opencode\opencode-skills\skills\codex-plan-executor"

:: 4) Restart OpenCode
```

#### Windows (PowerShell)

```powershell
# 1) Clone or update
if (Test-Path "$env:USERPROFILE\.config\opencode\opencode-skills") {
  Set-Location "$env:USERPROFILE\.config\opencode\opencode-skills"
  git pull
} else {
  git clone https://github.com/bainianlaoyao/opencode-skills.git "$env:USERPROFILE\.config\opencode\opencode-skills"
}

# 2) Ensure skills directory exists
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.config\opencode\skills" | Out-Null

# 3) Recreate junctions
Remove-Item "$env:USERPROFILE\.config\opencode\skills\knowledge-shifu" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -ItemType Junction -Path "$env:USERPROFILE\.config\opencode\skills\knowledge-shifu" -Target "$env:USERPROFILE\.config\opencode\opencode-skills\skills\knowledge-shifu" | Out-Null
Remove-Item "$env:USERPROFILE\.config\opencode\skills\codex-plan-executor" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -ItemType Junction -Path "$env:USERPROFILE\.config\opencode\skills\codex-plan-executor" -Target "$env:USERPROFILE\.config\opencode\opencode-skills\skills\codex-plan-executor" | Out-Null

# 4) Restart OpenCode
```

## Per-Project Knowledge Base (Required)

`knowledge-shifu` is installed globally, but each project should own its own KB under:
- Preferred (Codex): `.codex/knowledge-shifu/docs/`
- Compatible fallback (OpenCode): `.opencode/knowledge-shifu/docs/`

### Initialize in a project

#### macOS / Linux

```bash
mkdir -p .codex/knowledge-shifu
cp -R ~/.config/opencode/opencode-skills/skills/knowledge-shifu/docs .codex/knowledge-shifu/
```

#### Windows (Command Prompt)

```cmd
mkdir ".codex\knowledge-shifu" 2>nul
robocopy "%USERPROFILE%\.config\opencode\opencode-skills\skills\knowledge-shifu\docs" ".codex\knowledge-shifu\docs" /E >nul
```

### Verify

#### macOS / Linux

```bash
ls -l ~/.config/opencode/skills/knowledge-shifu
ls -l ~/.config/opencode/skills/codex-plan-executor
ls -R .codex/knowledge-shifu/docs
```

#### Windows (Command Prompt)

```cmd
dir /AL "%USERPROFILE%\.config\opencode\skills"
dir /S ".codex\knowledge-shifu\docs"
```
