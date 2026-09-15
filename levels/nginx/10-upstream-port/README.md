# checkout is down: every /api/ call returns 502 Bad Gateway
Nothing changed in the backend, yet the shop API stopped answering through nginx.
The static site still loads fine. Get /api/ talking to the upstream again.
