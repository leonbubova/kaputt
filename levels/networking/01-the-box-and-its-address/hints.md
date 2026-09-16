## 1
Inside the box (`wg shell`), `ip addr` lists every network card. The address of `eth0` is on its `inet` line — four numbers with dots, before the slash.
## 2
`echo ADDRESS > /root/my-ip.txt` — replace ADDRESS with the four numbers you read, without the `/16`.
## 3
    wg shell
    ip addr show eth0
    echo 172.17.0.2 > /root/my-ip.txt      # use the address YOUR box shows
