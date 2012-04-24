class DiagnosisOther < ActiveRecord::Base
  belongs_to :diagnosis
  attr_accessible :ECG, :TMT, :VPT, :angiography, :carotid_doppler, :color_doppler_for_limbs, :echocardiography_2d, :fundus, :ultrasound
end
