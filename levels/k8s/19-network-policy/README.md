# frontend can't reach backend
"Security added NetworkPolicies. Now `frontend` pods time out calling `backend`. Everything else works." Goal: pods labeled `role=frontend` can reach `http://backend.wg.svc/`. Keep default-deny for everyone else.
