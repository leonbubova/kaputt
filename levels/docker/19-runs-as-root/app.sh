#!/bin/sh
# writes a heartbeat file; needs a writable /app/data
echo "$(date +%s)" > /app/data/heartbeat || { echo "FATAL: cannot write /app/data/heartbeat" >&2; exit 1; }
echo "api ready as uid $(id -u)"
exec sleep infinity
