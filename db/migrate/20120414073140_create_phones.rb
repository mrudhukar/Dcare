class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :user
      t.integer :phone_number
      t.references :phone_type

      t.timestamps
    end
    add_index :phones, :user_id
    add_index :phones, :phone_type_id
  end
end
