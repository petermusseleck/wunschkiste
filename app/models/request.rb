class Request < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :shop, :taken, :title, :url, :fulfilid
  validates :title, presence: true
  

  
end
