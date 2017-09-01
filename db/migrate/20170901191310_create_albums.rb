class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.bool :is_featured, default: false
      t.text :description

      t.timestamps
    end
  end
end
