# chezmoi

My config files managed with [chezmoi](https://www.chezmoi.io/)

## Scripts

The Scripts directory contains a variety of shared scripts, because why not.

### PowerShell

Scripts used for PowerShell 7 profile. To use them, create a junction between this directory to the profile directory.

```pwsh
$profile_path = Split-Path -Path $Profile.CurrentUserAllHosts
$chezmoi_path = "$env:UserProfile/.local/share/chezmoi/Scripts/PowerShell"
New-Item -ItemType Junction -Path $profile_path -Target $chezmoi_path
```
