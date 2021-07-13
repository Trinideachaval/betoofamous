class RemovePhotoUrlFromCelebrities < ActiveRecord::Migration[6.0]
  def up
    remove_column :celebrities, :photo_url
  end

  def down
    add_column :celebrities, :photo_url, :string
  end
end
