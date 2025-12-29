# Добавление скрипта в планировщик задач

$TaskName = "WSL PortProxy Auto"
$ScriptPath = "C:\wsl_portproxy.ps1"

$Action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-ExecutionPolicy Bypass -NoProfile -File `"$ScriptPath`""

$Trigger = New-ScheduledTaskTrigger -AtStartup

$Principal = New-ScheduledTaskPrincipal `
    -UserId "SYSTEM" `
    -RunLevel Highest

Register-ScheduledTask `
    -TaskName $TaskName `
    -Action $Action `
    -Trigger $Trigger `
    -Principal $Principal `
    -Description "Update WSL portproxy (80,443)"

# HTTP 80
New-NetFirewallRule `
    -DisplayName "WSL HTTP 80" `
    -Direction Inbound `
    -Protocol TCP `
    -LocalPort 80 `
    -Action Allow `
    -Profile Any

# HTTPS 443
New-NetFirewallRule `
    -DisplayName "WSL HTTPS 443" `
    -Direction Inbound `
    -Protocol TCP `
    -LocalPort 443 `
    -Action Allow `
    -Profile Any