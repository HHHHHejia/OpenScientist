param(
  [Parameter(Position = 0)]
  [string]$Source,

  [string]$Out,
  [string]$Domain = "computer-science",
  [string]$Subdomain = "artificial-intelligence",
  [string]$Contributor = $env:USERNAME,
  [int]$MaxBytes = 200000,
  [string]$ValidateDir,
  [switch]$Help
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Show-Usage {
  @"
Usage:
  .\researchskills-extract.ps1 <source-file-or-dir> [options]

Options:
  -Out <dir>             Output directory for bundle/prompt.
  -Domain <slug>         Target ResearchSkills domain.
  -Subdomain <slug>      Target ResearchSkills subdomain.
  -Contributor <handle>  Public contributor handle.
  -MaxBytes <n>          Max bytes copied into source-bundle.md. Default: 200000.
  -ValidateDir <dir>     Validate existing generated .md files under this repo path.
  -Help                  Show this help.

This helper does not call an LLM and does not install commands. It prepares a
bounded source bundle and a high-signal extraction prompt for the agent.
"@
}

if ($Help) {
  Show-Usage
  exit 0
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir "../../../..")
$Validator = Join-Path $RepoRoot "utils/tools/validate.py"

if ($ValidateDir) {
  if (-not (Test-Path $Validator)) {
    throw "validator not found: $Validator"
  }
  $files = Get-ChildItem -Path $ValidateDir -Recurse -File -Filter "*.md" | ForEach-Object { $_.FullName }
  if (-not $files -or $files.Count -eq 0) {
    throw "no markdown files found under $ValidateDir"
  }
  & python $Validator @files
}

if (-not $Source) {
  Show-Usage
  exit 2
}
if (-not (Test-Path $Source)) {
  throw "source not found: $Source"
}
if (-not $Contributor) {
  $Contributor = "anonymous"
}

if (-not $Out) {
  $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
  $Out = Join-Path $RepoRoot ".researchskills-extract/$stamp"
}
New-Item -ItemType Directory -Force -Path $Out | Out-Null

$Manifest = Join-Path $Out "source-manifest.tsv"
$Bundle = Join-Path $Out "source-bundle.md"
$Prompt = Join-Path $Out "extraction-prompt.md"

"path`tbytes" | Set-Content -Path $Manifest -Encoding utf8
@"
# ResearchSkills Source Bundle

Source: $Source
Generated: $((Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ"))
Byte limit: $MaxBytes

"@ | Set-Content -Path $Bundle -Encoding utf8

function Test-TextCandidate([string]$Path) {
  $ext = [IO.Path]::GetExtension($Path).ToLowerInvariant()
  return @(".md", ".markdown", ".txt", ".json", ".jsonl", ".yaml", ".yml", ".csv", ".tsv", ".log").Contains($ext)
}

function Append-SourceFile([string]$Path) {
  if (-not (Test-Path $Path -PathType Leaf)) { return }
  if (-not (Test-TextCandidate $Path)) { return }

  $size = (Get-Item $Path).Length
  $current = (Get-Item $Bundle).Length
  if (($current + $size) -gt $MaxBytes) {
    "$Path`t$size`tSKIPPED_LIMIT" | Add-Content -Path $Manifest -Encoding utf8
    return
  }

  "$Path`t$size" | Add-Content -Path $Manifest -Encoding utf8
  $text = Get-Content -Raw -Path $Path
  $text = $text -replace "```", "` ` `"
  @"


## File: $Path

``````text
$text
``````
"@ | Add-Content -Path $Bundle -Encoding utf8
}

if (Test-Path $Source -PathType Leaf) {
  Append-SourceFile (Resolve-Path $Source)
} else {
  $skipDirs = @(".git", "node_modules", ".venv", "venv", "dist", "build", "__pycache__", ".researchskills-extract")
  Get-ChildItem -Path $Source -Recurse -File |
    Where-Object {
      $parts = $_.FullName -split [regex]::Escape([IO.Path]::DirectorySeparatorChar)
      -not ($parts | Where-Object { $skipDirs -contains $_ })
    } |
    Sort-Object FullName |
    ForEach-Object { Append-SourceFile $_.FullName }
}

$bundleText = Get-Content -Raw -Path $Bundle
@"
# ResearchSkills Extraction Prompt

Use the ResearchSkills meta skill to extract reusable research know-how from
the source bundle below. Write output files directly under:

``.agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md``

Default metadata:

- domain: ``$Domain``
- subdomain: ``$Subdomain``
- contributor: ``$Contributor``

Quality gate:

1. Extract only research know-how: scientific methodology, domain facts,
   computational science methods, research design, evaluation strategy, or
   concrete scientific episodes.
2. Reject pure engineering, package-manager, git, auth, deployment, UI, or
   generic coding lessons unless they directly constrain the research method.
3. One skill file equals one reusable insight.
4. De-identify private paths, usernames, project names, private URLs, and
   collaborator names. Preserve scientific methods, model names, datasets,
   parameters, and mechanisms.
5. Prefer 0 high-quality skills over broad low-value skills.

Memory types:

- procedural: ``tie``, ``no-change``, ``constraint-failure``, ``operator-fail``
- semantic: ``frontier``, ``non-public``, ``correction``
- episodic: ``failure``, ``adaptation``, ``anomalous``

Validation:

``````bash
python utils/tools/validate.py .agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/<subtype>--<skill-name>.md
``````

After extraction, summarize:

- files created
- candidates rejected and why
- validation command/result

---

$bundleText
"@ | Set-Content -Path $Prompt -Encoding utf8

@"
ResearchSkills extraction helper complete.

Output directory: $Out
Manifest:         $Manifest
Source bundle:    $Bundle
Prompt:           $Prompt

Next:
  1. Read $Prompt.
  2. Create ResearchSkills files under .agents/skills/.
  3. Validate with: python utils/tools/validate.py <generated-skill.md>
"@
