Change the listen line, then make nginx re-read the file.
    sed -i 's/listen 8080;/listen 8081;/' /etc/nginx/sites-enabled/api.conf; nginx -s reload
