# the TLS probe is useless — it skips certificate verification
Monitoring checks the edge with `curl -k`, so it would stay green even with a wrong or untrusted
certificate. Write ~/.k8s-wargame/tls/app/verify.sh: it fetches https://shop.local:9443/
(shop.local is 127.0.0.1, no DNS), trusts only our CA certs/root.crt, and exits 0 when chain and
hostname verify — non-zero otherwise. No -k / --insecure.
