The Host header is not forwarded, so the backend sees the upstream name.
    proxy_set_header Host $host;
