# makes Tlist.dat and Vlist.dat for trajectum files in target directory

SAMPLE=$1

for DIR in "$SAMPLE"/*/
do
    DIR="${DIR%/}"

    find "$DIR" -type f -name "Tcontour*" -exec readlink -f {} + > "$DIR/Tlist.dat"
    echo "produced Tlist.dat at ${DIR}/Tlist.dat"

    find "$DIR" -type f -name "Vcontour*" -exec readlink -f {} + > "$DIR/Vlist.dat"
    echo "produced Vlist.dat at ${DIR}/Vlist.dat"

done

echo "done"
