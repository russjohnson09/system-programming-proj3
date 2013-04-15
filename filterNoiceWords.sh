noice() {
    declare -a v=("$@")
    shopt -s nocasematch

    for e in "${noice[@]}"
        do [[ "$e" = "${v[0]}" ]] && return 0; done
    echo ${v[@]}
    shopt -u nocasematch
}

if [ $# -eq 1 ]; then
    temp=$IFS
    IFS=$'\n'
    direct="./$1"
    if [ -a $direct ]; then
        noice=($(cat $direct))
        IFS=$temp
        while read line; do noice $line; done
    else
        echo "error"
    fi
else
    echo "error"
fi
