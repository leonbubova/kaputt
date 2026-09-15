# put the stack on its own network
"Security wants `web` and `app` off the default bridge, on a dedicated network named `wg-back`." Goal: in the compose file in `~/.k8s-wargame/docker/14-compose-network/`, both services are attached to a network `wg-back` declared in the file, and `docker exec wg-app wget -qO- http://web/` returns the nginx page. Keep the container names.
