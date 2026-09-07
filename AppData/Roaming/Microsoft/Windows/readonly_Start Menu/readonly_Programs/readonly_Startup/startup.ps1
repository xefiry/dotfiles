try {
  chezmoi update
}
catch {
  Write-Host "Error caught : $LASTEXITCODE - $Error"
  Pause
}
