#!/bin/bash

# Variables
location="$HOME/.config/Code/User"
settings="settings.json"
backup="settings.json_$(date +"%Y%m%d_%H%M%S")"

# Backup existing settings
[ ! -d $location/backup ] && mkdir $location/backup

echo "Backing up to $location/backup/$backup."
mv $location/$settings $location/backup/$backup

# Echo size of the folder to make user aware of any space issues
echo "Size of backup folder:"
du -sh $location/backup

# Copy over our new settings
echo "Copying new settings."
cp $settings $location/$settings

echo "All done!"
