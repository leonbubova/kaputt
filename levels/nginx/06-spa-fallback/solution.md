try_files ends in =404; a SPA must fall back to the app shell.
    try_files $uri $uri/ /index.html;
