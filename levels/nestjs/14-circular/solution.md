Circular dependency users ↔ orders on module and provider level; without `forwardRef` one side is undefined when decorators run.
    users.module.ts / orders.module.ts → imports: [forwardRef(() => OtherModule)]
    users.service.ts / orders.service.ts → @Inject(forwardRef(() => OtherService))
