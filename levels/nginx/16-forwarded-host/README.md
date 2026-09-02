# the backend logs the wrong Host for every proxied request
The upstream needs the original Host (shop.local) to build correct links.
Right now /api/whoami reports the host as the upstream name, not shop.local.
Make nginx forward the original Host header to the backend.
