$profileDir = Split-Path -Parent $profile
$winTermDir = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

Copy-Item -Path ".\profile\*.ps1" -Destination $profileDir
Copy-Item -Path ".\terminal\*" -Destination $winTermDir

choco upgrade chocolatey
choco upgrade git
choco upgrade firacode

Update-Module -Scope CurrentUser -AllowPrerelease posh-git
Update-Module -Scope CurrentUser -AllowPrerelease Get-ChildItemColor

Update-Script -AllowPrerelease posh-winfetch