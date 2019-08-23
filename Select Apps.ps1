#Requires -RunAsAdministrator
param($originPath=$PSScriptRoot,$outPath=('C:\Users\' + $env:Username + '\Desktop\Installers'),$format=$false)

If ($format -eq $true) {
    Powershell.exe -executionpolicy remotesigned -File ($originPath + '\Utilities\installerFormatter.ps1') $originPath
    exit
}

New-Item -Path $outPath -ItemType 'directory' -Force | Out-Null
$isInstaller = $false

$prompt = New-Object -ComObject wscript.shell
$selection = $prompt.popup(('Would you like to download AND install?'), 5, ($env:Username + "'s Web Install"), 4)
If ($selection -eq 6 -OR $selection -eq -1) {$isInstaller = $true}
$webInstallPath = $originPath + '\Web Installs'

Write-Host 'Beginning web downloads...' -ForegroundColor Cyan

Get-ChildItem $webInstallPath | ForEach-Object {
    Get-ChildItem -Path ('C:\Users\' + $env:Username + '\Desktop\*') -Include '*.lnk' | Where-Object { $_.Name.Contains($_.BaseName) } | Remove-Item
    $prompt = New-Object -ComObject wscript.shell
    $selection = $prompt.popup(('Would you like to download ' + $_.BaseName + '?'), 5, 'App Selection', 4)
    If ($selection -eq 6 -OR $selection -eq -1) {
        Write-Host (' Starting ' + $_.BaseName + ' download...') -ForegroundColor DarkCyan
        Powershell.exe -executionpolicy remotesigned -File $_.FullName $originPath $outPath $isInstaller
    }
}

Write-Host 'Operations complete!' -ForegroundColor Cyan