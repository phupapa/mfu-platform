#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker network create app-network 2>/dev/null || echo "network exists"
  
echo "🔧 Building and starting el2"
docker compose up --build -d 
echo "✅ el2 services are up!"
