class AddAddressToCelebrities < ActiveRecord::Migration[6.0]
  def change
    add_column :celebrities, :address, :string
  end
end
