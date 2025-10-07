#!/bin/bash
# Skript tõmbab GitHubist muudatused harult 'linux' ja uuendab Apache2 kausta

export HOME=/home/maetam

DEV_DIR="/home/maetam/Desktop/development"
WEB_DIR="/var/www/html"

# Mine arenduskausta
cd "$WEB_DIR"

# Git pull harult 'linux'
git fetch --all
git reset --hard origin/main
cp linux/* /var/www/html
# Kopeeri failid Apache2 kausta


# Reload Apache2, et muudatused jõustuks
sudo systemctl reload apache2

LOG="/home/maetam/Desktop/development/git_pull.log"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Git pull ja Apache2 uuendus tehtud" >> "$LOG"

