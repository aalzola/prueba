class Matter < ActiveRecord::Base
  has_many :comments
  
  validates_presence_of     :name, :description
  validates_length_of       :name,     :maximum => 100
  validates_length_of       :description,     :maximum => 1000
  
end
