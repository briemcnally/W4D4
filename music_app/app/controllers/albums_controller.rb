class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = ["Invalid album credentials!"]
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = ["You can't edit this album!"]
    end
  end


  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to new_album_url
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title, :year, :studio_recording)
  end


end
