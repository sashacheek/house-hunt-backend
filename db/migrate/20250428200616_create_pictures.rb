class CreatePictures < ActiveRecord::Migration[8.0]
  def change
    create_table :pictures do |t|
      t.string :url
      t.boolean :main_img
      t.integer :listing_id

      t.timestamps
    end
    add_foreign_key :pictures, :listings, column: :listing_id, primary_key: :id
  end
end
