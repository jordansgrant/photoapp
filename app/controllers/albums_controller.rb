class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.is_featured
      old_featured = Album.find_by(is_featured: true)
      old_featured.update(is_featured: false) unless old_featured.nil?
    end
    if @album.save
      flash[:success] = "#{@album.name} was created. Now give it Photos!"
      redirect_to update_photos_url(@album)
    else
      flash[:error] = "Failed to create album"
      render :new
    end
  end

  def update_photos
    @album = Album.find(params[:id])
    @photos = Photo.all
  end

  def save_photos
    @album = Album.find(params[:id])
    @album.photo_ids = JSON.parse(params[:photos]).map {|p_id| p_id.to_i}
    if @album.save
      flash[:success] = "#{@album.name} was updated successfully"
      redirect_to album_url(@album)
    else
      flash[:error] = "Failed to update album"
      render :update_photos
    end
  end
  
  private
    def album_params
      params.require(:album).permit(:name, :description, :is_featured, :photos)
    end
end
