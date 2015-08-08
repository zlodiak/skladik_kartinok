class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :logged_check, only: [:create, :edit, :update, :destroy]

  def index
    # @images = Image.all.order(created_at: :DESC)
    @images = Image.paginate(page: params[:page], :per_page => 18).order(created_at: :DESC)  
  end

  def show
    image_detail = Image.find(image_params[:image_id])
    owner = User.find(image_detail.user_id)

    if image_detail
      render json: {
                    url_giant: image_detail.image.url(:giant),
                    description: image_detail.description,
                    created_at: l(image_detail.created_at, format: "%e %b %Y, %H:%I"),
                    updated_at: l(image_detail.updated_at, format: "%e %b %Y, %H:%I"),
                    owner: owner.name
      }, :status => 200 
    else
      render nothing: true, :status => 404 
    end
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create  
    @image = Image.create(image_params)   

    if @image.save
      @image.update_attributes(user: current_user)
      render json: @image, :status => 200 
    else
      render json: @image.errors.full_messages, :status => 403 
    end
  end

  def update
    if @image.update_attributes(image_params)
      if params[:image]
        @image.update_attributes(
          image_file_name: nil, 
          image_content_type: nil, 
          image_file_size: nil
        )
      end
      
      flash[:success] = :profile_updated
      redirect_to @image
    else
      flash[:error] = :profile_update_failed
      render  'index'
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:description, :image, :album_id, :image_id)
    end
end
