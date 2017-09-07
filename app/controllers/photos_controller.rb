class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "Your photo was uploaded!"
      redirect_to photo_url(@photo)
    else
      flash[:error] = "We hit a snag, photo not uploaded"
      render 'new'
    end
  end
 
  private
    def photo_params
      p = params.require(:photo).permit(:photo, :name)
      #p.merge PhotoUploader.get_metadata(params[:photo][:photo].path)
    end
 
end
