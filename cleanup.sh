#!/bin/bash

# Remove specific block types from all FLAC files in subdirectories
metaflac --remove --block-type=PICTURE,PADDING --dont-use-padding ./*/*.flac

# Find and remove all files that are not FLAC, MP3, or M4A
find ./*/* -type f ! -name "*.flac" ! -name "*.mp3" ! -name "*.playlist" -exec sh -c 'echo "Deleting: $1"; rm -f "$1"' _ {} \;

echo "Cleanup is complete - enjoy your tunes!"
