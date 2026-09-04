$GIT_SCRIPTS = "C:/GIT/$env:UserName/scripts-python/"

<#
.SYNOPSIS
  Prints password dates
#>
function get_password_dates {
  net user $env:UserName /domain | Select-String -Pattern 'Mot de passe' -NoEmphasis
}

<#
.SYNOPSIS
  Get BOSS parameters
#>
function get_boss_params {
  uv run --directory $GIT_SCRIPTS get_boss_params.py
}

<#
.SYNOPSIS
  Opens ticket found in the branch name
#>
function open_branch_ticket {
  uv run "$GIT_SCRIPTS/open_branch_ticket.py" $args
}

<#
.SYNOPSIS
  Update GIT sources
#>
function GIT_update {
  uv run --directory $GIT_SCRIPTS git_update.py
}

<#
.SYNOPSIS
  Rebase GIT repo
#>
function GIT_auto_rebase {
  uv run --directory $GIT_SCRIPTS git_auto_rebase.py $args
}

<#
.SYNOPSIS
  Create a log file for the commits in the current branch and open it.
  -All for all local branches.
  You can give the directories to log.
#>
function GIT_branch_log {
  param(
    [switch]$All
  )

  if ($All) {
    $branch_list = $(git for-each-ref --format='%(refname:short)' refs/heads/)
  }
  else {
    $branch_list = @($(git branch --show-current))
  }

  if (-not $?) { return }

  foreach ($branch in $branch_list) {
    if ($branch -eq 'main') {
      Write-Host 'main ignored'
    }
    else {
      Write-Host $branch
      $log_file = "$branch.log"
      $log_file = $log_file.Replace("$env:UserName/", '')
      $log_file = $log_file.Replace('/', '_')
      git log main^..$branch --name-status --decorate $args > $log_file
      code $log_file
    }
  }
}

<#
.SYNOPSIS
  Switch to $commit_id and start BOSS from $client with $arg1 and $arg2
#>
function GIT_try_boss {
  param (
    [Parameter(Mandatory)] [string]$arg1,
    [Parameter(Mandatory)] [string]$arg2,
    [Parameter(Mandatory)] [string]$client,
    [Parameter(Mandatory)] [string]$commit_id
  )

  if ( -not (Test-Path boss)) {
    Write-Host "Directory 'boss' not found"
    return
  }
  git switch -d $commit_id
  ./boss/CompileBoss.ps1 -Clean $client
  &"./boss/$client/exe/BOSS.exe" $arg1 $arg2
}
