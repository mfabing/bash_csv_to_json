#!/bin/bash

# Check if the required commands are available
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required. Install it with 'sudo apt-get install jq' or your package manager."
    exit 1
fi

# Check if a CSV file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 input.csv [output.json]"
    exit 1
fi

# Input and output file paths
csv_file="$1"
json_file="${2:-output.json}"

# Read the header (first row) of the CSV file to get column names
header=$(head -n 1 "$csv_file")
IFS=',' read -ra headers <<< "$header"

# Convert CSV to JSON line by line
echo "[" > "$json_file"
tail -n +2 "$csv_file" | while IFS=',' read -ra fields; do
    echo "{" >> "$json_file"
    for i in "${!headers[@]}"; do
        # Escape any special characters in field values
        field_value=$(echo "${fields[i]}" | jq -R .)
        echo "    \"${headers[i]}\": $field_value" >> "$json_file"
        # Add a comma after each field except the last one
        [ "$i" -lt $((${#headers[@]} - 1)) ] && echo "," >> "$json_file"
    done
    echo -n "}" >> "$json_file"
    # Add a comma after each row except the last one
    read -r _ && echo "," >> "$json_file" || echo "" >> "$json_file"
done
echo "]" >> "$json_file"

echo "Conversion complete! JSON output saved to $json_file"
