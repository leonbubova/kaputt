source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' '/app.enableCors({/,/^  });/d' "$APP/src/main.ts"
