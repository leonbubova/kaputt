Write a oneshot unit and start it once.
    cat > /etc/systemd/system/wg-marker.service <<'U'
    [Unit]
    Description=provisioning marker
    [Service]
    Type=oneshot
    ExecStart=/bin/sh -c 'hostname > /opt/wg/marker/ran'
    U
    systemctl daemon-reload && systemctl start wg-marker
