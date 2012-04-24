class CreateDiagnosisBloodTests < ActiveRecord::Migration
  def change
    create_table :diagnosis_blood_tests do |t|
      t.references :diagnosis
      t.string :hemoglobin_total
      t.string :hemoglobin_differential_count
      t.string :esr
      t.string :blood_sugar_fasting
      t.string :blood_sugar_pp
      t.string :hba1c
      t.string :triglycerides
      t.string :total_cholestrol
      t.string :ldl
      t.string :hdl
      t.string :blood_urea
      t.string :serum_uric_acid
      t.string :serum_creatinine
      t.string :LFT_serum_albumin
      t.string :LFT_gloulin_ratio
      t.string :LFT_serum_bilirubin
      t.string :LFT_SGOT
      t.string :LFT_SGPT
      t.string :LFT_GGT

      t.timestamps
    end
    add_index :diagnosis_blood_tests, :diagnosis_id
  end
end
