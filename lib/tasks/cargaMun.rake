namespace :carga do
  task :Municipios do

require 'config/environment'

print "Ejecutamos la carga de los municipios \n"

f = File.open("datosCarga/municipios.csv","r")
f.readlines.each do |record|
  record_split = record.split("#")
  print record_split[0].to_s + " " + record_split[1].to_s + " " + record_split[2].to_s + "\n"
  Municipio.create(:comunidad => record_split[0] , :provincia => record_split[1] , :municipio => record_split[2],
  :tipoVia  => record_split[3] , :direccionVia  => record_split[4], :codigoPostal  => record_split[5],
  :telefono  => record_split[6])
  #Model.create(:attr1 => record[0], :attr2 => record[1] ....)
end
  end
end