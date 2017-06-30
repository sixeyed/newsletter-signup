Write-Output '*** Tagging and pushing images'

$repositories = 'signup-web', 'signup-save-handler', 'signup-index-handler'

$tag = 'latest'
if (Test-Path Env:\APPVEYOR_BUILD_NUMBER) {
    $tag=$env:APPVEYOR_BUILD_NUMBER
}

if ((Test-Path Env:\HUB_USER) -and (Test-Path Env:\HUB_PASSWORD)) {
    docker login -u="$env:HUB_USER" -p="$env:HUB_PASSWORD"
}

foreach ($repository in $repositories) {

    $sourceTag = "sixeyed/$($repository)"
    $targetTag = "sixeyed/$($repository):$($tag)"

    docker tag $sourceTag $targetTag

    docker push $targetTag
}