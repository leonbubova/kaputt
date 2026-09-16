source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
has_table customers || fail "no table customers (create table …)"
case "$(col_type customers id)" in integer|bigint|smallint) ;; *) fail "customers.id should be integer, is '$(col_type customers id)'";; esac
case "$(col_type customers name)" in text|"character varying") ;; *) fail "customers.name should be text, is '$(col_type customers name)'";; esac
case "$(col_type customers email)" in text|"character varying") ;; *) fail "customers.email should be text, is '$(col_type customers email)'";; esac
[ "$(col_type customers created_at)" = "timestamp with time zone" ] || fail "customers.created_at should be timestamptz, is '$(col_type customers created_at)'"
ok "customers table exists with the right columns"
