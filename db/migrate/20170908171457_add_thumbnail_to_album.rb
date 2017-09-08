class AddThumbnailToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :thumbnail, :integer
  end
end
