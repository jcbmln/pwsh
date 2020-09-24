Set-PSReadLineOption -Colors @{
    "Parameter" = [System.ConsoleColor]::Magenta
    "Operator" = [System.ConsoleColor]::Magenta
}

Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete