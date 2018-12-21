sh dayfile.sh
errorflag=`grep "NTEBANK-ERROR:fileNumCoord<>fileNum4" /backup/batchdir/shells/data/day.log|wc -l`
if [ errorflag -ge 1 ]; then
echo 1
else
echo 0
fi
