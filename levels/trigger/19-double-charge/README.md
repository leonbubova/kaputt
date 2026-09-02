# customers charged twice
"Stripe delivered `evt_7` three times last night (their retries) and we created three `charge-card` runs for the same order. Card charged 3x." Goal: the same Stripe event, received any number of times, results in exactly one `charge-card` run; different events still get their own run.
