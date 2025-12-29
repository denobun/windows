# Поместить скрипт по пути указанному в установщике автозапуска

# Сброс
netsh interface portproxy reset

# Ждём, пока WSL2 поднимет сеть
Start-Sleep -Seconds 10

# Получаем IP WSL (eth0)
$wslIp = wsl.exe ip addr show eth0 |
    Select-String 'inet ' |
    ForEach-Object {
        ($_ -split '\s+')[2] -split '/' | Select-Object -First 1
    }
    
if (-not $wslIp) {
    exit 1
}

# HTTP 80
netsh interface portproxy add v4tov4 `
    listenaddress=0.0.0.0 listenport=80 `
    connectaddress=$wslIp connectport=80

# HTTPS 443
netsh interface portproxy add v4tov4 `
listenaddress=0.0.0.0 listenport=443 `
connectaddress=$wslIp connectport=443
