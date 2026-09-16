source ../../../lib/common.sh; source ../lib.sh
[ "$(R GET note:hidden-4f2c)" = needle ] || fail "the note:* key was changed or deleted — wg reset to start over"
[ "$(R EXISTS found)" = 1 ] || fail "no key found yet — find the note:* key with SCAN, GET it, SET found <its value>"
[ "$(R GET found)" = needle ] || fail "found holds '$(R GET found)' — wanted the value stored under the note:* key"
ok "found = needle — you located a key among hundreds with SCAN"
