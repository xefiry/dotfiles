# chezmoi

My config files managed with [chezmoi](https://www.chezmoi.io/)

## Files

| Name             | Home/Work                      | Template | Data  |
| ---------------- | ------------------------------ | :------: | :---: |
| startup.ps1      | shared                         |          |       |
| Chatterino       | home                           |    X     |   X   |
| Espanso          | shared (2 work specific files) |    X     |   X   |
| Firefox          | shared                         |          |       |
| Flameshot        | shared                         |          |       |
| Git              | different                      |    X     |   X   |
| Handy            | shared                         |          |       |
| LightBulb        | shared                         |    X     |   X   |
| Mp3tag           | home                           |          |       |
| mpv              | different                      |    X     |       |
| SSH              | shared                         |          |       |
| Unison           | shared  (1 work specific file) |    X     |       |
| VS Code          | shared                         |          |       |
| Windows Terminal | different                      |    X     |       |

## Data

| Variable                 | Home/Work |
| ------------------------ | :-------: |
| fullName                 |   both    |
| email                    |   both    |
| LightBulb_Latitude       |   both    |
| LightBulb_Longitude      |   both    |
| Chatterino_oauthToken    |   home    |
| Chatterino_Notifications |   home    |
| Chatterino_clientID      |   home    |
| Chatterino_userID        |   home    |
| Chatterino_username      |   home    |
| Espanso_emailTeam        |   work    |
| Git_credential           |   work    |

## Scripts

The Scripts directory contains a variety of shared scripts, because why not.

- windows_shortcuts.ahk : An AutohHotkey script to add/redefine shortcuts on Windows

### PowerShell

Scripts used for PowerShell 7 profile. To use them, create a junction between this directory to the profile directory.

```pwsh
$profile_path = Split-Path -Path $Profile.CurrentUserAllHosts
$chezmoi_path = "$env:UserProfile/.local/share/chezmoi/Scripts/PowerShell"
New-Item -ItemType Junction -Path $profile_path -Target $chezmoi_path
```
