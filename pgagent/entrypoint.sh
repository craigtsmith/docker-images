#!/bin/bash
# entrypoint.sh

# Construct the base connection string
conn_str="hostaddr=${PGHOST} port=${PGPORT} dbname=${PGDATABASE} user=${PGUSER}"

# Check if PGPASSWORD is provided
if [ -n "${PGPASSWORD}" ]; then
    conn_str="${conn_str} password=${PGPASSWORD}"
fi

# Start pgAgent with the connection string
exec pgagent -f $conn_str
