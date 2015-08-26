class ChangeIsClosedToStatusPollForPolls < ActiveRecord::Migration
  def change
    remove_column :polls, :is_closed
    add_column :polls, :status_polls_id, :integer, default: 0
  end
end
