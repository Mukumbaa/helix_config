$sourcePath = "C:\Users\gabry\AppData\Roaming\helix"

$destinationPath = Get-Location

$files = @("config.toml", "languages.toml")

foreach ($file in $files) {
    $sourceFile = Join-Path $sourcePath $file
    $destinationFile = Join-Path $destinationPath $file

    if (Test-Path $sourceFile) {
        Copy-Item -Path $sourceFile -Destination $destinationFile -Force
        Write-Host "Copied: $sourceFile -> $destinationFile"
    } else {
        Write-Host "File not found: $sourceFile"
    }
}

git add .
git commit -m "configs"
git push -u origin main
Write-Host "Pushed to git"
