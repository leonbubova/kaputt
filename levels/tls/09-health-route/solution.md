No location for /health. Add one to the port-80 server and reload.
    location /health { default_type text/plain; return 200 "ok\n"; }   then docker exec wg-tls nginx -s reload
