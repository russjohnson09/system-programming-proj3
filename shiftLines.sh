fun() {
    declare -a v=("$@")
    k=${#v[@]}
    for ((i=0;i<$k;i++)); do
        printf "%s " "${v[i]}"
        for ((j=i;j<$(($k+$i));j++)); do      
            index=$(($j%$k))
            #index=$(($i+$j))
            #index=$(($index%$k))
#            printf "%s " $index
            #printf "%s " ${v[@]}
        done
    echo ""
    done

}

fun2() {
    read -a array <<< "$@"
    len=${#array[@]}
    for ((i=0;i<$len;i++)); do
        unset v
        for ((j=0;j<$len;j++)); do
            index=$(($j+$i))
            index=$(($index%$len))
            v[j]=${array[j]}
        done
        for ((k=0;k<$len;k++)); do
            echo "${v[@]}"
        done
    done
}

fun3() {
    for element in "${array[@]}"
    do
        echo "$element"
    done
for index in "${!array[@]}"
do
    echo "$index ${array[index]}"
done
}

if [ $# -eq 1 ]; then
    fname="./$1"
    if [ -a $direct ]; then
        while read line; do fun2 "$line"; done <$fname
    else
        echo "error"
    fi
else
    echo "error"
fi
