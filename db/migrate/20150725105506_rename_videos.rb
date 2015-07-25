class RenameVideos < ActiveRecord::Migration
  def change
    rename_table :videos, :images
  end
end
