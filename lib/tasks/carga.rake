namespace :load do
  task :cityCouncils do

require 'config/environment'

print "loading city councils \n"

f = File.open("datosCarga/councils.csv","r")
f.readlines.each do |record|
  record_split = record.split("#")
  print record_split[0].to_s + " " + record_split[1].to_s + " " + record_split[2].to_s + "\n"
  CityCouncil.create(:autonomousRegion => record_split[0] , :state => record_split[1] , :city => record_split[2],
  :adresss  => record_split[3] + ' ' + record_split[4], :postalCode  => record_split[5],
  :telephone  => record_split[6])
  #Model.create(:attr1 => record[0], :attr2 => record[1] ....)
end
  end
end