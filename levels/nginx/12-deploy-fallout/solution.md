Two faults from one deploy: wrong upstream port and a broken SPA fallback.
    proxy_pass http://wg-backend:9000/;   and   try_files $uri $uri/ /index.html;
