#!/bin/bash
# This script bootstraps and deploys the Netflix clone to GitHub.
# It assumes that the GitHub CLI (`gh`) is installed and that you are
# authenticated.  Running this script will create a new private repository
# named `netflix-clone-innovative`, commit the current working tree, and
# push the initial commit.

set -euo pipefail

REPO_NAME="netflix-clone-innovative"

echo "Initializing git repository..."
git init 2>/dev/null || true

echo "Creating GitHub repository $REPO_NAME..."
# The `gh repo create` command will fail if the repository already exists.
# The `-y` flag auto‑confirms prompts; `--source` points to the current directory.
gh repo create "$REPO_NAME" --private --source=. --remote=origin --description "Netflix clone with unique features" --push -y || {
  echo "Repository may already exist or creation failed.  Continuing..."
}

echo "Adding all files to git..."
git add .
git commit -m "Initial commit" || true

echo "Pushing to GitHub..."
git push -u origin main || true

echo "Repository URL:"
gh repo view "$REPO_NAME" --json url -q .url || true