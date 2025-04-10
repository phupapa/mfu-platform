docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

compose_command="docker-compose"

# Check if docker compose is installed as "docker compose"
if ! command -v docker-compose &>/dev/null && command -v docker &>/dev/null; then
    compose_command="docker compose"
fi

if $compose_command version &>/dev/null; then

    # ✅ Ensure the network exists
    network_name="app-network"
    if ! docker network ls --format '{{.Name}}' | grep -wq "$network_name"; then
        echo "🔧 Creating Docker network: $network_name"
        docker network create "$network_name"
    else
        echo "✅ Docker network '$network_name' already exists."
    fi

    if [[ $1 == "build" && $2 == "" ]]; then
        $compose_command -f docker-compose.yml up --build -d
    else
        $compose_command -f docker-compose.yml up -d
    fi
else
    echo "Error: Docker Compose not found. Please install Docker Compose."
    exit 1
fi
 