class CreateAsuntos < ActiveRecord::Migration
  def self.up
    create_table "matters", :force => true do |t|
      t.column :name,         :string, :limit => 50
      t.column :description,   :string, :limit => 1000
      t.column :created_at,    :datetime
      t.column :updated_at,    :datetime
      t.column :address,       :string
      t.column :city,          :string
      t.column :state,         :string
      t.column :country_id,    :integer
      t.column :latitude,      :string
      t.column :longitude,     :string
      t.column :login,         :string, :limit => 40
    end
    add_index :matters, :city, :unique => false
  end

  def self.down
    drop_table "matters"
  end
end
