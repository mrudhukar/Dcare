class CreatePhoneTypes < ActiveRecord::Migration
  def change
    create_table :phone_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
