sum=$((3+1))
good="more then one word"
argument_count=$#

echo "the argument count is: $argument_count"
# echo hi
# echo $good
# echo $sum

A=hi
B=wo

C="$A/$B"

echo $C

if [ "$argument_count" -ne 1 ]; then
    echo "please pass 1 and just 1 input after this file"
else
    echo $1
fi