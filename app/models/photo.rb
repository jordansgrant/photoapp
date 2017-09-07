require 'exifr/jpeg'
class Photo < ApplicationRecord
  has_attached_file :photo, styles:          { original: '1500x1500', 
                                               thumb: '200x200' },
                            convert_options: { original: "-auto-orient -quality 85",
                                               thumb: "-auto-orient -quality 85 -strip" },
                            url: "/photos/:hash.:extension",
                            hash_secret: "iVZDR3M4nWnRn5onH5HQDnTrHDXlF3mC"  
  
  before_photo_post_process :load_exif
                                                  
  validates_attachment :photo, presence: true, 
    content_type: { content_type: "image/jpeg" }

  has_many :album_entries
  has_many :albums, through: :album_entries

  def load_exif
    exif = EXIFR::JPEG.new(photo.queued_for_write[:original].path)
    return unless exif
    self.date_taken = exif.date_time
  end
end
