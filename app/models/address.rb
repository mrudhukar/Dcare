class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :country, :district, :line1, :line2, :pin, :state
end
