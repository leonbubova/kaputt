# the API is unreachable on 8080 across the network — two things are wrong
After a change window the API can't be reached on 8080. There are two independent faults
in the way: one in the nginx vhost, one in the firewall. Fix both so localhost:8080 returns "api ok".
