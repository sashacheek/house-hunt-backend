class AddAuthTokenToListers < ActiveRecord::Migration[8.0]
  def change
    add_column :listers, :auth_token, :string
  end
end
