The upstream port is wrong (9099); the backend listens on 9000.
    sed -i 's/9099/9000/' default.conf   (then nginx -s reload)
