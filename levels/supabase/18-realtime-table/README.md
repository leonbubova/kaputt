# the room list should update live
Ticket: "The lobby subscribes with `postgres_changes` to `public.rooms` so new rooms pop up without a reload. Nothing ever arrives — the subscription connects fine. Turn on Realtime for that table."
Goal: changes to `rooms` are broadcast by Realtime.
