#!/bin/bash
# Skript tõmbab GitHubist muudatused harult 'linux' ja uuendab Apache2 kausta

export HOME=/home/maetam

DEV_DIR="/home/maetam/Desktop/development"
WEB_DIR="/var/www/html"

# Mine arenduskausta
cd "$WEB_DIR" || exit

# Git pull harult 'linux'
git pull origin linux

# Kopeeri failid Apache2 kausta
sudo cp -r "$DEV_DIR"/* "$WEB_DIR"

# Reload Apache2, et muudatused jõustuks
sudo systemctl reload apache2

LOG="/home/maetam/Desktop/development/git_pull.log"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Git pull ja Apache2 uuendus tehtud" >> "$LOG"

