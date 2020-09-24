$profileDir = Split-Path -Parent $profile
$winTermDir = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ".\profile\*.ps1" -Destination $profileDir
Copy-Item -Path ".\terminal\*" -Destination $winTermDir

Set-ExecutionPolicy -Scope Process -Force Bypass
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) -ErrorAction Stop

choco install -y git
choco install -y firacode

Install-Module -Scope CurrentUser -AllowPrerelease posh-git
Install-Module -Scope CurrentUser -AllowPrerelease Get-ChildItemColor


