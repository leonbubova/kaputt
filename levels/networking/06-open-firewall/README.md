# the API is up but the firewall blocks port 8080
nginx serves "api ok" on 8080, yet connections hang. A firewall rule is dropping traffic to 8080.
Add a rule that allows inbound TCP on 8080.
