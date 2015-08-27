class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy, :get_poll_data]
  before_action :admin_or_manager_check, only: [:edit, :update, :destroy]  

  def index
    @user = User.find(params[:user_id])
    @polls = @user.polls.paginate(page: params[:page], :per_page => 10).order(title: :DESC)
  end

  def show    
    @user = User.find(params[:user_id])
    @images = @poll.images.paginate(page: params[:page], :per_page => 10)
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
    @value_title = params[:fld_title]
    @order = params[:fld_order] || 'Сначала старые'

    if params[:fld_order] == 'Сначала новые'
      order_dir = :ASC
    else
      order_dir = :DESC
    end    

    if params[:fld_title].blank?
      @polls = Poll.all.paginate(page: params[:page], :per_page => 10).order(title: order_dir)
    else
      @polls = Poll.where("title LIKE :query", query: "%#{params[:fld_title]}%").paginate(page: params[:page], :per_page => 10).order(title: order_dir)
    end
  end

  def change_poll_state
    @poll = Poll.find(params[:pollId])

    if(@poll.update_attributes(status_poll_id: params[:newStateCode])) && admin_or_owner_check(current_user.id, params[:userId])
      render json: @poll, :status => 200 
    else
      render json: @poll.errors.full_messages, :status => 403 
    end
  end

  private
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def poll_params
      params.require(:poll).permit(:title, :description)
    end   

    def admin_or_owner_check(current_user_id, owner_id)
      if (current_user_id.to_i == owner_id.to_i) || (admin_status)
        return true
      else
        return nil
      end
    end
      
    def admin_or_manager_check
      unless (admin_status || manager_status)
        render nothing: true, :status => 403 
      end
    end       
end
