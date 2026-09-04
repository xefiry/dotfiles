function PromptPrefix {
    $color = If ($GitPromptValues.IsAdmin) { 31 } else { 32 }
    $error_sign = if ($GitPromptValues.DollarQuestion) { "✔`n" } else { "❗`n" }
    "$error_sign`e[$($color)m$($env:UserName)`e[0m@`e[36m$($env:ComputerName)`e[0m "
}

function PromptPath {
    $cur_dir = $executionContext.SessionState.Path.CurrentLocation.Path
    $cur_dir = $cur_dir.Replace($env:OneDrive, 'OneDrive')
    $cur_dir = $cur_dir.Replace($env:UserProfile, '~')
    $cur_dir
}

$GitPromptSettings.DefaultPromptPrefix.Text = '$(PromptPrefix)'
$GitPromptSettings.DefaultPromptPath.Text = '$(PromptPath)'
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = "`n"
