${function:~} = { Set-Location ~ }
${function:Set-ParentLocation} = {Set-Location ..}; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }
${function:pwshup} = { Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI" }

Set-Alias ls Get-ChildItem -option AllScope
Set-Alias lls Get-ChildItemColorFormatWide -option AllScope
Set-Alias time Measure-Command
