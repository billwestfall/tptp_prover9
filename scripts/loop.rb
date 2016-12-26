#!/usr/bin/ruby

Dir.foreach('/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/*') do |item|
  next if item == '*.p'
  /home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr < *.p | prover9 > *.out
  print "complete\n"
  sleep 10
end
