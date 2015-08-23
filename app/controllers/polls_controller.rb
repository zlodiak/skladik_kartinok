class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @polls = Poll.paginate(page: params[:page], :per_page => 10).order(title: :DESC)
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @poll = Poll.new
  end

  def edit
  end

  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      flash[:success] = 'Голосование создано'
      binding.pry
      redirect_to user_polls_path(current_user)
    else
      flash.now[:error] = 'Голосование не создано'
      @user = User.find(params[:user_id])
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:title, :description)
    end    
end
