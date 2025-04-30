class CreateListers < ActiveRecord::Migration[8.0]
  def change
    create_table :listers do |t|
      t.string :fname
      t.string :lname
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
