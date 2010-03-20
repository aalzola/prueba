class CreateMunicipios < ActiveRecord::Migration
  def self.up
    create_table :municipios do |t|
      t.string :comunidad
      t.string :provincia
      t.string :municipio
      t.string :tipoVia
      t.string :direccionVia
      t.string :codigoPostal
      t.string :telefono

      t.timestamps
    end
  end

  def self.down
    drop_table :municipios
  end
end
