class DelColsFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :filename
    remove_column :videos, :filesize
    remove_column :videos, :fileformat
  end
end
