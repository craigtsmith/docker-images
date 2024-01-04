#!/bin/bash
# entrypoint.sh

echo "Starting pgAgent with the following environment variables:"
echo "PGHOST=${PGHOST}"
echo "PGPORT=${PGPORT}"
echo "PGDATABASE=${PGDATABASE}"
echo "PGUSER=${PGUSER}"
echo "PGPASSWORD set: $([ -n "${PGPASSWORD}" ] && echo "yes" || echo "no")"

# Attempt to resolve the hostname to ensure network connectivity
echo "Attempting to resolve the hostname ${PGHOST}"
if host "${PGHOST}"; then
    echo "Hostname ${PGHOST} resolved successfully."
else
    echo "Failed to resolve hostname ${PGHOST}."
    exit 1
fi

# Resolve the IP address from the hostname
PGHOST_IP=$(getent hosts $PGHOST | awk '{ print $1 }')

# Check if the resolution was successful
if [ -z "$PGHOST_IP" ]; then
    echo "Failed to resolve the IP address for $PGHOST"
    exit 1
else
    echo "Resolved $PGHOST to IP: $PGHOST_IP"
fi

# Attempt a simple connection to PostgreSQL to ensure connectivity
echo "Attempting to connect to PostgreSQL at ${PGHOST}:${PGPORT}"
if pg_isready -h "${PGHOST}" -p "${PGPORT}" -d "${PGDATABASE}" -U "${PGUSER}"; then
    echo "Connection to PostgreSQL at ${PGHOST}:${PGPORT} successful."
else
    echo "Failed to connect to PostgreSQL at ${PGHOST}:${PGPORT}."
    exit 1
fi

# Construct the base connection string
conn_str="hostaddr=${PGHOST_IP} port=${PGPORT} dbname=${PGDATABASE} user=${PGUSER}"

# Check if PGPASSWORD is provided and append it to the connection string
if [ -n "${PGPASSWORD}" ]; then
    conn_str="${conn_str} password=${PGPASSWORD}"
fi

echo "Final connection string: $conn_str"

# Start pgAgent with the connection string and log at debug level
exec pgagent -f -l 2 $conn_str
