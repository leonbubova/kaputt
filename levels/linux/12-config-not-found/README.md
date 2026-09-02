# app says config missing, but the file is right there
"`/opt/app/show-config` fails: `/etc/app/config.yaml: No such file or directory`. `ls /etc/app` clearly lists config.yaml. We rolled out config v2 an hour ago."
Goal: `/etc/app/config.yaml` resolves to the v2 config (`release: v2`, `listen_port: 9000`).
