# venv helper for VS Code + Jupyter (Windows)

This repo contains `use-venv.ps1`, a PowerShell script that creates and activates a local Python virtual environment in the current folder. It is handy for getting Jupyter working in VS Code with the right interpreter.

## Quick start

### 1) Clone the repo
```powershell
git clone https://github.com/AITrekker/venv.git
cd venv
```

### 2) Put the script on your PATH
Pick a tools folder that is already on PATH or add a new one, for example:
```
C:\Tools
```
Copy the script there:
```powershell
Copy-Item .\use-venv.ps1 C:\Tools\
```

If `C:\Tools` is not on PATH, add it:

- GUI method: Start > type "Environment Variables" > Open "Edit the system environment variables" > "Environment Variables…" > under "User variables", select `Path` > "Edit" > "New" > add `C:\Tools` > OK.
- PowerShell method (user PATH):
  ```powershell
  setx PATH "$($env:PATH);C:\Tools"
  ```
Close and reopen PowerShell so the updated PATH is picked up.

### 3) Use it in any project to create a venv
From your project folder:
```powershell
mkdir MyProject
cd MyProject
use-venv.ps1
```
This creates `.venv`, activates it, and upgrades `pip`.

Install what you need, including Jupyter support:
```powershell
pip install ipykernel jupyter
```

### 4) Open the project in VS Code and select the venv
- Install the **Python** and **Jupyter** extensions in VS Code if you have not already.
- Open the folder: **File > Open Folder...** and choose your project.
- Select the interpreter: **Ctrl+Shift+P** > **Python: Select Interpreter** > pick the one from `.venv`.
- Open or create a notebook: **.ipynb** file.
- Select the kernel: upper-right of the notebook > choose the interpreter that points to `.venv`.

You should now be able to run cells in the notebook with your project venv.

## One-time Python install checklist
- Install Python 3.8 or newer from python.org or the Microsoft Store.
- During install, check "Add python.exe to PATH" or ensure Python is on PATH after install.
- Verify:
  ```powershell
  python --version
  pip --version
  ```

## Common issues and fixes

**VS Code does not see my venv**
- Make sure you opened the **folder** that contains `.venv`, not just the notebook file.
- Run `use-venv.ps1` in that folder to recreate and activate the venv.
- Restart VS Code, then run **Python: Select Interpreter** again.

**Kernel selection shows "No kernel"**
- Install Jupyter bits in the venv:
  ```powershell
  pip install ipykernel jupyter
  ```
- In VS Code, pick the interpreter from `.venv` as the kernel.

**PowerShell says running scripts is disabled**
- Temporarily allow running local scripts:
  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
  ```
  Then run `use-venv.ps1` again.

**Multiple Pythons installed and you get the wrong one**
- In the terminal, confirm:
  ```powershell
  where python
  python -c "import sys; print(sys.executable)"
  ```
- In VS Code, use **Python: Select Interpreter** and pick the path under your project `.venv\Scripts\python.exe`.

## License
MIT License
