#!/bin/bash

echo "📦 Setting up Laravel Docker Dev..."

# Salin konfigurasi environment khusus Docker
cp .env.docker .env

# Jalankan dan build container untuk development
docker-compose -f docker-compose.dev.yml up -d --build

echo "🚀 Installing dependencies in container..."
docker exec -it slow-dev-app composer install
docker exec -it slow-dev-app php artisan key:generate
docker exec -it slow-dev-app php artisan migrate
docker exec -it slow-dev-app php artisan storage:link

echo ""
echo "✅ Setup complete!"
echo "🌐 Access your Laravel app at: http://localhost:8001"
