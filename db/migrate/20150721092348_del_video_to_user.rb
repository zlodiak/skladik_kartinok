class DelVideoToUser < ActiveRecord::Migration
  def change
    remove_column :users, :video
  end
end
