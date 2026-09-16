# post-incident: two TLS faults at once
After a rushed change, verifying clients can't validate the chain AND plain HTTP is no longer
redirected to HTTPS. Two independent faults in the config. Fix both: the served chain must verify
for shop.local, and http:// must 301 to https://.
