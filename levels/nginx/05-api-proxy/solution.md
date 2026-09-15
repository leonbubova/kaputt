Add a proxy location for /api/ (trailing slash strips the prefix), then reload.
    location /api/ { proxy_pass http://wg-backend:9000/; proxy_set_header Host $host; }
