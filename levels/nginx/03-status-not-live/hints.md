## 1
`nginx -s reload` prints nothing even when it changed nothing: if the new file does not parse, nginx keeps running the old config. Ask it directly whether the file is valid: `docker exec wg-nginx nginx -t` — the error names the file and line.
## 2
`unexpected "}"` means the directive right before the brace was never terminated. Every directive ends with `;` — look at the `return` in the /status block.
## 3
Add the missing `;` after `"up\n"`, re-run `nginx -t` until it says "syntax is ok", then `docker exec wg-nginx nginx -s reload`.
