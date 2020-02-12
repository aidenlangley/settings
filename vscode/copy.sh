#!/bin/bash
if [[ $PWD != *"settings/vscode" ]]
then
    echo -e "\e[1;31mRun me from inside of settings/vscode!\e[1;0m"
    exit 0
fi

# Includes
source "../common.sh"

# Variables
vscode_dir="$HOME/.config/Code/User"
settings="settings.json"
settings_backup="settings_$(date +"%Y%m%d_%H%M%S").json"
keybindings="keybindings.json"
keybindings_backup="keybindings_$(date +"%Y%m%d_%H%M%S").json"

# Pull changes from git repo
echo "Pulling from git repo..."
git pull

# If no backup folder exists, create it
[ ! -d $vscode_dir/backup ] && mkdir $vscode_dir/backup

# Backup existing settings & keybindings
echo $text_bold"Backing up settings & keybindings..."$text_reset

backup_path="$vscode_dir/backup/$settings_backup"
echo -e $color_yellow$backup_path$color_reset
[ -f $vscode_dir/$settings ] && mv $vscode_dir/$settings $backup_path

backup_path="$vscode_dir/backup/$keybindings_backup"
echo -e $color_yellow$backup_path$color_reset
[ -f $vscode_dir/$keybindings ] && mv $vscode_dir/$keybindings $backup_path

echo -e $color_green"Backup complete."$color_reset

# Echo size of the folder to make user aware of any space issues
echo $text_bold"Size of backup folder:"$text_reset
du -sh $vscode_dir/backup

# Copy over our new settings & keybindings
echo "Copying new settings..."
[ -f $settings ] && cp $settings $vscode_dir/$settings

echo "Copying new keybindings..."
[ -f $keybindings ] && cp $keybindings $vscode_dir/$keybindings

echo -e $color_green"All done!"$color_reset
