class Comment < ActiveRecord::Base
  belongs_to :matter
  belongs_to :user
end
