class Admin::StatisticsController < ApplicationController
  before_action :admin_check

  layout 'admin'

  def index
    @accounts_quantity = User.all.count()
    @admins_quantity = User.where(status_id: 2).count()
    @managers_quantity = User.where(status_id: 1).count()
    @users_quantity = User.where(status_id: 0).count()
    @accounts_with_avatar_quantity = User.where.not(avatar_file_name: nil).count()

    @images_quantity = Image.where(is_delete: nil).count()
    @images_in_poll_quantity = Image.where.not(poll_id: nil).count()

    @polls_quantity = Poll.all.count()
    @polls_closed_quantity = Poll.where(status_poll_id: 1).count()
    @polls_opened_quantity = Poll.where(status_poll_id: 0).count()

    @albums_quantity = Album.all.count()
    @average_images_in_album_quantity = @images_quantity / Album.all.count()
  end
end