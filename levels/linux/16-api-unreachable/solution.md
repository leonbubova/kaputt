Stale `/etc/hosts` override sends api.internal to 10.99.0.1.
    grep -v api.internal /etc/hosts > /tmp/h && cat /tmp/h > /etc/hosts && echo "127.0.0.1 api.internal" >> /etc/hosts
