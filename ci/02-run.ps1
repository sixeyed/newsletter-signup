Write-Output '*** Start App: '

docker-compose `
 -f .\app\docker-compose.yml `
 -f .\app\docker-compose.local.yml `
 up -d

Write-Output '*** Containers '

docker container ls

Write-Output '*** Sleeping'

Start-Sleep -Seconds 20

$ip = docker inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' app_web_1

Write-Output '*** Checking website'

iwr -useb "http://$ip"