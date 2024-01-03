FROM postgres:14

# Update the package list and install pgAgent
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    && rm -rf /var/lib/apt/lists/*