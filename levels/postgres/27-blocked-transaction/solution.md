An open transaction (`batch-reconcile`) holds a row lock on accounts and never commits; every writer queues behind it.
    select pg_terminate_backend(pid) from pg_stat_activity where application_name = 'batch-reconcile';
