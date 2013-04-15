cycle() {
    k=${#1[@]}
    for ((i=0;i<${#1[@]};i++)); do
        for ((j=0;i<${#1[@]};j++)); do
            printf "%s" ${1[($i+$j)%$k]}
        done
        printf "\n"
    done
  }
fun() {
    declare -a v=("$@")
    k=${#v[@]}
    for ((i=0;i<$k;i++)); do
        for ((j=0;j<$k;j++)); do
            index=$(($i+$j))
            index=$(($index%$k))
            printf "%s " $index
            printf "%s " ${v[index]}
        done
    echo ""
    done

}

#while read -a line ; do cycle $line ; done;
while read line ; do fun $line ; done;
#while read line
#    do readline $line
#done
