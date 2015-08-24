class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_action :owner_check, only: [:edit, :update, :destroy]  

  def index
    @user = User.find(params[:user_id])
    @polls = @user.polls.paginate(page: params[:page], :per_page => 10).order(title: :DESC)
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
    @poll = current_user.polls.build(poll_params)

    if @poll.save      
      flash[:success] = 'Голосование создано'
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
    if @poll.destroy
      render nothing: true, :status => 200 
    else      
      render nothing: true, :status => 403 
    end
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:title, :description)
    end   

    def owner_check
      unless (admin_status) || (@poll.user.id == current_user.id)
        render nothing: true, :status => 403 
      end
    end       
end
