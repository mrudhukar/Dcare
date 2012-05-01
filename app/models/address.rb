class Address < ActiveRecord::Base
  attr_protected :user_id, :user

  belongs_to :user
  validates :user, :country, :state, :line1, :presence => true
end
