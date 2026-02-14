#!/bin/bash
# Build all cheatsheet docsets using Docker
# Requires: Docker

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Building docsets with cheatset (Ruby 2.7)..."

docker run --rm -v "$SCRIPT_DIR:/cheatsheets" ruby:2.7-bullseye bash -c '
gem install nokogiri -v 1.15.7 --platform=ruby 2>&1 | tail -1
gem install cheatset 2>&1 | tail -1
cd /cheatsheets
for rb in cheatsheets_*.rb; do
    echo "Building: $rb"
    cheatset generate "$rb" 2>&1 | grep -v "^NOTE:" | grep -v "warning:"
done
'

echo ""
echo "Built docsets:"
ls -d "$SCRIPT_DIR"/*.docset 2>/dev/null || echo "  (none)"

echo ""
echo "To install to Dash:"
echo "  cp -r *.docset ~/Library/Application\ Support/Dash/Cheat\ Sheets/"
echo "  # Then restart Dash or rescan cheatsheets"
