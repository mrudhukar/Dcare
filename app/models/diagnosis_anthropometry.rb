class DiagnosisAnthropometry < ActiveRecord::Base
  belongs_to :diagnosis
  attr_accessible :abdominal_girth, :bmi, :diastolic_bp_errect, :diastolic_bp_supine, :height, :systoloic_bp, :weight
end
