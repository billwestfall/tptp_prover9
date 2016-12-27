#!/bin/sh

n=1
while [ $n -le 500 ]
do
  dir='/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL'
  file=`/bin/ls -R -1 "$dir" | sort --random-sort | head -1`
  path=`readlink --canonicalize "$dir/$file"` # Converts to full path
  sleep 3
  echo "The randomly-selected file is: $path"
  cd "/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL"
  sleep 3
  `'/home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr' < /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/$file > /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/$file.in`
  ls /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/*.in
  sleep 3
  `'/home/pi/Documents/LADR-2009-11A/bin/prover9' -f /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/$file.in > /home/pi/Documents/tptp/TPTP-v6.4.0/Outfiles/$file.out`
  ls /home/pi/Documents/tptp/TPTP-v6.4.0/Outfiles
  sleep 900
n=$(( n+1 ))
done
