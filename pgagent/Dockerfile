FROM postgres:14

# Install pgAgent for job scheduling, dnsutils for network debugging, and PostgreSQL client tools
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    dnsutils \
    postgresql-client-14 \
    && rm -rf /var/lib/apt/lists/*

# Set default environment variables for PostgreSQL connection
# These can be overridden when running the container
ENV PGPORT=5432
ENV PGUSER=postgres
ENV PGDATABASE=postgres

# Copy the entrypoint script to the container and set executable permissions
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint script that starts pgAgent
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
