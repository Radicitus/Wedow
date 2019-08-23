param($originPath,$outPath,$isInstaller)

#Mailspring
$Uri = 'https://updates.getmailspring.com/download?platform=win32'
$appName = 'Mailspring'
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