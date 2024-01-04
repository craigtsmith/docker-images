# Start from the official PostgreSQL image as it contains the necessary PostgreSQL client utilities
FROM postgres:14

# Install pgAgent
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script to the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
