#!/usr/bin/env bash
set -euo pipefail

REPO_RAW_BASE="https://raw.githubusercontent.com/LeanderZiehm/docker-compose-templates/main/00_wordpress"

APP_DIR="${APP_DIR:-$HOME/wordpress-stack}"

echo "==> Creating install directory: $APP_DIR"
mkdir -p "$APP_DIR"
cd "$APP_DIR"

echo "==> Downloading docker-compose.yml"
curl -fsSL "$REPO_RAW_BASE/docker-compose.yml" -o docker-compose.yml

echo "==> Downloading .env.example"
curl -fsSL "$REPO_RAW_BASE/.env.example" -o .env.example

if [ ! -f .env ]; then
  echo "==> Creating .env from template"
  cp .env.example .env
else
  echo "==> .env already exists, skipping"
fi

echo "==> Detecting Docker / Podman Compose"

if docker compose version >/dev/null 2>&1; then
  COMPOSE_CMD="docker compose"
elif podman compose version >/dev/null 2>&1; then
  COMPOSE_CMD="podman compose"
else
  echo "ERROR: Neither docker compose nor podman compose found."
  exit 1
fi

echo "==> Using: $COMPOSE_CMD"

echo "==> Starting stack"
$COMPOSE_CMD up -d

echo ""
echo "==============================="
echo " WordPress stack is running"
echo " Directory: $APP_DIR"
echo "==============================="
echo ""
echo "To stop:"
echo "  cd $APP_DIR && $COMPOSE_CMD down"
echo ""
echo "To view logs:"
echo "  cd $APP_DIR && $COMPOSE_CMD logs -f"
