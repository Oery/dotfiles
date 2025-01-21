Clear-Host

$env:POWERSHELL_UPDATECHECK = 'Off'

Remove-Alias -Name ls
function ls {
    lsd --extensionsort @args
}

Set-PSReadLineOption -PredictionSource Plugin

Invoke-Expression (&starship init powershell)

# Add a new line between commands except for clears
$OriginalPromptFunction = $function:prompt
function prompt {
    & $OriginalPromptFunction
    $lastCommand = (Get-History -Count 1).CommandLine

    if ($lastCommand -and $lastCommand -notin @('cls', 'clear')) {
        "`n" | Write-Host -NoNewline
    }
}
