# look at the certificate a live server sends
Lesson: so far you read certificates from files. A client gets them over the network: when it connects to
port 443, the server shows its certificate (and chain) first, before any web page. `openssl s_client` is a
client that shows you exactly that handshake. This game runs a real TLS server for you on 127.0.0.1:9443
(a container named wg-tls); its name is shop.local.
    openssl s_client -connect 127.0.0.1:9443 -servername shop.local </dev/null
`-connect` is address:port, `-servername` is the name you are asking for (the server may hold several),
`</dev/null` makes s_client quit instead of waiting for you to type. Read the top: "Certificate chain",
subject and issuer of every certificate sent, then "Verify return code" (fails here — your computer does not
know our private root CA). Add `-CAfile ~/.k8s-wargame/tls/app/certs/root.crt` and it says `Verify return code: 0 (ok)`.
The output also contains the leaf certificate itself as text. Piped into `openssl x509`, that becomes a file:
    openssl s_client -connect 127.0.0.1:9443 -servername shop.local </dev/null 2>/dev/null | openssl x509 -out served.crt
Try it:
    cd ~/.k8s-wargame/tls/lab
    openssl s_client -connect 127.0.0.1:9443 -servername shop.local </dev/null 2>/dev/null | head -20
    openssl s_client -connect 127.0.0.1:9443 -servername shop.local -CAfile ~/.k8s-wargame/tls/app/certs/root.crt </dev/null 2>/dev/null | grep Verify
    curl --cacert ~/.k8s-wargame/tls/app/certs/root.crt --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/     curl doing the same check, then fetching the page
Your task: save the certificate the server sends into `~/.k8s-wargame/tls/lab/served.crt`, then read its subject
and SAN with the commands from lessons 1 and 6 — it should be shop.local.
Work in ~/.k8s-wargame/tls/lab. (Server not answering? `docker start wg-tls`, or `wg reset`.)
Check yourself:  wg check      stuck?  wg hint
