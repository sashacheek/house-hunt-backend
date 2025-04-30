class AddStateToAddress < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :addresses, :states, column: :state_code, primary_key: :state_code
  end
end
