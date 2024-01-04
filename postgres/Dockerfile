FROM postgres:14

# Install pgAgent and supervisord
RUN apt-get update && apt-get install -y \
    postgresql-14-pgagent \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Copy supervisord configuration files
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]