#!/usr/bin/ruby

i=0
Dir.foreach('/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/*') do |item|
  next if item == '*.p'
  /home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr < ${i}.p | prover9 > ${i}.out
  print "complete\n"
  i=i+1
  sleep 10
end
