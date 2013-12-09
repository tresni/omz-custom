export EDITOR=nano
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/Users/$USER/.bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export CFLAGS="-I/opt/local/include -L/opt/local/lib"
export CXXFLAGS=$CFLAGS
export CPPFLAGS=$CFLAGS

function portcheck() {
    if [[ $# -eq 1 ]]; then
        case "$1" in
            "-a"|"--all")
                ports=(`port installed | sed 1d | awk '{ print $1 }'`);
                ;;
            "-h"|"--help")
                cat <<EOF
$0 [--help|-h] [--all|-a]
Check for updates to MacPort ports.
By default only checks ports listed in \$MACPORTS_MAINTAINED

--help|-h  Print this message
--all|-a   Checks all installed ports
EOF
                return
                ;;
        esac
    else
        ports=($MACPORTS_MAINTAINED)
    fi

    for a in $ports; do
        port -v livecheck $a
    done | grep updated
}
