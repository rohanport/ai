source .env
prog="$1"; shift;
make prog="$prog" "$@"