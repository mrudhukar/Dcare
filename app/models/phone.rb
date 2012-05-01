class Phone < ActiveRecord::Base
  attr_protected :user
  
  belongs_to :user
  validates :user, :mobile_number, :presence => true
end
