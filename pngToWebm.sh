#!/bin/bash

# Check if a directory argument is provided
if [ -z "$1" ]; then
    echo "Please provide a directory containing PNG images."
    exit 1
fi

# Change to the specified directory
cd "$1" || exit

# Get the directory name to use as the base filename and replace spaces with underscores
dirname=$(basename "$1" | tr ' ' '_')

# Initialize the counter and filename
counter=0
output_filename="${dirname}.webm"

# Increment the filename if it already exists
while [ -f "$output_filename" ]; do
    let counter+=1
    output_filename="${dirname}_${counter}.webm"
done

# Check if the --high flag is set
if [ "$2" == "--high" ]; then
    echo "High quality mode enabled."
    ffmpeg -framerate 30 -i %04d.png -c:v libvpx-vp9 -b:v 0 -crf 10 -cpu-used 0 -pix_fmt yuva420p "$output_filename"
else
    ffmpeg -framerate 30 -i %04d.png -c:v libvpx-vp9 -pix_fmt yuva420p "$output_filename"
fi

echo "Conversion complete. The video is saved as $output_filename."
