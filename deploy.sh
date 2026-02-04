#!/usr/bin/env bash
# Push to GitHub so Actions can deploy. Uses GITHUB_TOKEN from .env (never committed).
set -e
cd "$(dirname "$0")"

# Load token from .env (avoid issues with sourcing and line endings)
GITHUB_TOKEN=""
if [ -f .env ]; then
  GITHUB_TOKEN=$(grep -E '^GITHUB_TOKEN=' .env | head -1 | cut -d= -f2- | tr -d '\r\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
fi

if [ -z "$GITHUB_TOKEN" ] || [ "${GITHUB_TOKEN#ghp_}" = "$GITHUB_TOKEN" ]; then
  echo "Missing or invalid GITHUB_TOKEN in .env"
  echo "  - File must contain exactly: GITHUB_TOKEN=ghp_your_token_here"
  echo "  - Create a classic token at: https://github.com/settings/tokens/new (check 'repo')"
  exit 1
fi

# Verify token with GitHub API (avoid confusing Git errors)
HTTP=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user 2>/dev/null || echo "000")
if [ "$HTTP" != "200" ]; then
  echo "GitHub rejected the token (HTTP $HTTP)."
  echo "  - Create a new classic token: https://github.com/settings/tokens/new"
  echo "  - Check the 'repo' scope, then copy it into .env as GITHUB_TOKEN=ghp_..."
  exit 1
fi

# Force Git to use the URL only — no credential helper
export GIT_TERMINAL_PROMPT=0
git -c credential.helper= push "https://eeeieeiooh:${GITHUB_TOKEN}@github.com/eeeieeiooh/myblog.git" main
