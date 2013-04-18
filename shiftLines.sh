fun2() {
    read -a array <<< "$@"
    len=${#array[@]}
    for ((i=0;i<$len;i++)); do
        unset v
        for ((j=0;j<$len;j++)); do
            index=$(($j+$i))
            index=$(($index%$len))
            v[j]=${array[index]}
        done
        echo "${v[@]}"
        echo "${v[@]}" >> ./.tempin
    done
}

if [ $# -eq 1 ]; then
    >./.tempin
    fname="./$1"
    if [ -a $direct ]; then
        while read line; do fun2 "${line%?}"; done <$fname
    else
        exit 1
    fi
else
    exit 2
fi
