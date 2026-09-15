`~/.profile` sets `PATH=/opt/deploy/bin`, dropping the system dirs.
    sed -i 's|^PATH=/opt/deploy/bin$|PATH="$PATH:/opt/deploy/bin"|' /home/deploy/.profile
