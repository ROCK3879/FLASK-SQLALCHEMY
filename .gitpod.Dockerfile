FROM gitpod/workspace-full

USER gitpod

# Install PostgreSQL
RUN sudo apt-get update && \
    sudo apt-get install -y wget gnupg2 lsb-release && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list && \
    sudo apt-get update && \
    sudo apt-get install -y postgresql-12 postgresql-client-12 && \
    sudo rm -rf /var/lib/apt/lists/*

# Ensure PostgreSQL is running
RUN sudo service postgresql start
