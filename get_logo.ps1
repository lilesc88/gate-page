$src = "C:\Users\admin\.openclaw\workspace\media\inbound\24543_seller_logo-1---c2764a31-fe5a-44fe-9498-4a5f0ab1f01d.png"
$dst = "C:\Users\admin\.openclaw\workspace\gate_page\tiktok_logo.png"
if (Test-Path $src) {
    Copy-Item $src $dst
    Write-Output "copied $((Get-Item $src).Length) bytes"
} else {
    Write-Output "not found at $src"
    # try find in temp
    $found = Get-ChildItem "$env:TEMP\*24543*" -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($found) {
        Copy-Item $found.FullName $dst
        Write-Output "found in temp: $($found.FullName)"
    } else {
        Write-Output "not found anywhere"
    }
}
