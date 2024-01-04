#!/bin/bash
set -e

# Call the original entrypoint script to start PostgreSQL
docker-entrypoint.sh postgres &

# Wait for PostgreSQL to become available
while ! pg_isready -h localhost -U postgres; do
    sleep 1
done

# Now start pgAgent
/usr/local/bin/start-pgagent.sh
