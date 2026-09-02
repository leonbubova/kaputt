# report runs die after 30 seconds
"Every `generate-report` run ends with `TaskRunMaxDurationExceeded` after exactly 30 s. Finance says the report used to take 10–15 minutes and that's fine." Goal: `generate-report` may run at least 10 minutes; the other tasks keep the project-wide 5-minute cap.
