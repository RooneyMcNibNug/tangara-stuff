#!/bin/bash

find ./*/* -name "*.flac" -exec sh -c 'metaflac --list "$1" | grep -q "ALBUMARTIST" || echo "$1"' _ {} \;

echo "Time to fix this metadata for the files above."
