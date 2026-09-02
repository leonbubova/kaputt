# app refuses to start: "key file permissions too open"
"After someone copied the signing key onto the box, `/opt/app/start` dies immediately with a message about the key file. Runs as user `app`."
Goal: `su - app -c /opt/app/start` prints `app started`. Don't touch the start script or the key content.
