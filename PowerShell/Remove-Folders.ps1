# Remove some unnecessary folders in user's home directory

$list = @("Documents", "Music", "Saved Games", "Vidoes")
$width = ($list | Measure-Object -Property Length -Maximum).Maximum

Write-Host -Object "`n"

foreach ($folder in $list) {
    $path = "$HOME\$folder"

    if (Test-Path -Path $path) {
        Remove-Item -Path $path -Recurse -Force
        if ($?) {
            Write-Host -Object $folder.PadRight($width), ": remove success"
        }
        else {
            Write-Host -Object $folder.PadRight($width), ": remove failed" -ForegroundColor Red
        }
    }
    else {
        Write-Host -Object $folder.PadRight($width), ": not found"
    }
}

Write-Host -Object "`n"