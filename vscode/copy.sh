#!/bin/bash

# Includes
source "../common.sh"

# Variables
vscode_dir="$HOME/.config/Code/User"
settings="settings.json"
settings_backup=$settings"_$(date +"%Y%m%d_%H%M%S")"
keybindings="keybindings.json"
keybindings_backup=$keybindings"_$(date +"%Y%m%d_%H%M%S")"

# If no backup folder exists, create it
[ ! -d $vscode_dir/backup ] && mkdir $vscode_dir/backup

# Backup existing settings & keybindings
echo $text_bold"Backing up settings & keybindings..."$text_normal

echo "$vscode_dir/backup/$settings_backup"
[ -f $vscode_dir/$settings ] && mv $vscode_dir/$settings $vscode_dir/backup/$settings_backup

echo "$vscode_dir/backup/$keybindings_backup"
[ -f $vscode_dir/$keybindings ] && mv $vscode_dir/$keybindings $vscode_dir/backup/$keybindings_backup

echo -e $color_green"Backup complete."$color_reset

# Echo size of the folder to make user aware of any space issues
echo $text_bold"Size of backup folder:"$text_normal
du -sh $vscode_dir/backup

# Copy over our new settings & keybindings
echo "Copying new settings..."
[ -f $settings ] && cp $settings $vscode_dir/$settings

echo "Copying new keybindings..."
[ -f $keybindings ] && cp $keybindings $vscode_dir/$keybindings

echo -e $color_green"All done!"$color_reset
