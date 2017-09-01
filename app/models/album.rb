class Album < ApplicationRecord
  has_many :albums, through: :album_entry
  validates :name, presence: true, length: { maximum: 50 }
  validates_uniqueness_of :is_featured, if: :is_featured
end
