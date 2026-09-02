Add a location for /health that returns the string, then reload.
    location = /health { default_type text/plain; return 200 "ok\n"; }
