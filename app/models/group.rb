class Group < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members
  attr_accessible :name, :user_id

  
  
end
