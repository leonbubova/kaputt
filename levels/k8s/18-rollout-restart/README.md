# roll the web pods
Ticket: "We rotated the certificate that `web` only reads at startup. Every `web` pod in `wg` has to be replaced by a fresh one — it's live traffic, so never go below one available replica, and don't touch the image."
Goal: both `web` pods are new, `web` is 2/2 available, image unchanged.
