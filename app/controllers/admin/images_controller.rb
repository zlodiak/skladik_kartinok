class Admin::ImagesController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :admin_check

  layout 'admin'

  def index
    @images = Image.all.paginate(page: params[:page], :per_page => 6).order(created_at: :DESC)
  end

  def show

  end

  def new
    @image = Image.new
  end

  def edit
    p '-------------------------------'
    p @image    
  end

  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
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
    if @image.destroy
      flash[:success] = "Картинка удалена"      
    else
      flash[:error] = "Картинка не удалена" 
    end

    redirect_to admin_images_path
  end

  private
    def set_video
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:description)
    end
end
