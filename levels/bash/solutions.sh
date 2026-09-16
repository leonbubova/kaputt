# machine-applied solutions, one per level — used by run-all.sh only. Each writes the fixed script.
source "$(dirname "${BASH_SOURCE[0]}")/bashlib.sh"

s08(){ ws greet.sh <<'S'
#!/usr/bin/env bash
printf 'hello, %s\n' "$1"
S
}


s09(){ ws double.sh <<'S'
#!/usr/bin/env bash
echo $(( $1 * 2 ))
S
}

s10(){ ws notready.sh <<'S'
#!/usr/bin/env bash
echo 'not ready'; exit 3
S
}

s11(){ ws even.sh <<'S'
#!/usr/bin/env bash
n=$1
if [ $((n % 2)) -eq 0 ]; then echo even; exit 0; else echo odd; exit 1; fi
S
}


s12(){ ws sum.sh <<'S'
#!/usr/bin/env bash
total=0
for n in "$@"; do total=$((total + n)); done
echo "$total"
S
}


s13(){ ws whoran.sh <<'S'
#!/usr/bin/env bash
echo "user: $(whoami)"
S
}

s14(){ ws count-lines.sh <<'S'
#!/usr/bin/env bash
n=0
while IFS= read -r line || [ -n "$line" ]; do n=$((n + 1)); done < "$1"
echo "$n"
S
}


s15(){ ws greet2.sh <<'S'
#!/usr/bin/env bash
name=${1:-world}
printf 'hello, %s\n' "$name"
S
}


s16(){ ws catf.sh <<'S'
#!/usr/bin/env bash
cat "$1"
S
}


s17(){ ws maxnum.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -gt "$2" ]; then echo "$1"; else echo "$2"; fi
S
}


s18(){ ws countdown.sh <<'S'
#!/usr/bin/env bash
i=$1
while [ "$i" -ge 1 ]; do echo "$i"; i=$((i - 1)); done
S
}


s19(){ ws errors.sh <<'S'
#!/usr/bin/env bash
grep ERROR "$1"
S
}

s20(){ ws error-count.sh <<'S'
#!/usr/bin/env bash
grep ERROR "$1" | wc -l
S
}

s21(){ ws count-matches.sh <<'S'
#!/usr/bin/env bash
count=$(grep -c "$2" "$1")
echo "$count"
S
}


s22(){ ws firstword.sh <<'S'
#!/usr/bin/env bash
set -o pipefail
head -1 "$1" | awk '{print $1}'
S
}


s23(){ ws report.sh <<'S'
#!/usr/bin/env bash
TOTAL=42
echo "total: $TOTAL"
S
}


s24(){ ws batchok.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -gt 0 ] && [ $(($1 % 2)) -eq 0 ]; then echo yes; else echo no; fi
S
}

s25(){ ws between.sh <<'S'
#!/usr/bin/env bash
if [ "$1" -ge "$2" ] && [ "$1" -le "$3" ]; then echo yes; else echo no; fi
S
}

# ---- lessons 01–07 (absolute beginner) ----
s01(){ wf hello.sh <<'S'
echo hello from a script
S
}
s02(){ ws run-me.sh <<'S'
#!/usr/bin/env bash
echo it runs
S
}
s03(){ ws vars.sh <<'S'
#!/usr/bin/env bash
city=Berlin
echo "I live in $city"
S
}
s04(){ ws two.sh <<'S'
#!/usr/bin/env bash
echo "first: $1"
echo "second: $2"
S
}
s05(){ ws door.sh <<'S'
#!/usr/bin/env bash
if [ "$1" = "open" ]; then
  echo "come in"
else
  echo "go away"
fi
S
}
s06(){ ws fruits.sh <<'S'
#!/usr/bin/env bash
for fruit in apple pear plum; do
  echo "$fruit"
done
S
}
s07(){ ( cd "$WORK" && ./mystery.sh >/dev/null; echo "$?" > answer.txt ); }
