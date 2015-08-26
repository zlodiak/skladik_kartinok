class RenameStatusPollsToStatusPoll < ActiveRecord::Migration
  def change
    rename_column :polls, :status_polls_id, :status_poll_id
  end
end
