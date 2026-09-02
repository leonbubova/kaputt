# the capacity review needs this server's `maxclients` limit
Ops is comparing connection limits across all Redis instances. Read the value this server is
currently running with (not the default from the docs) and store it as a string under
`audit:maxclients`.
