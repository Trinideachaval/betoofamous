class ChangeColumnNameFromCelebrity < ActiveRecord::Migration[6.0]
  def change
    rename_column :celebrities, :city, :adress
  end
end
