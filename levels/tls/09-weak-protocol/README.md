# TLS handshakes fail — the server only offers an obsolete protocol
The TLS server was pinned to an old protocol version that modern clients refuse, so the handshake
fails and nobody can connect. Allow current TLS (1.2 and 1.3).
