#!/bin/bash

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker network create app-network 2>/dev/null || echo "network exists"

# Pull latest changes for each service
echo "📥 Pulling latest code for el2"
cd "el2"
git pull
echo "🔧 Building and starting el2"
docker compose up --build -d
cd ..

echo "📥 Pulling latest code for elearning"
cd "elearning"
git pull
echo "🔧 Building and starting elearning"
docker compose up --build -d
cd ..

echo "📥 Pulling latest code for nginx"
cd "nginx"
git pull
echo "🌐 Starting nginx reverse proxy..."
docker compose up --build -d
cd ..

echo "✅ All services are up!"
