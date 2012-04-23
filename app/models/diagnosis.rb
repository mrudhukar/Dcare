class Diagnosis < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :diagnosis_date, :name
end
