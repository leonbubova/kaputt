## 1
Edit → `systemctl daemon-reload` → `systemctl start wg-hello`. If the output file still says `hello`, one of the three steps is missing — `systemctl status wg-hello` tells you which (warning about daemon-reload, or never started again).
## 2
`nano /etc/systemd/system/wg-hello.service`, change the ExecStart line to `ExecStart=/bin/sh -c 'echo hello again > /opt/wg/hello/out'`, save. Then the two commands.
## 3
    sed -i "s/echo hello >/echo hello again >/" /etc/systemd/system/wg-hello.service
    systemctl daemon-reload
    systemctl start wg-hello
    cat /opt/wg/hello/out
