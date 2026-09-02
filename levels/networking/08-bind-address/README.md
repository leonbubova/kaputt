# the API answers on localhost but not on the box's network address
Other hosts can't reach the API. It works from `curl localhost:8080` on the box, but not via the
machine's own IP. nginx is bound to the loopback only. Make it listen on all interfaces.
