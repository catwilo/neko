#!/usr/bin/env bash
# neko — install neko scripts to PATH
set -euo pipefail
REPO=$(cd "$(dirname "$0")" && pwd)

chmod +x "$REPO/neko.sh" "$REPO/addneko.sh" "$REPO/rmneko.sh" "$REPO/nekoyay.sh"
mkdir -p "$HOME/.local/bin"
ln -sf "$REPO/neko.sh"    "$HOME/.local/bin/neko"
ln -sf "$REPO/addneko.sh" "$HOME/.local/bin/addneko"
ln -sf "$REPO/rmneko.sh"  "$HOME/.local/bin/rmneko"
ln -sf "$REPO/nekoyay.sh" "$HOME/.local/bin/nekoyay"
echo "[neko] symlinked neko addneko rmneko nekoyay → ~/.local/bin/"
