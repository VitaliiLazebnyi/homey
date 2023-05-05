#!/usr/bin/env bash

## Precompile assets
#bundle exec rake assets:precompile

# Wait for database to be ready
until nc -z -v -w30 $HOMEY_DATABASE_HOST $HOMEY_DATABASE_PORT; do
 echo 'Waiting for PostgreSQL...'
 sleep 1
done
echo "PostgreSQL is up and running!"

# If the database exists, migrate. Otherwise setup (create and migrate)
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:create db:migrate
echo "PostgreSQL database has been created & migrated!"

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Run the Rails server
bundle exec rails server -b 0.0.0.0 -p 8080