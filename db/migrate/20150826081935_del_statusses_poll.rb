class DelStatussesPoll < ActiveRecord::Migration
  def change
    drop_table :statuses_poll
  end
end
