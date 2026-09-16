`(percent / 100)` is integer division → 0 for every percent below 100, so nothing is subtracted.
    src/Money.kt → priceCents - priceCents * percent / 100
