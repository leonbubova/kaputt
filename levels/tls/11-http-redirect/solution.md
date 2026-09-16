The port-80 server serves content instead of redirecting.
    return 301 https://$host$request_uri;
