# networking — the commands you'll actually use
Everything happens inside the wg-net box (`wg shell`). The API is an nginx vhost in /etc/nginx/sites-enabled/api.conf and belongs on :8080.

  ss -ltnp                                  who listens on which port and address (and which pid)
  curl -s localhost:8080                    does the API answer? hangs = firewall, refused = nobody listening
  pgrep nginx  /  nginx  /  nginx -s reload  running? / start / re-read config
  nginx -t                                  config syntax check — names the file and line
  nginx -s stop; nginx                      full restart (a changed listen address needs it, reload won't do)
  getent hosts api.internal                 what does the name resolve to? static names: /etc/hosts (`IP  name`)
  iptables -L INPUT -n                      firewall rules in order — first match wins, DROP lines are the suspects
  iptables -I INPUT -p tcp --dport 8080 -j ACCEPT    insert an allow at the top;  -D … -j DROP deletes a rule
  iptables -D INPUT -p icmp -j DROP         pings dropped? remove the rule (ping -c1 127.0.0.1 to test)
  ip link show eth0  /  ip link set eth0 mtu 1500    interface state / fix the MTU
  pkill -f 'nc -lk'                         kill whatever squats on the port (found via ss -ltnp)

Mental model: a request has to clear four gates in order — name (hosts/DNS) → port (is something listening, on which address?) → firewall (iptables INPUT) → the service itself. Check them in that order; `ss -ltn` and `iptables -L INPUT -n` answer two gates at a glance.
