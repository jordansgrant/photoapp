class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :album_entries
  has_many :albums, through: :album_entries
end
