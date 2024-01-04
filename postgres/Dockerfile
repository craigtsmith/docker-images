FROM postgres:14

# Install pgAgent
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    && rm -rf /var/lib/apt/lists/*

# Copy the pgAgent startup script
COPY start-pgagent.sh /usr/local/bin/start-pgagent.sh
RUN chmod +x /usr/local/bin/start-pgagent.sh

# Custom script that starts PostgreSQL and then pgAgent
COPY docker-entrypoint-extension.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint-extension.sh

# Set the custom script as the entrypoint
ENTRYPOINT ["docker-entrypoint-extension.sh"]
