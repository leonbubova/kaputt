## 1
Log lines have a fixed shape, so counting a status means matching text at a known position — here the status sits right after the closing quote of the request. Look at a few lines first to see it: `head -3 /var/log/app/access.log`.
## 2
`grep -c PATTERN FILE` counts matching lines. Make the pattern specific enough: `" 500 ` (quote, space, 500, space) won't match sizes or 502.
## 3
`grep -c '" 500 ' /var/log/app/access.log > /answer`
