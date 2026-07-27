param(
    [Parameter(Mandatory = $true)]
    [string]$Topic,

    [ValidateSet('Core Interview Readiness', 'Broad Concept Coverage')]
    [string]$Mode = 'Core Interview Readiness',

    [ValidateSet('low', 'medium', 'high')]
    [string]$Energy = 'low',

    [string]$Date = (Get-Date).ToString('yyyy-MM-dd')
)

$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$sessionsDir = Join-Path $root 'sessions'
$slug = ($Topic.ToLowerInvariant() -replace '[^a-z0-9]+', '-' -replace '(^-|-$)', '')
$path = Join-Path $sessionsDir "$Date-$slug.md"

if (Test-Path -LiteralPath $path) {
    throw "Session already exists: $path"
}

$content = @"
# Session: $Date - $Topic

````yaml
date: $Date
mode: $Mode
topic: $Topic
energy: $Energy
status: attempted
revision_done: false
quality_score: 0
readiness_delta: 0
tags:
  - todo
````

## Revision

Core topics revised for 5-10 minutes:
- 

## Teaching Notes

What was taught:
- 

## Grill

Questions asked:
1. 

Answers given:
- 

## Score

Quality score: 0/5

What worked:
- 

Weak spots:
- 

## Next Actions

- 

## Commit

Committed: no
"@

Set-Content -LiteralPath $path -Value $content -Encoding UTF8
Write-Output $path
