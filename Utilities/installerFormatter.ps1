param($originPath)

while ((Read-Host -Prompt 'Press ENTER to create a new download script, or "Q" to Quit') -ne 'Q') {
    $appName = Read-Host -Prompt 'Please type in the name of the application'
    $uri = Read-Host -Prompt 'Please paste the STATIC download link to the application (dynamic links and certain redirects not supported)'

    Get-Content ($originPath + '\Utilities\webInstallerTemplate.txt') | ForEach-Object {
        If ($_ -match 'applicationName') {
            $_ -replace 'applicationName', $appName
        }
        ElseIf ($_ -match 'applicationDownloadLink') {
            $_ -replace 'applicationDownloadLink', $uri
        } Else {
            $_
        }
    } | Set-Content ($originPath + '\Web Installs\' + $appName + '.ps1')
}