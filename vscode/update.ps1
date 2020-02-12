# Rudimentary error handling to ensure the script is run in the correct location
# to keep things tidy
$dir = Get-Location
if ($dir -notlike "*settings\vscode") {
    Write-Error "Run me from settings/vscode!"
    exit
}

# Variables
$vscode_dir = "$env:APPDATA\Code\User"
$settings = "settings.json"
$keybindings = "keybindings.json"

Write-Output "Backing up settings..."
if (Test-Path $settings -PathType Leaf) {
    Copy-Item $settings -Destination "$settings.bak"
}

Write-Output "Backing up keybindings..."
if (Test-Path $keybindings -PathType Leaf) {
    Copy-Item $keybindings -Destination "$keybindings.bak"
}

Write-Output "Copying new settings..."
if (Test-Path $vscode_dir\$settings -PathType Leaf) {
    Copy-Item $vscode_dir\$settings -Destination $settings
}

Write-Output "Copying new keybindings..."
if (Test-Path $vscode_dir\$keybindings -PathType Leaf) {
    Copy-Item $vscode_dir\$keybindings -Destination $keybindings
}

# Stage, commit and push to master
Write-Output "Pushing to git repo..."
if (Test-Path $settings -PathType Leaf) {
    git add $settings
}

if (Test-Path $keybindings -PathType Leaf) {
    git add $keybindings
}

git commit -m "New files"
git push

Write-Host "All done!" -ForegroundColor Green
