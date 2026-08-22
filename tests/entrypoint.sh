#!/usr/bin/env bash
set -u
export USER="${USER:-$(id -un)}"

# first use of the nix cache volume leaves /nix root-owned;
# single-user nix install needs it writable by tester
if [ -d /nix ] && [ ! -w /nix ]; then
  sudo chown -R "$(id -u):$(id -g)" /nix
fi

cd ~/dotfiles || exit 1

echo "===== PASS 1: fresh install ====="
./install.sh || exit 1

echo "===== PASS 2: idempotency ====="
./install.sh || exit 1

echo "===== assertions ====="
# make nix-installed binaries visible to this shell
[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && . "$HOME/.nix-profile/etc/profile.d/nix.sh"

fail=0

for b in zsh nvim tmux stow fzf rg bat make gcc direnv yarn git; do
  command -v "$b" >/dev/null 2>&1 || { echo "MISSING binary: $b"; fail=1; }
done

for f in ~/.zshrc ~/.tmux.conf; do
  target="$(readlink "$f" 2>/dev/null)" || target=""
  case "$target" in
    dotfiles/*) ;;
    *) echo "BAD symlink: $f -> ${target:-<none>}"; fail=1 ;;
  esac
done

zsh_bin="$(command -v zsh)"
count="$(grep -cxF "$zsh_bin" /etc/shells)"
[ "$count" = "1" ] || { echo "/etc/shells zsh entries = $count (want 1)"; fail=1; }

login_shell="$(getent passwd tester | cut -d: -f7)"
[ "$login_shell" = "$zsh_bin" ] || { echo "login shell = $login_shell (want $zsh_bin)"; fail=1; }

if [ "$fail" = 0 ]; then
  echo "ALL CHECKS PASSED"
else
  echo "CHECKS FAILED"
fi

if [ "${KEEP_CONTAINER:-0}" = "1" ]; then
  name="${CONTAINER_NAME:-this container}"
  echo "Keeping container alive. Inspect with:"
  echo "  docker exec -it $name bash -l       # shell as tester (nix on PATH)"
  echo "  docker exec -u root -it $name bash  # shell as root"
  echo "Remove later with: docker rm -f $name (or just re-run ./tests/run.sh)"
  exec sleep infinity
fi

[ "$fail" = 0 ] || exit 1
