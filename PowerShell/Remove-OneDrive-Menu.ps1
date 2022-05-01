# Remove OneDrive menu on Desktop

$path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\ FileSyncEx"
$item = "FileSyncEx"

Write-Host -Object "`n"

if (Test-Path -Path $path) {
    Remove-Item -Path $path -Recurse
    if ($?) {
        Write-Host -Object "${item}: remove success"
    }
    else {
        Write-Host -Object "${item}: remove failed" -ForegroundColor Red
    }
}
else {
    Write-Host -Object "${item}: not found"
}

Write-Host -Object "`n"