#!/usr/bin/env bash
set -euo pipefail

cd /root/library

# Check if the container already exists and remove it
if [ "$(docker ps -aq -f name=mesh-library-app)" ]; then
    docker rm -f mesh-library-app
fi

# Start the Docker container
echo "Starting the mesh-library-app container..."
docker run -d -p 3000:3000 \
  --name mesh-library-app \
  --env-file .env \
  -v /root/library/custom:/usr/src/app/custom \
  mesh-library-app