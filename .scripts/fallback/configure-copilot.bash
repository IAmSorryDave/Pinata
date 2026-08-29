#!/bin/bash

# Wait for llama-cpp service to be ready
echo "Waiting for llama.cpp server to be ready..."
for i in {1..30}; do
  if curl -s http://llama-cpp:8000/health > /dev/null 2>&1; then
    echo "✓ llama.cpp server is ready"
    break
  fi
  echo "Attempt $i: Waiting for llama.cpp..."
  sleep 2
done

# Configure BYOK environment variables
export COPILOT_PROVIDER_BASE_URL="http://llama-cpp:8000"
export COPILOT_PROVIDER_API_KEY="unused"  # llama.cpp doesn't require authentication
export COPILOT_OFFLINE="true"  # Run in offline mode to prevent GitHub telemetry

# Test the connection
curl -X POST http://llama-cpp:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "local",
    "messages": [{"role": "user", "content": "Hello"}],
    "max_tokens": 50
  }'

echo "✓ Copilot CLI BYOK configuration ready"
