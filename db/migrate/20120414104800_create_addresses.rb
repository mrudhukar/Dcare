class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :line1
      t.string :line2
      t.string :district
      t.string :state
      t.string :country
      t.string :pin

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
