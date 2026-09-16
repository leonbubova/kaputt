# the API must only be reachable from this box — bind it to loopback
Security audit: the internal API on 8080 is reachable on the machine's network address, it should
only answer on 127.0.0.1. Change the vhost so it listens on loopback only; `curl localhost:8080` must keep working.
