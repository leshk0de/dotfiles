import json
import os


from google.cloud import bigquery

PROJECT_ID = "project_ID_goes_here"
DATASET = "dataset_name_goes_here"
TABLE_NAME = "test-03"
OUTPUT_FILE_NAME = "temp_schema.json"

# Get the directory of the current script
script_dir = os.path.dirname(os.path.abspath(__file__))

client = bigquery.Client()

# Define the existing table and the new table
existing_table_id = f"{PROJECT_ID}.{DATASET}.{TABLE_NAME}"

# Get the schema from the existing table
table = client.get_table(existing_table_id)  # Make an API request.
schema = table.schema

# Convert schema to a JSON-serializable format
schema_json = [field.to_api_repr() for field in schema]

# Convert the JSON data to a string first
schema_json_str = json.dumps(schema_json, indent=2)
num_bytes = len(schema_json_str.encode('utf-8'))

# Save this schema JSON to a file
OUTPUT_FILE = os.path.join(script_dir, OUTPUT_FILE_NAME)
with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
    f.write(schema_json_str)

print(f"{num_bytes} bytes were written to {OUTPUT_FILE}")

