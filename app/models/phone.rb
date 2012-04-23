class Phone < ActiveRecord::Base
  attr_accessible :home_number, :mobile_number, :office_number, :user
  validates :mobile_number, :presence => true
  belongs_to :user
end
