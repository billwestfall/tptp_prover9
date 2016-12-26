#!/usr/bin/ruby

#Dir.foreach('/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/*') do |item|
#  next if item == '*.p'
#  /home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr < #{item}.p | prover9 > #{item}.out
#  print "complete\n"
#  sleep 10
#end

Dir.glob('/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/AGT/*.p').each do |fileName|
  "'/home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr' < fileName > /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/fileName.in"
  "'/home/pi/Documents/LADR-2009-11A/bin/prover9' -f /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/fileName.in > /home/pi/Documents/tptp/TPTP-v6.4.0/Problems/fileName.out"
  print "complete\n"
  sleep 10
end
