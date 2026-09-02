# monitoring needs a /health endpoint on the edge
The uptime checker polls http://shop.local/health and expects HTTP 200 with the body `ok`.
Right now the edge only serves / on port 80 and /health is a 404. Add the route to the nginx
config and apply it without restarting the container.
