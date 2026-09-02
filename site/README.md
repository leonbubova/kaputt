# kaputt — landing page

Static showcase for the break/fix wargame. Plain HTML/CSS/JS, no build step.

- `index.html` / `style.css` / `app.js` — the page
- `levels.json` — generated track/level data
- `build.sh` — regenerate `levels.json` by scanning the wargame repo (`./build.sh [path-to-k8s-wargame]`)

Served via GitHub Pages. To refresh after tracks change: `./build.sh && git commit -am "refresh levels" && git push`.
