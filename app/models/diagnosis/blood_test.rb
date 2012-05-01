class Diagnosis::BloodTest < ActiveRecord::Base
  set_table_name "diagnosis_blood_tests"

  belongs_to :diagnosis
  attr_protected :diagnosis,:diagnosis_id
end
