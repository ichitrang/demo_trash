class TrashController < ApplicationController
  def index
    @trashs=Trash.all
  end

  def restore
    @trashs=Trash.find(params[:id])
    @photo=Photo.new
    @photo.img=@trashs.img.blob
    @photo.save
    @trashs.destroy
    redirect_to root_path
  end

  def destroy
    @trashs=Trash.find(params[:id])
    @trashs.destroy
  end
end
