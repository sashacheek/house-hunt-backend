class RenameTypeColumn < ActiveRecord::Migration[8.0]
  def change
    rename_column :types, :type, :type_name
  end
end
