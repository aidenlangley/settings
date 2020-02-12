# Rudimentary error handling to ensure the script is run in the correct location
# to keep things tidy
$dir = Get-Location
if ($dir -notlike "*settings\vscode") {
    Write-Error "Run me from settings/vscode"
    exit
}

# Variables
$vscode_dir = "$env:APPDATA\Code\User"
$settings = "settings.json"
$settings_backup = "settings_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".json"
$keybindings = "keybindings.json"
$keybindings_backup = "keybindings_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".json"

# Create backup directory if it doesn't exist
if (-not (Test-Path -LiteralPath "$vscode_dir\backup")) {
    New-Item -Path "$vscode_dir\backup" -ItemType Directory > $null
}

# Backup existing settings & keybindings
Write-Output "Backing up settings & keybindings..."

$backup_path = "$vscode_dir/backup/$settings_backup"
Write-Host $backup_path -ForegroundColor Yellow
if (Test-Path "$vscode_dir/$settings" -PathType Leaf) {
    Move-Item -Path "$vscode_dir/$settings" -Destination $backup_path
}

$backup_path = "$vscode_dir/backup/$keybindings_backup"
Write-Host $backup_path -ForegroundColor Yellow
if (Test-Path "$vscode_dir/$keybindings" -PathType Leaf) {
    Move-Item -Path "$vscode_dir/$keybindings" -Destination $backup_path
}

Write-Host "Backup complete." -ForegroundColor Green

Write-Output "Size of backup folder:"
"{0} MB" -f ((Get-ChildItem "$vscode_dir/backup" -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB)

# Copy over our new settings & keybindings
Write-Output "Copying new settings..."
if (Test-Path $settings -PathType Leaf) {
    Copy-Item $settings -Destination $vscode_dir\$settings
}

Write-Output "Copying new keybindings..."
if (Test-Path $keybindings -PathType Leaf) {
    Copy-Item $keybindings -Destination $vscode_dir\$keybindings
}

Write-Host "All done!" -ForegroundColor Green