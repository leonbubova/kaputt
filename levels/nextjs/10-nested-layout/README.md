# dashboard needs its own sub-navigation
"`/dashboard` and a new `/dashboard/settings` page should share a sub-nav (`Overview` → `/dashboard`, `Settings` → `/dashboard/settings`) — rendered once, not copied into each page. Mark the nav `data-testid="dashboard-nav"`."
App: `~/.k8s-wargame/nextjs/app`. Goal: both URLs return 200 and contain the sub-nav; the nav lives in a nested layout, not in the pages.
