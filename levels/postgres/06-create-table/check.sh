source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table owners || fail "no table owners yet — create table owners (…);"
case "$(col_type owners id)" in integer|bigint|smallint) ;; *) fail "owners.id should be integer, is '$(col_type owners id)'";; esac
case "$(col_type owners name)" in text|"character varying") ;; *) fail "owners.name should be text, is '$(col_type owners name)'";; esac
case "$(col_type owners email)" in text|"character varying") ;; *) fail "owners.email should be text, is '$(col_type owners email)'";; esac
has_constraint owners p || fail "owners has no primary key — id integer primary key"
rejects "insert into owners (id, name, email) values (1, 'a', 'a@x'); insert into owners (id, name, email) values (1, 'b', 'b@x')" || fail "two rows with id 1 were accepted — the primary key must be on id"
sql "delete from owners where id = 1" >/dev/null
ok "owners table exists with id as primary key — you declared columns and types"
