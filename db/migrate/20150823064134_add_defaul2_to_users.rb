class AddDefaul2ToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :status_id, 0
  end
end
