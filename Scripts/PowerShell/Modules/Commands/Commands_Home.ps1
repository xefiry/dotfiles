<#
.SYNOPSIS
  Run "go test -v" and color output
#>
function GO_ColoredTest {
  [alias('gct')]
  param ()

  foreach ($line in $(go test -v)) {
    $line = $line.Replace('PASS', "`e[1;32mPASS`e[0m")
    $line = $line.Replace('FAIL', "`e[1;31mFAIL`e[0m")
    Write-Host $line
  }
}
