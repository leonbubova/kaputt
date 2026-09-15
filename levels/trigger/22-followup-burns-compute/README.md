# follow-up mails never go out and the bill exploded
"`send-followup` runs sit at `Executing` for 5 minutes, then die with `TaskRunMaxDurationExceeded`. No follow-up mail was ever sent, and we paid compute for every one of those minutes." Goal: the run finishes its own code immediately, the platform holds it for 24 h at zero cost, and the mail goes out afterwards.
