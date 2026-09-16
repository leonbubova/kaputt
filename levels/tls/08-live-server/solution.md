s_client shows the handshake; openssl x509 on its output extracts the leaf.
    openssl s_client -connect 127.0.0.1:9443 -servername shop.local </dev/null 2>/dev/null | openssl x509 -out ~/.k8s-wargame/tls/lab/served.crt
