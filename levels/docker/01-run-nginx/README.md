# we need a web server, now
"Marketing wants a placeholder page on this box today." Goal: a container named `wg-web` from image `nginx:1.27-alpine`, running in the background, with host port 18001 forwarded to the container's port 80 — `curl localhost:18001` shows the nginx welcome page.
