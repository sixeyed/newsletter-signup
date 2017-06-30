Write-Output '*** App Build: '

docker-compose `
 -f .\app\docker-compose.yml `
 -f .\app\docker-compose.build.yml `
 -f .\app\docker-compose.local.yml  `
 build