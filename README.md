
bash script to convert a CSV file with headers into JSON using `awk` and `jq`. This script assumes that `jq` is installed on your system.

### Usage
1. Save this script as `csv_to_json.sh` and make it executable:
   ```bash
   chmod +x csv_to_json.sh
   ```
2. Run the script with your CSV file as input:
   ```bash
   ./csv_to_json.sh input.csv output.json
   ```

### Explanation
1. **Header Extraction**: The `head -n 1` command gets the first row, which serves as JSON keys.
2. **Loop Through Rows**: Each row (excluding the header) is read and converted into JSON format.
3. **Field Parsing**: Fields are escaped using `jq -R .` for safe JSON encoding.
4. **File Output**: The script writes each row to the JSON file in the correct format.

This script will create a JSON array in `output.json`, formatted similarly to the Python example. Adjust file paths as needed.
