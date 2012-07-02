class Establishment < ActiveRecord::Base
  attr_accessible :name, :lat, :long
  
  belongs_to :user
  
  validates :user_id, :presence => true
end
