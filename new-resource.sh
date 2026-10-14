#!/usr/bin/env bash
# Usage: ./new-resource.sh <name> <path/to/page.html>
# Copies the page into <name>-<random>/index.html and prints its link.
set -euo pipefail
[ $# -eq 2 ] || { echo "usage: $0 <name> <page.html>" >&2; exit 1; }
name=$(echo "$1" | tr 'A-Z ' 'a-z-' | tr -cd 'a-z0-9-')
slug="$name-$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 10 || true)"
mkdir "$slug"
cp "$2" "$slug/index.html"
echo "https://$(cat CNAME 2>/dev/null || echo your-domain)/$slug/"
