class ImageAlbumsController < ApplicationController

  def  new
    @album = ImageAlbum.new
  end

  def create
    @album = ImageAlbum.new(album_params)
    @album.save
    redirect_to image_album_path(@album)
  end

  def show
    @album = ImageAlbum.find_by(id:params[:id])
    @post_image = @album.post_images
  end

  private
  def album_params
    params.require(:image_album).permit(:title, post_images_images: [])
  end
end
