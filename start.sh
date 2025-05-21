#!/bin/bash

MODE=$1

if [ -z "$MODE" ]; then
  echo "❗️ Please specify a mode: dev or prod"
  echo "Usage: ./start.sh dev | ./start.sh prod"
  exit 1
fi

# ✅ สร้าง shared Docker network ถ้ายังไม่มี
docker network create app-network 2>/dev/null || echo "🌐 Docker network 'app-network' already exists"

# 👉 เข้า elearning
echo "📥 Pulling latest code for elearning..."
cd elearning
git pull

if [ "$MODE" = "dev" ]; then
  echo "🚀 Building dev frontend..."
  cd Frontend
  npm install
  npm run build -- --mode dev
  cd ..
 
  echo "🧪 Starting development environment..."
  docker compose -f docker-compose.dev.yml up --build -d

  echo "📥 Pulling latest code for nginx..."
  cd ../nginx
  git pull
  docker compose -f docker-compose.dev.yml up --build -d

  echo -e "✅ \033[0;32mDev environment ready at: http://localhost/elearning\033[0m"

elif [ "$MODE" = "prod" ]; then
  echo "🚀 Building production frontend..."
  cd Frontend
  npm install
  npm run build -- --mode production
  cd ..

  echo "🔧 Starting backend + database..."
  docker compose -f docker-compose.prod.yml up --build -d

  echo "📥 Pulling latest code for nginx..."
  cd ../nginx
  git pull
  docker compose -f docker-compose.prod.yml up --build -d

  echo -e "✅ \033[0;32mProduction ready at: http://mymfu.doitung.net/elearning\033[0m"

else
  echo "❗️ Invalid mode: $MODE"
  echo "Usage: ./start.sh dev | ./start.sh prod"
  exit 1
fi
