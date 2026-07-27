param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$outputPath = Join-Path $Root 'llm-context.md'
$contextFiles = @(
    'context\PROFILE.md',
    'context\recovered-interview-prep-tracker.md',
    'context\interview-prep-nextalphaai-bairesdev.md',
    'context\LEAN_TRACK.md'
)

function Add-FileSection {
    param(
        [System.Text.StringBuilder]$Builder,
        [string]$Path,
        [string]$Label,
        [string]$Root
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        [void]$Builder.AppendLine("## Missing: $Label")
        [void]$Builder.AppendLine()
        [void]$Builder.AppendLine('Expected path: `' + $Path + '`')
        [void]$Builder.AppendLine()
        return
    }

    $content = Get-Content -LiteralPath $Path -Raw
    $source = $Path
    if ($Path.StartsWith($Root)) {
        $source = $Path.Substring($Root.Length).TrimStart('\', '/').Replace('\', '/')
    }
    [void]$Builder.AppendLine("## $Label")
    [void]$Builder.AppendLine()
    [void]$Builder.AppendLine('Source: `' + $source + '`')
    [void]$Builder.AppendLine()
    [void]$Builder.AppendLine($content.Trim())
    [void]$Builder.AppendLine()
}

$builder = [System.Text.StringBuilder]::new()
[void]$builder.AppendLine("# LLM Context Bundle")
[void]$builder.AppendLine()
[void]$builder.AppendLine("Generated: $(Get-Date -Format s)")
[void]$builder.AppendLine()
[void]$builder.AppendLine("Purpose: single startup context file for LLM-run interview-prep sessions.")
[void]$builder.AppendLine()

Add-FileSection -Builder $builder -Path (Join-Path $Root 'LLM_SESSION_PROTOCOL.md') -Label 'LLM Session Protocol' -Root $Root
Add-FileSection -Builder $builder -Path (Join-Path $Root 'LLM_HANDOFF.md') -Label 'LLM Handoff' -Root $Root
Add-FileSection -Builder $builder -Path (Join-Path $Root 'README.md') -Label 'Repo README' -Root $Root
Add-FileSection -Builder $builder -Path (Join-Path $Root 'SYLLABUS.md') -Label 'Syllabus' -Root $Root
Add-FileSection -Builder $builder -Path (Join-Path $Root 'SESSION_TEMPLATE.md') -Label 'Session Template' -Root $Root

foreach ($file in (Get-ChildItem -LiteralPath (Join-Path $Root 'topics') -File -Filter '*.md' | Sort-Object Name)) {
    Add-FileSection -Builder $builder -Path $file.FullName -Label "Topic: $($file.BaseName)" -Root $Root
}

foreach ($relativePath in $contextFiles) {
    $path = Join-Path $Root $relativePath
    Add-FileSection -Builder $builder -Path $path -Label "Portable Context: $([System.IO.Path]::GetFileName($path))" -Root $Root
}

$sessions = @(Get-ChildItem -LiteralPath (Join-Path $Root 'sessions') -File -Filter '*.md' | Sort-Object Name)
foreach ($file in $sessions) {
    Add-FileSection -Builder $builder -Path $file.FullName -Label "Session: $($file.BaseName)" -Root $Root
}

Set-Content -LiteralPath $outputPath -Value $builder.ToString() -Encoding UTF8
Write-Output "Generated $outputPath"
