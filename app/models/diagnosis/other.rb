class Diagnosis::Other < ActiveRecord::Base
  set_table_name "diagnosis_others"

  belongs_to :diagnosis
  attr_protected :diagnosis,:diagnosis_id
end
