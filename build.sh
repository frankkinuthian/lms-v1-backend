#!/usr/bin/env bash
# exit on error
set -o errexit

# Create necessary directories
# mkdir -p staticfiles
# mkdir -p media

# Install dependencies
pip install -r requirements.txt

# Collect static files
# python manage.py collectstatic --no-input --clear


# Run migrations
python manage.py makemigrations
python manage.py migrate 

# Create superuser
python manage.py createsuperuser --no-input --username frank --email f.kinuthia01@gmail.com --password test12345 --password test12345

# Run server
python manage.py runserver