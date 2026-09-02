    select pg_terminate_backend(pid) from pg_stat_activity where application_name = 'office-laptop';
