class Address < ActiveRecord::Base
  attr_protected :user

  belongs_to :user
  validates :user, :country, :state, :line1, :presence => true
end
