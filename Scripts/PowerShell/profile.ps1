<#
Set execution policy : https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.5

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
Get-ExecutionPolicy -List

-----

Customize PowerShell : https://learn.microsoft.com/en-us/powershell/scripting/learn/shell/creating-profiles?view=powershell-7.3
Automatic variables : https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.3

$Profile | Select-Object *
#>

Import-Module posh-git  # https://github.com/dahlbyk/posh-git
Import-Module Prompt
Import-Module Commands

# Ctrl + D to exit
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit

Write-Host "Type 'list' to get a list of custom commands"
