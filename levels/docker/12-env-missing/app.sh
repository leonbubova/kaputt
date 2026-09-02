#!/bin/sh
# tiny api stub: needs a token to talk to the upstream
[ -n "$API_TOKEN" ] || { echo "FATAL: API_TOKEN is not set, refusing to start" >&2; exit 1; }
echo "api ready (token ${#API_TOKEN} chars, log level ${LOG_LEVEL:-info})"
exec sleep infinity
