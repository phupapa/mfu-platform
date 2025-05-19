#!/bin/bash

# ================================
# 🔧 Configurable Ports
# ================================
PORTS_IN_USE=(5173 3306)

# ================================
# 🔥 Stop and remove all containers
# ================================
echo "🛑 Stopping and removing all containers..."
docker stop $(docker ps -aq) 2>/dev/null
docker rm $(docker ps -aq) 2>/dev/null

# ================================
# ⚔️ Kill processes using important ports
# ================================
for PORT in "${PORTS_IN_USE[@]}"; do
  PID=$(lsof -ti tcp:$PORT)
  if [ ! -z "$PID" ]; then
    echo "⚠️ Port $PORT is in use by PID $PID. Killing it..."
    kill -9 $PID
  else
    echo "✅ Port $PORT is free."
  fi
done

# ================================
# 🌐 Create Docker network if not exists
# ================================
echo "🔗 Ensuring Docker network exists: app-network"
docker network create app-network 2>/dev/null || echo "network exists"

# ================================
# 🚀 Pull, Build, and Run Services
# ================================
SERVICES=(el2 elearning nginx)

for SERVICE in "${SERVICES[@]}"; do
  echo ""
  echo "📥 Pulling latest code for $SERVICE"
  cd "$SERVICE" || { echo "❌ Directory $SERVICE not found!"; exit 1; }

  git pull || { echo "❌ Failed to pull $SERVICE"; exit 1; }

  echo "🔧 Building and starting $SERVICE"
  docker compose up --build -d || { echo "❌ Failed to build $SERVICE"; exit 1; }

  cd ..
done

echo ""
echo "✅ All services are up and running!"
