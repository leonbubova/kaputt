Add the block inside server, test, reload.
    location = /ping { default_type text/plain; return 200 "pong\n"; }
