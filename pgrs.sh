#!/usr/bin/env sh

psql -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public; GRANT ALL ON SCHEMA public TO $1;" $2 postgres
pg_restore -U postgres --no-password --role "$1" --dbname "$2" --schema public \
	--no-owner --no-privileges --no-comments -1 "$3"
