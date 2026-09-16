## 1
`openssl s_client -connect HOST:PORT -servername NAME </dev/null` prints the handshake including the server's certificate as text. Another `openssl x509` reading from the pipe can write that certificate to a file.
## 2
Pipe them: `openssl s_client -connect 127.0.0.1:9443 -servername shop.local </dev/null 2>/dev/null | openssl x509 -out served.crt` (the `2>/dev/null` hides s_client's chatter on stderr).
## 3
    cd ~/.k8s-wargame/tls/lab
    openssl s_client -connect 127.0.0.1:9443 -servername shop.local </dev/null 2>/dev/null | openssl x509 -out served.crt
    openssl x509 -noout -subject -ext subjectAltName -in served.crt
