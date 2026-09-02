# FAQ page blank for logged-out visitors
"The FAQ shows fine once you log in, but the public landing page (anon key) gets `[]` from `/rest/v1/faq`. Someone already added a read policy, so it's not RLS… right?" Goal: anon GET returns all 3 FAQ rows. Keep RLS enabled.
