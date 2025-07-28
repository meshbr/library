#!/usr/bin/env bash
set -euo pipefail

cd /root/library

# pull newest code changes
git reset --hard HEAD
git pull origin main

# change permissions after pulling newest files
chmod +x /root/library/*.sh

# Remove the previous image
docker stop mesh-library-app
docker rm mesh-library-app

# Rebuild the Docker image
docker build -t mesh-library-app .

docker run -d -p 3000:3000 \
  --name mesh-library-app \
  --restart always \
  --env-file .env \
  -v /root/library/custom:/usr/src/app/custom \
  mesh-library-app