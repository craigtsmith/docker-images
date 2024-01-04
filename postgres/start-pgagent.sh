#!/bin/bash
# Start pgAgent as the postgres user
su - postgres -c "pgagent hostaddr=127.0.0.1 dbname=postgres user=postgres"
