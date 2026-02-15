# Helper: run npm even if it's not in PATH (Node.js installed in default location)
$nodePaths = @(
    "$env:ProgramFiles\nodejs\npm.cmd",
    "${env:ProgramFiles(x86)}\nodejs\npm.cmd",
    "$env:LOCALAPPDATA\Programs\node\npm.cmd",
    "$env:APPDATA\npm\npm.cmd"
)
$npm = $null
foreach ($p in $nodePaths) {
    if (Test-Path $p) { $npm = $p; break }
}
if (-not $npm) {
    Write-Host "Node.js not found. Please install from https://nodejs.org (LTS) and add to PATH." -ForegroundColor Red
    Write-Host "Then close and reopen the terminal." -ForegroundColor Yellow
    exit 1
}
& $npm @args
