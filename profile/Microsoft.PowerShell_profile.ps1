Import-Module -Name posh-git
Import-Module Get-ChildItemColor

. "$PSScriptRoot\functions.ps1"
. "$PSScriptRoot\aliases.ps1"
. "$PSScriptRoot\psreadline.ps1"
. "$PSScriptRoot\Scripts\posh-winfetch.ps1"

$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::Magenta
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'

function prompt {
    if (Test-Administrator) {  # Use different username if elevated
        Write-Host "(Elevated) " -NoNewline -ForegroundColor Red
    }

    Write-Host "$ENV:USERNAME" -NoNewline -ForegroundColor Blue
    Write-Host "@" -NoNewline -ForegroundColor White
    Write-Host "$ENV:COMPUTERNAME".ToLower() -NoNewline -ForegroundColor Green
    Write-Host " " -NoNewline

    & $GitPromptScriptBlock
}