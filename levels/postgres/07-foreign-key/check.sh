source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table visits || fail "no table visits yet — create table visits (…);"
case "$(col_type visits id)" in integer|bigint|smallint) ;; *) fail "visits.id should be integer, is '$(col_type visits id)'";; esac
case "$(col_type visits pet_id)" in integer|bigint|smallint) ;; *) fail "visits.pet_id should be integer, is '$(col_type visits pet_id)'";; esac
case "$(col_type visits reason)" in text|"character varying") ;; *) fail "visits.reason should be text, is '$(col_type visits reason)'";; esac
has_constraint visits p || fail "visits has no primary key — id integer primary key"
has_constraint visits f || fail "visits has no foreign key — pet_id integer references pets (id)"
rejects "insert into visits (id, pet_id, reason) values (9001, 999, 'x')" || fail "a visit for pet 999 (which does not exist) was accepted — pet_id must reference pets (id)"
sql "insert into visits (id, pet_id, reason) values (9001, 1, 'x'); delete from visits where id = 9001" >/dev/null || fail "a visit for pet 1 (Rex) was refused — pet_id should reference pets (id)"
ok "visits points at pets — you declared a foreign key"
