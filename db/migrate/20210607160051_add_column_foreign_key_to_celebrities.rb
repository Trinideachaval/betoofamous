class AddColumnForeignKeyToCelebrities < ActiveRecord::Migration[6.0]
  def change
    add_reference :celebrities, :user, null: false, foreign_key: true
  end
end
