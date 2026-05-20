$ErrorActionPreference = 'Stop'

Import-Module BurntToast
Add-Type -AssemblyName presentationCore

$soundPath = Join-Path $env:USERPROFILE '.agents\hooks\sounds\stop.wav'
$player = New-Object System.Windows.Media.MediaPlayer
$player.Volume = 0.3
$player.Open([uri]$soundPath)
$player.Play()

$emoji = [char]::ConvertFromUtf32(0x1FAE1)

$binding = New-BTBinding -Children `
    (New-BTText -Text $emoji), `
    (New-BTText -Text 'Work completed')

$content = New-BTContent -Visual (New-BTVisual -BindingGeneric $binding) -Audio (New-BTAudio -Silent)

Submit-BTNotification -Content $content | Out-Null
Start-Sleep -Seconds 3
