# Use the official PostgreSQL 14 image as the base
FROM postgres:14

# Update the package list and install pgAgent and other required tools
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    && rm -rf /var/lib/apt/lists/*