#!/usr/bin/ruby

#Dir.foreach('/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/*') do |item|
#  next if item == '*.p'
#  /home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr < #{item}.p | prover9 > #{item}.out
#  print "complete\n"
#  sleep 10
#end

Dir.glob('/home/pi/Documents/tptp/TPTP-v6.4.0/Problems/*/*.p').each do |fileName|
  '/home/pi/Documents/LADR-2009-11A/bin/tptp_to_ladr' < fileName | prover9 > fileName.out
  print "complete\n"
  sleep 10
end
