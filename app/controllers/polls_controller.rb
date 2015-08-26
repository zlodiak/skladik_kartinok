class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy, :get_poll_data]
  before_action :permission_check, only: [:edit, :update, :destroy]  

  def index
    @user = User.find(params[:user_id])
    @polls = @user.polls.paginate(page: params[:page], :per_page => 10).order(title: :DESC)
  end

  def show
    @user = User.find(params[:user_id])
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
    if @poll.update_attributes(poll_params)
      render json: @poll, :status => 200 
    else
      render json: @poll.errors.full_messages, :status => 403 
    end
  end

  def destroy
    if @poll.destroy
      render nothing: true, :status => 200 
    else      
      render nothing: true, :status => 403 
    end
  end

  def get_poll_data
    if @poll
      render json: @poll, :status => 200 
    else
      render nothing: true, :status => 404  
    end
  end  

  def poll_list
    @polls = Poll.all.paginate(page: params[:page], :per_page => 10).order(title: :DESC)
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:title, :description)
    end   

    def permission_check
      unless (admin_status || manager_status)
        render nothing: true, :status => 403 
      end
    end       
end
