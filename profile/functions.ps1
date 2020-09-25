
function which($command) { Get-Command $command -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding utf8 }

function Edit-Hosts { Invoke-Expression "sudo $(if($null -ne $env:EDITOR) { $env:EDITOR } else { 'notepad' }) $env:windir\system32\drivers\etc\hosts" }
function Edit-Profile { Invoke-Expression "$(if($null -ne $env:EDITOR) { $env:EDITOR } else { 'notepad' }) $profile" }

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function Test-CommandExtists($command) {
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'

    try {
        if (Get-Command $command) {
            return $true
        }
    }
    catch {
        return $false
    }
    finally {
        $ErrorActionPreference = $oldPreference
    }
}


function sudo {
    if ($args.Length -eq 1) {
        Start-Process $args[0] -Verb "runAs"
    }
    if ($args.Length -gt 1) {
        Start-Process $args[0] -ArgumentList $args[1..$args.Length] -Verb "runAs"
    }
}