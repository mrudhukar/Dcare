class Phone < ActiveRecord::Base
  belongs_to :user
  belongs_to :phone_type
  attr_accessible :phone_number
end
