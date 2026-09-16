# curl fails in every login shell: "Could not resolve proxy: proxy.old.corp"
"The old corporate proxy was decommissioned. On this box every `curl` in a login shell still tries to use it — even for `127.0.0.1`. Nobody knows where it is configured."
Goal: `bash -lc 'curl -s http://127.0.0.1:9300/'` prints `local ok`, no `http_proxy` in login shells, and `/answer` contains the full path of the file that set it.
