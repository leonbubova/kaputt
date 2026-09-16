A proxy location forwards /shop/… to the backend as /…; test and reload.
    location /shop/ { proxy_pass http://wg-backend:9000/; }
