class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all 
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)   
    
    if @video.save
      flash[:success] = :video_created
      redirect_to @video
    else
      flash.now[:error] = :user_not_created
      redirect_to @video
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    if @video.update_attributes(video_params)
      if params[:video]
        @video.update_attributes(
          video_file_name: nil, 
          video_content_type: nil, 
          video_file_size: nil
        )
      end
      
      flash[:success] = :profile_updated
      redirect_to @video
    else
      flash[:error] = :profile_update_failed
      render  'index'
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :video)
    end
end
