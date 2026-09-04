# chezmoi

My config files managed with [chezmoi](https://www.chezmoi.io/)

## Files

| Name             | Home/Work                     | Template | Secrets |
| ---------------- | ----------------------------- | :------: | :-----: |
| Chatterino       | home                          |    X     |    X    |
| Espanso          | shared (1 work specific file) |    X     |    X    |
| Firefox          | shared                        |          |         |
| Flameshot        | shared                        |          |         |
| Git              | different                     |    X     |    X    |
| Handy            | shared                        |          |         |
| LightBulb        | shared                        |    X     |    X    |
| Mp3tag           | home                          |          |         |
| mpv              | different                     |    X     |         |
| SSH              | shared                        |          |         |
| VS Code          | shared                        |          |         |
| Windows Terminal | different                     |    X     |         |

## Secrets

| Name       | User       | Home/Work |
| ---------- | ---------- | :-------: |
| common     | fullName   |   both    |
| common     | email      |   both    |
| LightBulb  | Latitude   |   both    |
| LightBulb  | Longitude  |   both    |
| Chatterino | clientID   |   home    |
| Chatterino | oauthToken |   home    |
| Chatterino | userID     |   home    |
| Chatterino | username   |   home    |
| Espanso    | emailTeam  |   work    |
| Git        | credential |   work    |

- Set : `chezmoi secret keyring set --service="chezmoi/__name__" --user="__user__" --value="__value__"`
- Get : `chezmoi secret keyring get --service="chezmoi/__name__" --user="__user__"`
- Del : `chezmoi secret keyring delete --service="chezmoi/__name__" --user="__user__"`
