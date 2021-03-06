class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    
    if current_user_can? :destroy, @album
      @album.destroy
      redirect_to root_path
    else
      redirect_to root_path, :notice => "You cannot do that, sorry"
    end

  end

end



