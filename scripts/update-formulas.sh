#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

changed=0

get_latest_version() {
    local repo="$1"
    curl -sf "https://api.github.com/repos/${repo}/releases/latest" \
        | grep -oP '"tag_name":\s*"v?\K[^"]+'
}

get_current_version() {
    grep -oP 'version "\K[^"]+' "$1" | head -1
}

fetch_sha256() {
    local hash
    hash=$(curl -sfL "$1.sha256" | awk '{print $1}')
    if [[ ! "$hash" =~ ^[a-f0-9]{64}$ ]]; then
        echo "Invalid sha256 for $1" >&2
        return 1
    fi
    echo "$hash"
}

update_formula() {
    local repo="$1" binary="$2" file="${REPO_DIR}/$3"

    local current latest
    current=$(get_current_version "$file")
    latest=$(get_latest_version "$repo") || { echo "  $binary: failed to fetch latest version"; return 1; }

    if [[ "$current" == "$latest" ]]; then
        echo "  $binary: up to date ($current)"
        return 0
    fi

    echo "  $binary: $current -> $latest"

    local base="https://github.com/${repo}/releases/download/v${latest}"
    local sha_arm sha_x86 sha_linux

    sha_arm=$(fetch_sha256 "${base}/${binary}-aarch64-apple-darwin.tar.gz") || { echo "  Failed to fetch arm mac sha256"; return 1; }
    sha_x86=$(fetch_sha256 "${base}/${binary}-x86_64-apple-darwin.tar.gz") || { echo "  Failed to fetch x86 mac sha256"; return 1; }
    sha_linux=$(fetch_sha256 "${base}/${binary}-x86_64-unknown-linux-gnu.tar.gz") || { echo "  Failed to fetch linux sha256"; return 1; }

    mapfile -t old < <(grep -oP 'sha256 "\K[^"]+' "$file")

    sed -i "s/version \"${current}\"/version \"${latest}\"/" "$file"
    sed -i "s/${old[0]}/${sha_arm}/" "$file"
    sed -i "s/${old[1]}/${sha_x86}/" "$file"
    sed -i "s/${old[2]}/${sha_linux}/" "$file"

    changed=1
}

update_cask() {
    local repo="$1" binary="$2" file="${REPO_DIR}/$3"

    local current latest
    current=$(get_current_version "$file")
    latest=$(get_latest_version "$repo") || { echo "  $binary: failed to fetch latest version"; return 1; }

    if [[ "$current" == "$latest" ]]; then
        echo "  $binary: up to date ($current)"
        return 0
    fi

    echo "  $binary: $current -> $latest"

    local base="https://github.com/${repo}/releases/download/v${latest}"
    local sha_arm sha_x86

    sha_arm=$(fetch_sha256 "${base}/${binary}-aarch64-apple-darwin.dmg") || { echo "  Failed to fetch arm mac sha256"; return 1; }
    sha_x86=$(fetch_sha256 "${base}/${binary}-x86_64-apple-darwin.dmg") || { echo "  Failed to fetch x86 mac sha256"; return 1; }

    mapfile -t old < <(grep -oP 'sha256 "\K[^"]+' "$file")

    sed -i "s/version \"${current}\"/version \"${latest}\"/" "$file"
    sed -i "s/${old[0]}/${sha_arm}/" "$file"
    sed -i "s/${old[1]}/${sha_x86}/" "$file"

    changed=1
}

echo "Checking for formula updates..."
echo ""

update_formula "franzos/tku"     "tku"     "Formula/tku.rb"
update_formula "franzos/envstash" "envstash" "Formula/envstash.rb"
update_formula "franzos/jota"    "jota"    "Formula/jota.rb"
update_formula "franzos/vatic"   "vatic"   "Formula/vatic.rb"

update_cask "franzos/jota" "jota-gui" "Casks/jota-gui.rb"

echo ""
if [[ "$changed" -eq 1 ]]; then
    echo "Updates applied."
else
    echo "Everything up to date."
fi
