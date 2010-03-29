class CreateMunicipios < ActiveRecord::Migration
  def self.up
    create_table "city_councils" do |t|
      t.string :autonomousRegion
      t.string :state
      t.string :city
      t.string :adresss
      t.string :postalCode
      t.string :telephone

      t.timestamps
    end
  end

  def self.down
    drop_table "city_councils"
  end
end
