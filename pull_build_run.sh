#!/usr/bin/env bash
set -euo pipefail

cd /root/library

# pull newest code changes
git reset --hard HEAD
git pull origin main

# change permissions after pulling newest files
chmod +x /root/library/*.sh

# Check if the container already exists and remove it
if [ "$(docker ps -aq -f name=mesh-library-app)" ]; then
    docker stop mesh-library-app
    docker rm mesh-library-app
fi

# Rebuild the Docker image
docker build -t mesh-library-app .

# Start the Docker container
echo "Starting the mesh-library-app container..."
docker run -d -p 3000:3000 \
  --name mesh-library-app \
  --restart always \
  --env-file .env \
  -v /root/library/custom:/usr/src/app/custom \
  mesh-library-app