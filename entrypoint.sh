#!/bin/sh
cd /app

# Collect static files
# echo "Collect static files"
pipenv run python manage.py collectstatic --noinput

# Apply database migrations
echo "\n\nApply database migrations."
pipenv run python manage.py migrate

# Start server
echo "Starting server"
/usr/bin/supervisord
