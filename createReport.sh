report() {
    declare -a v=("$@")

}


msg1="The number of lines in the input file sample.dat is "
msg2="The number of lines in the output file sample.out is "

inlines=0
outlines=0

if [ $# -eq 1 ]; then
    direct="./$1"
    echo "" > $1
    while read line; do report $line; done
else
    echo "error"
fi
