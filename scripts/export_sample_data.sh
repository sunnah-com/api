#!/bin/bash

ENV_FILE="../.env.prod_connect"
OUTPUT="sample_data.sql"
SAMPLE_SIZE=3

usage() {
    echo "Usage: $0 [-e <env_file>] [-o <output_file>] [-s <sample_size>]"
    echo ""
    echo "Options:"
    echo "  -e, --env-file       Path to the .env file (default: .env)"
    echo "  -o, --output         Output SQL file name (default: sample_data.sql)"
    echo "  -s, --sample-size    Number of rows to sample from each table (default: 10)"
    echo "  -h, --help           Display this help message"
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -e|--env-file)
            ENV_FILE="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT="$2"
            shift 2
            ;;
        -s|--sample-size)
            SAMPLE_SIZE="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown parameter: $1"
            usage
            ;;
    esac
done

if [ -f "$ENV_FILE" ]; then
    # Export variables from .env file into the environment
    export $(grep -v '^#' "$ENV_FILE" | xargs)
else
    echo "Environment file '$ENV_FILE' not found!"
    exit 1
fi

# Check for required variables
if [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_DATABASE" ]; then
    echo "Required environment variables (MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE) are not set in $ENV_FILE."
    exit 1
fi

# Set default host and port if not specified
MYSQL_HOST=${MYSQL_HOST:-"localhost"}
MYSQL_PORT=${MYSQL_PORT:-3306}

rm -f "$OUTPUT"

# Start the SQL file with disabling foreign key checks
echo "SET FOREIGN_KEY_CHECKS=0;" > "$OUTPUT"

# MySQL connection parameters
MYSQL_CONN="-u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOST -P$MYSQL_PORT"

# Get the list of tables
TABLES=$(mysql $MYSQL_CONN -e "SHOW TABLES IN \`$MYSQL_DATABASE\`" -s --skip-column-names)

for TABLE in $TABLES; do
    echo "Processing table $TABLE..."

    # Dump the table schema without tablespaces and without locking tables
    mysqldump $MYSQL_CONN --no-data --skip-lock-tables --no-tablespaces --skip-comments \
     "$MYSQL_DATABASE" "$TABLE" >> "$OUTPUT"

    # Dump sample data without locking tables and excluding GTIDs
    mysqldump $MYSQL_CONN --no-create-info --skip-triggers \
        --where="1 LIMIT $SAMPLE_SIZE" --skip-lock-tables --no-tablespaces --skip-comments \
        --set-gtid-purged=OFF "$MYSQL_DATABASE" "$TABLE" >> "$OUTPUT"
done

# Re-enable foreign key checks
echo "SET FOREIGN_KEY_CHECKS=1;" >> "$OUTPUT"

echo "Sample data exported to $OUTPUT"
