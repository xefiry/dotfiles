function p() {
  Write-Host "
>>> $($args[0])"
}

p 'sync_homedir'
sync_homedir

p 'seek_and_destroy'
seek_and_destroy

p 'unison freetube'
unison freetube

p 'chezmoi update'
chezmoi update 2> $null
if (!($?)) {
  Write-Error 'chezmoi update - error, run the command manually'
  Pause
}

p 'check_status'
check_status
if ($LASTEXITCODE -ne 0) {
  Write-Error 'check_status - error'
  Pause
}

Start-Sleep -Seconds 5
