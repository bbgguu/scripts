# Clear Run history

$path = "Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
$item = "Run"

Write-Host -Object "`n"

if (Test-Path -Path $path) {
    Remove-ItemProperty -Path $path -Name ?
    if ($?) {
        Write-Host -Object "${item}: clear success"
    }
    else {
        Write-Host -Object "${item}: clear failed" -ForegroundColor Red
    }
}
else {
    Write-Host -Object "${item}: not found" -ForegroundColor Red
}

Write-Host -Object "`n"