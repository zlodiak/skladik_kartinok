class AddDefToUserStatus < ActiveRecord::Migration
  def change
    change_column_null :users, :status_id, 1
  end
end
