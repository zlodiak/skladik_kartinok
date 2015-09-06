class Admin::ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :admin_check

  layout 'admin'

  def index
    @images = Image.where(is_delete: nil).paginate(page: params[:page], :per_page => 10).order(created_at: :DESC)
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit  
  end

  def create
  end

  def update
    if @image.update_attributes(image_params)
      flash[:success] = 'Описание отредактировано'
    else
      flash[:error] = 'Описание не отредактировано'      
    end

    redirect_to admin_images_path
  end

  def destroy
    if @image.update_attributes(is_delete: true)
      flash[:success] = "Картинка удалена"      
    else
      flash[:error] = "Картинка не удалена" 
    end

    redirect_to admin_images_path
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:description)
    end
end
