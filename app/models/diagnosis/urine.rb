class Diagnosis::Urine < ActiveRecord::Base
  set_table_name "diagnosis_urines"

  belongs_to :diagnosis
  attr_protected :diagnosis,:diagnosis_id
end
