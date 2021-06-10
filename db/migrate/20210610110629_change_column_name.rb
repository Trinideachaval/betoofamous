class ChngeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :celebrities, :adress, :address
  end
end
