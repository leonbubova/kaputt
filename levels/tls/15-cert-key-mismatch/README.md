# after a cert rotation nginx won't start — key does not match the certificate
The TLS config points at a private key that doesn't belong to the served certificate,
so nginx fails to start and the whole site is down. Point it back at the matching key.
