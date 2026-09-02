Leaf-only chain plus a missing HTTP redirect.
    ssl_certificate /etc/nginx/certs/fullchain.crt;   and   return 301 https://$host$request_uri;
