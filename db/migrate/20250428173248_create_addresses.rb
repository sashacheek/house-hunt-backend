class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state_code, limit: 2
      t.integer :zip_code, limit: 5

      t.timestamps
    end
  end
end
