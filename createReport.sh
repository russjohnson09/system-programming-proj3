msg1="The number of lines in the input file sample.dat is "
msg2="The number of lines in the output file sample.out is "

inlines=0
outlines=0

if [ $# -eq 1 ]; then
    fname="./$1"
    > $fname
    while read line; do
        echo $line
    done
    echo ""
    while read line; do 
        let inlines++
    done <./.tempin
    while read line; do 
        let outlines++
    done <./.tempout
    echo $msg1$inlines
    echo $msg2$outlines   
else
    exit 1
fi
