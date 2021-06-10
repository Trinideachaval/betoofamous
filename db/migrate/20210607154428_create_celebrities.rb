class CreateCelebrities < ActiveRecord::Migration[6.0]
  def change
    create_table :celebrities do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.text :description
      t.string :photo_url

      t.timestamps
    end
  end
end
