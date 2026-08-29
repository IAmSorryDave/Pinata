#!/bin/bash

# Download a model (e.g., a quantized Mistral or similar)
# This example uses a smaller model suitable for local inference

MODEL_DIR="$HOME/.cache/models"
mkdir -p "$MODEL_DIR"

# Example: Download a quantized model (adjust URL to your choice)
if [ ! -f "$MODEL_DIR/model.gguf" ]; then
  echo "Downloading model..."
  curl -L https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/resolve/main/Mistral-7B-Instruct-v0.1.Q4_K_M.gguf \
    -o "$MODEL_DIR/model.gguf"
  echo "Model ready at $MODEL_DIR/model.gguf"
else
  echo "Model already exists"
fi
