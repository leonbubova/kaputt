## 1
`-k` switches off the two checks a real client does: the chain must lead to a CA it trusts, and the name in the cert must match the host it asked for. curl can do both against a private CA: `--cacert <ca file>` replaces the system trust store; without `-k` curl exits non-zero (60) when verification fails.
## 2
The hostname check needs the request to be made to the name, not the IP: `--resolve shop.local:9443:127.0.0.1` sends it to 127.0.0.1 but verifies as shop.local. Try it on the command line first.
## 3
verify.sh: `curl -s -o /dev/null --cacert ~/.k8s-wargame/tls/app/certs/root.crt --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/` — curl's exit code is the script's exit code.
