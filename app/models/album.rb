class Album < ApplicationRecord
  has_many :album_entries
  has_many :photos, through: :album_entries
  validates :name, presence: true, length: { maximum: 50 }
  validates_uniqueness_of :is_featured, if: :is_featured
end
