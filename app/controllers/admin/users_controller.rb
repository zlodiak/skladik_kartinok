class Admin::UsersController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :admin_check

  layout 'admin'

  def index
    @users = User.all.paginate(page: params[:page], :per_page => 10).order(created_at: :DESC)
  end

  def show

  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Данные пользователя отредактированы'
    else
      flash[:error] = 'Данные пользователя не отредактированы'      
    end

    redirect_to admin_users_path
  end

  def destroy
    p '-========================================'
    if @user.destroy
      flash[:success] = "Пользователь удалён"      
    else
      flash[:error] = "Пользователь не удалён" 
    end

    redirect_to admin_users_path
  end

  private
    def set_video
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :info, :avatar, :delete_avatar, :fld_status, :fld_name)
    end
end
