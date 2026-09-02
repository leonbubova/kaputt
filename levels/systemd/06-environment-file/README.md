# api refuses to start: "API_PORT not set"
"`wg-api.service` fails right after deploy. The config the app needs is already on the box in `/etc/wg/api.env` (`API_PORT`, `API_TOKEN`). Wire the file into the unit — don't copy the values into the unit file, ops rotates the token there."
Goal: `wg-api.service` is active and `/opt/wg/api/state` shows the port and token from `/etc/wg/api.env`.
