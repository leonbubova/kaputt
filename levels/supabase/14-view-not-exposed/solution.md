View lives in schema `wg_analytics`, which is not exposed to PostgREST.
    alter view wg_analytics.top_articles set schema public;
