class CreateStates < ActiveRecord::Migration[8.0]
  def change
    create_table :states, primary_key: :state_code do |t|
      t.string :state_code, limit: 2
      t.string :name

      t.timestamps
    end
  end
end
