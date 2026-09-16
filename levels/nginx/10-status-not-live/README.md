# the new /status endpoint is not live, even though it was added and reloaded
A colleague added a `location = /status` answering "up" to the shop.local config and ran the reload.
http://shop.local/status still renders the homepage, and the block is definitely in the file.
Make /status return 200 with the plain body "up".
