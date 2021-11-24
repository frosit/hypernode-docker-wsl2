#!/bin/bash
# Installs jetbrains toolbox

set -e

if [ -d ~/.local/share/JetBrains/Toolbox ]; then
    echo "JetBrains Toolbox is already installed!"
    exit 0
fi

if [ -f /data/web/bin/jetbrains-toolbox ]; then
    echo "JetBrains Toolbox binary is already installed!"
    exit 0
fi

echo "Start installation..."

wget --show-progress -qO ./toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"

TOOLBOX_TEMP_DIR=$(mktemp -d)

tar -C "$TOOLBOX_TEMP_DIR" -xf toolbox.tar.gz
rm ./toolbox.tar.gz

cp "$TOOLBOX_TEMP_DIR"/*/jetbrains-toolbox /data/web/.wsl/bin/

rm -r "$TOOLBOX_TEMP_DIR"

echo "JetBrains Toolbox was successfully installed!"