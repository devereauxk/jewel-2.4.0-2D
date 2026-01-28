
HEPMC=$(realpath $1)

cd hepmcToRoot
rm Execute
make

for FILE in "$HEPMC"/*.hepmc
do
    BASENAME=$(basename "$FILE" .hepmc)

    ROOTFILE="$HEPMC/$BASENAME.root"
    echo "converting $FILE to $ROOTFILE"

    ./Execute "$FILE" "$ROOTFILE"
done
echo "conversion done"
