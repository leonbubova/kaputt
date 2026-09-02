# one of the sessions never expires — find it and remove it
Three sessions are stored: `session:a`, `session:b`, `session:c`. Two were written with an
expiry; one was written without and will sit in memory forever. Delete the one that never
expires. The other two must stay exactly as they are.
