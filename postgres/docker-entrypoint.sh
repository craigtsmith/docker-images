#!/bin/bash
# docker-entrypoint.sh

# Start supervisord in the background
/usr/bin/supervisord &

# Call the original entrypoint script from the official Postgres image
exec docker-entrypoint.sh "$@"
