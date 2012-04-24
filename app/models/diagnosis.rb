class Diagnosis < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :diagnosis_date, :name, :diagnosis_blood_test, :diagnosis_anthropometry, :diagnosis_urine, :diagnosis_other
  has_one :diagnosis_blood_test
  has_one :diagnosis_anthropometry
  has_one :diagnosis_urine
  has_one :diagnosis_other
end
