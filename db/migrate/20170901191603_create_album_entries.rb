class CreateAlbumEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :album_entries do |t|
      t.integer :photo_id
      t.integer :album_id

      t.timestamps
    end
  end
end
