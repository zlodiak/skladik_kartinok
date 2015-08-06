class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Данные профиля изменены'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Ошибка обновления данных профиля'
      render  'edit'
    end    
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :info)
    end
end
