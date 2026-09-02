# machine-applied solutions, one per level — used by run-all.sh only. Each does exactly what the level asks.
source "$(dirname "${BASH_SOURCE[0]}")/shelllib.sh"

s01(){ echo hello > "$WORK/hello.txt"; }
s02(){ echo red green blue > "$WORK/colors.txt"; }
s03(){ ( cd "$WORK/kitchen" && echo hi > i-was-here.txt ); }
s04(){ ( cd "$WORK/house/kitchen" && touch ../garden/plant.txt ); }
s05(){ local w; w=$(sed -n 's/.*secret word is: //p' "$WORK/letter.txt"); echo "$w" > "$WORK/answer.txt"; }
s06(){ mkdir -p "$WORK/project" && touch "$WORK/project/notes.txt"; }
s07(){ ( cd "$WORK" && mv draft.txt final.txt && cp final.txt archive/ && rm old-junk.txt ); }
s08(){ ( cd "$WORK" && mv *.jpg photos/ ); }
s09(){ echo "day three: learned redirection" >> "$WORK/diary.txt"; }
s10(){ ( cd "$WORK" && grep vegetarian guests.txt | wc -l > count.txt ); }
s11(){ ( export FAVORITE_COLOR=blue; env > "$WORK/env.txt" ); }
s12(){ ls -a "$WORK" > "$WORK/listing.txt"; }
s13(){ ( cd "$WORK" && chmod +x hello.sh && ./hello.sh ); }
s14(){ ( cd "$WORK" && chmod +x backup.sh && ./backup.sh ); }
