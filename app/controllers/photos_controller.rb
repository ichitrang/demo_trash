class PhotosController < ApplicationController
  def index
    @photos=Photo.all
  end

  def new
    @photo=Photo.new 
  end

  def create
    @photo=Photo.new(photo_params)
    if @photo.save 
      redirect_to root_path
    end
  end

  def destroy
    @photo=Photo.find(params[:id])
    @trash=Trash.new
    @trash.img=@photo.img.blob
    @trash.save
    @photo.destroy
    redirect_to root_path
  end
  private 
  def photo_params 
    params.require(:photo).permit(:name,:img)
  end
end
