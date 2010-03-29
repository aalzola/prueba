class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :comment
      t.references :user
      t.references :matter
      t.column :name, :string, :limit => 100, :default => '', :null => true
      t.column :email, :string, :limit => 100
      t.timestamps
    end
    add_index :comments, :id
    add_index :comments, :user_id
    add_index :comments, :matter_id
  end

  def self.down
    drop_table :comments
  end
end
