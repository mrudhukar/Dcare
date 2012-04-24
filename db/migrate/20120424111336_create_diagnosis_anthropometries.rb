class CreateDiagnosisAnthropometries < ActiveRecord::Migration
  def change
    create_table :diagnosis_anthropometries do |t|
      t.references :diagnosis
      t.string :height
      t.string :weight
      t.string :bmi
      t.string :abdominal_girth
      t.string :systoloic_bp
      t.string :diastolic_bp_supine
      t.string :diastolic_bp_errect

      t.timestamps
    end
    add_index :diagnosis_anthropometries, :diagnosis_id
  end
end
