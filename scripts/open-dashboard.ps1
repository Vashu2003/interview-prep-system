param(
    [int]$Port = 8765
)

$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$url = "http://localhost:$Port/dashboard/index.html"

$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) {
    throw "Python is required to serve the static dashboard."
}

$existing = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue
if ($existing) {
    Start-Process $url
    Write-Output "Dashboard already available at $url"
    exit 0
}

Start-Process -FilePath $python.Source -ArgumentList @('-m', 'http.server', "$Port") -WorkingDirectory $root -WindowStyle Hidden
Start-Sleep -Seconds 1
Start-Process $url
Write-Output "Dashboard available at $url"

