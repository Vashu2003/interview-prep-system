param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$outputPath = Join-Path $Root 'llm-context.md'
$externalFiles = @(
    'C:\Users\Vashu singh\JobSearch\PROFILE.md',
    'C:\Users\Vashu singh\JobSearch\interview-prep-tracker.md',
    'C:\Users\Vashu singh\JobSearch\interview-prep-nextalphaai-bairesdev.md',
    'C:\Users\Vashu singh\Desktop\laptop-migration\Desktop\LEAN_TRACK.md'
)

function Add-FileSection {
    param(
        [System.Text.StringBuilder]$Builder,
        [string]$Path,
        [string]$Label
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        [void]$Builder.AppendLine("## Missing: $Label")
        [void]$Builder.AppendLine()
        [void]$Builder.AppendLine('Expected path: `' + $Path + '`')
        [void]$Builder.AppendLine()
        return
    }

    $content = Get-Content -LiteralPath $Path -Raw
    [void]$Builder.AppendLine("## $Label")
    [void]$Builder.AppendLine()
    [void]$Builder.AppendLine('Source: `' + $Path + '`')
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

Add-FileSection -Builder $builder -Path (Join-Path $Root 'LLM_SESSION_PROTOCOL.md') -Label 'LLM Session Protocol'
Add-FileSection -Builder $builder -Path (Join-Path $Root 'README.md') -Label 'Repo README'
Add-FileSection -Builder $builder -Path (Join-Path $Root 'SESSION_TEMPLATE.md') -Label 'Session Template'

foreach ($file in (Get-ChildItem -LiteralPath (Join-Path $Root 'topics') -File -Filter '*.md' | Sort-Object Name)) {
    Add-FileSection -Builder $builder -Path $file.FullName -Label "Topic: $($file.BaseName)"
}

foreach ($path in $externalFiles) {
    Add-FileSection -Builder $builder -Path $path -Label "External Context: $([System.IO.Path]::GetFileName($path))"
}

$sessions = @(Get-ChildItem -LiteralPath (Join-Path $Root 'sessions') -File -Filter '*.md' | Sort-Object Name)
foreach ($file in $sessions) {
    Add-FileSection -Builder $builder -Path $file.FullName -Label "Session: $($file.BaseName)"
}

Set-Content -LiteralPath $outputPath -Value $builder.ToString() -Encoding UTF8
Write-Output "Generated $outputPath"
