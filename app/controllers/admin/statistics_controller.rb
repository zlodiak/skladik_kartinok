class Admin::StatisticsController < ApplicationController
  before_action :admin_check

  layout 'admin'

  def index
    @accounts_quantity = User.all.count()
    @admins_quantity = User.where(status_id: 2).count()
    @managers_quantity = User.where(status_id: 1).count()
    @users_quantity = User.where(status_id: 0).count()
    @accounts_with_avatar_quantity = User.where.not(avatar_file_name: nil).count()
  end
end