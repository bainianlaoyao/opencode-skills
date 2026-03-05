[CmdletBinding()]
param(
    [string]$CodexHome = $(if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME ".codex" }),
    [string[]]$Skills = @("knowledge-shifu", "codex-plan-executor")
)

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $repoRoot "skills"
$destinationRoot = Join-Path $CodexHome "skills"

if (-not (Test-Path $sourceRoot)) {
    throw "Source skill directory not found: $sourceRoot"
}

New-Item -ItemType Directory -Force -Path $destinationRoot | Out-Null

foreach ($skill in $Skills) {
    $sourcePath = Join-Path $sourceRoot $skill
    $skillFile = Join-Path $sourcePath "SKILL.md"
    if (-not (Test-Path $skillFile)) {
        throw "Invalid skill '$skill': missing SKILL.md at $skillFile"
    }

    $destinationPath = Join-Path $destinationRoot $skill
    if (Test-Path $destinationPath) {
        Remove-Item $destinationPath -Force -Recurse
    }

    Copy-Item $sourcePath $destinationPath -Recurse
    Write-Host "Installed $skill -> $destinationPath"
}

Write-Host "Done. Restart Codex to pick up new skills."
