#!/bin/bash

# Define the URL and the output filename
URL="https://github.com/sookmax/mecab-ko-dic-2.1.1-20180720/releases/download/matrix-def-upload/matrix.def"
OUTPUT="matrix.def"

echo "Downloading $OUTPUT..."

if [ -f "$OUTPUT" ]; then
    # -L follows redirects
    # -o specifies the output file name
    # --progress-bar shows a simple progress meter
    # The -z (or --time-cond) flag tells curl to only download the file if the remote version is newer than the local one.
    curl -L -z "$OUTPUT" "$URL" -o "$OUTPUT" --progress-bar
else
    # -L follows redirects
    # -o specifies the output file name
    # --progress-bar shows a simple progress meter
    curl -L "$URL" -o "$OUTPUT" --progress-bar
fi

if [ $? -eq 0 ]; then
    echo "Download complete."
else
    echo "Error: Download failed."
    exit 1
fi