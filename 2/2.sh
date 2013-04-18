subdir() {
    cd $1
    temp=$IFS
    IFS='_'
    for file in *; do
        if [[ ! -d $file ]]; then read -a array <<< "$file"; fi;
        subdir=${array[1]}
        if [[ ! -d ${array[1]} ]]; then mkdir $subdir; fi;
    done

    IFS=$temp
    cd ..
}

mvfiles() {
    temp=$IFS
    IFS='_'
    cd $1
    for file in *; do
        if [[ ! -d $file ]]; then 
            read -a array <<< "$file";
            subdir=${array[1]}
            if [[ ${#array[@]} -lt 5 ]]; then
                mv "$file" "$subdir/memo.txt"
            else
                mv "$file" "$subdir/${array[4]}"
            fi
                
        fi
    done
    IFS=$temp
    cd ..

}

maketest() {

    direct="$PWD/$1/"
    cd $direct
    for file in *; do
        echo $file
            make -f ../../makefile -C $file
            make test -f ../../makefile -C $file
    done

}



if [ $# -eq 1 ]; then
    direct=${1:0:$((${#1}-4))}
    unzip $1 -d $direct
    subdir $direct
    mvfiles $direct
    maketest $direct
fi
