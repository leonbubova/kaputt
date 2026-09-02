# machine-applied solutions, one per level — used by run-all.sh only. Each writes the fixed script.
source "$(dirname "${BASH_SOURCE[0]}")/bashlib.sh"

s01(){ ws greet.sh <<'S'
#!/usr/bin/env bash
printf 'hello, %s\n' "$1"
S
}


s02(){ ws double.sh <<'S'
#!/usr/bin/env bash
echo $(( $1 * 2 ))
S
}

s03(){ ws notready.sh <<'S'
#!/usr/bin/env bash
echo 'not ready'; exit 3
S
}

s04(){ ws even.sh <<'S'
#!/usr/bin/env bash
n=$1
if [ $((n % 2)) -eq 0 ]; then echo even; exit 0; else echo odd; exit 1; fi
S
}


s05(){ ws sum.sh <<'S'
#!/usr/bin/env bash
total=0
for n in "$@"; do total=$((total + n)); done
echo "$total"
S
}


s06(){ ws whoran.sh <<'S'
#!/usr/bin/env bash
echo "user: $(whoami)"
S
}

s07(){ ws count-lines.sh <<'S'
#!/usr/bin/env bash
n=0
while IFS= read -r line || [ -n "$line" ]; do n=$((n + 1)); done < "$1"
echo "$n"
S
}


s08(){ ws greet2.sh <<'S'
#!/usr/bin/env bash
name=${1:-world}
printf 'hello, %s\n' "$name"
S
}


s09(){ ws catf.sh <<'S'
#!/usr/bin/env bash
cat "$1"
S
}


s10(){ ws maxnum.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -gt "$2" ]; then echo "$1"; else echo "$2"; fi
S
}


s11(){ ws countdown.sh <<'S'
#!/usr/bin/env bash
i=$1
while [ "$i" -ge 1 ]; do echo "$i"; i=$((i - 1)); done
S
}


s12(){ ws errors.sh <<'S'
#!/usr/bin/env bash
grep ERROR "$1"
S
}

s13(){ ws error-count.sh <<'S'
#!/usr/bin/env bash
grep ERROR "$1" | wc -l
S
}

s14(){ ws count-matches.sh <<'S'
#!/usr/bin/env bash
count=$(grep -c "$2" "$1")
echo "$count"
S
}


s15(){ ws firstword.sh <<'S'
#!/usr/bin/env bash
set -o pipefail
head -1 "$1" | awk '{print $1}'
S
}


s16(){ ws report.sh <<'S'
#!/usr/bin/env bash
TOTAL=42
echo "total: $TOTAL"
S
}


s17(){ ws batchok.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -gt 0 ] && [ $(($1 % 2)) -eq 0 ]; then echo yes; else echo no; fi
S
}

s18(){ ws between.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -ge "$2" ] && [ "$1" -le "$3" ]; then echo yes; else echo no; fi
S
}
