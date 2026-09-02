# website on :18009 resets the connection
"`wg-web` (nginx) is Running, but `curl localhost:18009` gives 'connection reset by peer'."
Goal: `http://localhost:18009/` returns the nginx welcome page from container `wg-web` (image `nginx:1.27-alpine`).
