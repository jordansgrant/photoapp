require 'rails_helper'

RSpec.describe Album, type: :model do
  before(:example) do
    Album.create(name: "Test Album", description: "Test Description", is_featured: true)
  end

  context "Album creation" do
    it "Should not allow more than one featured album" do
      album = Album.new(name: "Test2", description: "Test2 Description", is_featured: true)
      expect(album.valid?).to eq(false)

      album.is_featured = false
      expect(album.valid?).to eq(true)
    end
  end
end
