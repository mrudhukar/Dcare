class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.references :user
      t.string :name
      t.text :description
      t.date :diagnosis_date

      t.timestamps
    end
    add_index :diagnoses, :user_id
  end
end
