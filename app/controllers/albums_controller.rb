class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :admin_or_owner_check, only: [:edit, :update, :destroy]

  def index
    @albums = Album.all
    @album = Album.new
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = current_user.albums.build(album_params)

    if @album.save
      # @album_id = @album.id
      #redirect_to new_user_album_path(@current_user)
      render json: @album.id, :status => 200 
    else
      render nothing: true, :status => 403 
    end
  end

  def update
    if @album.update_attributes(album_params)
      flash[:success] = :album_updated
      redirect_to user_album_path(current_user, @album)
    else
      flash[:error] = :album_not_updated
      render  'edit'
    end
  end

  def destroy
    if @album.destroy
      render nothing: true, :status => 200 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title)
    end

    def admin_or_owner_check
      unless admin_status || @album.user.id == current_user.id
        redirect_to user_albums_path, :status => 403      
      end
    end    
end
