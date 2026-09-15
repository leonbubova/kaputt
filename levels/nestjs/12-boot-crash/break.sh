source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/join(process.cwd(), 'seed', 'users.json')/join(__dirname, 'seed', 'users.json')/" "$APP/src/users/users.service.ts"
