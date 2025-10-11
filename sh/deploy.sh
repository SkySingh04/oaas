#!/usr/bin/env bash
set -euo pipefail

# Usage: ./sh/deploy.sh user@pb-server /path/on/server
REMOTE=${1:-}
DEST=${2:-/opt/pb-obfuscator}

if [[ -z "$REMOTE" ]]; then
  echo "Usage: $0 user@host [/remote/path]"
  exit 1
fi

# Create remote directory
ssh "$REMOTE" "sudo mkdir -p $DEST && sudo chown -R \$USER:$USER $DEST"

# Rsync project files needed for deployment
rsync -az --delete \
  docker-compose.yml \
  cmd/llvm-obfuscator/Dockerfile.backend \
  cmd/llvm-obfuscator/requirements.txt \
  cmd/llvm-obfuscator/api \
  cmd/llvm-obfuscator/core \
  cmd/llvm-obfuscator/reports \
  cmd/llvm-obfuscator/frontend/Dockerfile.frontend \
  cmd/llvm-obfuscator/frontend/nginx.conf \
  cmd/llvm-obfuscator/frontend/package.json \
  cmd/llvm-obfuscator/frontend/package-lock.json \
  cmd/llvm-obfuscator/frontend/src \
  cmd/llvm-obfuscator/frontend/public \
  "$REMOTE:$DEST/"

# Build and start services on remote
ssh "$REMOTE" "cd $DEST && docker compose build && docker compose up -d"

echo "Deployment completed. Frontend on http://$REMOTE/"


