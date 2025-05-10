class AddCascadingDeletes < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :pictures, :listings
    add_foreign_key :pictures, :listings, on_delete: :cascade
    remove_foreign_key :listings, :addresses
    add_foreign_key :listings, :addresses, on_delete: :cascade
  end
end
