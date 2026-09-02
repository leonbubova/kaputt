## 1
Look at a few lines first: `head -3 /var/log/app/access.log`. The status sits right after the closing quote of the request.
## 2
`grep -c PATTERN FILE` counts matching lines. Make the pattern specific enough: `" 500 ` (quote, space, 500, space) won't match sizes or 502.
## 3
`grep -c '" 500 ' /var/log/app/access.log > /answer`
