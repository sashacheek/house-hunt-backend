class AddPriceToListings < ActiveRecord::Migration[8.0]
  def change
    add_column :listings, :price, :float
  end
end
