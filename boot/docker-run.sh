#!/bin/bash

source /opt/venv/bin/activate

cd /code
RUN_PORT=${PORT:-8000}
RUN_HOST=${HOST:-0.0.0.0}

if check_port 8000; then
  echo "Backend is already running on port 8000. Skipping backend startup."
else
    gunicorn -k uvicorn.workers.UvicornWorker -b $RUN_HOST:$RUN_PORT main:app --reload --timeout 300 
fi