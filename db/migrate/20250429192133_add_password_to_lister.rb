class AddPasswordToLister < ActiveRecord::Migration[8.0]
  def change
    add_column :listers, :password_digest, :string
  end
end
