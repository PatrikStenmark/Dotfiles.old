function psql-start --description "start postgresql"
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
end
