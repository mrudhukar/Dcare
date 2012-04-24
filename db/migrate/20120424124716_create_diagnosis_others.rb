class CreateDiagnosisOthers < ActiveRecord::Migration
  def change
    create_table :diagnosis_others do |t|
      t.references :diagnosis
      t.string :fundus
      t.string :VPT
      t.string :ECG
      t.string :TMT
      t.string :echocardiography_2d
      t.string :angiography
      t.string :ultrasound
      t.string :carotid_doppler
      t.string :color_doppler_for_limbs

      t.timestamps
    end
    add_index :diagnosis_others, :diagnosis_id
  end
end
