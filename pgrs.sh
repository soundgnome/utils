#!/usr/bin/env sh

if [ $# -lt 3 ]; then
    echo "Usage: pgrs [USER] [DATABASE] [FILE]"
    exit
fi


psql -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public; GRANT ALL ON SCHEMA public TO $1;" $2 postgres
pg_restore -U postgres --no-password --role "$1" --dbname "$2" --schema public \
	--no-owner --no-privileges --no-comments -1 "$3"
