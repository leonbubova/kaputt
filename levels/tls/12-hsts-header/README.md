# security audit: HSTS header is missing on HTTPS responses
Responses over HTTPS must carry a `Strict-Transport-Security` header so browsers pin HTTPS.
Add it to the TLS server.
