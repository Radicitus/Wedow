param($originPath,$outPath,$isInstaller)

$appName = 'Mailspring'
#
$Uri = 'https://updates.getmailspring.com/download?platform=win32'
$installerName = $appName + 'Setup.exe'

$installerPath = $outPath + '\' + $installerName
#
Powershell.exe -executionpolicy remotesigned -File ($originPath + '\Utilities\asyncDownload.ps1') $Uri $installerPath
If ($isInstaller -eq $true) {
    Write-Host '  Starting'$appName' installation...' -ForegroundColor DarkCyan
    Start-Process -FilePath $installerPath -Wait
    Write-Host '   '$appName' has been installed!' -ForegroundColor Green
} Else {
    Write-Host '  '$appName' has been downloaded!' -ForegroundColor Green
}

Write-Host