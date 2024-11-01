# bash_csv_to_json
bash script to convert a CSV file with headers into JSON using awk and jq.
This script assumes that jq is installed on your system.

# Usage
Save this script as csv_to_json.sh and make it executable:
chmod +x csv_to_json.sh

Run the script with your CSV file as input:
./csv_to_json.sh input.csv output.json

Explanation
Header Extraction: The head -n 1 command gets the first row, which serves as JSON keys.
Loop Through Rows: Each row (excluding the header) is read and converted into JSON format.
Field Parsing: Fields are escaped using jq -R . for safe JSON encoding.
File Output: The script writes each row to the JSON file in the correct format.
This script will create a JSON array in output.json, formatted similarly to the Python example. Adjust file paths as needed.
