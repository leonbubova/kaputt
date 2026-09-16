# nginx won't start — "address already in use" on 8080
A leftover process is squatting on port 8080, so the API server can't bind.
Find what holds the port, free it, and start nginx.
