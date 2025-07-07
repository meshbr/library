#!/usr/bin/env bash
set -euo pipefail

cd /root/library

docker run -d -p 3000:3000 \
  --name mesh-library-app \
  --env-file .env \
  -v /root/library/custom:/usr/src/app/custom \
  mesh-library-app