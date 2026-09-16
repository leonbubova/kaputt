## 1
URL `/hello` = folder `src/app/hello`. The page shown there is the file `page.tsx` inside that folder — no other name counts.
## 2
Two commands from the shell track: `mkdir` makes the folder, `cp SOURCE TARGET` copies the about page in. Run them inside `~/.k8s-wargame/nextjs/app`.
## 3
    cd ~/.k8s-wargame/nextjs/app
    mkdir src/app/hello
    cp src/app/about/page.tsx src/app/hello/page.tsx
