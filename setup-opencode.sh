#!/usr/bin/env bash

set -e

echo "===================================="
echo "     OpenCode Provider Setup"
echo "===================================="
echo

read -rp "Provider ID [local]: " PROVIDER_ID
PROVIDER_ID=${PROVIDER_ID:-local}

read -rp "Provider Name [Local API]: " PROVIDER_NAME
PROVIDER_NAME=${PROVIDER_NAME:-Local API}

read -rp "Base URL [http://localhost:20128/v1]: " BASE_URL
BASE_URL=${BASE_URL:-http://localhost:20128/v1}

read -rp "API Key (leave blank if none): " API_KEY

echo
echo "Available models:"
curl -s "$BASE_URL/models" | grep -o '"id":"[^"]*"' | cut -d'"' -f4 || true
echo

read -rp "Model ID: " MODEL_ID

CONFIG_DIR="$HOME/.config/opencode"
mkdir -p "$CONFIG_DIR"

cat > "$CONFIG_DIR/opencode.json" <<EOF
{
  "\$schema": "https://opencode.ai/config.json",
  "provider": {
    "$PROVIDER_ID": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "$PROVIDER_NAME",
      "options": {
        "baseURL": "$BASE_URL",
        "apiKey": "$API_KEY"
      },
      "models": {
        "$MODEL_ID": {}
      }
    }
  },
  "model": "$PROVIDER_ID/$MODEL_ID"
}
EOF

echo
echo "===================================="
echo "Saved to:"
echo "$CONFIG_DIR/opencode.json"
echo "===================================="
echo
echo "Default model:"
echo "$PROVIDER_ID/$MODEL_ID"
