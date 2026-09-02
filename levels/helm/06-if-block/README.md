# debug switch for the frontend
Ticket: "Release `web` in `wg-helm` needs a debug mode for support. Add a chart value `debug` (default `false`); when it is on, the page shows an extra line `debug=on` — when it is off, that line must not exist at all, not even empty. Roll `web` out with debug switched on."
Chart copy: `~/.k8s-wargame/helm/06-if-block/web`. Goal: page at `http://web.wg-helm.svc/` shows `debug=on`; `helm template web ./web` (chart defaults) contains no `debug` line.
