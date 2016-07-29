# If a file ~/.mysql/$1.cnf exists, call mysql(1) using that file. Otherwise
# just run MySQL with given args. Use restrictive permissions on these files.
# Examples:
#
#   [client]
#   host=dbhost.example.com
#   user=foo
#   password=SsJ2pICe226jM
#
#   [mysql]
#   database=bar
#
mysql() {
    local config
    config=$HOME/.mysql/$1.cnf
    if [[ -r $config ]] ; then
        shift
        set -- --defaults-extra-file="$config" "$@"
    fi
    command mysql "$@"
}
