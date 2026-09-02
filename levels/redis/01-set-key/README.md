# the app can't read its name from cache — key app:name is empty
The service reads a string key `app:name` on boot and expects the value `shop`.
Right now the key doesn't exist. Set it.
