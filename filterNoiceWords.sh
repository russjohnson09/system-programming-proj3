noice() {
    declare -a v=("$@")
    shopt -s nocasematch

    for e in "${n[@]}"
        do [[ "$e" = "${v[0]}" ]] && return 0; done
    echo ${v[@]}
    echo ${v[@]} >> ./.tempout
    shopt -u nocasematch
}

if [ $# -eq 1 ]; then
    >> ./.tempout
    temp=$IFS
    IFS=$'\n'
    direct="./$1"
    if [ -a $direct ]; then
        n=($(cat $direct))
        IFS=$temp
        while read line; do noice $line; done
    else
        exit 1
    fi
    IFS=$temp
else
    exit 2
fi
