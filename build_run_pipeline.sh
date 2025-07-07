#!/usr/bin/env bash
set -euo pipefail

cd /root/library

# Remove the previous image
docker stop mesh-library-app
docker rm mesh-library-app

# Rebuild the Docker image
# docker build --no-cache -t mesh-library-app .

docker run -d -p 3000:3000 \
  --name mesh-library-app \
  --env-file .env \
  -v /root/library/custom:/usr/src/app/custom \
  mesh-library-app