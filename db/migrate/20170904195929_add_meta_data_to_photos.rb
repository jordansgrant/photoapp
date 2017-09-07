class AddMetaDataToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :photo_meta, :text
    add_column :photos, :orientation, :string
    add_column :photos, :date_taken, :datetime
  end
end
