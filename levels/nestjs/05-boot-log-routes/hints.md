## 1
Restart the server (or scroll up in terminal 1) and read the `Mapped {…, GET}` lines. One of them is *almost* `/health`.
## 2
The route prefix comes from `@Controller('…')` at the top of src/health/health.controller.ts. The text in the brackets is misspelled — the log shows the misspelling.
## 3
```
@Controller('health')
```
Save; the log now shows `Mapped {/health, GET} route`; `curl -s localhost:3200/health`.
