# something is still listening on 9090 — the debug service was retired
Port 9090 shows up as open in the scan, though nothing should run there anymore.
Find the process that holds 9090 and stop it. Leave the API on 8080 alone.
