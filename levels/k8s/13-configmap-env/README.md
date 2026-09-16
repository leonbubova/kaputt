# config into the container
Ticket: "We want app config outside the image. Create a ConfigMap `app-config` in `wg` with `GREETING=hello`, then a pod `greeter` (image `busybox:1.36`) that gets **all** keys of that ConfigMap as environment variables and prints `$GREETING`."
Goal: `kubectl logs greeter` contains `hello`, and the pod takes its env from `app-config` via `envFrom`.
