class ImagePollsTableDel < ActiveRecord::Migration
  def change
    drop_table :images_polls
  end
end
