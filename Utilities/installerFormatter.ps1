param($originPath)

Write-Host "Enter 'Q' if you would like to Quit."
while ((Read-Host -Prompt 'Would you like to create a new download script?') -ne 'Q') {
    $appName = Read-Host -Prompt 'Please type in the name of the application:'
    $uri = Read-Host -Prompt 'Please paste the STATIC download link to the application (dynamic links and certain redirects not supported):'

    Get-Content ($originPath + '\Utilities\webInstallerTemplate.txt') | ForEach-Object {
        $_ -replace 'applicationName', $appName
        $_ -replace 'applicationDownloadLink', $uri
    } | Set-Content ($originPath + '\Web Installs\' + $appName + '.ps1')
}