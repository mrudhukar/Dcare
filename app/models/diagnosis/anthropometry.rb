class Diagnosis::Anthropometry < ActiveRecord::Base
  set_table_name "diagnosis_anthropometries"

  belongs_to :diagnosis
  attr_protected :diagnosis,:diagnosis_id
end
