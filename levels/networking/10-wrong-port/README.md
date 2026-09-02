# the API moved to the wrong port — clients expect 8080, it's on 8081
After a config edit the API vhost came up on 8081. Every client hits 8080 and gets nothing.
Put it back on 8080.
