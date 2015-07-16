class DeleteDefaultFromStatus < ActiveRecord::Migration
  def change
    change_column_default(:status_tables, :title, nil)
  end
end
