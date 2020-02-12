# Settings
A repo to store my personal application settings.

# VS Code
Only for global settings.

The scripts found in the `vscode` folder will create a backup directory within your VS Code settings directory, move and rename the existing file to `settings.json_YYYYMMDD-HHMMSS` and copy the new `settings.json` in place of the old settings file.

Extensions need to be installed manually as it stands.

It will report on the size of the backup directory so it doesn't cause problems since it doesn't do anything fancy in regards to checking if the files are the same, or deleting backups older than a given date.

## Windows
Run `vscode/copy.bat` to copy the `settings.json` to VS Code settings directory.

Run `vscode/update.bat` to grab `settings.json` from VS Code settings directory, and upload it to this GitHub repository.

## Linux
Run `vscode/copy.sh` to copy the `settings.json` to VS Code settings directory.

Run `vscode/update.sh` to grab `settings.json` from VS Code settings directory, and upload it to this GitHub repository.

## Mac
Nope.

## Locations:

* Windows: `%APPDATA%\Code\User\settings.json`
* Linux: `$HOME/.config/Code/User/settings.json`
* Mac: `$HOME/Library/Application Support/Code/User/settings.json`