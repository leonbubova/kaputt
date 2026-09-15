source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' 's/^@Injectable()$/@Injectable({ scope: Scope.REQUEST })/; s/import { forwardRef, Inject, Injectable, NotFoundException, OnModuleInit }/import { forwardRef, Inject, Injectable, NotFoundException, OnModuleInit, Scope }/' "$APP/src/users/users.service.ts"
