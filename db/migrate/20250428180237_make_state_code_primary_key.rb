class MakeStateCodePrimaryKey < ActiveRecord::Migration[8.0]
  def change
    remove_column :state, :id, :primary_key
    execute "ALTER TABLE states ADD PRIMARY KEY (state_code);"
  end
end
