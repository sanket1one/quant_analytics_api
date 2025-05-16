#!/bin/bash

if check_port 8000; then
  echo "Backend is already running on port 8000. Skipping backend startup."
else
  echo "Starting FastAPI backend in the current shell..."
  source .venv/bin/activate
  uvicorn src.main:app --reload --host 0.0.0.0 --port 8080
  deactivate
fi