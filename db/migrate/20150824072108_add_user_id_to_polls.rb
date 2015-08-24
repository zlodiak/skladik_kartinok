class AddUserIdToPolls < ActiveRecord::Migration
  def change
    rename_column(:polls, :owner, :user_id) 
  end
end
