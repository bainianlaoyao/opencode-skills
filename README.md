# opencode-skills

This repository stores OpenCode/Agent Skills.

## Skills

- `skills/knowledge-shifu/` - Progressive-disclosure project knowledge router with its own `docs/` (L1/L2/L3).

## Installation (OpenCode)

Reference style: follows the Superpowers OpenCode install flow (clone -> link into `~/.config/opencode/skills` -> restart).

### Quick Install

Tell OpenCode:

```text
Clone https://github.com/bainianlaoyao/opencode-skills to ~/.config/opencode/opencode-skills, then create ~/.config/opencode/skills if missing, then symlink ~/.config/opencode/opencode-skills/skills/knowledge-shifu to ~/.config/opencode/skills/knowledge-shifu, then restart opencode.
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

# 3) Recreate link
rm -rf ~/.config/opencode/skills/knowledge-shifu
ln -s ~/.config/opencode/opencode-skills/skills/knowledge-shifu ~/.config/opencode/skills/knowledge-shifu

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

:: 3) Recreate junction (works without symlink privilege)
rmdir "%USERPROFILE%\.config\opencode\skills\knowledge-shifu" 2>nul
mklink /J "%USERPROFILE%\.config\opencode\skills\knowledge-shifu" "%USERPROFILE%\.config\opencode\opencode-skills\skills\knowledge-shifu"

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

# 3) Recreate junction
Remove-Item "$env:USERPROFILE\.config\opencode\skills\knowledge-shifu" -Force -Recurse -ErrorAction SilentlyContinue
New-Item -ItemType Junction -Path "$env:USERPROFILE\.config\opencode\skills\knowledge-shifu" -Target "$env:USERPROFILE\.config\opencode\opencode-skills\skills\knowledge-shifu" | Out-Null

# 4) Restart OpenCode
```

## Per-Project Knowledge Base (Required)

`knowledge-shifu` is installed globally, but each project should own its own KB under `.opencode/knowledge-shifu/docs/`.

### Initialize in a project

#### macOS / Linux

```bash
mkdir -p .opencode/knowledge-shifu
cp -R ~/.config/opencode/opencode-skills/skills/knowledge-shifu/docs .opencode/knowledge-shifu/
```

#### Windows (Command Prompt)

```cmd
mkdir ".opencode\knowledge-shifu" 2>nul
robocopy "%USERPROFILE%\.config\opencode\opencode-skills\skills\knowledge-shifu\docs" ".opencode\knowledge-shifu\docs" /E >nul
```

### Verify

#### macOS / Linux

```bash
ls -l ~/.config/opencode/skills/knowledge-shifu
ls -R .opencode/knowledge-shifu/docs
```

#### Windows (Command Prompt)

```cmd
dir /AL "%USERPROFILE%\.config\opencode\skills"
dir /S ".opencode\knowledge-shifu\docs"
```
