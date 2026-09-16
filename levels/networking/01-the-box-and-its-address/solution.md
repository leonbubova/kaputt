`ip addr show eth0` prints the address on the `inet` line; write it without the mask.
    echo $(hostname -I | awk '{print $1}') > /root/my-ip.txt
