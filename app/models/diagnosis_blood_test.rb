class DiagnosisBloodTest < ActiveRecord::Base
  belongs_to :diagnosis
  attr_accessible :LFT_GGT, :LFT_SGOT, :LFT_SGPT, :LFT_gloulin_ratio, :LFT_serum_albumin, :LFT_serum_bilirubin, :blood_sugar_fasting, :blood_sugar_pp, :blood_urea, :esr, :hba1c, :hdl, :hemoglobin_differential_count, :hemoglobin_total, :ldl, :serum_creatinine, :serum_uric_acid, :total_cholestrol, :triglycerides
end
