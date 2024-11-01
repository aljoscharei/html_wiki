#!/bin/bash

# Set the directory containing the HTML files
html_dir="Players_FlohFelixAljoscha_html"

# Set the path to the index.html in the parent directory
index_file="../index.html"

# Start by adding a section heading to the index.html (if needed)
echo -e "\n<h2>Links to Files</h2>\n<ul>" >> "$index_file"

# Loop over all .html files in the subdirectory
find "$html_dir" -type f -name "*.html" | while read -r file; do
  # Get the filename without the directory
  filename=$(basename "$file")

  # Append a link to the file in the index.html
  echo "<li><a href=\"$html_dir/$filename\">$filename</a></li>" >> "$index_file"
done

# Close the unordered list tag
echo "</ul>" >> "$index_file"

echo "Appended links to all .html files in $html_dir to $index_file"
