FROM mysql:5.6

COPY init_databases.sh /docker-entrypoint-initdb.d/
