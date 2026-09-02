source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
# sample over 1s with top, take the busiest process of the 2nd iteration (ignores one-shot spikes like ps itself)
line=$(X top -bn2 -d1 -o %CPU 2>/dev/null | awk '/PID +USER/{c++} c==2 && /^ *[0-9]/{print; exit}')
pc=$(echo "$line" | awk '{print $9}'); pc=${pc%%[.,]*}
[ "${pc:-0}" -lt 50 ] || fail "still burning CPU: $(echo "$line" | awk '{print $9"% "$12}')"
ok "CPU calm"
