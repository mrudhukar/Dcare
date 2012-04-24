class DiagnosisUrine < ActiveRecord::Base
  belongs_to :diagnosis
  attr_accessible :GFR, :alb, :ketones, :microalbumin, :sugar, :urine_pus_cells, :urine_spot_protien
end
