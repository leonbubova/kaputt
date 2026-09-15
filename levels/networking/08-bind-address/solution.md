nginx is bound to 127.0.0.1; bind to all interfaces. A bind-address change needs a restart, not a reload.
    listen 8080;   (was listen 127.0.0.1:8080;) then: nginx -s stop; nginx
