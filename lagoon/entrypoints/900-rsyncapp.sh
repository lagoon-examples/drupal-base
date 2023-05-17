#!/bin/sh

# copy from the image backup location to the volume mount

echo "Creating /shadowapp if it doesn't exist"
mkdir -p /shadowapp
echo "Synchronizing vendor files..."
rsync -a --stats /app/* /shadowapp/
echo "Synchronized vendor files"
