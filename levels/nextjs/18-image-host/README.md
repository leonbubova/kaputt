# gallery page crashes with "hostname is not configured"
"The CDN team moved our images to `cdn.wurm-assets.example`. We updated the `<Image>` URLs; now `/gallery` is a 500 with something about `next/image` and a hostname."
App: `~/.k8s-wargame/nextjs/app`. Goal: `/gallery` renders 200 with the hero image (`hero.jpg`) still served through `next/image`. Don't swap `<Image>` for `<img>`.
