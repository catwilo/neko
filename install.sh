#!/usr/bin/env bash
set -euo pipefail
REPO=$(cd "$(dirname "$0")" && pwd)

chmod +x "$REPO/neko.sh" "$REPO/addneko.sh" "$REPO/rmneko.sh" "$REPO/nekoyay.sh"
mkdir -p "$HOME/.local/bin"

_install_atomic() {
    local src="$1" dst="$2" binname
    binname="$(basename "$dst")"
    local dstdir tmp
    dstdir="$(dirname "$dst")"
    mkdir -p "$dstdir"
    tmp="$(mktemp -d "$dstdir/.neko-tmp.XXXXXX")/$binname"
    if cp -f "$src" "$tmp"; then
        chmod +x "$tmp"
        rm -f "$dst"
        mv -f "$tmp" "$dst" && echo "[neko] installed $binname" || { echo "[neko] ERROR: mv $binname failed" >&2; exit 1; }
    else
        echo "[neko] ERROR: cp $binname failed" >&2; exit 1
    fi
    rm -rf "$(dirname "$tmp")" 2>/dev/null || true
}

_install_atomic "$REPO/neko.sh"    "$HOME/.local/bin/neko"
_install_atomic "$REPO/addneko.sh" "$HOME/.local/bin/addneko"
_install_atomic "$REPO/rmneko.sh"  "$HOME/.local/bin/rmneko"
_install_atomic "$REPO/nekoyay.sh" "$HOME/.local/bin/nekoyay"

echo "[neko] all binaries installed"
