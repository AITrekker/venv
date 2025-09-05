# use-venv.ps1

# Ensure errors stop the script
$ErrorActionPreference = "Stop"

# Get current folder name to use as venv name
$currentDir = Get-Location
$projectName = Split-Path $currentDir -Leaf

# Define where venvs are stored
$venvRoot = "\venvs"
$venvPath = Join-Path $venvRoot $projectName
$activateScript = Join-Path $venvPath "Scripts\Activate.ps1"

# Check if already in a venv
if ($env:VIRTUAL_ENV) {
    Write-Host "Already in a virtual environment: $env:VIRTUAL_ENV"
    return
}

# Create venv if it doesn't exist
if (-Not (Test-Path $venvPath)) {
    Write-Host "Creating new venv at $venvPath with --system-site-packages"

    if (Get-Command uv -ErrorAction SilentlyContinue) {
        uv venv --system-site-packages $venvPath
    } else {
        python -m venv --system-site-packages $venvPath
    }
}

# Activate the venv
if (Test-Path $activateScript) {
    Write-Host "Activating venv: $venvPath"
    & $activateScript
} else {
    Write-Error "Activation script not found: $activateScript"
    return
}