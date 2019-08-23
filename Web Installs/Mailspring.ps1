param($originPath,$outPath,$isInstaller)

#Mailspring
$Uri = 'https://updates.getmailspring.com/download?platform=win32'
$appName = 'Mailspring'
$installerName = $appName + 'Setup.exe'

$installerPath = $outPath + '\' + $installerName
#
Powershell.exe -executionpolicy remotesigned -File ($originPath + '\Utilities\asyncDownload.ps1') $Uri $installerPath
If ($isInstaller) {
    Write-Host 'Installer = '$isInstaller
    Start-Process -FilePath $installerPath
    Start-Sleep -Seconds 180
    Write-Host '  '$appName' has been installed!' -ForegroundColor DarkCyan
} Else {
    Write-Host '  '$appName' has been downloaded!' -ForegroundColor DarkCyan
}

Write-Host