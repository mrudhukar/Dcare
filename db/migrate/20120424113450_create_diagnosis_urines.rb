class CreateDiagnosisUrines < ActiveRecord::Migration
  def change
    create_table :diagnosis_urines do |t|
      t.references :diagnosis
      t.string :urine_pus_cells
      t.string :urine_spot_protien
      t.string :GFR
      t.string :sugar
      t.string :ketones
      t.string :microalbumin
      t.string :alb

      t.timestamps
    end
  end
end
