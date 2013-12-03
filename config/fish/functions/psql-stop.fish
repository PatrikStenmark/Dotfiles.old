function psql-stop --description "stop postgresql"
    pg_ctl -D /usr/local/var/postgres stop
end
