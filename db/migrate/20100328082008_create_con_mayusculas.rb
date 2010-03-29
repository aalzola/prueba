class CreateConMayusculas < ActiveRecord::Migration
  def self.up
    create_table :con_mayusculas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :con_mayusculas
  end
end
