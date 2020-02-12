#!/bin/bash

# Includes
source "../common.sh"

# Variables
vscode_dir="$HOME/.config/Code/User"
backup_dir="$PWD/backup"
settings="settings.json"
keybindings="keybindings.json"

# Copy over our new settings
echo "Copying new settings..."
[ -f $vscode_dir/$settings ] && cp $vscode_dir/$settings $settings

# Copy over our new keybindings
echo "Copying new keybindings..."
[ -f $vscode_dir/$keybindings ] && cp $vscode_dir/$keybindings $keybindings

# Stage, commit and push to master
echo "Pushing to git repo..."
[ -f $settings ] && git add $settings
[ -f $keybindings ] && git add $keybindings
git commit -m "New files"
git push

echo -e $color_green"All done!"$color_reset
