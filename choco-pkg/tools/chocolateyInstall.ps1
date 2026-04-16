$ErrorActionPreference = 'Stop';

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;

$pp = Get-PackageParameters
$instanceName = 'Default'
$port = ''

if ($pp['InstanceName']) { $instanceName = $pp['InstanceName'] }
if ($pp['Port']) { $port = $pp['Port'] }

$safeInstanceName = $instanceName -replace '[^a-zA-Z0-9]',''
$serviceName = "SignMeUpCloud_$safeInstanceName"
$installDir = "$(Join-Path $env:ProgramFiles "SignMeUpCloudServer_$safeInstanceName")"

Write-Host "Installazione/Aggiornamento Istanza: $instanceName nella cartella $installDir"

if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
    Write-Host "Arresto servizio $serviceName per sbloccare i file..."
    Stop-Service -Name $serviceName -Force
    Start-Sleep -Seconds 3
}

$packageName = 'signmeup-cloud-server'
$url = "https://github.com/smeup/signmeup-cloud-binaries/releases/download/v1.2.1/SignMeUp.Cloud.Server_v1.2.1.zip"
$checksum = '908E79CE49863F7B6E00A4A1A774233626C0E4D69413A10577F4C80F7CDAE963'

Install-ChocolateyZipPackage -PackageName $packageName `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType 'sha256' `
  -UnzipLocation $installDir

$appSettingsPath = Join-Path $installDir "appsettings.Production.json"
$customConfig = @{ LoggingInstance = @{ InstanceName = $instanceName } }
if ($port) { $customConfig.Add('Urls', "http://*:$port") }
$customConfig | ConvertTo-Json -Depth 5 | Set-Content $appSettingsPath

$serviceDisplayName = "SignMeUp Cloud Server ($instanceName)"
$exePath = Join-Path $installDir "SignMeUp.Cloud.Server.exe"

if (Get-Service -Name $serviceName -ErrorAction SilentlyContinue) {
    & sc.exe config $serviceName binPath= "`"$exePath`""
} else {
    New-Service -Name $serviceName -DisplayName $serviceDisplayName -BinaryPathName "`"$exePath`"" -StartupType Automatic
}

Start-Service -Name $serviceName
