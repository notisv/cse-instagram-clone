class PhotosController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if params[:photo][:image] == nil
      flash[:alert] = "Please upload a photo."
      redirect_to :back
    elsif params[:photo][:title] == ""
      flash[:alert] = "You forgot to add a title!"
      redirect_to :back
    else
    @photo = Photo.create(photo_params)
      @photo.user_id = @user.id
      @photo.save
      flash[:notice] = "Successfully uploaded a photo!"
      redirect_to user_path(@user)
    end
  end

  def new
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
