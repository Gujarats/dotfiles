#!/usr/bin/env bash

# stpo on error
set -euo pipefail
# move to the repo root
cd "$(dirname "$0")/.."

DOCKER_TTY=""
[ -t 0 ] && DOCKER_TTY="-it"

KEEP="${KEEP:-}"
[ "${1:-}" = "--keep" ] && KEEP=1

NAME="dotfiles-test-keep"

# remove leftover container from a previous --keep run
docker rm -f "$NAME" >/dev/null 2>&1 || true

RUN_OPTS=(--rm)
if [ "$KEEP" = "1" ]; then
  RUN_OPTS=(--name "$NAME" -e KEEP_CONTAINER=1 -e CONTAINER_NAME="$NAME")
fi

# build docker image with the specified Dockerfile
docker build \
  --build-arg TESTER_UID="$(id -u)" \
  --build-arg TESTER_GID="$(id -g)" \
  -t dotfiles-test \
  -f tests/Dockerfile .

# named volume caches the nix store between runs; delete to start fresh:
#   docker volume rm dotfiles-nix-cache
exec docker run "${RUN_OPTS[@]}" $DOCKER_TTY \
  -v "$PWD":/home/tester/dotfiles \
  -v dotfiles-nix-cache:/nix \
  dotfiles-test
