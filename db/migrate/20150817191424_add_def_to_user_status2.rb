class AddDefToUserStatus2 < ActiveRecord::Migration
  def change
    change_column_default :users, :status_id, 1
  end
end
