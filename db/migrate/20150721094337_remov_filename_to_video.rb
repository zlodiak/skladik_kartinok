class RemovFilenameToVideo < ActiveRecord::Migration
  def change
    remove_column :users, :filename
  end
end
