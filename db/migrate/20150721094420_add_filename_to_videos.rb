class AddFilenameToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :filename, :string
  end
end
