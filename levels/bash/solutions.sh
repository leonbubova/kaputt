# machine-applied solutions, one per level — used by run-all.sh only. Each writes the fixed script.
source "$(dirname "${BASH_SOURCE[0]}")/bashlib.sh"

s01(){ ws greet.sh <<'S'
#!/usr/bin/env bash
printf 'hello, %s\n' "$1"
S
}

s02(){ ws even.sh <<'S'
#!/usr/bin/env bash
n=$1
if [ $((n % 2)) -eq 0 ]; then echo even; exit 0; else echo odd; exit 1; fi
S
}

s03(){ ws sum.sh <<'S'
#!/usr/bin/env bash
total=0
for n in "$@"; do total=$((total + n)); done
echo "$total"
S
}

s04(){ ws count-lines.sh <<'S'
#!/usr/bin/env bash
n=0
while IFS= read -r line || [ -n "$line" ]; do n=$((n + 1)); done < "$1"
echo "$n"
S
}

s05(){ ws greet2.sh <<'S'
#!/usr/bin/env bash
name=${1:-world}
printf 'hello, %s\n' "$name"
S
}

s06(){ ws catf.sh <<'S'
#!/usr/bin/env bash
cat "$1"
S
}

s07(){ ws maxnum.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -gt "$2" ]; then echo "$1"; else echo "$2"; fi
S
}

s08(){ ws countdown.sh <<'S'
#!/usr/bin/env bash
i=$1
while [ "$i" -ge 1 ]; do echo "$i"; i=$((i - 1)); done
S
}

s09(){ ws count-matches.sh <<'S'
#!/usr/bin/env bash
count=$(grep -c "$2" "$1")
echo "$count"
S
}

s10(){ ws firstword.sh <<'S'
#!/usr/bin/env bash
set -o pipefail
head -1 "$1" | awk '{print $1}'
S
}

s11(){ ws report.sh <<'S'
#!/usr/bin/env bash
TOTAL=42
echo "total: $TOTAL"
S
}

s12(){ ws between.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -ge "$2" ] && [ "$1" -le "$3" ]; then echo yes; else echo no; fi
S
}
