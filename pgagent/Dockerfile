FROM postgres:14

# Install pgAgent, dnsutils for network debugging, and PostgreSQL client tools
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    dnsutils \
    postgresql-client-14 \
    && rm -rf /var/lib/apt/lists/*

# Copy your scripts and set permissions
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
