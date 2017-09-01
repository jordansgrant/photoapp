class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :albums, through: :album_entry
end
