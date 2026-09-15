# vendor portal needs the activation key the license service printed
"`wg-license.service` ran once during provisioning and printed the activation key to its output — nobody wrote it down, the service is long finished, and the key was never stored anywhere on disk. Put it into `/opt/wg/license/key` (just the key, one line)."
Goal: `/opt/wg/license/key` contains the activation key that `wg-license.service` printed.
