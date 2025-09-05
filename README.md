# use-venv.ps1

A simple PowerShell script to help you quickly create and manage Python virtual environments on Windows.

## Features
- Creates a new virtual environment in your project folder.
- Automatically activates the environment after creation.
- Installs `pip` and upgrades it if needed.
- Simplifies repeated environment setup for multiple projects.

## Requirements
- Windows PowerShell 5.1 or PowerShell 7+
- Python 3.8+ installed and available on your system `PATH`

## Usage
1. Clone or download this repo.
2. Open PowerShell in your project folder.
3. Run the script:
   ```powershell
   .\use-venv.ps1
   ```
   This will:
   - Create a `.venv` folder if it doesn’t exist.
   - Activate the virtual environment.
   - Upgrade `pip`.

4. Once activated, install dependencies as usual:
   ```powershell
   pip install -r requirements.txt
   ```

## Example
```powershell
PS C:\MyProject> .\use-venv.ps1
[INFO] Virtual environment created at .venv
[INFO] Activating environment...
(.venv) PS C:\MyProject> pip install requests
```

## Why use this?
Setting up and activating virtual environments can be repetitive. This script saves time by automating the boilerplate steps and ensuring consistent setup across projects.

## License
MIT License
