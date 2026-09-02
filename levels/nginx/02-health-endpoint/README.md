# monitoring alerts: GET /health returns the homepage, not "ok"
The load balancer probes http://shop.local/health and expects the body "ok".
Right now it gets the HTML index page, so the probe is failing.
Add a /health endpoint on the shop.local server that returns 200 with the plain body "ok".
