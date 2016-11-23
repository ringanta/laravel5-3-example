#!/bin/bash

set -e

mv .env.example .env
php artisan key:generate
touch database/database.sqlite
php artisan migrate --seed
php artisan vendor:publish
exec php artisan serve --host=0.0.0.0
