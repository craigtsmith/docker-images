# Start from the official PostgreSQL image as it contains the necessary PostgreSQL client utilities
FROM postgres:14

# Install pgAgent
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    && rm -rf /var/lib/apt/lists/*

# Set the entrypoint to pgagent and pass the connection string as the argument
ENTRYPOINT ["pgagent"]
CMD ["-f", "hostaddr=${PGHOST} port=${PGPORT} dbname=${PGDATABASE} user=${PGUSER} password=${PGPASSWORD}"]