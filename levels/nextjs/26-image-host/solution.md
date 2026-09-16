The image URL moved to `cdn.wurm-assets.example`, but `images.remotePatterns` in `next.config.ts` still only allows `cdn.wurm.example`. Config changes need a dev-server restart.
    sed -i '' 's/cdn.wurm.example/cdn.wurm-assets.example/' next.config.ts
