#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker network create app-network 2>/dev/null || echo "network exists"

echo "🔧 Building and starting el2"
cd "el2"
docker compose up --build -d
cd ..

echo "🔧 Building and starting elearning"
cd "elearning"
docker compose up --build -d
cd ..

echo "🌐 Starting nginx reverse proxy..."
cd nginx
docker compose up --build -d
cd ..

echo "✅ All services are up!"
