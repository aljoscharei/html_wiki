#!/bin/bash

# Set the base directory and output directory
base_dir="Players_FlohFelixAljoscha"
output_dir="./output-dir"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Recursively find all .md files in the base directory
find "$base_dir" -type f -name "*.md" | while read -r file; do

# Get the filename without the directory and extension
filename=$(basename "$file" .md)

# Prepend a primary markdown heading (H1) to the file
# Use a proper method to ensure newline is handled correctly on macOS
echo "# $filename" | cat - "$file" > temp && mv temp "$file"

# Convert the file to HTML using pandoc
pandoc "$file" -M document-css=false -o "$output_dir/$filename.html"
  
echo "Processed $file -> $output_dir/$filename.html"

done
