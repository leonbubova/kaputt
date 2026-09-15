# raise the worker count in app.conf
Ticket: "Load went up. In `/etc/app/app.conf` change `workers=2` to `workers=4`. That file is pushed by config management — every other line, including the header comment, must stay byte for byte as it is."
Goal: `/etc/app/app.conf` says `workers=4`; nothing else in the file changed.
