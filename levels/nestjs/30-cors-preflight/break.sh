source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/allowedHeaders: \['Content-Type', 'X-Api-Key'\],/allowedHeaders: ['Content-Type'],/" "$APP/src/main.ts"
