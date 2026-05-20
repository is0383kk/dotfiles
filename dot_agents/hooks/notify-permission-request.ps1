$ErrorActionPreference = 'Stop'

Import-Module BurntToast
Add-Type -AssemblyName presentationCore

$soundPath = Join-Path $env:USERPROFILE '.agents\hooks\sounds\notification-permission_prompt.wav'
$player = New-Object System.Windows.Media.MediaPlayer
$player.Volume = 0.3
$player.Open([uri]$soundPath)
$player.Play()

$emojiThinking = [char]::ConvertFromUtf32(0x1F914)
$emojiQuestion = [char]::ConvertFromUtf32(0x2753)
$emoji = "$emojiThinking$emojiQuestion"

$binding = New-BTBinding -Children `
    (New-BTText -Text $emoji), `
    (New-BTText -Text 'Confirmation Request')

$content = New-BTContent -Visual (New-BTVisual -BindingGeneric $binding) -Audio (New-BTAudio -Silent)

Submit-BTNotification -Content $content | Out-Null
Start-Sleep -Seconds 3
