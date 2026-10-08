database_name=npx_schema_prototype

reload: down up

up:
	createdb ${database_name}
	psql ${database_name} < schema.sql
	psql ${database_name} < data.sql

down:
	dropdb ${database_name}
