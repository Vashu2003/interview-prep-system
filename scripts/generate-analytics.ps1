param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$sessionsDir = Join-Path $Root 'sessions'
$dataDir = Join-Path $Root 'data'
$outputPath = Join-Path $dataDir 'analytics.json'

function Parse-SessionFile {
    param([System.IO.FileInfo]$File)

    $text = Get-Content -LiteralPath $File.FullName -Raw
    $match = [regex]::Match($text, '(?s)```yaml\s*(.*?)\s*```')
    $meta = @{}

    if ($match.Success) {
        $lines = $match.Groups[1].Value -split "`r?`n"
        $currentListKey = $null

        foreach ($line in $lines) {
            if ($line -match '^\s*-\s*(.+)$' -and $currentListKey) {
                if (-not $meta.ContainsKey($currentListKey)) {
                    $meta[$currentListKey] = @()
                }
                $meta[$currentListKey] += $Matches[1].Trim()
                continue
            }

            if ($line -match '^([A-Za-z_]+):\s*(.*)$') {
                $key = $Matches[1].Trim()
                $value = $Matches[2].Trim()
                $currentListKey = $null

                if ($value -eq '') {
                    $meta[$key] = @()
                    $currentListKey = $key
                }
                elseif ($value -match '^(true|false)$') {
                    $meta[$key] = [bool]::Parse($value)
                }
                elseif ($value -match '^-?\d+(\.\d+)?$') {
                    $meta[$key] = [double]$value
                }
                else {
                    $meta[$key] = $value
                }
            }
        }
    }

    $qualityScore = 0
    if ($meta.ContainsKey('quality_score')) {
        $qualityScore = [double]$meta['quality_score']
    }

    $readinessDelta = 0
    if ($meta.ContainsKey('readiness_delta')) {
        $readinessDelta = [double]$meta['readiness_delta']
    }

    [PSCustomObject]@{
        file = $File.FullName.Substring($Root.Length + 1).Replace('\', '/')
        date = $meta['date']
        mode = $meta['mode']
        topic = $meta['topic']
        energy = $meta['energy']
        status = $meta['status']
        revision_done = [bool]$meta['revision_done']
        quality_score = $qualityScore
        readiness_delta = $readinessDelta
        tags = @($meta['tags'])
    }
}

function Get-StreakDays {
    param([object[]]$Sessions)

    $dates = @(
        $Sessions |
            Where-Object { $_.date -match '^\d{4}-\d{2}-\d{2}$' } |
            ForEach-Object { [datetime]::ParseExact($_.date, 'yyyy-MM-dd', $null).Date } |
            Sort-Object -Unique -Descending
    )

    if ($dates.Count -eq 0) {
        return 0
    }

    $streak = 0
    $cursor = (Get-Date).Date

    if ($dates[0] -lt $cursor) {
        $cursor = $dates[0]
    }

    foreach ($date in $dates) {
        if ($date -eq $cursor) {
            $streak += 1
            $cursor = $cursor.AddDays(-1)
        }
        elseif ($date -lt $cursor) {
            break
        }
    }

    $streak
}

function Get-GitCommitCount {
    param([string]$Root)

    $current = Get-Location
    try {
        Set-Location -LiteralPath $Root
        $count = git rev-list --count HEAD 2>$null
        if ($LASTEXITCODE -ne 0 -or -not $count) {
            return 0
        }
        [int]$count
    }
    finally {
        Set-Location $current
    }
}

New-Item -ItemType Directory -Force -Path $dataDir | Out-Null

$sessions = @(
    Get-ChildItem -LiteralPath $sessionsDir -File -Filter '*.md' -ErrorAction SilentlyContinue |
        ForEach-Object { Parse-SessionFile -File $_ } |
        Sort-Object date, file
)

$topicsCovered = @($sessions | Where-Object { $_.topic } | Select-Object -ExpandProperty topic -Unique)
$scoredSessions = @($sessions | Where-Object { $_.quality_score -gt 0 })
$averageQuality = if ($scoredSessions.Count -gt 0) {
    [math]::Round((($scoredSessions | Measure-Object -Property quality_score -Average).Average), 2)
} else {
    0
}

$weakTopics = @(
    $sessions |
        Where-Object { $_.quality_score -gt 0 -and $_.quality_score -lt 3 } |
        Select-Object -ExpandProperty topic -Unique
)

$coreCount = @($sessions | Where-Object { $_.mode -eq 'Core Interview Readiness' }).Count
$broadCount = @($sessions | Where-Object { $_.mode -eq 'Broad Concept Coverage' }).Count
$revisionCount = @($sessions | Where-Object { $_.revision_done }).Count
$revisionFrequency = if ($sessions.Count -gt 0) {
    [math]::Round(($revisionCount / $sessions.Count) * 100, 1)
} else {
    0
}

$readiness = if ($sessions.Count -gt 0) {
    $base = [math]::Min(70, $coreCount * 4)
    $qualityBoost = [math]::Min(20, $averageQuality * 4)
    $revisionBoost = [math]::Min(10, $revisionFrequency / 10)
    [math]::Round([math]::Min(100, $base + $qualityBoost + $revisionBoost), 1)
} else {
    0
}

$analytics = [ordered]@{
    generated_at = (Get-Date).ToString('s')
    sessions_attempted = $sessions.Count
    streak_days = Get-StreakDays -Sessions $sessions
    topics_covered = $topicsCovered
    weak_topics = $weakTopics
    average_quality_score = $averageQuality
    energy_trend = @($sessions | Where-Object { $_.energy } | Select-Object date, energy, topic)
    mode_split = [ordered]@{
        'Core Interview Readiness' = $coreCount
        'Broad Concept Coverage' = $broadCount
    }
    revision_frequency = $revisionFrequency
    git_commit_count = Get-GitCommitCount -Root $Root
    interview_readiness_percentage = $readiness
    sessions = $sessions
}

$analytics | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $outputPath -Encoding UTF8
Write-Output "Generated $outputPath"
