#!/usr/bin/env bash
# exit on error
set -o errexit

# Create and activate virtual environment
python -m venv .venv
source .venv/bin/activate

# Create necessary directories
mkdir -p staticfiles
mkdir -p media

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Run migrations
python manage.py makemigrations
python manage.py migrate 

# Create superuser
DJANGO_SUPERUSER_PASSWORD=test12345 DJANGO_SUPERUSER_EMAIL=f.kinuthia01@gmail.com DJANGO_SUPERUSER_USERNAME=frank python manage.py createsuperuser --noinput

# Remove the runserver command - Render will use the start command from render.yaml instead