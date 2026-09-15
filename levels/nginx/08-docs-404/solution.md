Give /docs/ its own location whose try_files falls back to a 404 instead of index.html.
    location /docs/ { try_files $uri $uri/ =404; }
