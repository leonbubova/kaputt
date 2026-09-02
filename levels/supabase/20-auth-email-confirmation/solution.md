`[auth.email] enable_confirmations = true` in config.toml — unconfirmed users cannot sign in.
    sed -i.bak '/^\[auth.email\]/,/^\[/ s/^enable_confirmations = true/enable_confirmations = false/' ~/.k8s-wargame/supabase/project/supabase/config.toml
    cd ~/.k8s-wargame/supabase/project && supabase stop && supabase start
