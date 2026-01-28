# runs jewel 2D for pPb param files. Run setup-pPb.sh first to create params files

PARAMS=$(realpath ./params/pPb)

if [ -z "$1" ]; then
    NFILES=0
else
    NFILES=$1
fi

i=0
for f in "$PARAMS"/params* 
do
    if [ "$NFILES" -ne 0 ] && [ $i -ge $NFILES ]; then
        break
    fi

    echo "running Jewel with params file: $f"
    ./jewel-2.4.0-2D "$f"
    i=$((i+1))
done

echo "done"
