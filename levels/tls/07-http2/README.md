# the CDN wants HTTP/2 but the origin only speaks HTTP/1.1 over TLS
Clients negotiate HTTP/2 via ALPN during the TLS handshake, but this server never offers it,
so connections fall back to HTTP/1.1. Enable HTTP/2 on the TLS listener.
