# the API isn't answering on port 8080 — nothing is listening
The site config for the internal API is in place, but the web server was never started.
Bring nginx up so http://localhost:8080/ returns "api ok".
