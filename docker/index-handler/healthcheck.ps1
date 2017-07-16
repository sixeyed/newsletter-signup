$urls = 'http://elasticsearch:9200', 'http://message-queue:8222'

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