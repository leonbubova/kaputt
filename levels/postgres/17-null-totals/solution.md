`amount - NULL` is NULL: the view doesn't handle a missing discount.
    create or replace view invoice_totals as select id, customer, amount - coalesce(discount, 0) as total from invoices;
