param($originPath="C:\Users\CamCam\Documents\Code\Personal\Wedow\",$outPath="C:\Users\CamCam\Desktop")

#Mailspring
$Uri = 'https://updates.getmailspring.com/download?platform=win32'
$installerName = 'MailspringSetup.exe'

$installerPath = $outPath + '\' + $installerName
#
Powershell.exe -executionpolicy remotesigned -File ($originPath + '\Utilities\asyncDownload.ps1') $Uri $installerPath
#Start-Process -FilePath $installerPath
Start-Sleep -Seconds 180
Write-Host '  Mailspring has been installed!' -ForegroundColor DarkCyan

Write-Host