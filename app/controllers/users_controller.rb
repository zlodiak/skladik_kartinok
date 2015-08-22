class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @statuses = Status.all

    if (params[:fld_status] == nil) || (params[:fld_status] == '')
      @users = User.paginate(page: params[:page], :per_page => 10).order(created_at: :DESC)        
    else
      @users = User.where(status_id: params[:fld_status]).paginate(page: params[:page], :per_page => 10).order(created_at: :DESC)  
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      if params[:delete_avatar]
        @user.update_attributes(
          avatar_file_name: nil, 
          avatar_content_type: nil, 
          avatar_file_size: nil
        )
      end
            
      flash[:success] = 'Данные профиля изменены'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Ошибка обновления данных профиля'
      render  'edit'
    end    
  end

  def destroy
    if current_user.destroy
      flash[:success] = 'Аккаунт удалён'
      redirect_to root_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :info, :avatar, :delete_avatar, :fld_status)
    end
end
