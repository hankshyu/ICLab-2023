wvRestoreSignal -win $_nWave1 \
           "/RAID2/COURSE/iclab/iclab105/Desktop/Lab06/Exercise/01_RTL/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSelectSignal -win $_nWave1 {( "G1" 29 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetPosition -win $_nWave1 {("G1" 28)}
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSetPosition -win $_nWave1 {("G1" 28)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 28)}
wvSetCursor -win $_nWave1 629374.759501 -snap {("G1" 28)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSetPosition -win $_nWave1 {("G1" 23)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 27)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 27)}
wvSetCursor -win $_nWave1 689236.529036 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 653319.467315 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 676266.478970 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 699213.490625 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 747102.906253 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 797985.410358 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 846872.522144 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 899750.418567 -snap {("G1" 27)}
wvExit
