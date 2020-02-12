#!/bin/bash

# Variables
location="$HOME/.config/Code/User"
settings="settings.json"
backup="settings.json_$(date +"%Y%m%d_%H%M%S")"

# Backup existing settings
[ ! -d $PWD/backup ] && mkdir backup

echo "Backing up to $PWD/backup/$backup."
cp $settings $PWD/backup/$backup

# Echo size of the folder to make user aware of any space issues
echo "Size of backup folder:"
du -sh $PWD/backup

# Copy over our new settings
echo "Copying new settings."
cp $location/$settings $settings

# Stage, commit and push to master
echo "Pushing to git repo."
git add $settings
git commit -m "New settings"
git push

echo "All done!"
