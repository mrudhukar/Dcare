class Phone < ActiveRecord::Base
  attr_accessible :home_number, :mobile_number, :office_number, :user
  
  belongs_to :user

  validates :mobile_number, :user, :presence => true
end
