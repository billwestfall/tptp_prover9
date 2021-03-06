#!/bin/sh
 
n=1
while [ $n -le 23000 ]
do
  dir='/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL'
  file=`/bin/ls -R -1 "$dir" | sort --random-sort | head -1`
  path=`readlink --canonicalize "$dir/$file"` # Converts to full path
  sleep 3
  echo "The randomly-selected file is: $path"
  cd "/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL"
  sleep 3
  `'/home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr' < /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/$file > /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/$file.in & sleep 900 ; kill $!`
  ls /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/*.in | wc -l
  sleep 3
  `'/home/pi/Documents/LADR-2009-11A/bin/prover9' -f /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/$file.in > /home/pi/Documents/tptp/TPTP-v6.4.0/Outfiles/$file.out & sleep 900 ; kill $!`
  ls /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/ALL/*.in | wc -l
  ls /home/pi/Documents/tptp/TPTP-v6.4.0/Outfiles | wc -l
  sleep 900
n=$(( n+1 ))
done
