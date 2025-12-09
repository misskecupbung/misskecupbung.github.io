#!/bin/bash

# Generate PDF thumbnails for talks
# Requires: ImageMagick (brew install imagemagick) and Ghostscript (brew install ghostscript)

SLIDES_DIR="assets/slides"
THUMBS_DIR="assets/img/talks"

# Create thumbnails directory if it doesn't exist
mkdir -p "$THUMBS_DIR"

echo "Generating thumbnails for PDF slides..."

for pdf in "$SLIDES_DIR"/*.pdf; do
    if [ -f "$pdf" ]; then
        filename=$(basename "$pdf" .pdf)
        thumb="$THUMBS_DIR/${filename}.png"
        
        if [ ! -f "$thumb" ] || [ "$pdf" -nt "$thumb" ]; then
            echo "Processing: $filename"
            # Convert first page of PDF to PNG thumbnail (300px width)
            magick -density 150 "${pdf}[0]" -resize 400x -quality 90 "$thumb"
        else
            echo "Skipping (up to date): $filename"
        fi
    fi
done

echo "Done! Thumbnails saved to $THUMBS_DIR"
