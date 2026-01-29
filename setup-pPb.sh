# makes jewel params and medium files for pPb sample

SAMPLE=/home/kdeverea/Jewel/hydro/pPb/sample
PARAMS=$(realpath ./params/pPb)

echo "setting up params files in ${PARAMS} for sample in ${SAMPLE}"

shopt -s dotglob

rm -rf ${PARAMS}
mkdir -p ${PARAMS}

for DIR in "$SAMPLE"/*/
do
    NCOLL=$(basename "$DIR")

cat > ${PARAMS}/medium.2D-pPb-${NCOLL}.dat <<EOF
CENTRMIN 0.
CENTRMAX 100.
A 208
HYDRODIR ${SAMPLE}/${NCOLL}
EOF

cat > ${PARAMS}/params.2D-pPb-${NCOLL}.dat <<EOF
NEVENT 100
LOGFILE logs/pPb/2D-pPb-${NCOLL}.log
HEPMCFILE eventfiles/pPb/2D-pPb-${NCOLL}.hepmc
PTMIN 10.
PTMAX -1.
ETAMAX 2.5
PROCESS 'PPZJ'
SQRTS 8160.
MASS 1.
# this is to include recoil effects
KEEPRECOILS T
# to write the output necessary for subtraction of the thermal momentum components
WRITESCATCEN T
# to write out dummy particles (needed for 4MomSub subtraction)
WRITEDUMMIES T
# And we also want to change the medium parameters:
MEDIUMPARAMS ${PARAMS}/medium.2D-pPb-${NCOLL}.dat
EOF

done

shopt -u dotglob

echo "done"
