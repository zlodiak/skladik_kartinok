class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    p '-------------'
    p @user
  end

  def new
  end

  def edit
  end

  def create  
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # params.require(:user).permit()
    end
end
