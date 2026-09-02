# the id string is the task's identity, and it must be unique across the project
Lesson: the platform never sees your export names, file names or variable names. It sees one thing per task: the `id` string. The dashboard lists ids, `trigger()` resolves to an id, and deploy registers ids.
That has a consequence for copy-paste: if two files declare the same `id`, they are one task to the platform. The indexer keeps whichever it saw last and silently drops the other — at most a deploy warning. Calls meant for the dropped one land in the survivor, which does its own thing with the payload and reports success.
So the symptom of a duplicate id is never an error. It is the wrong code running, with a green status. The check is mechanical: list every `id:` in `src/trigger` and look for a repeat.
    grep -rn 'id:' src/trigger                every task id in the project, with its file
    grep -rn 'id:' src/trigger | sort -k2     sorted, so duplicates sit next to each other
    npx tsc --noEmit                          green — ids are strings, tsc cannot know
Try it first: run the grep and count: 14 task files, how many distinct ids?
Your task: "Support triggered `process-refund` for ord_1002 from the dashboard. The run output says `processed: true` and no refund was booked. Also deploy warns about something." Goal: `process-refund` refunds, `process-order` processes, deploy has no task-id warnings.
Check yourself:  wg check      stuck?  wg hint
