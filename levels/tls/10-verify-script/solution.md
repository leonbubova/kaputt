curl with the CA and the name instead of -k; its exit code carries the verdict.
    curl -s -o /dev/null --cacert $APP/certs/root.crt --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/
