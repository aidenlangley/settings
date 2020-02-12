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
keybindings="keybindings.json"

echo "Backing up settings..."
[ -f $settings ] && mv $settings $settings.bak

echo "Backing up keybindings..."
[ -f $keybindings ] && mv $keybindings $keybindings.bak

echo "Copying new settings..."
[ -f $vscode_dir/$settings ] && cp $vscode_dir/$settings $settings

echo "Copying new keybindings..."
[ -f $vscode_dir/$keybindings ] && cp $vscode_dir/$keybindings $keybindings

# Stage, commit and push to master
echo "Pushing to git repo..."
[ -f $settings ] && git add $settings
[ -f $keybindings ] && git add $keybindings
git commit -m "New files"
git push

echo -e $color_green"All done!"$color_reset
