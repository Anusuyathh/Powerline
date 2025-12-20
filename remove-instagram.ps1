$files = Get-ChildItem -Filter "*.html" -Recurse
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Remove Instagram link and icon
    $content = $content -replace '<li class="list-inline-item me-3">\s*<a href="https://www\.instagram\.com/[^"]*"[^>]*>\s*<i class="icon fab fa-instagram"><\/i>\s*<\/a>\s*<\/li>', ''
    
    # Also try removing any standalone Instagram link blocks
    $content = $content -replace '<a href="https://www\.instagram\.com/[^"]*"[^>]*>\s*<i class="icon fab fa-instagram"><\/i>\s*<\/a>', ''
    
    Set-Content $file.FullName $content -Encoding UTF8
    Write-Host "Processed: $($file.Name)"
}
Write-Host "All Instagram links removed"
