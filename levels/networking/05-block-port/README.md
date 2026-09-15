# security wants port 9090 closed — inbound TCP must be dropped
A retired debug service used 9090 and the port is still open to anyone who connects.
Add a firewall rule so inbound TCP to 9090 is dropped, even if something listens there.
