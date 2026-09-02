No server block listens on 8080.
    write a server { listen 8080; location / { return 200 "api ok\n"; } } and reload
