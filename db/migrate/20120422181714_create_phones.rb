class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :user
      t.string :mobile_number
      t.string :office_number
      t.string :home_number

      t.timestamps
    end
  end
end
