FROM postgres:14

# Install pgAgent and supervisord
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Copy supervisord configuration files
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the custom entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]

STOPSIGNAL SIGINT
EXPOSE 5432

# Default command: start the PostgreSQL server
CMD ["postgres"]
