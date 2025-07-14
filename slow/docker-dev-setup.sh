#!/bin/bash

echo "📦 Setting up Laravel Docker Dev..."

cp .env.docker .env

docker-compose -f docker-compose.dev.yml up -d --build

echo "🚀 Installing dependencies..."
docker exec -it slow-dev-app composer install
docker exec -it slow-dev-app php artisan key:generate
docker exec -it slow-dev-app php artisan migrate
docker exec -it slow-dev-app php artisan storage:link

echo "✅ Setup complete. Access project at http://localhost:8000"
