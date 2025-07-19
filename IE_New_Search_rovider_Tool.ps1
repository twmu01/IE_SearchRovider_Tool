$GoogleGuid = [guid]::NewGuid().ToString().ToUpper()
$YahooGuid = [guid]::NewGuid().ToString().ToUpper()
$BaiduGuid = [guid]::NewGuid().ToString().ToUpper()

Write-Output "──────────────────────────────────────"
Write-Output "│Internet Explorer 新增搜索提供者工具│"
Write-Output "──────────────────────────────────────"
Write-Output "───────────────────────────────────────────────"
Write-Output "│1. 新增Google、Yahoo!奇摩、中國百度搜索提供者│"
Write-Output "│2. 新增Yahoo!奇摩搜索提供者                 │"
Write-Output "│3. 新增Google搜索提供者                     │"
Write-Output "│4. 新增中國百度搜索提供者                    │"
Write-Output "───────────────────────────────────────────────"

$choose = [int](Read-Host "請輸入")

if ($choose -eq 1) {
    New-Item -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Force
    New-Item -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Force
    New-Item -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Force

    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "DisplayName" -Value "Google"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "DisplayName" -Value "Yahoo!奇摩"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "DisplayName" -Value "中國百度"

    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "URL" -Value "https://www.google.com/search?q={searchTerms}"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "URL" -Value "https://tw.search.yahoo.com/search?p={searchTerms}"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "URL" -Value "https://www.baidu.com/s?wd={searchTerms}"

    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "ShowSearchSuggestions" -Value 1 -PropertyType DWord
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "ShowSearchSuggestions" -Value 1 -PropertyType DWord
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "ShowSearchSuggestions" -Value 0 -PropertyType DWord

    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "SuggestionsURL" -Value 'https://www.google.com/complete/search?output=chrome&q={searchTerms}'
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "SuggestionsURL" -Value "https://tw.search.yahoo.com/search?p={searchTerms}"

    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "FaviconURL" -Value "https://www.google.com/favicon.ico"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "FaviconURL" -Value "https://s.yimg.com/rz/l/favicon.ico"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "FaviconURL" -Value "https://www.baidu.com/favicon.ico"
    
    Write-Output "──────────────────────────────────────────────────"
    Write-Output "│1. Yahoo!奇摩為預設搜索提供者                  │"
    Write-Output "│2. Google為預設搜索提供者                  │"
    Write-Output "│3. 中國百度為預設搜索提供者                 │"
    Write-Output "──────────────────────────────────────────────────"

    $Dchoose = [int](Read-Host "請輸入")

    if ($Dchoose -eq 1) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\SearchScopes" -Name "DefaultScope" -Value "{$YahooGuid}"
    }
    elseif ($Dchoose -eq 2) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\SearchScopes" -Name "DefaultScope" -Value "{$GoogleGuid}"
    }
    elseif ($Dchoose -eq 3) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\SearchScopes" -Name "DefaultScope" -Value "{$BaiduGuid}"
    }

    Write-Host "`n已成功新增搜尋提供者！請重新啟動 Internet Explorer。"
    Read-Host -Prompt "按下 Enter 鍵以繼續..."
}
elseif ($choose -eq 2) {
    New-Item -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Force
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "DisplayName" -Value "Yahoo!奇摩"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "URL" -Value "https://tw.search.yahoo.com/search?p={searchTerms}"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "ShowSearchSuggestions" -Value 1 -PropertyType DWord
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "SuggestionsURL" -Value "https://tw.search.yahoo.com/search?p={searchTerms}"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$YahooGuid" -Name "FaviconURL" -Value "https://s.yimg.com/rz/l/favicon.ico"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\SearchScopes" -Name "DefaultScope" -Value "{$YahooGuid}"
    Write-Host "`n已成功新增搜尋提供者！請重新啟動 Internet Explorer。"
    Read-Host -Prompt "按下 Enter 鍵以繼續..."
}
elseif ($choose -eq 3) {
    New-Item -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Force
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "DisplayName" -Value "Google"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "URL" -Value "https://www.google.com/search?q={searchTerms}"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "ShowSearchSuggestions" -Value 1 -PropertyType DWord
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "SuggestionsURL" -Value 'https://www.google.com/complete/search?output=chrome&q={searchTerms}'
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$GoogleGuid" -Name "FaviconURL" -Value "https://www.google.com/favicon.ico"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\SearchScopes" -Name "DefaultScope" -Value "{$GoogleGuid}"
    Write-Host "`n已成功新增搜尋提供者！請重新啟動 Internet Explorer。"
    Read-Host -Prompt "按下 Enter 鍵以繼續..."
}
elseif ($choose -eq 4) {
    New-Item -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Force
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "DisplayName" -Value "中國百度"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "URL" -Value "https://www.baidu.com/s?wd={searchTerms}"
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "ShowSearchSuggestions" -Value 0 -PropertyType DWord
    New-ItemProperty -Path "HKCU:Software\Microsoft\Internet Explorer\SearchScopes\$BaiduGuid" -Name "FaviconURL" -Value "https://www.baidu.com/favicon.ico"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer\SearchScopes" -Name "DefaultScope" -Value "{$BaiduGuid}"
    Write-Host "`n已成功新增搜尋提供者！請重新啟動 Internet Explorer。"
    Read-Host -Prompt "按下 Enter 鍵以繼續..."
}
else {
    Write-Output "請重新輸入。"
    Read-Host -Prompt "按下 Enter 鍵以繼續..."
}
