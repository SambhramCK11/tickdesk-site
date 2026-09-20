#!/usr/bin/env bash
# deploy.sh — publish this site to Cloudflare Workers.
#
#   ./deploy.sh
#
# Needs Node 18+ and a free Cloudflare account. No database, no secrets.
# On the first run a browser opens so you can authorise wrangler.

set -euo pipefail
cd "$(dirname "$0")"

step() { printf '\n\033[1m==> %s\033[0m\n' "$1"; }
fail() { printf '\n\033[31mFailed:\033[0m %s\n' "$1" >&2; exit 1; }

command -v node >/dev/null || fail "Node is not installed. Get it from https://nodejs.org (18 or newer)."

MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
[ "$MAJOR" -ge 18 ] || fail "Node $MAJOR is too old; wrangler needs 18 or newer."

step "Installing dependencies"
npm install --no-fund --no-audit

step "Checking your Cloudflare login"
if npx wrangler whoami 2>&1 | grep -q "not authenticated"; then
  echo "Opening a browser so you can authorise wrangler..."
  npx wrangler login
else
  echo "Already logged in."
fi

step "Deploying"
npx wrangler deploy

cat <<'DONE'

Done. The URL is printed just above, in the form:

    https://tickdesk-site.<your-subdomain>.workers.dev

Open it and check the footer shows the repository link.
DONE
