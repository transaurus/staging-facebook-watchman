#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for facebook/watchman
# Runs on existing source tree (no clone). Installs deps and builds.
# Docusaurus 2.4.3, Yarn Classic 1.x, Node 20

# --- Node.js setup via nvm ---
# cheerio@1.1.2 (transitive dep) requires Node >=20.18.1; use Node 20 LTS
export NVM_DIR="${HOME}/.nvm"
if [ ! -f "${NVM_DIR}/nvm.sh" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi
# shellcheck disable=SC1091
source "${NVM_DIR}/nvm.sh"

nvm install 20
nvm use 20

node --version
npm --version

# --- Install dependencies with Yarn Classic ---
npm install -g yarn
yarn --version

yarn install --frozen-lockfile

# --- Build ---
yarn build

echo "[DONE] Build complete."
