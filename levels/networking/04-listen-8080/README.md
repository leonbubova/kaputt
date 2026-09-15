# nginx is running but serves nothing on 8080 — the API vhost is missing
The web server is up, but there is no server block for the API.
Create an nginx site that listens on 8080 and returns "api ok", then reload.
