$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
if ($env:ComputerName -eq 'XEFIRY-PC') {
  . $ScriptDir/Commands_Home.ps1
  $PYTHON_SCRIPTS = "D:/Code/xefiry/PythonScripts"
}
if ($env:ComputerName -eq 'PS-0568') {
  . $ScriptDir/Commands_Work.ps1
  $PYTHON_SCRIPTS = "C:/GIT/xefiry/PythonScripts"
}

<#
.SYNOPSIS
  Print a list of functions and aliasses
#>
function list_commands {
  [alias('list')]
  param ()

  foreach ($command in $(Get-Command -Module Commands)) {
    $alias = Get-Alias -Definition $command -ErrorAction SilentlyContinue
    Get-Help $command | Select-Object Name, @{l = 'Alias'; e = { $alias } }, @{l = 'Description'; e = { $_.Synopsis } }
  }
}

<#
.SYNOPSIS
  Kill explorer process
#>
function kill_explorer {
  Stop-Process -PassThru -Name 'explorer' | Select-Object Id, ProcessName
}

<#
.SYNOPSIS
  Print the content of PATH environment variable separated by scope (process/machine/user),
  and check if each directory exists
#>
function check_path {
  function print_it {
    param (
      [Parameter(Mandatory)]
      [string]$path
    )

    if (Test-Path -Path $path) {
      Write-Host "`e[32mOK`e[0m $path"
    }
    else {
      Write-Host "`e[31mKO`e[0m $path"
    }
  }

  $machine = [System.Environment]::GetEnvironmentVariable('PATH', 'machine').split(';')
  $user = [System.Environment]::GetEnvironmentVariable('PATH', 'user').split(';')
  $process = [System.Environment]::GetEnvironmentVariable('PATH', 'process').split(';')
  # remove from process items that are in machine or user
  $process = $process | Where-Object { -not (($machine -contains $_) -or ($user -contains $_)) }

  Write-Output '>>> Process'
  foreach ($item in $process) { if ($item -ne '') { print_it $item } }
  Write-Output '>>> Machine'
  foreach ($item in $machine) { if ($item -ne '') { print_it $item } }
  Write-Output '>>> User'
  foreach ($item in $user) { if ($item -ne '') { print_it $item } }
}

<#
.SYNOPSIS
  Get a random number between 1 and max (or infinite if max is not specified).
#>
function get_random_number {
  [alias('rand')]
  param (
    [int32]$max
  )

  if ($max -lt 1) {
    Get-Random
  }
  else {
    $max = $max + 1
    Get-Random -Minimum 1 -Maximum $max
  }
}

<#
.SYNOPSIS
  Open history file in editor
#>
function view_history {
  [alias('hist')]
  param ()

  $hist = (Get-PSReadlineOption).HistorySavePath

  Write-Host "Opening $hist"
  explorer $hist
}

<#
.SYNOPSIS
  Review permissions in Firefox profiles
#>
function firefox_tools {
  uv run --directory "$PYTHON_SCRIPTS" python -m firefox_tools $args
}

<#
.SYNOPSIS
  Print a sample of colors
  See https://en.wikipedia.org/wiki/ANSI_escape_code#Colors for more
#>
function Color_Test {
  [alias('ct')]
  param ()

  $fg_list = @(30, 31, 32, 33, 34, 35, 36, 37, 90)
  $bg_list = @(40, 41, 42, 43, 44, 45, 46, 47, 100)

  Write-Host ''
  foreach ($fg in $fg_list) {
    $line = ''
    foreach ($bg in $bg_list) {
      $line += "`e[${fg};${bg}m ${fg};${bg} `e[00m "
    }
    Write-Host "$line"
  }
  Write-Host ''
}

<#
.SYNOPSIS
  Listen to music with mpv (mpv --no-video)
#>
function mpv_music {
  [alias('music')]
  param (
    [Parameter(Mandatory)]
    [string]$url
  )

  mpv --no-video $url
}

<#
.SYNOPSIS
  Watch Twitch stream using mpv and streamlink
#>
function mpv_stream {
  [alias('stream')]
  param (
    [Parameter(Mandatory)]
    [string]$streamer
  )
  $quality = if ($env:ComputerName -eq 'PS-0568') { 'worst' } else { 'best' }

  uvx streamlink -p mpv "https://www.twitch.tv/$streamer" "$quality"
}

<#
.SYNOPSIS
  Synchronize FreeTube to OneDrive dir using unison
#>
function sync_freetube {
  unison `
    -ignore 'Name ?*' `
    -ignorenot 'Name history.db' `
    -ignorenot 'Name playlists.db' `
    -ignorenot 'Name profiles.db' `
    -ignorenot 'Name search-history.db' `
    -ignorenot 'Name settings.db' `
    -root "$env:AppData\FreeTube" `
    -root "$env:OneDrive\FreeTube" `
    -batch
  #-repeat 'watch'
  #-auto
  #-silent
  #-ignorenot "Name *.db" `
}

<#
.SYNOPSIS
  Start FreeTube (if not already running) and manage file sync
#>
function start_freetube {
  if (Get-Process 'FreeTube' -ErrorAction SilentlyContinue) {
    Write-Host 'FreeTube is already running'
    return
  }

  # sync before starting FreeTube
  sync_freetube

  # start FreeTube
  FreeTube.exe

  # wait for it to stop
  Do {
    Start-Sleep 1
  } while (Get-Process 'FreeTube' -ErrorAction SilentlyContinue)

  Start-Sleep 2

  # sync again
  sync_freetube

  Start-Sleep 5
}

<#
.SYNOPSIS
  Start Open WebUI (web interface for Ollama)
#>
function start_open_webui {
  [alias('webui')]
  param ()

  $open_webui_path = "$env:LocalAppData\Programs\open-webui"

  $env:DATA_DIR = "$open_webui_path\data"
  $env:CORS_ALLOW_ORIGIN = 'http://localhost:8080'

  Set-Location $open_webui_path

  uvx --python 3.11 open-webui@latest serve
}
