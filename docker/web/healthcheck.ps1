$urls = 'http://message-queue:8222', 'http://localhost/SignUp'

foreach ($url in $urls) {
    try { 
        $response = Invoke-WebRequest -UseBasicParsing $url
        if ($response.StatusCode -eq 200) { 
            return 0
        }
        else {
            return 1
        }
    }
    catch { 
        return 1 
    }
}