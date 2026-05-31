#!/usr/bin/env bash
set -euo pipefail
# usage install.sh 04_umami

if [ "$argument_count" -ne 1 ]; then
    echo "please pass 1 and just 1 input after this file"
else
    echo "selected: $1"
fi

FOLDER = $1

REPO_URL_PREFIX = "https://raw.githubusercontent.com/LeanderZiehm/docker-compose-templates/main"

REPO_FOLDER_URL = "$REPO_URL_PREFIX/$FOLDER"

echo "==> Creating install directory: $FOLDER"
mkdir -p "$FOLDER"
cd "$FOLDER"

echo "==> Downloading compose + env scripts"

curl -fsSL "$REPO_FOLDER_URL/docker-compose.yml" -o docker-compose.yml
curl -fsSL "$REPO_FOLDER_URL/create_env.sh" -o create_env.sh

chmod +x create_env.sh

echo "==> Generating .env using create_env.sh"

if [ ! -f .env ]; then
  ./create_env.sh
else
  echo "==> .env already exists, skipping generation"
fi

echo "==> Detecting Compose runtime"

if docker compose version >/dev/null 2>&1; then
  COMPOSE_CMD="docker compose"
elif podman compose version >/dev/null 2>&1; then
  COMPOSE_CMD="podman compose"
else
  echo "ERROR: Neither docker compose nor podman compose found."
  exit 1
fi

echo "==> Using: $COMPOSE_CMD"

echo "==> Starting Compose stack"
$COMPOSE_CMD up -d

echo ""
echo "==============================="
echo " Compose stack installed"
echo " Directory: $FOLDER"
echo "==============================="
echo ""
echo "Stop:"
echo "  cd $FOLDER && $COMPOSE_CMD down"
echo ""
echo "Logs:"
echo "  cd $FOLDER && $COMPOSE_CMD logs -f"
