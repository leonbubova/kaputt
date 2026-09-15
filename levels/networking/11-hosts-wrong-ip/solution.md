The /etc/hosts entry points at a wrong, unreachable IP; rewrite it to 127.0.0.1.
    grep -v api.internal /etc/hosts > /tmp/h; cat /tmp/h > /etc/hosts; echo '127.0.0.1 api.internal' >> /etc/hosts
