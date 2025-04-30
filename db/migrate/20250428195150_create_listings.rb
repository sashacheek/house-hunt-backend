class CreateListings < ActiveRecord::Migration[8.0]
  def change
    create_table :listings do |t|
      t.integer :bedrooms
      t.float :bathrooms
      t.integer :square_ft
      t.integer :address_id
      t.integer :type_id
      t.string :description
      t.integer :lister_id

      t.timestamps
    end

    add_foreign_key :listings, :addresses, column: :address_id, primary_key: :id
    add_foreign_key :listings, :types, column: :type_id, primary_key: :id
    add_foreign_key :listings, :listers, column: :lister_id, primary_key: :id
  end
end
