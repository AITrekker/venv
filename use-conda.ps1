# use-conda.ps1

$ErrorActionPreference = "Stop"

# Use current folder name as env name
$currentDir = Get-Location
$envName = Split-Path $currentDir -Leaf

# Load conda from user profile
$userHome = [Environment]::GetFolderPath("UserProfile")
$condaRoot = Join-Path $userHome "Anaconda3"
$hookScript = Join-Path $condaRoot "shell\condabin\conda-hook.ps1"

if (Test-Path $hookScript) {
    & $hookScript
} else {
    Write-Error "Conda hook script not found at: $hookScript"
    return
}

# Define custom venv location
$venvRoot = "D:\venvs"
$venvPath = Join-Path $venvRoot $envName

# Create env if it doesn't exist
if (-not (Test-Path $venvPath)) {
    Write-Host "Creating conda environment at: $venvPath"
    conda create -y --prefix $venvPath python=3.10.6 pip
}

# Activate the conda env by full path
Write-Host "Activating conda environment at: $venvPath"
conda activate $venvPath
