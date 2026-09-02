source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/req.headers\['x-api-key'\]/req.headers['X-Api-Key']/" "$APP/src/admin/api-key.guard.ts"
