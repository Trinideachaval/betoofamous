class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :reserve_begin
      t.date :reserve_end
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :celebrity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
