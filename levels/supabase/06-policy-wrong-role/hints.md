## 1
There *is* a policy. Read it carefully: `select policyname, roles, cmd, qual from pg_policies where tablename='faq';`
## 2
Policies apply to a list of roles. Requests with the anon key run as role `anon`; logged-in users run as `authenticated`. Which one does the policy cover?
## 3
`alter policy "faq is public" on public.faq to anon, authenticated;`
