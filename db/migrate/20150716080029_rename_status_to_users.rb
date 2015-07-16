class RenameStatusToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :status, :status_id
  end
end
